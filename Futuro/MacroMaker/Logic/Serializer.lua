--------------------------------------------------------------------------------
-- Macro Maker - Serializer Module
-- Version: 1.0
-- Author: Satyros
--
-- Description:
--   Handles data Serialization/Deserialization for macro sharing.
--   Features a lightweight Base64 encoder/decoder and string formatting
--   logic (v1:Name:Icon:Body) for import/export functionality.
--------------------------------------------------------------------------------

local AddOnName, MM = ...

--------------------------------------------------------------------------------
local LibDeflate = LibStub and LibStub:GetLibrary("LibDeflate", true)
local LibSerialize = LibStub and LibStub:GetLibrary("LibSerialize", true)

--------------------------------------------------------------------------------
-- Base64 Implementation (Legacy & Fallback)
--------------------------------------------------------------------------------

local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local b64lookup = {}
for i = 1, 64 do
    b64lookup[string.byte(b64chars, i)] = i - 1
end

--- Encodes a string to Base64.
--- @param data string The raw string to encode.
--- @return string The Base64 encoded string.
function MM:Base64Encode(data)
    if LibDeflate then
        return LibDeflate:EncodeForPrint(data)
    end
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b64chars:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

--- Decodes a Base64 string.
--- @param data string The Base64 encoded string.
--- @return string The decoded raw string.
function MM:Base64Decode(data)
    if LibDeflate then
        local decoded = LibDeflate:DecodeForPrint(data)
        if decoded then return decoded end
    end
    data = string.gsub(data, '[^'..b64chars..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',b64lookup[x:byte()]
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

--------------------------------------------------------------------------------
-- Advanced Payload Compression (LibDeflate + LibSerialize)
--------------------------------------------------------------------------------

--- Encodes any Lua table into a highly compressed, print-safe string with header.
--- @param data table
--- @param header string e.g. "MacroMakerMacro", "MacroMakerLibrary", "MacroMakerBackup"
--- @return string
function MM:EncodeCompressedPayload(data, header)
    if LibSerialize and LibDeflate then
        local serialized = LibSerialize:Serialize(data)
        local compressed = LibDeflate:CompressDeflate(serialized, {level = 9})
        local encoded = LibDeflate:EncodeForPrint(compressed)
        return string.format("!MM:%s:%s!", header, encoded)
    end
    
    -- Fallback to JSON-like + Base64
    local serialized = MM.Serializer:Serialize(data)
    local encoded = MM:Base64Encode(serialized)
    return string.format("[%s::%s]", header, encoded)
end

--- Decodes a compressed payload string back to a Lua table.
--- @param str string
--- @return table|nil, string|nil
function MM:DecodeCompressedPayload(str)
    if not str or str == "" then return nil, "Empty string" end
    
    -- Pattern 1: Modern !MM:Header:Data!
    local header, payload = str:match("!MM:([%w_-]+):(.-)!")
    if header and payload then
        if LibSerialize and LibDeflate then
            local decoded = LibDeflate:DecodeForPrint(payload)
            if not decoded then return nil, "Failed to decode Base64 payload." end
            local decompressed = LibDeflate:DecompressDeflate(decoded)
            if not decompressed then return nil, "Failed to decompress Deflate stream." end
            local success, data = LibSerialize:Deserialize(decompressed)
            if not success then return nil, "Failed to deserialize table data." end
            return data, nil, header
        end
    end
    
    -- Pattern 2: Legacy [Header::Data]
    local legHeader, legPayload = str:match("%[([%w_-]+)::(.-)%]")
    if legHeader and legPayload then
        local raw = MM:Base64Decode(legPayload)
        if raw and raw ~= "" then
            local data, err = MM.Serializer:Deserialize(raw)
            if data then return data, nil, legHeader end
            return nil, err
        end
    end

    return nil, "Unrecognized format"
end

--------------------------------------------------------------------------------
-- Export / Import Logic
--------------------------------------------------------------------------------

-- Legacy single macro format: v1:NAME_B64:ICON_B64:BODY_B64
local SEP = ":"
local VERSION = "v1"

--- Generates an export string for a single macro.
--- @param name string Macro name.
--- @param icon string Icon texture path/ID.
--- @param body string Macro body text.
--- @return string The formatted export string.
function MM:ExportMacro(name, icon, body)
    if not name or not body then return "" end
    icon = icon or "INV_Misc_QuestionMark"
    
    local payload = {
        name = name,
        icon = icon,
        body = body,
        v = 2
    }
    
    return MM:EncodeCompressedPayload(payload, "Macro")
end

--- Generates an export string for the entire Personal Library.
--- @return string The formatted export string.
function MM:ExportLibrary()
    if not MM.db or not MM.db.library then return "" end
    return MM:EncodeCompressedPayload(MM.db.library, "Library")
end

--- Generates an export string for a specific list/category of macros.
--- @param macroList table Table of macros {name, icon, body}.
--- @return string The formatted export string.
function MM:ExportMacroList(macroList)
    if not macroList or #macroList == 0 then return "" end
    return MM:EncodeCompressedPayload(macroList, "List")
end

--- Parses an import string into macro data (supports modern and legacy formats).
--- @param str string The raw import string.
--- @return table|nil Table {name, icon, body} if successful, or nil.
--- @return string|nil Error message if failed.
function MM:ImportMacroString(str)
    if not str or str == "" then return nil, "Empty string" end
    
    -- Try Modern / Compressed format first
    local data, err, header = MM:DecodeCompressedPayload(str)
    if data and type(data) == "table" and data.name and data.body then
        return data
    end
    
    -- Legacy format: v1:NAME_B64:ICON_B64:BODY_B64
    local parts = {}
    for part in string.gmatch(str, "([^"..SEP.."]+)") do
        table.insert(parts, part)
    end
    
    if #parts >= 4 and parts[1] == VERSION then
        local name = MM:Base64Decode(parts[2])
        local icon = MM:Base64Decode(parts[3])
        local body = MM:Base64Decode(parts[4])
        return { name = name, icon = icon, body = body }
    end
    
    return nil, err or "Invalid format"
end

--------------------------------------------------------------------------------
-- JSON-like Table Serializer (Simplified / Fallback)
--------------------------------------------------------------------------------

MM.Serializer = {}

--- Serialize a table to a JSON-like string.
--- @param val any The value to serialize.
function MM.Serializer:Serialize(val)
    local t = type(val)
    if t == "number" or t == "boolean" then
        return tostring(val)
    elseif t == "string" then
        return string.format("%q", val)
    elseif t == "table" then
        local parts = {}
        local isArray = (#val > 0)
        if isArray then
            for _, v in ipairs(val) do
                table.insert(parts, self:Serialize(v))
            end
            return "{" .. table.concat(parts, ",") .. "}"
        else
            for k, v in pairs(val) do
                -- Only serialize string/number keys
                if type(k) == "string" or type(k) == "number" then
                    local keyStr = (type(k)=="number") and ("["..k.."]") or string.format("[%q]", k)
                    table.insert(parts, keyStr .. "=" .. self:Serialize(v))
                end
            end
            return "{" .. table.concat(parts, ",") .. "}"
        end
    else
        return "nil"
    end
end

--- Deserialize a string (Lua table syntax) to a table.
function MM.Serializer:Deserialize(str)
    if not str then return nil end
    local func, err = loadstring("return " .. str)
    if not func then return nil, err end
    setfenv(func, {}) -- Sandbox env
    local success, res = pcall(func)
    if success then return res else return nil, res end
end
