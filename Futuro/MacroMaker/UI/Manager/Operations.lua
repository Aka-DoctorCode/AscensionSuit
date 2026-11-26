--------------------------------------------------------------------------------
-- Macro Maker - Manager: Operations
-- Version: 2.0
-- Part of the Manager Module
-- Handles macro CRUD operations (Create, Read, Update, Delete) and actions.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

--------------------------------------------------------------------------------
-- Builder / Macro Operations
--------------------------------------------------------------------------------

--- Clears the current builder state, resetting all inputs and selection.
function MM:ClearBuilder()
    MM.selectedMacroIndex = nil
    MM.selectedMacroName = nil
    MM.selectedStaticIcon = nil
    
    if MM.nameInput then MM.nameInput:SetText("") end
    if MM.nameInput then MM.nameInput:ClearFocus() end
    if MM.outputBox then MM.outputBox:SetText("") end
    
    MM:ParseMacroToBuilder("")
    MM:UpdateMacroPreviewIcon() 
    if MM.usageLabel then MM:UpdateMacroList() end
    
    if MM.ClearLivePreview then MM:ClearLivePreview() end
end

--- Parses a raw macro body string into the Builder UI rows.
--- @param body string The macro text content to parse.
function MM:ParseMacroToBuilder(body)
    MM.isParsingMacro = true
    
    -- Reset Flags
    MM.useShowTooltip = false
    MM.tooltipSource = ""
    
    if MM.OptionsWindow then
        MM.OptionsWindow.chkShowTooltip:SetChecked(false)
        if MM.OptionsWindow.tooltipSourceInput then
            MM.OptionsWindow.tooltipSourceInput:SetText("")
            MM.OptionsWindow.tooltipSourceInput:Disable()
            MM.OptionsWindow.lblSource:SetTextColor(0.5, 0.5, 0.5)
        end
    end
    
    MM:UpdateMacroPreviewIcon()

    -- 1. Reset all rows
    for key, row in pairs(MM.rows) do
        if row.lines then
            for i = #row.lines, 1, -1 do
                row:RemoveLine(row.lines[i])
            end
        end
        
        if row.chkChat then
            row.chkChat:SetChecked(false)
            if row.chatFrame then row.chatFrame:Hide() end
            if row.chatInput then row.chatInput:SetText("") end
        end
        
        if row.contentFrame and not row.isBase then
            row.contentFrame:Hide()
            row:SetHeight(30)
        end
        
        if row.UpdateHeight then row:UpdateHeight() end
    end

    -- 2. Parse Code
    if not body or body == "" then
        MM.isParsingMacro = false
        if MM.outputBox then MM.outputBox:SetText("") end
        if MM.UpdateCharCount then MM:UpdateCharCount(0) end
        if MM.UpdateOverviewPanel then MM:UpdateOverviewPanel() end
        return 
    end
    
    -- Handle #showtooltip logic
    local showLine = body:match("#showtooltip[^\r\n]*")
    if showLine then
        MM.useShowTooltip = true
        if MM.OptionsWindow then
             MM.OptionsWindow.chkShowTooltip:SetChecked(true)
             MM.OptionsWindow.lblSource:SetTextColor(1, 1, 1)
             MM.OptionsWindow.tooltipSourceInput:Enable()
        end
        
        local source = showLine:match("#showtooltip%s+(.+)")
        if source then
            source = source:match("^%s*(.-)%s*$") -- trim
            MM.tooltipSource = source
            if MM.OptionsWindow and MM.OptionsWindow.tooltipSourceInput then
                MM.OptionsWindow.tooltipSourceInput:SetText(source)
            end
        else
            MM.tooltipSource = ""
            if MM.OptionsWindow and MM.OptionsWindow.tooltipSourceInput then
                MM.OptionsWindow.tooltipSourceInput:SetText("")
            end
        end
    else
        MM.useShowTooltip = false
        MM.tooltipSource = ""
        if MM.OptionsWindow then
             MM.OptionsWindow.chkShowTooltip:SetChecked(false)
             MM.OptionsWindow.lblSource:SetTextColor(0.5, 0.5, 0.5)
             MM.OptionsWindow.tooltipSourceInput:Disable()
             MM.OptionsWindow.tooltipSourceInput:SetText("")
        end
    end
    
    -- Extract commands
    local parts = {}
    for line in body:gmatch("[^\r\n]+") do
        local l = line:match("^%s*(.+)")
        if l then
            local cmd = l:match("^(%S+)")
            if cmd then
                cmd = cmd:lower()
                if cmd == "/cast" or cmd == "/use" then
                    local payload = l:gsub("^(%S+)%s+", "")
                    for part in payload:gmatch("[^;]+") do
                        table.insert(parts, part)
                    end
                elseif cmd:sub(1,1) == "#" then
                    -- Ignore meta-commands
                else
                    table.insert(parts, l)
                end
            end
        end
    end

    MM:UpdateMacroPreviewIcon()

    -- 3. Map commands to rows (Nomod, Shift, Ctrl, Alt)
    local modMap = { nomod = {}, shift = {}, ctrl = {}, alt = {} }
    
    for _, part in ipairs(parts) do
        local lowerPart = part:lower()
        local isShift = lowerPart:find("mod:shift")
        local isCtrl = lowerPart:find("mod:ctrl") or lowerPart:find("mod:control")
        local isAlt = lowerPart:find("mod:alt")
        
        local targetKey = "nomod"
        if isShift then targetKey = "shift"
        elseif isCtrl then targetKey = "ctrl"
        elseif isAlt then targetKey = "alt"
        end
        
        table.insert(modMap[targetKey], part)
    end
    
    -- 4. Populate Rows
    for key, partsList in pairs(modMap) do
        local row = MM.rows[key]
        if row then
            local needed = #partsList
            if needed == 0 and row.isBase then needed = 1 end
            
            while #row.lines < needed do row:AddLine() end
            while #row.lines > needed do row:RemoveLine(row.lines[#row.lines]) end
            
            for i, part in ipairs(partsList) do
                local line = row.lines[i]
                if line then
                     local rawContent = part:gsub("%[.-%]", ""):match("^%s*(.-)%s*$")
                     
                     local cmd = rawContent and rawContent:match("^(%S+)")
                     local arg = ""
                     
                     if cmd then
                         local lowerCmd = cmd:lower()
                         if MM.CommandsWithArgs and MM.CommandsWithArgs[lowerCmd] then
                             local s, e = rawContent:find(cmd)
                             if e then
                                 arg = rawContent:sub(e+1):match("^%s*(.-)%s*$")
                             end
                             line.spellInput:SetText(cmd)
                             if line.argInput then line.argInput:SetText(arg or "") end
                         else
                             line.spellInput:SetText(rawContent or "")
                             if line.argInput then line.argInput:SetText("") end
                         end
                     else
                         line.spellInput:SetText("")
                         if line.argInput then line.argInput:SetText("") end
                     end
                     
                     -- Parse inline conditions
                     for cond in part:gmatch("%[(.-)%]") do
                        for c in cond:gmatch("[^,]+") do
                            c = c:match("^%s*(.-)%s*$")
                            if c and c ~= "" and not c:find("^mod:") and c ~= "nomod" then
                                MM:SetLineCondition(line, c, true)
                            end
                        end
                     end
                end
            end
            
            if #partsList == 0 and row.isBase and row.lines[1] then
                 row.lines[1].spellInput:SetText("")
                 if row.lines[1].argInput then row.lines[1].argInput:SetText("") end
                 row.lines[1].conditions = {}
                 if row.lines[1].condBtn then row.lines[1].condBtn:SetText(L["Conditions"]) end 
            end 
            
            row:UpdateHeight()
        end
    end
    
    -- Preserve exact original macro text in outputBox
    MM.isParsingMacro = false
    if MM.outputBox then
        MM.outputBox:SetText(body)
    end
    if MM.UpdateCharCount then MM:UpdateCharCount(#body) end
    if MM.UpdateOverviewPanel then MM:UpdateOverviewPanel() end
    MM:UpdateMacroList()
end

--- Updates the visual state of a line's condition button.
function MM:SetLineCondition(line, tag, state)
    if not line.conditions then line.conditions = {} end
    if tag then line.conditions[tag] = state end
    
    local count = 0
    for k, v in pairs(line.conditions) do if v then count = count + 1 end end
    
    if line.condBtn then
        if count > 0 then
            line.condBtn:SetText(L["Conditions"].." ("..count..")")
        else
            line.condBtn:SetText(L["Conditions"])
        end
    end
end

--- Loads a macro from the game client OR Library OR Warband Vault into the Builder UI.
function MM:LoadMacro(index)
    local name, icon, body
    if MM.selectedScope == "library" then
        local m = MM.db.library[index]
        if m then
            name, icon, body = m.name, m.icon, m.body
        end
    elseif MM.selectedScope == "warband" then
        local m = MacroMaker_GlobalDB and MacroMaker_GlobalDB.warbandMacros and MacroMaker_GlobalDB.warbandMacros[index]
        if m then
            name, icon, body = m.name, m.icon, m.body
        end
    else
        name, icon, body = GetMacroInfo(index)
    end
    
    if not name then return end

    if MM.nameInput then
        MM.nameInput:SetText(name)
    end
    
    MM.selectedMacroIndex = index
    MM.selectedMacroName = name
    MM.originalMacroBody = body or ""
    
    -- Determine if this is a static icon or dynamic '?'
    local isQuestion = (not icon) or (icon == 134400) or (icon == "Interface\\Icons\\INV_Misc_QuestionMark") or (icon == "INV_Misc_QuestionMark") or (tostring(icon) == "134400")
    
    if isQuestion then
        MM.selectedStaticIcon = nil
        MM.useStaticIcon = false
    else
        MM.selectedStaticIcon = icon
        MM.useStaticIcon = true
    end 
    
    MM:ParseMacroToBuilder(body)
    MM:UpdateMacroPreviewIcon()
    if MM.UpdateLivePreview then MM:UpdateLivePreview() end
end

--- Deletes the currently selected macro.
function MM:DeleteMacro()
    if MM.selectedMacroIndex then
        if MM.selectedScope == "library" then
            if MM.Profiles then MM.Profiles:CreateBackup("Pre-Delete") end
            table.remove(MM.db.library, MM.selectedMacroIndex)
            if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Library Macro Deleted"], false) end
        elseif MM.selectedScope == "warband" then
            if MacroMaker_GlobalDB and MacroMaker_GlobalDB.warbandMacros then
                table.remove(MacroMaker_GlobalDB.warbandMacros, MM.selectedMacroIndex)
                if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Warband Macro Deleted"] or "Warband Macro Deleted", false) end
            end
        else
            DeleteMacro(MM.selectedMacroIndex)
            if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Macro Deleted"], false) end
        end
        
        -- NEW: Sync Delete to Global
        if MM.globalDb and MM.globalDb.syncMacros then
            MM.globalDb.syncMacros[MM.selectedMacroName] = nil
        end

        if MM.PlaySoundCue then MM:PlaySoundCue("delete") end
        MM:ClearBuilder() -- Reset selection
        MM:UpdateMacroList()
    else
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["No macro selected"], true) end
        if MM.PlaySoundCue then MM:PlaySoundCue("error") end
    end
