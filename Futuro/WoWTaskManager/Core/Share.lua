--[[--------------------------------------------------------------------------
    WoW Task Manager - Core/Share.lua

    Export and import as a single line of text you can paste into chat, a forum
    post or a bug report:

        WTM2:settings:3f2a91bc:<compressed text>     (LibSerialize + LibDeflate)
        WTM1:settings:3f2a91bc:<base64>              (own format, no libraries)

    What can be shared
        settings    the changed settings of the current profile
        sets        saved addon sets (Core/AddonSets.lua)
        locations   performance by zone and by encounter (Monitoring/Locations.lua)

    Two formats. WTM2 uses LibSerialize and LibDeflate (embedded in Libs/) and
    comes out two to four times shorter. WTM1 is this file's own serializer with
    no libraries at all; it is what a client falls back to if the libraries are
    missing, and both are always readable here when the libraries are present.

    A pasted string is UNTRUSTED INPUT, so it is never executed or loaded as
    Lua. It is read by a small parser with hard limits (size, depth, item
    count), checked against its checksum, and then only values whose key is
    already known to this addon AND whose type matches are copied in. Anything
    else is dropped, and a count of what was dropped is reported.
----------------------------------------------------------------------------]]

local ADDON_NAME, WTM = ...

local Share = {}
WTM.Share = Share

local PREFIX = "WTM1"
local PREFIX_V2 = "WTM2"
Share.KINDS = { settings = true, sets = true, locations = true }

-- Hard limits for anything read from a pasted string.
local MAX_INPUT_CHARS  = 400000
-- A deflate stream can expand a thousandfold, and LibDeflate has no output
-- limit, so a compressed paste is capped far lower than a plain one.
local MAX_COMPRESSED_CHARS = 10000
local MAX_STRING       = 4000
local MAX_DEPTH        = 8
local MAX_ITEMS        = 20000
local MAX_MAP_ENTRIES  = 500
local MAX_FIELD_LENGTH = 200

--------------------------------------------------------------------------
-- Base64
--------------------------------------------------------------------------

local ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local ENCODE, DECODE = {}, {}
for i = 1, 64 do
    local ch = ALPHABET:sub(i, i)
    ENCODE[i - 1] = ch
    DECODE[ch] = i - 1
end

local floor = math.floor

--- Arithmetic only: the client's `bit` library is not needed.
function Share.Base64Encode(data)
    local out, n = {}, 0
    for i = 1, #data, 3 do
        local b1, b2, b3 = data:byte(i, i + 2)
        local value = b1 * 65536 + (b2 or 0) * 256 + (b3 or 0)
        local c1 = floor(value / 262144) % 64
        local c2 = floor(value / 4096) % 64
        local c3 = floor(value / 64) % 64
        local c4 = value % 64
        n = n + 1
        out[n] = ENCODE[c1] .. ENCODE[c2] .. (b2 and ENCODE[c3] or "=") .. (b3 and ENCODE[c4] or "=")
    end
    return table.concat(out)
end

--- Returns the decoded bytes, or nil for anything that is not valid base64.
function Share.Base64Decode(text)
    text = text:gsub("%s+", "")
    if #text == 0 or #text % 4 ~= 0 then return nil end
    local out, n = {}, 0
    for i = 1, #text, 4 do
        local a, b, c, d = text:sub(i, i), text:sub(i + 1, i + 1), text:sub(i + 2, i + 2), text:sub(i + 3, i + 3)
        local va, vb = DECODE[a], DECODE[b]
        local vc = c == "=" and 0 or DECODE[c]
        local vd = d == "=" and 0 or DECODE[d]
        if not (va and vb and vc and vd) then return nil end
        if (c == "=" and d ~= "=") then return nil end
        local value = va * 262144 + vb * 4096 + vc * 64 + vd
        local b1 = floor(value / 65536) % 256
        local b2 = floor(value / 256) % 256
        local b3 = value % 256
        n = n + 1
        if c == "=" then
            out[n] = string.char(b1)
        elseif d == "=" then
            out[n] = string.char(b1, b2)
        else
            out[n] = string.char(b1, b2, b3)
        end
    end
    return table.concat(out)
end

--- Adler-32, as 8 hex digits. Catches a truncated or mangled paste.
local function Checksum(data)
    local a, b = 1, 0
    for i = 1, #data do
        a = (a + data:byte(i)) % 65521
        b = (b + a) % 65521
    end
    return ("%08x"):format(b * 65536 + a)
