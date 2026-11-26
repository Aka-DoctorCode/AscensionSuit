--------------------------------------------------------------------------------
-- Macro Maker - Profiles Module
-- Version: 2.0
-- Author: Satyros
--
-- Description:
--   Per-specialization profile system.
--   Auto-switches library macros when changing specs.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

MM.Profiles = {}

--- Gets the current spec or loadout identifier string.
--- @return string profileKey A unique key like "WARRIOR-1" or "WARRIOR-1-Raid ST"
function MM.Profiles:GetProfileKey()
    local specIndex = GetSpecialization()
    if not specIndex then return "DEFAULT" end
    
    local _, className = UnitClass("player")
    local baseKey = className .. "-" .. specIndex
    
    if MM.db and MM.db.settings and MM.db.settings.loadoutProfilesEnabled then
        if C_ClassTalents and C_ClassTalents.GetActiveConfigID then
            local configID = C_ClassTalents.GetActiveConfigID()
            if configID and configID > 0 then
                local configInfo = C_Traits and C_Traits.GetConfigInfo and C_Traits.GetConfigInfo(configID)
                local configName = (configInfo and configInfo.name and configInfo.name ~= "") and configInfo.name or ("Loadout" .. configID)
                return baseKey .. "-" .. configName
            end
        end
    end
    
    return baseKey
end

-- Backward compatibility alias
function MM.Profiles:GetSpecKey()
    return self:GetProfileKey()
end

--- Saves the current library to the active profile.
function MM.Profiles:SaveCurrent()
    if not MM.db then return end
    if not MM.db.profiles then MM.db.profiles = {} end
    
    local key = self:GetProfileKey()
    
    -- Deep copy of library
    MM.db.profiles[key] = {
        library = MM.db.library and CopyTable(MM.db.library) or {},
        savedAt = time(),
    }
end

--- Loads a profile by spec key.
--- @param key string The spec key to load.
function MM.Profiles:Load(key)
    if not MM.db or not MM.db.profiles then return end
    
    local profile = MM.db.profiles[key]
    if not profile then return false end
    
    MM.db.library = CopyTable(profile.library or {})
    
    if MM.UpdateMacroList then MM:UpdateMacroList() end
    
    return true
end

--- Handles spec or talent loadout change event. Auto-saves current and loads new.
function MM.Profiles:OnSpecChanged()
    if not MM.db or not MM.db.settings then return end
    if not MM.db.settings.profilesEnabled and not MM.db.settings.loadoutProfilesEnabled then return end
    
    -- Save outgoing profile
    if MM.db.settings.lastSpecKey then
        local oldKey = MM.db.settings.lastSpecKey
        if not MM.db.profiles then MM.db.profiles = {} end
        MM.db.profiles[oldKey] = {
            library = MM.db.library and CopyTable(MM.db.library) or {},
            savedAt = time(),
        }
    end
    
    -- Load incoming profile
    local newKey = self:GetProfileKey()
    MM.db.settings.lastSpecKey = newKey
    
    if MM.db.profiles and MM.db.profiles[newKey] then
        self:Load(newKey)
    end
end

--- Returns a list of all saved profile keys.
--- @return table keys List of profile key strings.
function MM.Profiles:GetSavedKeys()
    local keys = {}
    if MM.db and MM.db.profiles then
        for k, _ in pairs(MM.db.profiles) do
            table.insert(keys, k)
        end
    end
    table.sort(keys)
    return keys
end

--- Creates an automatic or manual backup snapshot of the library.
--- @param reason string Optional description like "Auto", "Manual", "Pre-Delete"
function MM.Profiles:CreateBackup(reason)
    if not MM.db then return end
    if not MM.db.backups then MM.db.backups = {} end
    
    local snapshot = {
        library = MM.db.library and CopyTable(MM.db.library) or {},
        timestamp = time(),
        dateStr = date("%Y-%m-%d %H:%M:%S"),
        reason = reason or "Manual",
        macroCount = MM.db.library and #MM.db.library or 0,
    }
    
    table.insert(MM.db.backups, 1, snapshot)
    
    -- Keep maximum 10 latest snapshots
    if #MM.db.backups > 10 then
        table.remove(MM.db.backups)
    end
    
    if MM.Notify and reason ~= "Auto" then
        MM:Notify(string.format(L["Backup created: %s (%d macros)"] or "Backup erstellt: %s (%d Makros)", snapshot.dateStr, snapshot.macroCount), "success")
    end
end

--- Restores a library snapshot from backup.
--- @param index number Backup index (1 = latest)
function MM.Profiles:RestoreBackup(index)
    if not MM.db or not MM.db.backups or not MM.db.backups[index] then
        if MM.Notify then MM:Notify(L["No backup found at index."] or "Kein Backup unter diesem Index gefunden.", "error") end
        return false
    end
    
    -- Create safety backup of current state before restoring
    self:CreateBackup("Pre-Restore Safety")
    
    local snapshot = MM.db.backups[index]
    MM.db.library = CopyTable(snapshot.library or {})
    
    if MM.UpdateMacroList then MM:UpdateMacroList() end
    if MM.RefreshLibraryList then MM:RefreshLibraryList() end
    
    if MM.Notify then
        MM:Notify(string.format(L["Restored library backup from %s (%d macros)"] or "Bibliothek wiederhergestellt vom %s (%d Makros)", snapshot.dateStr, snapshot.macroCount), "success")
    end
    return true
end

--- Deletes a profile.
--- @param key string The profile key to delete.
function MM.Profiles:Delete(key)
    if MM.db and MM.db.profiles then
        MM.db.profiles[key] = nil
        if MM.Notify then
            MM:Notify(format(L["Profile deleted: %s"], key), "info")
        end
    end
end