end

--- Transfers (Copies) the selected macro to the other scope (Account <-> Character).
--- @param toCharacter boolean If true, copy to Character macros. If false, copy to Account macros.
function MM:TransferMacro(toCharacter)
    if not MM.selectedMacroIndex then
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["No macro selected"], true) end
        if MM.PlaySoundCue then MM:PlaySoundCue("error") end
        return
    end
    
    local name, icon, body = GetMacroInfo(MM.selectedMacroIndex)
    if not name then return end
    
    local global, perChar = GetNumMacros()
    local limit = toCharacter and (MAX_CHARACTER_MACROS or 30) or 120
    local current = toCharacter and perChar or global
    
    if current >= limit then
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["No free slots available"], true) end
        if MM.PlaySoundCue then MM:PlaySoundCue("error") end
        return
    end
    
    -- Create in target scope
    local index = CreateMacro(name, icon, body, toCharacter)
    if index then
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Macro copied to "] .. (toCharacter and L["Character"] or L["Account"]), false) end
        if MM.PlaySoundCue then MM:PlaySoundCue("copy") end
    else
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Failed to copy macro"], true) end
        if MM.PlaySoundCue then MM:PlaySoundCue("error") end
    end
end

--- Saves the current builder state content to the game macro system or library.
function MM:SaveMacro()
    local name = (MM.nameInput and MM.nameInput:GetText()) or MM.selectedMacroName or "MM_New"
    if name ~= " " then name = strtrim(name) end
    
    if name == "" then
        if MM.ShowStatus then MM:ShowStatus(L["Error: Enter a macro name"], true) end
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Error: Enter a macro name"], true) end
        if MM.PlaySoundCue then MM:PlaySoundCue("error") end
        return
    end

    local body = (MM.outputBox and MM.outputBox:GetText()) or ""
    if MM.Validator then
        local isValid, errors = MM.Validator:ValidateBody(body)
        if not isValid then
            if MM.ShowStatus then MM:ShowStatus(L["Error: Fix issues before saving"], true) end
            if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Error: Fix issues before saving"], true) end
            if MM.PlaySoundCue then MM:PlaySoundCue("error") end
            return
        end
    end
    
    local icon = 134400
    if MM.useStaticIcon and MM.selectedStaticIcon then
        icon = MM.selectedStaticIcon
    end
    
    if MM.selectedScope == "library" then
        -- Library Scope Save/Update
        if not MM.selectedMacroIndex then
            if not MM.db.library then MM.db.library = {} end
            table.insert(MM.db.library, {
                name = name,
                icon = icon,
                body = body,
                category = "GENERAL"
            })
            MM.selectedMacroIndex = #MM.db.library
            MM.selectedMacroName = name
            if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Saved to Library"], false) end
            if MM.ShowStatus then MM:ShowStatus(L["Saved to Library"], false) end
        else
            local m = MM.db.library[MM.selectedMacroIndex]
            if m then
                m.name = name
                m.icon = icon
                m.body = body
                MM.selectedMacroName = name
                if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Library Macro Updated"], false) end
                if MM.ShowStatus then MM:ShowStatus(L["Library Macro Updated"], false) end
            end
        end
        if MM.PlaySoundCue then MM:PlaySoundCue("save") end
        MM:UpdateMacroList()
        if MM.UpdateOverviewPanel then MM:UpdateOverviewPanel() end
        return
    elseif MM.selectedScope == "warband" then
        -- Warband Vault Scope Save/Update
        if not MacroMaker_GlobalDB then MacroMaker_GlobalDB = {} end
        if not MacroMaker_GlobalDB.warbandMacros then MacroMaker_GlobalDB.warbandMacros = {} end
        
        local playerName = UnitName("player") or "Unknown"
        local realmName = GetRealmName() or ""
        local authorInfo = playerName .. " - " .. realmName
        
        if not MM.selectedMacroIndex then
            table.insert(MacroMaker_GlobalDB.warbandMacros, {
                name = name,
                icon = icon,
                body = body,
                author = authorInfo,
                timestamp = time()
            })
            MM.selectedMacroIndex = #MacroMaker_GlobalDB.warbandMacros
            MM.selectedMacroName = name
            if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Saved to Warband Vault"] or "Saved to Warband Vault", false) end
            if MM.ShowStatus then MM:ShowStatus(L["Saved to Warband Vault"] or "Saved to Warband Vault", false) end
        else
            local m = MacroMaker_GlobalDB.warbandMacros[MM.selectedMacroIndex]
            if m then
                m.name = name
                m.icon = icon
                m.body = body
                m.author = authorInfo
                m.timestamp = time()
                MM.selectedMacroName = name
                if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Warband Macro Updated"] or "Warband Macro Updated", false) end
                if MM.ShowStatus then MM:ShowStatus(L["Warband Macro Updated"] or "Warband Macro Updated", false) end
            end
        end
        if MM.PlaySoundCue then MM:PlaySoundCue("save") end
        MM:UpdateMacroList()
        if MM.UpdateOverviewPanel then MM:UpdateOverviewPanel() end
        return
    end
    
    -- Game Macro Scope (Account / Character)
    local global, perChar = GetNumMacros()
    local isPerChar = (MM.selectedScope == "character")
    local limit = isPerChar and (MAX_CHARACTER_MACROS or 30) or 120
    local current = isPerChar and perChar or global
    
    if not MM.selectedMacroIndex then
        if current >= limit then
            if MM.ShowManagerStatus then MM:ShowManagerStatus(L["No free slots available"], true) end
            if MM.ShowStatus then MM:ShowStatus(L["No free slots available"], true) end
            if MM.PlaySoundCue then MM:PlaySoundCue("error") end
            return
        end
        
        local index = CreateMacro(name, icon, body, isPerChar)
        if index then
            MM.selectedMacroIndex = index
            MM.selectedMacroName = name
            MM.selectedStaticIcon = icon
            if MM.ShowManagerStatus then MM:ShowManagerStatus(L["New macro created"], false) end
            if MM.ShowStatus then MM:ShowStatus(L["New Macro Created"], false) end
            if MM.PlaySoundCue then MM:PlaySoundCue("save") end
        else
            if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Failed to create (Limit reached?)"], true) end
            if MM.ShowStatus then MM:ShowStatus(L["Failed to create (Limit reached?)"], true) end
            if MM.PlaySoundCue then MM:PlaySoundCue("error") end
            return
        end
    else
        local success = EditMacro(MM.selectedMacroIndex, name, icon, body)
        if success then
            MM.selectedMacroName = name
            if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Macro saved"], false) end
            if MM.ShowStatus then MM:ShowStatus(L["Macro Saved"] or "Macro Saved", false) end
            if MM.PlaySoundCue then MM:PlaySoundCue("save") end
        else
            if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Failed to update"], true) end
            if MM.ShowStatus then MM:ShowStatus(L["Failed to update"], true) end
            if MM.PlaySoundCue then MM:PlaySoundCue("error") end
            return
        end
    end

    -- Sync Save to Global if applicable
    if MM.globalDb and MM.globalDb.syncMacros then
        MM.globalDb.syncMacros[name] = {
            name = name,
            icon = icon,
            body = body
        }
    end

    MM:UpdateMacroList()
    if MM.UpdateOverviewPanel then MM:UpdateOverviewPanel() end