end
Share.Checksum = Checksum

--------------------------------------------------------------------------
-- Serializer
--------------------------------------------------------------------------
-- n<number>;   T   F   s<length>:<bytes>   { key value key value ... }

local function Write(value, out, depth)
    local kind = type(value)
    if kind == "number" then
        if value ~= value or value == math.huge or value == -math.huge then
            error("a number that is not finite cannot be shared")
        end
        out[#out + 1] = "n" .. ("%.15g"):format(value) .. ";"
    elseif kind == "boolean" then
        out[#out + 1] = value and "T" or "F"
    elseif kind == "string" then
        out[#out + 1] = "s" .. #value .. ":" .. value
    elseif kind == "table" then
        if depth > MAX_DEPTH then error("nested too deeply to share") end
        out[#out + 1] = "{"
        for key, item in pairs(value) do
            local keyKind, itemKind = type(key), type(item)
            if (keyKind == "string" or keyKind == "number")
               and (itemKind == "number" or itemKind == "boolean" or itemKind == "string" or itemKind == "table") then
                Write(key, out, depth + 1)
                Write(item, out, depth + 1)
            end
        end
        out[#out + 1] = "}"
    else
        error("cannot share a " .. kind)
    end
end

function Share.Serialize(value)
    local out = {}
    Write(value, out, 1)
    return table.concat(out)
end

--------------------------------------------------------------------------
-- Parser
--------------------------------------------------------------------------

local function Read(s, pos, depth, budget)
    if budget.items <= 0 then error("too many items") end
    budget.items = budget.items - 1

    local c = s:sub(pos, pos)
    if c == "n" then
        local stop = s:find(";", pos, true)
        if not stop or stop - pos > 40 then error("bad number") end
        local number = tonumber(s:sub(pos + 1, stop - 1))
        if not number or number ~= number or number == math.huge or number == -math.huge then
            error("bad number")
        end
        return number, stop + 1
    elseif c == "T" then
        return true, pos + 1
    elseif c == "F" then
        return false, pos + 1
    elseif c == "s" then
        local colon = s:find(":", pos, true)
        if not colon or colon - pos > 8 then error("bad string") end
        local length = tonumber(s:sub(pos + 1, colon - 1))
        if not length or length < 0 or length % 1 ~= 0 or length > MAX_STRING then error("bad string length") end
        local text = s:sub(colon + 1, colon + length)
        if #text ~= length then error("truncated string") end
        return text, colon + length + 1
    elseif c == "{" then
        if depth > MAX_DEPTH then error("nested too deeply") end
        local result = {}
        pos = pos + 1
        while true do
            local ch = s:sub(pos, pos)
            if ch == "}" then return result, pos + 1 end
            if ch == "" then error("unterminated table") end
            local key, keyEnd = Read(s, pos, depth + 1, budget)
            if type(key) ~= "string" and type(key) ~= "number" then error("bad key") end
            local value, valueEnd = Read(s, keyEnd, depth + 1, budget)
            result[key] = value
            pos = valueEnd
        end
    end
    error("unexpected character at " .. pos)
end

--- Returns the value, or nil and a reason. Never throws.
function Share.Deserialize(text)
    if type(text) ~= "string" or #text > MAX_INPUT_CHARS then return nil, "too large" end
    local ok, value, stop = pcall(Read, text, 1, 1, { items = MAX_ITEMS })
    if not ok then return nil, tostring(value):gsub("^.-:%d+: ", "") end
    if stop ~= #text + 1 then return nil, "trailing data" end
    return value
end

--------------------------------------------------------------------------
-- Envelope
--------------------------------------------------------------------------

--- The two libraries WTM2 needs, or nil when either is missing.
local function GetCompressionLibs()
    local stub = _G.LibStub
    if type(stub) ~= "table" and type(stub) ~= "function" then return nil end
    local okSerialize, serialize = pcall(stub, "LibSerialize", true)
    local okDeflate, deflate = pcall(stub, "LibDeflate", true)
    if okSerialize and okDeflate and type(serialize) == "table" and type(deflate) == "table"
       and serialize.Serialize and serialize.Deserialize
       and deflate.CompressDeflate and deflate.DecompressDeflate
       and deflate.EncodeForPrint and deflate.DecodeForPrint then
        return serialize, deflate
    end
    return nil
end
Share.GetCompressionLibs = GetCompressionLibs

--- The own-format envelope (no libraries).
function Share.PackV1(kind, payload)
    local data = Share.Serialize(payload)
    return ("%s:%s:%s:%s"):format(PREFIX, kind, Checksum(data), Share.Base64Encode(data))
end

--- The compressed envelope, or nil when the libraries are not there.
function Share.PackV2(kind, payload)
    local serialize, deflate = GetCompressionLibs()
    if not serialize then return nil end
    local ok, text = pcall(function()
        local raw = serialize:Serialize(payload)
        local compressed = deflate:CompressDeflate(raw, { level = 9 })
        return ("%s:%s:%s:%s"):format(PREFIX_V2, kind, Checksum(compressed), deflate:EncodeForPrint(compressed))
    end)
    return ok and text or nil
end

--- Compressed when it can be, the own format otherwise.
function Share.Pack(kind, payload)
    return Share.PackV2(kind, payload) or Share.PackV1(kind, payload)
end

--- Counts items and depth, so a decompressed payload gets the same bounds the
--- own-format parser enforces while reading.
local function WithinLimits(value, depth, budget)
    if depth > MAX_DEPTH then return false end
    if type(value) ~= "table" then return true end
    for key, item in pairs(value) do
        budget.items = budget.items - 1
        if budget.items < 0 then return false end
        local keyKind = type(key)
        if keyKind ~= "string" and keyKind ~= "number" then return false end
        if type(item) == "string" and #item > MAX_STRING then return false end
        if not WithinLimits(item, depth + 1, budget) then return false end
    end
    return true
end

--- Returns kind, payload - or nil, reason.
function Share.Unpack(text)
    if type(text) ~= "string" then return nil, "nothing to import" end
    text = text:gsub("%s+", "")
    if #text > MAX_INPUT_CHARS * 2 then return nil, "too large" end
    local prefix, kind, checksum, body = text:match("^(%w+):(%w+):(%x+):(.+)$")
    if prefix ~= PREFIX and prefix ~= PREFIX_V2 then return nil, "this is not a WoW Task Manager export" end
    if not Share.KINDS[kind] then return nil, "unknown kind '" .. tostring(kind) .. "'" end

    if prefix == PREFIX_V2 then
        local serialize, deflate = GetCompressionLibs()
        if not serialize then
            return nil, "this export is compressed and needs LibSerialize and LibDeflate, which are not available here"
        end
        if #text > MAX_COMPRESSED_CHARS then return nil, "too large for a compressed export" end
        local compressed = deflate:DecodeForPrint(body)
        if not compressed then return nil, "the text is damaged - was it copied completely?" end
        if Checksum(compressed) ~= checksum then return nil, "the checksum does not match - the text was cut off or changed" end
        local raw = deflate:DecompressDeflate(compressed)
        if type(raw) ~= "string" then return nil, "could not be decompressed" end
        local ok, success, payload = pcall(serialize.Deserialize, serialize, raw)
        if not ok or not success or type(payload) ~= "table" then return nil, "could not be read" end
        if not WithinLimits(payload, 1, { items = MAX_ITEMS }) then return nil, "contents are larger than any export this addon makes" end
        return kind, payload
    end

    local data = Share.Base64Decode(body)
    if not data then return nil, "the text is damaged (not valid base64) - was it copied completely?" end
    if Checksum(data) ~= checksum then return nil, "the checksum does not match - the text was cut off or changed" end
    local payload, why = Share.Deserialize(data)
    if payload == nil or type(payload) ~= "table" then return nil, "could not be read: " .. tostring(why) end
    return kind, payload
end

--------------------------------------------------------------------------
-- Validation: only known keys, only matching types
--------------------------------------------------------------------------

local function CleanPrimitive(value)
    local kind = type(value)
    if kind == "number" then
        if value ~= value or value == math.huge or value == -math.huge then return nil end
        return value
    elseif kind == "boolean" then
        return value
    elseif kind == "string" then
        return value:sub(1, MAX_FIELD_LENGTH)
    end
    return nil
end

--- A free-form map of names to flags/numbers/strings (hidden addons, per-widget
--- sizes). No nested tables, bounded size.
local function CleanMap(value, nested)
    local out, count = {}, 0
    for key, item in pairs(value) do
        local keyKind = type(key)
        local clean
        if type(item) == "table" and not nested then
            -- One level of flat tables is allowed (an alert rule is one).
            clean = CleanMap(item, true)
        else
            clean = CleanPrimitive(item)
        end
        if (keyKind == "string" or keyKind == "number") and clean ~= nil then
            count = count + 1
            if count > MAX_MAP_ENTRIES then break end
            out[keyKind == "string" and key:sub(1, 100) or key] = clean
        end
    end
    return out
end

--- Copies from `value` only what `template` knows, with the same type.
--- Returns the clean table and how many entries were dropped.
local function Sanitize(template, value, depth, dropped)
    local out = {}
    if type(value) ~= "table" or depth > 6 then return out end
    for key, item in pairs(value) do
        local expected = type(key) == "string" and template[key] or nil
        if expected == nil then
            dropped.n = dropped.n + 1
        elseif type(expected) == "table" then
            if type(item) ~= "table" then
                dropped.n = dropped.n + 1
            elseif next(expected) == nil then
                out[key] = CleanMap(item)
            else
                out[key] = Sanitize(expected, item, depth + 1, dropped)
            end
        elseif type(item) == type(expected) then
            local clean = CleanPrimitive(item)
            if clean == nil then dropped.n = dropped.n + 1 else out[key] = clean end
        else
            dropped.n = dropped.n + 1
        end
    end
    return out
end

local function DeepMerge(destination, source)
    for key, value in pairs(source) do
        if type(value) == "table" and type(destination[key]) == "table" then
            DeepMerge(destination[key], value)
        else
            destination[key] = value
        end
    end
end

local function Clamp(value, lo, hi) return math.max(lo, math.min(hi, value)) end

-- Values a settings string must never be able to push out of a sane range: an
-- interval of zero would make every sampler run every frame.
local function ClampKnown(clean)
    local sampling = clean.sampling
    if sampling and sampling.intervals then
        for key, value in pairs(sampling.intervals) do
            sampling.intervals[key] = Clamp(value, 0.05, 300)
        end
    end
    if sampling and sampling.burstDuration then sampling.burstDuration = Clamp(sampling.burstDuration, 1, 120) end
    if sampling and sampling.overheadBudgetMs then sampling.overheadBudgetMs = Clamp(sampling.overheadBudgetMs, 0.1, 50) end
    local ui = clean.ui
    if ui and ui.scrollbarWidth then ui.scrollbarWidth = Clamp(ui.scrollbarWidth, 4, 24) end
    local retention = clean.retention
    if retention then
        for key, value in pairs(retention) do
            if type(value) == "number" then retention[key] = Clamp(value, 1, 500) end
        end
    end
end

--------------------------------------------------------------------------
-- Export
--------------------------------------------------------------------------

local function CopyTable(source, depth)
    if type(source) ~= "table" or depth > MAX_DEPTH then return source end
    local out = {}
    for key, value in pairs(source) do
        if type(value) == "table" then
            out[key] = CopyTable(value, depth + 1)
        else
            out[key] = value
        end
    end
    return out
end

--- The text to export for `kind`, or nil and a reason.
function Share:Export(kind)
    if not Share.KINDS[kind] then return nil, "unknown kind" end
    local payload
    if kind == "settings" then
        local template = WTM.Database.defaults.profile
        payload = Sanitize(template, WTM.db.profile, 1, { n = 0 })
        payload.dev = nil
        if next(payload) == nil then return nil, "nothing differs from the defaults yet" end
    elseif kind == "sets" then
        payload = CopyTable(WTM.db.global.addonSets or {}, 1)
        if next(payload) == nil then return nil, "no addon sets saved yet" end
    else
        local places, encounters = WTM.Locations:Count()
        if places == 0 and encounters == 0 then return nil, "no location data recorded yet" end
        payload = {
            locations  = CopyTable(WTM.db.global.locations or {}, 1),
            encounters = CopyTable(WTM.db.global.encounters or {}, 1),
        }
    end
    local ok, text = pcall(Share.Pack, kind, payload)
    if not ok then return nil, tostring(text) end
    return text
end

--------------------------------------------------------------------------
-- Import
--------------------------------------------------------------------------

local function ImportSettings(payload)
    local dropped = { n = 0 }
    local clean = Sanitize(WTM.Database.defaults.profile, payload, 1, dropped)
    clean.dev = nil
    ClampKnown(clean)
    local count = 0
    for key, value in pairs(clean) do
        if type(value) == "table" and type(WTM.db.profile[key]) == "table" then
            DeepMerge(WTM.db.profile[key], value)
        else
            WTM.db.profile[key] = value
        end
        count = count + 1
    end
    return ("Imported %d settings group%s (%d unknown value%s ignored). Reload the UI to apply it.")
        :format(count, count == 1 and "" or "s", dropped.n, dropped.n == 1 and "" or "s")
end

local function ImportSets(payload)
    local Sets = WTM.AddonSets
    local added, skipped = 0, 0
    for name, set in pairs(payload) do
        local normalized = type(name) == "string" and Sets.NormalizeName(name) or nil
        if normalized and type(set) == "table" and type(set.addons) == "table"
           and Sets:Count() < 40 then
            local addons, count = {}, 0
            for folder, enabled in pairs(set.addons) do
                if type(folder) == "string" and #folder <= 64 and enabled == true and count < 400 then
                    addons[folder] = true
                    count = count + 1
                end
            end
            -- Never silently replace one of your own sets with someone else's.
            local finalName, n = normalized, 1
            while Sets:Get(finalName) do
                n = n + 1
                local suffix = n == 2 and " (imported)" or (" (imported %d)"):format(n)
                finalName = normalized:sub(1, 32 - #suffix) .. suffix
            end
            WTM.db.global.addonSets[finalName] = {
                addons = addons, count = count,
                savedAt = tonumber(set.savedAt) or time(),
                character = type(set.character) == "string" and set.character:sub(1, 64) or nil,
            }
            added = added + 1
        else
            skipped = skipped + 1
        end
    end
    WTM:SendMessage("WTM_ADDON_SETS_CHANGED")
    return ("Imported %d addon set%s (%d skipped). Apply one from the Sets menu on the Processes page.")
        :format(added, added == 1 and "" or "s", skipped)
end

local PLACE_NUMBERS = { "seconds", "n", "sumFps", "sumLat", "latN", "nCombat", "sumFpsCombat", "spikes" }
local ENCOUNTER_NUMBERS = { "attempts", "seconds", "n", "sumFps", "spikes" }

local function MergeNumbers(destination, source, fields)
    for _, field in ipairs(fields) do
        local value = tonumber(source[field])
        if value and value >= 0 then destination[field] = (destination[field] or 0) + value end
    end
    local maxMs = tonumber(source.maxMs)
    if maxMs and maxMs > (destination.maxMs or 0) then destination.maxMs = maxMs end
    local minFps = tonumber(source.minFps)
    if minFps and minFps > 0 and (not destination.minFps or minFps < destination.minFps) then
        destination.minFps = minFps
    end
end

local function ImportLocations(payload)
    local places, encounters = 0, 0
    local source = type(payload.locations) == "table" and payload.locations or {}
    for label, entry in pairs(source) do
        if type(label) == "string" and #label <= 100 and type(entry) == "table" then
            local kind = entry.kind == "world" and "world" or "instance"
            local place = WTM.Locations:GetPlace(label, kind, true)
            MergeNumbers(place, entry, PLACE_NUMBERS)
            places = places + 1
        end
    end
    source = type(payload.encounters) == "table" and payload.encounters or {}
    for _, entry in pairs(source) do
        if type(entry) == "table" and type(entry.name) == "string" and tonumber(entry.id) then
            local difficulty = type(entry.difficulty) == "string" and entry.difficulty:sub(1, 60) or nil
            local encounter = WTM.Locations:GetEncounter(tonumber(entry.id), entry.name:sub(1, 100),
                difficulty, type(entry.instance) == "string" and entry.instance:sub(1, 100) or nil, true)
            MergeNumbers(encounter, entry, ENCOUNTER_NUMBERS)
            encounters = encounters + 1
        end
    end
    return ("Merged %d place%s and %d encounter%s into your location data.")
        :format(places, places == 1 and "" or "s", encounters, encounters == 1 and "" or "s")
end

--- Reads a pasted string and applies it. Returns true, message - or false, reason.
function Share:Import(text)
    local kind, payload = Share.Unpack(text)
    if not kind then return false, payload end

    local ok, message
    if kind == "settings" then
        ok, message = pcall(ImportSettings, payload)
    elseif kind == "sets" then
        ok, message = pcall(ImportSets, payload)
    else
        ok, message = pcall(ImportLocations, payload)
    end
    if not ok then return false, "the import failed: " .. tostring(message) end
    return true, message, kind
end
