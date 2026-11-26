--------------------------------------------------------------------------------
-- Macro Maker - Manager: Macro List
-- Version: 2.0
-- Part of the Manager Module
-- Handles the display and updating of the macro list.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

local LibCustomGlow = LibStub and LibStub:GetLibrary("LibCustomGlow-1.0", true)

--------------------------------------------------------------------------------
-- List Management
--------------------------------------------------------------------------------

local EMPTY_ACTIONBAR_USAGE = { count = 0, list = {} }

--- Helper to return human-readable action bar slot name.
--- @param slot number
--- @return string
local function GetBarName(slot)
    if slot >= 1 and slot <= 12 then return string.format(L["Action Bar %d, Slot %d"] or "Bar %d, Slot %d", 1, slot)
    elseif slot >= 13 and slot <= 24 then return string.format(L["Action Bar %d, Slot %d"] or "Bar %d, Slot %d", 2, slot - 12)
    elseif slot >= 25 and slot <= 36 then return string.format("Right Bar, Slot %d", slot - 24)
    elseif slot >= 37 and slot <= 48 then return string.format("Right Bar 2, Slot %d", slot - 36)
    elseif slot >= 49 and slot <= 60 then return string.format("Bottom Right, Slot %d", slot - 48)
    elseif slot >= 61 and slot <= 72 then return string.format("Bottom Left, Slot %d", slot - 60)
    elseif slot >= 73 and slot <= 84 then return string.format(L["Action Bar %d, Slot %d"] or "Bar %d, Slot %d", 5, slot - 72)
    elseif slot >= 85 and slot <= 96 then return string.format(L["Action Bar %d, Slot %d"] or "Bar %d, Slot %d", 6, slot - 84)
    elseif slot >= 97 and slot <= 108 then return string.format(L["Action Bar %d, Slot %d"] or "Bar %d, Slot %d", 7, slot - 96)
    elseif slot >= 109 and slot <= 120 then return string.format(L["Action Bar %d, Slot %d"] or "Bar %d, Slot %d", 8, slot - 108)
    end
    return "Slot " .. slot
end

--- Builds a single-pass lookup cache of all macros currently placed on action bars (1..120).
--- Scans all 120 slots once (O(120)) and maps usage by index and by name for O(1) lookups.
--- @return table cache { byIndex = table, byName = table }
function MM:BuildActionBarCache()
    local cache = {
        byIndex = {},
        byName = {},
    }

    local function GetOrCreateEntry(id, name)
        local entry = (id and cache.byIndex[id]) or (name and cache.byName[name])
        if not entry then
            entry = { count = 0, list = {} }
        end
        if id then cache.byIndex[id] = entry end
        if name and name ~= "" then cache.byName[name] = entry end
        return entry
    end

    for slot = 1, 120 do
        if HasAction(slot) then
            local actionType, id = GetActionInfo(slot)
            if actionType == "macro" then
                local actionText = GetActionText(slot)
                local mName = (id and GetMacroInfo(id)) or actionText
                local entry = GetOrCreateEntry(id, mName or actionText)
                entry.count = entry.count + 1
                table.insert(entry.list, GetBarName(slot))
            end
        end
    end

    return cache
end

--- Returns which action bar slots contain this macro (O(1) with pre-built cache).
--- @param macroName string
--- @param macroIndex number
--- @param cache table|nil Optional pre-built cache from MM:BuildActionBarCache()
--- @return table usage { count = number, list = table }
function MM:GetMacroActionBarUsage(macroName, macroIndex, cache)
    if not cache then
        cache = MM:BuildActionBarCache()
    end
    if macroIndex and cache.byIndex and cache.byIndex[macroIndex] then
        return cache.byIndex[macroIndex]
    end
    if macroName and cache.byName and cache.byName[macroName] then
        return cache.byName[macroName]
    end
    return EMPTY_ACTIONBAR_USAGE
end