end

--- Duplicates the currently selected macro.
function MM:DuplicateMacro()
    if not MM.selectedMacroIndex then
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["No macro selected to duplicate"], true) end
        if MM.PlaySoundCue then MM:PlaySoundCue("error") end
        return
    end

    local name, icon, body
    if MM.selectedScope == "library" then
        local m = MM.db.library and MM.db.library[MM.selectedMacroIndex]
        if m then name, icon, body = m.name, m.icon, m.body end
    elseif MM.selectedScope == "warband" then
        local m = MacroMaker_GlobalDB and MacroMaker_GlobalDB.warbandMacros and MacroMaker_GlobalDB.warbandMacros[MM.selectedMacroIndex]
        if m then name, icon, body = m.name, m.icon, m.body end
    else
        name, icon, body = GetMacroInfo(MM.selectedMacroIndex)
    end
    
    if not name then return end

    local newName = "(C) " .. name
    -- Truncate to 16 chars to satisfy WoW UI limits
    if string.len(newName) > 16 then
        newName = string.sub(newName, 1, 16)
    end

    if MM.selectedScope == "library" then
        table.insert(MM.db.library, {
            name = newName,
            icon = icon,
            body = body,
            category = (MM.db.library[MM.selectedMacroIndex] and MM.db.library[MM.selectedMacroIndex].category) or "GENERAL"
        })
        MM:UpdateMacroList()
        MM:LoadMacro(#MM.db.library)
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Macro duplicated"], false) end
        if MM.PlaySoundCue then MM:PlaySoundCue("copy") end
        return
    elseif MM.selectedScope == "warband" then
        if not MacroMaker_GlobalDB.warbandMacros then MacroMaker_GlobalDB.warbandMacros = {} end
        local authorInfo = (UnitName("player") or "Unknown") .. " - " .. (GetRealmName() or "")
        table.insert(MacroMaker_GlobalDB.warbandMacros, {
            name = newName,
            icon = icon,
            body = body,
            author = authorInfo,
            timestamp = time()
        })
        MM:UpdateMacroList()
        MM:LoadMacro(#MacroMaker_GlobalDB.warbandMacros)
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Macro duplicated"], false) end
        if MM.PlaySoundCue then MM:PlaySoundCue("copy") end
        return
    end

    local isAccount = (MM.selectedScope == "account")
    local global, perChar = GetNumMacros()
    local limit = isAccount and 120 or (MAX_CHARACTER_MACROS or 30)
    local current = isAccount and global or perChar

    if current >= limit then
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["No free slots available"], true) end
        if MM.PlaySoundCue then MM:PlaySoundCue("error") end
        return
    end

    local index = CreateMacro(newName, icon, body, not isAccount)
    if index then
        MM:UpdateMacroList()
        MM:LoadMacro(index)
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Macro duplicated"], false) end
        if MM.PlaySoundCue then MM:PlaySoundCue("copy") end
    else
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Failed to duplicate macro"], true) end
        if MM.PlaySoundCue then MM:PlaySoundCue("error") end
    end
end

--- Shares the currently selected macro to chat as a draggable link.
function MM:ShareMacro()
    if not MM.selectedMacroIndex then
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["No macro selected"], true) end
        return
    end
    
    local name, icon, body
    if MM.selectedScope == "library" then
         local m = MM.db.library[MM.selectedMacroIndex]
         name, icon, body = m.name, m.icon, m.body
    elseif MM.selectedScope == "warband" then
         local m = MacroMaker_GlobalDB and MacroMaker_GlobalDB.warbandMacros and MacroMaker_GlobalDB.warbandMacros[MM.selectedMacroIndex]
         if m then name, icon, body = m.name, m.icon, m.body end
    else
         name, icon, body = GetMacroInfo(MM.selectedMacroIndex)
    end
    
    if not body then return end
    
    local encoded = MM:Base64Encode(body)
    -- Use plain text format for transmission: [MacroMaker: Name::EncodedData]
    -- We assume Name doesn't contain "::"
    local link = "[MacroMaker: " .. name .. "::" .. encoded .. "]"
    
    -- Try to insert into active chat, otherwise open default chat and insert
    if not ChatEdit_InsertLink(link) then
        local editBox = ChatEdit_ChooseBoxForSend()
        if editBox then
            ChatEdit_ActivateChat(editBox)
            editBox:Insert(link)
        else
            -- Very unlikely fallback
            print(L["Share Link: "] .. link)
        end
    end
