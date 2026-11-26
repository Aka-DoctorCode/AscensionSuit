--[[--------------------------------------------------------------------------
    WoW Task Manager - Core/AddonSets.lua

    Saved sets of enabled addons: "Raid", "Leveling", "Bare minimum".

    A set is the list of addons that were enabled for this character when it
    was saved. Applying one enables exactly those and disables every other
    installed addon, through the client's own EnableAddOn / DisableAddOn. Like
    every enable/disable in WoW, the change takes effect after a UI reload, and
    nothing here reloads on its own.

    What it will not touch:
      * this addon itself - applying a set can never switch the tool off,
      * Blizzard's own modules (Blizzard_*), which the client manages,
      * anything while in combat: the change is queued until combat ends.

    A set that names an addon that is no longer installed is still applied; the
    missing ones are counted and reported, not treated as an error.
----------------------------------------------------------------------------]]

local ADDON_NAME, WTM = ...

local C      = WTM.C
local Compat = WTM.Compat

local AddonSets = {}
WTM.AddonSets = AddonSets

local MAX_NAME_LENGTH = 32
local MAX_SETS = 40

--------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------

local function Store()
    local g = WTM.db.global
    g.addonSets = g.addonSets or {}
    return g.addonSets
end

--- Trimmed, single-spaced, length-limited. Returns nil for an unusable name.
function AddonSets.NormalizeName(name)
    if type(name) ~= "string" then return nil end
    name = name:gsub("%s+", " "):gsub("^ ", ""):gsub(" $", "")
    if name == "" then return nil end
    return name:sub(1, MAX_NAME_LENGTH)
end

--- The stored key matching `name` ignoring case, or nil.
local function FindKey(name)
    name = AddonSets.NormalizeName(name)
    if not name then return nil end
    local lowered = name:lower()
    for key in pairs(Store()) do
        if key:lower() == lowered then return key end
    end
    return nil
end

local function IsManaged(folder)
    -- Not ours to switch: this tool, and the client's own modules.
    if folder == ADDON_NAME then return false end
    if folder:sub(1, 9) == "Blizzard_" then return false end
    return true
end

--- Is the addon at `index` enabled for this character?
local function IsEnabledNow(index, character)
    local state = Compat.GetAddOnEnableState(index, character)
    return state ~= nil and state > 0
end

--- Calls `fn(index, folder)` for every installed addon this module manages.
local function EachManaged(fn)
    for i = 1, Compat.GetNumAddOns() do
        local folder = Compat.GetAddOnInfo(i)
        if folder and IsManaged(folder) then fn(i, folder) end
    end
end

--------------------------------------------------------------------------
-- Reading
--------------------------------------------------------------------------

--- Sorted array of set names.
function AddonSets:Names(out)
    out = WTM.Scratch(out)
    for key in pairs(Store()) do out[#out + 1] = key end
    table.sort(out, function(a, b) return a:lower() < b:lower() end)
    return out
end

function AddonSets:Get(name)
    local key = FindKey(name)
    return key and Store()[key] or nil, key
end

function AddonSets:Count()
    local n = 0
    for _ in pairs(Store()) do n = n + 1 end
    return n
end

--------------------------------------------------------------------------
-- Saving
--------------------------------------------------------------------------

--- Saves the addons enabled for this character right now as `name`, replacing
--- a set of the same name. Returns true, enabledCount - or false, reason.
function AddonSets:Save(name)
    name = AddonSets.NormalizeName(name)
    if not name then return false, "Give the set a name." end

    local sets = Store()
    local existing = FindKey(name)
    if not existing and self:Count() >= MAX_SETS then
        return false, ("Only %d sets can be kept. Delete one first."):format(MAX_SETS)
    end

    local character = UnitName("player")
    local addons, count = {}, 0
    EachManaged(function(index, folder)
        if IsEnabledNow(index, character) then
            addons[folder] = true
            count = count + 1
        end
    end)

    if existing then sets[existing] = nil end
    sets[name] = { addons = addons, count = count, savedAt = time(), character = character }
    WTM:SendMessage("WTM_ADDON_SETS_CHANGED")
    return true, count
end

function AddonSets:Delete(name)
    local key = FindKey(name)
    if not key then return false, "No set with that name." end
    Store()[key] = nil
    WTM:SendMessage("WTM_ADDON_SETS_CHANGED")
    return true
end

--------------------------------------------------------------------------
-- Applying
--------------------------------------------------------------------------

--- What applying `name` would change, without changing anything.
--- Returns toEnable, toDisable (arrays of folder names), missing (count).
function AddonSets:Preview(name, enableOut, disableOut)
    local set = self:Get(name)
    if not set then return nil end
    enableOut, disableOut = WTM.Scratch(enableOut), WTM.Scratch(disableOut)

    local character = UnitName("player")
    local installed = {}
    EachManaged(function(index, folder)
        installed[folder] = true
        local wanted = set.addons[folder] and true or false
        local current = IsEnabledNow(index, character)
        if wanted and not current then
            enableOut[#enableOut + 1] = folder
        elseif not wanted and current then
            disableOut[#disableOut + 1] = folder
        end
    end)

    local missing = 0
    for folder in pairs(set.addons) do
        if not installed[folder] then missing = missing + 1 end
    end
    return enableOut, disableOut, missing
end

--- Applies a set. Returns true, enabled, disabled, missing, queued - or
--- false, reason. `queued` is true when combat deferred the change.
function AddonSets:Apply(name)
    if not WTM.Caps:Has("addonEnableDisable") then
        return false, C.TXT_UNAVAILABLE_CLIENT
    end
    local set = self:Get(name)
    if not set then return false, "No set with that name." end

    local enableList, disableList, missing = self:Preview(name)
    local api = Compat.api
    local character = UnitName("player")

    local function Run()
        local function Switch(fn, folder)
            if not fn then return end
            -- Both argument shapes exist in the wild; name-only works everywhere.
            if not pcall(fn, folder, character) then pcall(fn, folder) end
        end
        for _, folder in ipairs(enableList) do
            Switch(api.EnableAddOn, folder)
            local record = WTM.Processes:Get(folder)
            if record then record.pendingChange = "enable" end
        end
        for _, folder in ipairs(disableList) do
            Switch(api.DisableAddOn, folder)
            local record = WTM.Processes:Get(folder)
            if record then record.pendingChange = "disable" end
        end
        WTM:SendMessage("WTM_ADDON_STATE_CHANGED")
    end

    local ranNow = Compat.RunWhenSafe("ApplyAddonSet", Run)
    return true, #enableList, #disableList, missing, not ranNow
end

--- One sentence describing the result of Apply, for chat.
function AddonSets.DescribeResult(name, enabled, disabled, missing, queued)
    if enabled == 0 and disabled == 0 then
        return ("Set |cffffffff%s|r already matches your addons - nothing to change."):format(name)
    end
    local text = ("Set |cffffffff%s|r: %d to enable, %d to disable"):format(name, enabled, disabled)
    if missing > 0 then
        text = text .. (", %d saved addon%s no longer installed"):format(missing, missing == 1 and " is" or "s are")
    end
    if queued then
        text = text .. ". Waiting for combat to end"
    end
    return text .. ". Reload the UI to apply it (|cff4c8dff/wtm reload|r)."
end