--- Updates only the usage text (separated to allow status messages to override).
function MM:UpdateMacroUsageText()
    if MM.managerStatusActive then return end
    
    local isAccount = (MM.selectedScope == "account")
    local global, perChar = GetNumMacros()
    local totalSlots = isAccount and 120 or (MAX_CHARACTER_MACROS or 30)
    local usedSlots = (isAccount and global or perChar)
    if MM.usageLabel then
        if MM.selectedScope == "library" then
             local count = MM.db.library and #MM.db.library or 0
             MM.usageLabel:SetText(L["Personal Library"] .. ": " .. count .. " / ∞")
        elseif MM.selectedScope == "warband" then
             local count = 0
             if MM.globalDb and MM.globalDb.warbandMacros then
                 for _ in pairs(MM.globalDb.warbandMacros) do count = count + 1 end
             end
             MM.usageLabel:SetText((L["Warband Vault"] or "Warband Vault") .. ": " .. count .. " / ∞")
        else
            MM.usageLabel:SetText( (isAccount and L["Account Macros"] or L["Character Macros"]) .. ": " .. usedSlots .. " / " .. totalSlots)
        end
        MM.usageLabel:SetTextColor(1, 1, 1) -- Standard color
    end
end

--- Shows a status message in the Manager panel.
function MM:ShowManagerStatus(msg, isError)
    MM.managerStatusActive = true
    if MM.usageLabel then
        MM.usageLabel:SetText(msg)
        if isError then
            MM.usageLabel:SetTextColor(1, 0, 0)
        else
            MM.usageLabel:SetTextColor(0, 1, 0)
        end
    end
    
    if MM.managerStatusTimer then C_Timer.CancelTimer(MM.managerStatusTimer) end
    MM.managerStatusTimer = C_Timer.After(3, function()
        MM.managerStatusActive = false
        if MM.usageLabel then MM.usageLabel:SetTextColor(1, 1, 1) end -- Reset color
        MM:UpdateMacroUsageText() -- Restore usage text
    end)
end