end

--- Saves a macro to the Library. Accepts explicit args or uses selection/inputs.
function MM:SaveToLibrary(name, icon, body)
    if not name or not body then
        if not MM.selectedMacroIndex or MM.selectedScope == "library" then
            if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Select a game macro first"], true) end
            return
        end
        if MM.selectedScope == "warband" then
            local m = MacroMaker_GlobalDB and MacroMaker_GlobalDB.warbandMacros and MacroMaker_GlobalDB.warbandMacros[MM.selectedMacroIndex]
            if m then name, icon, body = m.name, m.icon, m.body end
        else
            name, icon, body = GetMacroInfo(MM.selectedMacroIndex)
        end
    end
    
    if name and body then
        if not MM.db.library then MM.db.library = {} end
        table.insert(MM.db.library, {
            name = name,
            icon = icon or 134400,
            body = body,
            category = "GENERAL"
        })
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Saved to Library"], false) end
        if MM.PlaySoundCue then MM:PlaySoundCue("save") end
        if MM.selectedScope == "library" then MM:UpdateMacroList() end
    end
end

--- Saves a macro to the account-wide Warband Vault. Accepts explicit args or uses selection/inputs.
function MM:SaveToWarbandVault(name, icon, body)
    if not name or not body then
        if MM.selectedMacroIndex then
            if MM.selectedScope == "library" then
                local m = MM.db.library and MM.db.library[MM.selectedMacroIndex]
                if m then name, icon, body = m.name, m.icon, m.body end
            elseif MM.selectedScope == "warband" then
                if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Already in Warband Vault"] or "Already in Warband Vault", true) end
                return
            else
                name, icon, body = GetMacroInfo(MM.selectedMacroIndex)
            end
        else
            name = MM.nameInput and MM.nameInput:GetText()
            body = MM.outputBox and MM.outputBox:GetText()
            icon = MM.selectedStaticIcon or 134400
        end
    end
    
    if not name or name == "" or not body or body == "" then
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["No macro selected to save to Warband"] or "No macro selected", true) end
        return
    end
    
    if not MacroMaker_GlobalDB then MacroMaker_GlobalDB = {} end
    if not MacroMaker_GlobalDB.warbandMacros then MacroMaker_GlobalDB.warbandMacros = {} end
    
    local playerName = UnitName("player") or "Unknown"
    local realmName = GetRealmName() or ""
    local authorInfo = playerName .. " - " .. realmName
    
    table.insert(MacroMaker_GlobalDB.warbandMacros, {
        name = name,
        icon = icon or 134400,
        body = body,
        author = authorInfo,
        timestamp = time()
    })
    
    if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Saved to Warband Vault"] or "Saved to Warband Vault", false) end
    if MM.ShowStatus then MM:ShowStatus(L["Saved to Warband Vault"] or "Saved to Warband Vault", false) end
    if MM.PlaySoundCue then MM:PlaySoundCue("save") end
    
    if MM.selectedScope == "warband" then
        MM:UpdateMacroList()
    end
end

------ Opens keybinding mode for macros (using LibKeyBound-1.0 if available).
function MM:BindMacroKey()
    local LibKeyBound = LibStub and LibStub:GetLibrary("LibKeyBound-1.0", true)
    if LibKeyBound then
        LibKeyBound:Toggle()
        return
    end

    if not MM.selectedMacroIndex or MM.selectedScope == "library" then
        print(L["You must select a game macro (Account/Character) to bind it."])
        return 
    end
    
    local name = GetMacroInfo(MM.selectedMacroIndex)
    if not name then return end
    
    -- Create popup if needed
    if not MM.KeybindPopup then
        local f = CreateFrame("Frame", "MM_KeybindPopup", UIParent, "BackdropTemplate")
        f:SetSize(300, 150)
        f:SetPoint("CENTER")
        f:SetFrameStrata("FULLSCREEN_DIALOG")
        f:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true, tileSize = 32, edgeSize = 32,
            insets = { left = 11, right = 12, top = 12, bottom = 11 }
        })
        
        local lbl = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        lbl:SetPoint("TOP", 0, -20)
        lbl:SetText(L["Press a key to bind"])
        
        local sub = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        sub:SetPoint("TOP", lbl, "BOTTOM", 0, -10)
        sub:SetText(L["Press ESC to Unbind/Reset"])
        
        local val = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        val:SetPoint("CENTER", 0, 0)
        val:SetText("...")
        f.val = val
        
        f:EnableKeyboard(true)
        f:SetScript("OnKeyDown", function(self, key)
            if key == "ESCAPE" then
                -- Unbind Logic
                if self.macroName then
                    local cmd = "MACRO " .. self.macroName
                    local keys = {GetBindingKey(cmd)}
                    local found = false
                    for _, k in ipairs(keys) do
                        SetBinding(k, nil)
                        found = true
                    end
                    
                    if found then
                        SaveBindings(GetCurrentBindingSet())
                        if MM.ShowManagerStatus then
                             MM:ShowManagerStatus(L["Keybind Reset"], false)
                        else
                             print(L["Keybind Reset"])
                        end
                    else
                         if MM.ShowManagerStatus then MM:ShowManagerStatus(L["No bind to reset"], true) end
                    end
                end
                self:Hide()
            else
                -- Ignore modifier-only presses
                if key ~= "LSHIFT" and key ~= "RSHIFT" and key ~= "LCTRL" and key ~= "RCTRL" and key ~= "LALT" and key ~= "RALT" then
                     local bind = key
                     -- Check constraints
                     if IsShiftKeyDown() then bind = "SHIFT-"..bind end
                     if IsControlKeyDown() then bind = "CTRL-"..bind end
                     if IsAltKeyDown() then bind = "ALT-"..bind end
                     
                     self.targetKey = bind
                     self.val:SetText(bind)
                     self:Confirm()
                end
            end
        end)
        
        function f:Confirm()
            if self.targetKey and self.macroName then
                -- Native API
                -- SetBindingMacro(key, macroName)
                local success = SetBindingMacro(self.targetKey, self.macroName)
                if success then
                    -- Save Bindings
                    SaveBindings(GetCurrentBindingSet())
                    if MM.ShowManagerStatus then
                         MM:ShowManagerStatus(format(L["Bound '%s' to %s"], self.macroName, self.targetKey), false)
                    else
                         print(format(L["Bound '%s' to %s"], self.macroName, self.targetKey))
                    end
                else
                    if MM.ShowManagerStatus then
                         MM:ShowManagerStatus(L["Failed to bind key."], true)
                    else
                         print(L["Failed to bind key."])
                    end
                end
                self:Hide()
                if MM.UpdateMacroList then MM:UpdateMacroList() end
            end
        end
        
        MM.KeybindPopup = f
    end
    
    MM.KeybindPopup.macroName = name
    MM.KeybindPopup.val:SetText("...")
    MM.KeybindPopup:Show()