--- Refreshes the scrollable list of macros based on current scope and search filter.
function MM:UpdateMacroList()
    local list = MM.ManagerPanel and MM.ManagerPanel.listContent
    if not list then return end 
    local yOffset = 0
    
    local filter = ""
    if MM.ManagerSearch then filter = string.lower(MM.ManagerSearch:GetText()) end
    
    local scope = MM.selectedScope
    
    local numMacros = 0
    local dataSource = {} 
    
    -- Button Visibility Management handled by context menu
    
    if MM.ManagerPanel.btnImport then MM.ManagerPanel.btnImport:Show() end
    
    if scope == "account" or scope == "character" then
        local global, perChar = GetNumMacros()
        MM.dataOffset = (scope == "account") and 1 or 121
        local count = (scope == "account") and global or perChar
        numMacros = count
    elseif scope == "library" then
        dataSource = MM.db.library or {}
        numMacros = #dataSource
        MM.dataOffset = 1
    elseif scope == "warband" then
        dataSource = {}
        if MM.globalDb and MM.globalDb.warbandMacros then
            for k, v in pairs(MM.globalDb.warbandMacros) do
                table.insert(dataSource, {
                    key = k,
                    name = v.name or k,
                    icon = v.icon or 134400,
                    body = v.body or "",
                    author = v.author,
                    realm = v.realm,
                    class = v.class,
                })
            end
            table.sort(dataSource, function(a, b) return (a.name or "") < (b.name or "") end)
        end
        MM.warbandList = dataSource
        numMacros = #dataSource
        MM.dataOffset = 1
    end
    
    MM:UpdateMacroUsageText() -- Update label
    
    -- Pre-build action bar cache once for O(1) lookups during list generation
    local barCache = (scope ~= "library") and MM:BuildActionBarCache() or nil
    
    -- Reset current buttons
    if MM.macroListButtons then
        for _, btn in pairs(MM.macroListButtons) do btn:Hide() end
    else
        MM.macroListButtons = {}
    end
    
    -- Populate List
    local btnIdx = 0
    -- If normal macros: Iterate 1..count. Use (i + offset - 1) as macroID.
    -- If library: Iterate 1..count. Use i as table index.

    for i = 1, numMacros do
        local name, icon, body
        local id
        
        if scope == "library" or scope == "warband" then
            local m = dataSource[i]
            if m then
                name, icon, body = m.name, m.icon, m.body
                id = i
            end
        else
            id = MM.dataOffset + i - 1
            name, icon, body = GetMacroInfo(id)
        end
        
        if name then
            local match = true
            -- Category filter for library scope
            if scope == "library" and MM.selectedLibraryCategory and MM.selectedLibraryCategory ~= "ALL" then
                local m = dataSource[i]
                local cat = (m and m.category) or "GENERAL"
                if cat ~= MM.selectedLibraryCategory then
                    match = false
                end
            end
            
            -- Tag/Favorite search
            if match and filter ~= "" then
                local matchName = string.find(string.lower(name), filter, 1, true)
                local matchTag = false
                if MM.db and MM.db.macros and MM.db.macros[tostring(id)] and MM.db.macros[tostring(id)].tags then
                    for _, tag in ipairs(MM.db.macros[tostring(id)].tags) do
                        if string.find(string.lower(tag), filter, 1, true) then
                            matchTag = true
                            break
                        end
                    end
                end
                if not matchName and not matchTag then match = false end
            end
            
            -- Filter Favorites Only
            if match and MM.filterFavoritesOnly then
                local isFav = false
                if scope == "library" or scope == "warband" then
                    local m = dataSource[i]
                    isFav = (m and m.favorite)
                else
                    isFav = (MM.db and MM.db.macros and MM.db.macros[tostring(id)] and MM.db.macros[tostring(id)].favorite)
                end
                if not isFav then match = false end
            end
            
            if match then
                btnIdx = btnIdx + 1
                local btn = MM.macroListButtons[btnIdx]
                
                if not btn then
                    btn = CreateFrame("Button", nil, list, "BackdropTemplate")
                    btn:SetSize(150, 30)
                    
                    -- Icon
                    local tex = btn:CreateTexture(nil, "ARTWORK")
                    tex:SetSize(24, 24)
                    tex:SetPoint("LEFT", 4, 0)
                    btn.icon = tex
                    
                    -- Action Bar indicator badge
                    local barIndicator = btn:CreateTexture(nil, "OVERLAY")
                    barIndicator:SetSize(8, 8)
                    barIndicator:SetPoint("BOTTOMRIGHT", tex, "BOTTOMRIGHT", 2, -2)
                    barIndicator:SetTexture("Interface\\COMMON\\Indicator-Green")
                    barIndicator:Hide()
                    btn.barIndicator = barIndicator
                    
                    -- Text
                    local text = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
                    text:SetPoint("LEFT", tex, "RIGHT", 5, 0)
                    text:SetPoint("RIGHT", -22, 0)
                    text:SetJustifyH("LEFT")
                    text:SetWordWrap(false)
                    btn.text = text
                    
                    -- Favorite Button
                    local favBtn = CreateFrame("Button", nil, btn)
                    favBtn:SetSize(18, 18)
                    favBtn:SetPoint("RIGHT", -2, 0)
                    
                    local star = favBtn:CreateTexture(nil, "ARTWORK")
                    star:SetAllPoints()
                    star:SetTexture("Interface\\COMMON\\FavoritesIcon")
                    star:SetDesaturated(true)
                    star:SetAlpha(0.3)
                    favBtn.star = star
                    
                    favBtn:SetScript("OnClick", function(self)
                         -- Toggle Favorite
                         local parentBtn = self:GetParent()
                         local id = parentBtn.macroIndex
                         if id then
                             if MM.selectedScope == "library" then
                                 if MM.db and MM.db.library and MM.db.library[id] then
                                     MM.db.library[id].favorite = not MM.db.library[id].favorite
                                     MM:UpdateMacroList()
                                 end
                             elseif MM.selectedScope == "warband" then
                                 if MacroMaker_GlobalDB and MacroMaker_GlobalDB.warbandMacros and MacroMaker_GlobalDB.warbandMacros[id] then
                                     MacroMaker_GlobalDB.warbandMacros[id].favorite = not MacroMaker_GlobalDB.warbandMacros[id].favorite
                                     MM:UpdateMacroList()
                                 end
                             else
                                 local macroKey = tostring(id)
                                 if not MM.db.macros[macroKey] then MM.db.macros[macroKey] = {} end
                                 MM.db.macros[macroKey].favorite = not MM.db.macros[macroKey].favorite
                                 MM:UpdateMacroList() -- Refresh list to update ordering/visuals
                             end
                         end
                    end)
                    -- Prevent click propagation? Frame levels usually handle this, but explicit is safer
                    favBtn:SetScript("OnMouseDown", function() end) 
                    
                    btn.favBtn = favBtn
                    btn.star = star
                    
                    -- Highlight
                    btn:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
                    
                    -- Backdrop for Selection
                    btn:SetBackdrop({
                        bgFile = "Interface\\Buttons\\WHITE8x8",
                        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                        tile = false, tileSize = 16, edgeSize = 16,
                        insets = { left = 5, right = 5, top = 5, bottom = 5 }
                    })
                    btn:SetBackdropBorderColor(0, 0, 0, 0)
                    btn:SetBackdropColor(0, 0, 0, 0)

                    -- LibKeyBound-1.0 Support
                    btn.GetActionName = function(self)
                        return "Macro: " .. (self.macroName or (self.text and self.text:GetText()) or "Macro")
                    end
                    btn.GetHotkey = function(self)
                        local mName = self.macroName or (self.text and self.text:GetText())
                        if not mName then return "" end
                        local key1 = GetBindingKey("MACRO " .. mName)
                        local LibKeyBound = LibStub and LibStub:GetLibrary("LibKeyBound-1.0", true)
                        return (key1 and LibKeyBound and LibKeyBound:ToShortKey(key1)) or key1 or ""
                    end
                    btn.GetBindings = function(self)
                        local mName = self.macroName or (self.text and self.text:GetText())
                        if not mName then return "" end
                        local keys = { GetBindingKey("MACRO " .. mName) }
                        return table.concat(keys, ", ")
                    end
                    btn.SetKey = function(self, key)
                        local mName = self.macroName or (self.text and self.text:GetText())
                        if mName then
                            SetBindingMacro(key, mName)
                            SaveBindings(GetCurrentBindingSet())
                            if MM.ShowManagerStatus then MM:ShowManagerStatus(string.format(L["Bound '%s' to %s"] or "Bound '%s' to %s", mName, key), false) end
                            if MM.UpdateMacroList then MM:UpdateMacroList() end
                        end
                    end
                    btn.FreeKey = function(self, key)
                        local action = GetBindingAction(key)
                        SetBinding(key, nil)
                        SaveBindings(GetCurrentBindingSet())
                        return action
                    end
                    btn.ClearBindings = function(self)
                        local mName = self.macroName or (self.text and self.text:GetText())
                        if mName then
                            local cmd = "MACRO " .. mName
                            local keys = { GetBindingKey(cmd) }
                            for _, k in ipairs(keys) do SetBinding(k, nil) end
                            SaveBindings(GetCurrentBindingSet())
                            if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Keybind Reset"] or "Keybind Reset", false) end
                            if MM.UpdateMacroList then MM:UpdateMacroList() end
                        end
                    end
                    
                    -- Click Handler
                    btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
                    btn:SetScript("OnClick", function(self, button)
                        if button == "RightButton" then
                             if MM.selectedMacroIndex ~= self.macroIndex then
                                 MM:LoadMacro(self.macroIndex)
                             end
                             
                             -- Context Menu using MenuUtil (11.0+)
                             if MenuUtil then
                                 MenuUtil.CreateContextMenu(self, function(owner, rootDescription)
                                     rootDescription:CreateTitle("Macro Options")
                                     
                                     rootDescription:CreateButton(L["Duplicate"], function() MM:DuplicateMacro() end)
                                     rootDescription:CreateButton(L["Bind Key (Hover)"] or "Bind Key (Hover)", function() MM:BindMacroKey() end)
                                     rootDescription:CreateButton(L["Share to Chat"], function() MM:ShareMacro() end)
                                     rootDescription:CreateButton(L["Send to Target (Player)"] or "Send to Target (Player)", function() MM:SendSelectedMacroToTarget() end)
                                     rootDescription:CreateButton(L["Share to Party/Raid"] or "Share to Party/Raid", function() MM:SendSelectedMacroToGroup() end)
                                     
                                     rootDescription:CreateDivider()
                                     
                                     rootDescription:CreateButton(L["Export Macro"], function() 
                                         local body
                                         if MM.selectedScope == "library" then
                                             local m = MM.db.library and MM.db.library[MM.selectedMacroIndex]
                                             body = m and m.body
                                         elseif MM.selectedScope == "warband" then
                                             local m = MacroMaker_GlobalDB and MacroMaker_GlobalDB.warbandMacros and MacroMaker_GlobalDB.warbandMacros[MM.selectedMacroIndex]
                                             body = m and m.body
                                         else
                                             body = GetMacroBody(MM.selectedMacroIndex)
                                         end
                                         MM:ShowImportExportWindow("export", body or "")
                                     end)
                                     
                                     if MM.selectedScope == "account" then
                                         rootDescription:CreateButton(L["Copy to Character"], function() MM:TransferMacro(true) end)
                                         rootDescription:CreateButton(L["Save to Warband Vault"] or "Save to Warband Vault", function() MM:SaveToWarbandVault() end)
                                         rootDescription:CreateButton(L["Save to Library"], function() MM:SaveToLibrary() end)
                                     elseif MM.selectedScope == "character" then
                                         rootDescription:CreateButton(L["Copy to Account"], function() MM:TransferMacro(false) end)
                                         rootDescription:CreateButton(L["Save to Warband Vault"] or "Save to Warband Vault", function() MM:SaveToWarbandVault() end)
                                         rootDescription:CreateButton(L["Save to Library"], function() MM:SaveToLibrary() end)
                                     elseif MM.selectedScope == "warband" then
                                         rootDescription:CreateButton(L["Equip to Account"] or "Equip to Account", function() MM:EquipMacroFromWarband(false) end)
                                         rootDescription:CreateButton(L["Equip to Character"] or "Equip to Character", function() MM:EquipMacroFromWarband(true) end)
                                         rootDescription:CreateButton(L["Save to Library"], function() MM:SaveToLibrary() end)
                                     elseif MM.selectedScope == "library" then
                                         rootDescription:CreateButton(L["Equip to Account"], function() MM:EquipMacroFromLibrary(false) end)
                                         rootDescription:CreateButton(L["Equip to Character"], function() MM:EquipMacroFromLibrary(true) end)
                                         rootDescription:CreateButton(L["Save to Warband Vault"] or "Save to Warband Vault", function() MM:SaveToWarbandVault() end)
                                         
                                         -- Category submenu
                                         local catSubmenu = rootDescription:CreateButton(L["Set Category"] or "Set Category")
                                         local categories = {
                                             { id = "GENERAL", name = L["General"] or "General" },
                                             { id = "RAID_M+", name = L["Raid & M+"] or "Raid & M+" },
                                             { id = "PVP", name = L["PvP"] or "PvP" },
                                             { id = "UTILITY", name = L["Utility"] or "Utility" },
                                             { id = "CLASS", name = L["Class"] or "Class" },
                                         }
                                         for _, cat in ipairs(categories) do
                                             catSubmenu:CreateButton(cat.name, function()
                                                 if MM.db.library and MM.db.library[MM.selectedMacroIndex] then
                                                     MM.db.library[MM.selectedMacroIndex].category = cat.id
                                                     MM:UpdateMacroList()
                                                 end
                                             end)
                                         end
                                     end
                                     
                                     rootDescription:CreateDivider()
                                     
                                     rootDescription:CreateButton(L["Toggle Favorite"], function() 
                                         local id = MM.selectedMacroIndex
                                         if not id then return end
                                         if MM.selectedScope == "library" then
                                             if MM.db and MM.db.library and MM.db.library[id] then
                                                 MM.db.library[id].favorite = not MM.db.library[id].favorite
                                                 MM:UpdateMacroList()
                                             end
                                         elseif MM.selectedScope == "warband" then
                                             if MacroMaker_GlobalDB and MacroMaker_GlobalDB.warbandMacros and MacroMaker_GlobalDB.warbandMacros[id] then
                                                 MacroMaker_GlobalDB.warbandMacros[id].favorite = not MacroMaker_GlobalDB.warbandMacros[id].favorite
                                                 MM:UpdateMacroList()
                                             end
                                         else
                                             local macroKey = tostring(id)
                                             if not MM.db.macros[macroKey] then MM.db.macros[macroKey] = {} end
                                             MM.db.macros[macroKey].favorite = not MM.db.macros[macroKey].favorite
                                             MM:UpdateMacroList()
                                         end
                                     end)
                                     
                                     rootDescription:CreateButton(L["Edit Tags"], function() 
                                         MM:ShowTagEditor(MM.selectedMacroIndex)
                                     end)

                                     rootDescription:CreateDivider()
                                     
                                     local delBtn = rootDescription:CreateButton(L["Delete"], function() MM:DeleteMacro() end)
                                 end)
                             end
                        else
                            if MM.selectedMacroIndex == self.macroIndex then
                                MM:ClearBuilder()
                            else
                                MM:LoadMacro(self.macroIndex)
                            end
                        end
                    end)
                    
                    -- Drag Handler
                    btn:RegisterForDrag("LeftButton")
                    btn:SetScript("OnDragStart", function(self)
                        if MM.selectedScope ~= "library" and MM.selectedScope ~= "warband" and self.macroIndex then 
                            PickupMacro(self.macroIndex) 
                        end
                    end)

                    -- Rich Tooltip via GameTooltip
                    btn:SetScript("OnEnter", function(self)
                        local LibKeyBound = LibStub and LibStub:GetLibrary("LibKeyBound-1.0", true)
                        if LibKeyBound and LibKeyBound:IsShown() then
                            LibKeyBound:Set(self)
                            return
                        end

                        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                        GameTooltip:ClearLines()

                        local mName, mIcon, mBody, mSubtitle
                        if MM.selectedScope == "library" then
                            local m = MM.db.library and MM.db.library[self.macroIndex]
                            if m then 
                                mName, mIcon, mBody = m.name, m.icon, m.body 
                                if m.category then
                                    mSubtitle = "|cff00ccff[" .. (L[m.category] or m.category) .. "]|r"
                                end
                            end
                        elseif MM.selectedScope == "warband" then
                            local m = MacroMaker_GlobalDB and MacroMaker_GlobalDB.warbandMacros and MacroMaker_GlobalDB.warbandMacros[self.macroIndex]
                            if m then 
                                mName, mIcon, mBody = m.name, m.icon, m.body 
                                if m.author then
                                    mSubtitle = "|cff888888" .. m.author .. "|r"
                                end
                            end
                        else
                            mName, mIcon, mBody = GetMacroInfo(self.macroIndex)
                        end
                        
                        if mName then
                            local headerIcon = (type(mIcon) == "number" and ("|T" .. mIcon .. ":18:18:0:0|t ") or "")
                            local rightHeader = mSubtitle or ("|cff888888#" .. tostring(self.macroIndex) .. "|r")
                            GameTooltip:AddDoubleLine(headerIcon .. "|cffffd100" .. mName .. "|r", rightHeader)
                            
                            if mBody and mBody ~= "" then
                                GameTooltip:AddLine(" ")
                                local lineCount = 0
                                for line in mBody:gmatch("[^\r\n]+") do
                                    lineCount = lineCount + 1
                                    if lineCount <= 8 then
                                        GameTooltip:AddDoubleLine("|cff00ff00" .. lineCount .. ".|r", "|cffffffff" .. line .. "|r")
                                    end
                                end
                                if lineCount > 8 then
                                    GameTooltip:AddDoubleLine("...", "|cff888888+" .. (lineCount - 8) .. " more lines|r")
                                end
                            end
                            
                            if self.barUsage then
                                GameTooltip:AddLine(" ")
                                if self.barUsage.count > 0 then
                                    GameTooltip:AddLine("|cff00ff00" .. string.format(L["On Action Bar: %s"] or "On Action Bar: %s", table.concat(self.barUsage.list, ", ")) .. "|r", 1, 1, 1, true)
                                else
                                    GameTooltip:AddLine("|cff888888" .. (L["Not on any Action Bar"] or "Not on any Action Bar") .. "|r")
                                end
                            end
                            
                            GameTooltip:Show()
                        else
                            GameTooltip:SetText(self.text:GetText() or "Macro", 1, 0.82, 0)
                            if self.barUsage and self.barUsage.count > 0 then
                                GameTooltip:AddLine(string.format(L["On Action Bar: %s"] or "On Action Bar: %s", table.concat(self.barUsage.list, ", ")), 0, 1, 0, true)
                            end
                            GameTooltip:Show()
                        end
                    end)

                    btn:SetScript("OnLeave", function(self)
                        local LibKeyBound = LibStub and LibStub:GetLibrary("LibKeyBound-1.0", true)
                        if LibKeyBound and LibKeyBound:IsShown() then
                            LibKeyBound:Set(nil)
                        end
                        GameTooltip_Hide()
                    end)
                    
                    MM.macroListButtons[btnIdx] = btn
                end
                
                btn.macroIndex = id
                btn.macroName = name
                btn.text:SetText(name)
                btn.icon:SetTexture(icon)
                
                -- Action Bar slot scan
                if scope ~= "library" and scope ~= "warband" then
                    local usage = MM:GetMacroActionBarUsage(name, id, barCache)
                    btn.barUsage = usage
                    if usage.count > 0 then
                        btn.barIndicator:Show()
                    else
                        btn.barIndicator:Hide()
                    end
                else
                    btn.barUsage = nil
                    btn.barIndicator:Hide()
                end
                
                btn:SetPoint("TOPLEFT", 10, -yOffset)
                
                -- Update Favorite Star
                if btn.star then
                    local isFav = false
                    if scope == "library" then
                        local m = MM.db and MM.db.library and MM.db.library[id]
                        isFav = (m and m.favorite)
                    elseif scope == "warband" then
                        local m = MacroMaker_GlobalDB and MacroMaker_GlobalDB.warbandMacros and MacroMaker_GlobalDB.warbandMacros[id]
                        isFav = (m and m.favorite)
                    else
                        local macroKey = tostring(id)
                        isFav = (MM.db and MM.db.macros and MM.db.macros[macroKey] and MM.db.macros[macroKey].favorite)
                    end
                    
                    if isFav then
                        btn.star:SetDesaturated(false)
                        btn.star:SetAlpha(1.0)
                    else
                        btn.star:SetDesaturated(true)
                        btn.star:SetAlpha(0.3)
                    end
                end
                
                -- Selection Highlighting with LibCustomGlow or Backdrop
                if MM.selectedMacroIndex and MM.selectedMacroIndex == id then
                    btn:SetBackdropColor(1, 0.8, 0, 0.2)
                    btn:SetBackdropBorderColor(1, 0.8, 0, 0.5)
                    if LibCustomGlow then
                        LibCustomGlow.PixelGlow_Start(btn, {1, 0.82, 0, 1}, 8, 0.25, nil, 1)
                    end
                else
                    btn:SetBackdropColor(0, 0, 0, 0)
                    btn:SetBackdropBorderColor(0, 0, 0, 0)
                    if LibCustomGlow then
                        LibCustomGlow.PixelGlow_Stop(btn)
                    end
                end
                
                btn:Show()
                
                yOffset = yOffset + 32
            end
        end
    end
    
    list:SetHeight(yOffset > 0 and yOffset or 1)
    
    -- Auto-hide scrollbar logic
    local scrollFrame = list:GetParent()
    if scrollFrame then
        -- Fix: Check for skinned scrollbar first (MM:SkinScrollBar creates NewStandardScrollBar)
        local sfName = scrollFrame.GetName and scrollFrame:GetName()
        local scrollBar = scrollFrame.NewStandardScrollBar or scrollFrame.ScrollBar or (sfName and _G[sfName.."ScrollBar"])
        
        if scrollBar then
            local h = scrollFrame:GetHeight()
            local contentHeight = yOffset
            
            if h and h > 10 and contentHeight > h then
                scrollBar:Show()
                -- Ensure thumb/buttons are shown
                if scrollBar.ScrollDownButton then scrollBar.ScrollDownButton:Enable() end
                if scrollBar.ScrollUpButton then scrollBar.ScrollUpButton:Enable() end
            else
                scrollBar:Hide()
                scrollBar:SetValue(0)
            end
        end
    end
end