end

--- Returns data table for the currently selected macro across scopes.
--- @return table|nil
function MM:GetSelectedMacroData()
    if not MM.selectedMacroIndex then return nil end
    if MM.selectedScope == "library" then
        return MM.db.library and MM.db.library[MM.selectedMacroIndex]
    elseif MM.selectedScope == "warband" then
        return MacroMaker_GlobalDB and MacroMaker_GlobalDB.warbandMacros and MacroMaker_GlobalDB.warbandMacros[MM.selectedMacroIndex]
    else
        local name, icon, body = GetMacroInfo(MM.selectedMacroIndex)
        if name then
            return { name = name, icon = icon, body = body }
        end
    end
    return nil
end

--- Sends the currently selected macro to the targeted player via AceComm-3.0.
function MM:SendSelectedMacroToTarget()
    local macroData = MM:GetSelectedMacroData()
    if not macroData then
        if MM.Notify then MM:Notify(L["No macro selected"] or "No macro selected", "error") end
        return
    end
    local targetName, targetRealm = UnitName("target")
    if not targetName or not UnitIsPlayer("target") or UnitIsUnit("player", "target") then
        if StaticPopupDialogs then
            StaticPopupDialogs["MM_SEND_TARGET_PROMPT"] = {
                text = L["Enter recipient player name:"] or "Enter recipient player name:",
                button1 = OKAY or "OK",
                button2 = CANCEL or "Cancel",
                hasEditBox = true,
                timeout = 0,
                whileDead = true,
                hideOnEscape = true,
                OnAccept = function(dialog)
                    local editBox = dialog.editBox or _G[dialog:GetName().."EditBox"]
                    local recipient = editBox and editBox:GetText()
                    if recipient and recipient ~= "" then
                        MM:SendMacroToPlayer(recipient:trim(), macroData)
                    end
                end,
                EditBoxOnEnterPressed = function(dialog)
                    local editBox = dialog.editBox or _G[dialog:GetName().."EditBox"]
                    local recipient = editBox and editBox:GetText()
                    if recipient and recipient ~= "" then
                        MM:SendMacroToPlayer(recipient:trim(), macroData)
                    end
                    dialog:Hide()
                end,
            }
            StaticPopup_Show("MM_SEND_TARGET_PROMPT")
        end
        return
    end
    if targetRealm and targetRealm ~= "" then
        targetName = targetName .. "-" .. targetRealm
    end
    MM:SendMacroToPlayer(targetName, macroData)
end

--- Sends the currently selected macro to party/raid via AceComm-3.0.
function MM:SendSelectedMacroToGroup()
    local macroData = MM:GetSelectedMacroData()
    if not macroData then
        if MM.Notify then MM:Notify(L["No macro selected"] or "No macro selected", "error") end
        return
    end
    MM:SendMacroToGroup(macroData)
end

--- Moves (Equips) the selected library macro into a game slot.
--- @param isPerChar boolean Whether to save to Character Specific macros.
function MM:EquipMacroFromLibrary(isPerChar)
    if not MM.selectedMacroIndex or MM.selectedScope ~= "library" then 
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["No macro selected"], true) end
        return 
    end
    
    local m = MM.db.library[MM.selectedMacroIndex]
    if not m then return end
    
    local global, perChar = GetNumMacros()
    local limit = isPerChar and (MAX_CHARACTER_MACROS or 30) or 120
    local current = isPerChar and perChar or global
    
    -- Check limits based on target
    if current >= limit then
        if MM.ShowManagerStatus then MM:ShowManagerStatus(isPerChar and L["Character macros full!"] or L["Account macros full!"], true) end
        return
    end
    
    -- CreateMacro(name, icon, body, perCharacter)
    local index = CreateMacro(m.name, m.icon, m.body, isPerChar)
    if index then
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Equipped Macro"], false) end
        -- Switch view to game macros to show it
        MM.selectedScope = isPerChar and "character" or "account" 
        if MM.ManagerPanel and MM.ManagerPanel.scopeDropdown then 
             MM.ManagerPanel.scopeDropdown:SetText(isPerChar and L["Character Macros"] or L["Account Macros"]) 
             -- Update Label on dropdown too
             if MM.ManagerPanel.scopeDropdown.Label then
                 MM.ManagerPanel.scopeDropdown.Label:SetText(isPerChar and L["Character Macros"] or L["Account Macros"])
             end
        end
        MM:UpdateMacroList()
        MM:LoadMacro(index)
    else
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Failed to create macro"], true) end
    end
end

--- Moves (Equips) the selected Warband Vault macro into a game slot.
--- @param isPerChar boolean Whether to save to Character Specific macros.
function MM:EquipMacroFromWarband(isPerChar)
    if not MM.selectedMacroIndex or MM.selectedScope ~= "warband" then 
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["No macro selected"], true) end
        return 
    end
    
    local m = MacroMaker_GlobalDB and MacroMaker_GlobalDB.warbandMacros and MacroMaker_GlobalDB.warbandMacros[MM.selectedMacroIndex]
    if not m then return end
    
    local global, perChar = GetNumMacros()
    local limit = isPerChar and (MAX_CHARACTER_MACROS or 30) or 120
    local current = isPerChar and perChar or global
    
    if current >= limit then
        if MM.ShowManagerStatus then MM:ShowManagerStatus(isPerChar and L["Character macros full!"] or L["Account macros full!"], true) end
        return
    end
    
    local index = CreateMacro(m.name, m.icon, m.body, isPerChar)
    if index then
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Equipped Macro"], false) end
        MM.selectedScope = isPerChar and "character" or "account" 
        if MM.ManagerPanel and MM.ManagerPanel.scopeDropdown then 
             MM.ManagerPanel.scopeDropdown:SetText(isPerChar and L["Character Macros"] or L["Account Macros"]) 
             if MM.ManagerPanel.scopeDropdown.Label then
                 MM.ManagerPanel.scopeDropdown.Label:SetText(isPerChar and L["Character Macros"] or L["Account Macros"])
             end
        end
        MM:UpdateMacroList()
        MM:LoadMacro(index)
    else
        if MM.ShowManagerStatus then MM:ShowManagerStatus(L["Failed to create macro"], true) end
    end
end

--------------------------------------------------------------------------------
-- Tag Editor Dialog
--------------------------------------------------------------------------------

--- Opens a dialog to edit comma-separated tags for a given macro key.
--- @param macroKey string The key in MM.db.macros for the macro.
function MM:ShowTagEditor(macroKey)
    if not macroKey then return end
    
    if not MM.db.macros[macroKey] then MM.db.macros[macroKey] = {} end
    
    if not MM.TagEditorFrame then
        local f = CreateFrame("Frame", "MM_TagEditor", UIParent, "BackdropTemplate")
        f:SetSize(300, 120)
        f:SetPoint("CENTER")
        f:SetFrameStrata("FULLSCREEN_DIALOG")
        f:SetMovable(true)
        f:EnableMouse(true)
        f:RegisterForDrag("LeftButton")
        f:SetScript("OnDragStart", f.StartMoving)
        f:SetScript("OnDragStop", f.StopMovingOrSizing)
        
        f:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true, tileSize = 32, edgeSize = 32,
            insets = { left = 11, right = 12, top = 12, bottom = 11 }
        })
        f:SetBackdropColor(1, 1, 1, 1)
        
        local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        title:SetPoint("TOP", 0, -20)
        title:SetText(L["Edit Tags"])
        
        local desc = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        desc:SetPoint("TOP", title, "BOTTOM", 0, -5)
        desc:SetText(L["Separate tags with commas"])
        
        local input = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
        input:SetSize(250, 20)
        input:SetPoint("TOP", desc, "BOTTOM", 0, -8)
        input:SetAutoFocus(true)
        input:SetMaxLetters(200)
        f.input = input
        
        local btnSave = CreateFrame("Button", nil, f, "GameMenuButtonTemplate, BackdropTemplate")
        btnSave:SetSize(80, 22)
        btnSave:SetPoint("BOTTOMRIGHT", -20, 15)
        btnSave:SetText(L["Save"])
        MM:StyleButtonToModern(btnSave)
        btnSave:SetScript("OnClick", function()
            local text = input:GetText() or ""
            local tags = {}
            for tag in text:gmatch("[^,]+") do
                local trimmed = tag:match("^%s*(.-)%s*$")
                if trimmed and trimmed ~= "" then
                    table.insert(tags, trimmed)
                end
            end
            MM.db.macros[f.macroKey].tags = tags
            f:Hide()
            MM:UpdateMacroList()
            if MM.Notify then MM:Notify(L["Tags saved"], "success") end
        end)
        
        local btnCancel = CreateFrame("Button", nil, f, "GameMenuButtonTemplate, BackdropTemplate")
        btnCancel:SetSize(80, 22)
        btnCancel:SetPoint("RIGHT", btnSave, "LEFT", -10, 0)
        btnCancel:SetText(L["Cancel"])
        MM:StyleButtonToModern(btnCancel)
        btnCancel:SetScript("OnClick", function() f:Hide() end)
        
        input:SetScript("OnEnterPressed", function() btnSave:Click() end)
        input:SetScript("OnEscapePressed", function() f:Hide() end)
        
        MM.TagEditorFrame = f
    end
    
    local f = MM.TagEditorFrame
    f.macroKey = macroKey
    
    -- Pre-fill existing tags
    local existing = MM.db.macros[macroKey].tags or {}
    f.input:SetText(table.concat(existing, ", "))
    f:Show()
    f.input:SetFocus()
end
