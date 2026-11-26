--------------------------------------------------------------------------------
-- Macro Maker - Sequence Builder Module
-- Version: 3.0 (Modern Cast Sequence Studio)
-- Author: Satyros
--
-- Description:
--   Interactive studio for building `/castsequence` macros with drag-and-drop
--   spell slots, reordering controls, cooldown warnings, reset triggers, and
--   live code preview.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

--------------------------------------------------------------------------------
-- Sequence Panel
--------------------------------------------------------------------------------

--- Toggles visibility of Sequence Panel
function MM:ToggleSequencePanel()
    if MM.SequencePanel and MM.SequencePanel:IsShown() then
        MM:ShowInspectorTab("overview")
    else
        MM:ShowInspectorTab("sequence")
    end
end

function MM:CreateSequencePanel()
    local f = CreateFrame("Frame", "MM_SequencePanel", MM.InspectorPanel)
    f:SetPoint("TOPLEFT", MM.InspectorPanel, "TOPLEFT", 0, -56)
    f:SetPoint("BOTTOMRIGHT", MM.InspectorPanel, "BOTTOMRIGHT", 0, 0)
    f:Hide()
    
    -- Exclusive Visibility
    f:HookScript("OnShow", function(self)
        if MM.CloseInspectorPanels then MM:CloseInspectorPanels(self) end
        if MM.UpdateInspectorTabHighlight then MM:UpdateInspectorTabHighlight("sequence") end
        if f.UpdatePreview then f:UpdatePreview() end
    end)
    
    -- Header Title
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 12, -8)
    title:SetText(L["Cast Sequence Studio"] or "Cast Sequence Studio")
    
    -- Info / Help Icon with tooltip
    local infoBtn = CreateFrame("Button", nil, f)
    infoBtn:SetSize(16, 16)
    infoBtn:SetPoint("LEFT", title, "RIGHT", 6, 0)
    local infoTex = infoBtn:CreateTexture(nil, "ARTWORK")
    infoTex:SetAllPoints()
    infoTex:SetTexture("Interface\\FriendsFrame\\InformationIcon")
    
    infoBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["How /castsequence Works"] or "How /castsequence Works", 1, 0.82, 0)
        GameTooltip:AddLine(L["• Executes spells in order, advancing one step per click."] or "• Executes spells in order, advancing one step per click.", 1, 1, 1, true)
        GameTooltip:AddLine(L["• Resets back to step 1 after the last spell, or when reset triggers fire."] or "• Resets back to step 1 after the last spell, or when reset triggers fire.", 1, 1, 1, true)
        GameTooltip:AddLine(" ", 1, 1, 1)
        GameTooltip:AddLine(L["Important: If a spell in the sequence fails or is on cooldown, the sequence HALTS until that spell succeeds."] or "Important: If a spell in the sequence fails or is on cooldown, the sequence HALTS until that spell succeeds.", 1, 0.3, 0.3, true)
        GameTooltip:Show()
    end)
    infoBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

    -- 1. Reset Triggers Card
    local resetCard = CreateFrame("Frame", nil, f, "BackdropTemplate")
    resetCard:SetPoint("TOPLEFT", 10, -28)
    resetCard:SetPoint("TOPRIGHT", -10, -28)
    resetCard:SetHeight(74)
    resetCard:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, edgeSize = 10,
        insets = { left = 3, right = 3, top = 3, bottom = 3 }
    })
    resetCard:SetBackdropColor(0.08, 0.08, 0.12, 0.85)
    resetCard:SetBackdropBorderColor(0.25, 0.25, 0.35, 0.7)
    
    local lblResetTitle = resetCard:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblResetTitle:SetPoint("TOPLEFT", 8, -6)
    lblResetTitle:SetTextColor(0.9, 0.8, 0.4)
    lblResetTitle:SetText(L["Reset Triggers"] or "Reset Triggers")
    
    local resets = {
        { id = "combat", name = L["Combat"] or "Combat", tipTitle = L["Reset on Combat"] or "Reset im Kampf", tipDesc = L["Resets the sequence to Step 1 whenever you enter or leave combat."] or "Resets the sequence to Step 1 whenever you enter or leave combat." },
        { id = "target", name = L["Target"] or "Target", tipTitle = L["Reset on Target"] or "Reset bei Zielwechsel", tipDesc = L["Resets the sequence back to Step 1 whenever you change targets."] or "Resets the sequence back to Step 1 whenever you change targets." },
        { id = "timer",  name = L["Timer"] or "Timer", tipTitle = L["Reset Timeout (Inactivity)"] or "Reset Timeout (Inactivity)", tipDesc = L["Resets the sequence to Step 1 if the macro has not been pressed for X seconds. (Timer restarts with every click!)"] or "Resets the sequence to Step 1 if the macro has not been pressed for X seconds. (Timer restarts with every click!)" },
        { id = "shift",  name = "Shift", tipTitle = L["Reset on Shift"] or "Reset mit Shift", tipDesc = L["Resets the sequence whenever you hold the Shift key while pressing."] or "Resets the sequence whenever you hold the Shift key while pressing." },
        { id = "ctrl",   name = "Ctrl", tipTitle = L["Reset on Ctrl"] or "Reset mit Strg", tipDesc = L["Resets the sequence whenever you hold the Ctrl key while pressing."] or "Resets the sequence whenever you hold the Ctrl key while pressing." },
        { id = "alt",    name = "Alt", tipTitle = L["Reset on Alt"] or "Reset mit Alt", tipDesc = L["Resets the sequence whenever you hold the Alt key while pressing."] or "Resets the sequence whenever you hold the Alt key while pressing." },
    }
    
    f.resetChecks = {}
    
    for i, r in ipairs(resets) do
        local cb = CreateFrame("CheckButton", nil, resetCard, "SettingsCheckBoxTemplate")
        cb:SetSize(18, 18)
        if cb.SetHighlightTexture then cb:SetHighlightTexture("") end
        
        local col = (i - 1) % 3
        local row = math.floor((i - 1) / 3)
        cb:SetPoint("TOPLEFT", 8 + (col * 78), -24 - (row * 22))
        
        local clbl = resetCard:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        clbl:SetPoint("LEFT", cb, "RIGHT", 4, 0)
        clbl:SetText(r.name)
        
        if r.id == "timer" then
            local timerEdit = CreateFrame("EditBox", nil, resetCard, "InputBoxTemplate")
            timerEdit:SetSize(24, 18)
            timerEdit:SetPoint("LEFT", clbl, "RIGHT", 4, 0)
            timerEdit:SetAutoFocus(false)
            timerEdit:SetMaxLetters(3)
            timerEdit:SetNumeric(true)
            timerEdit:SetText("10")
            f.timerEdit = timerEdit
            
            local sLbl = resetCard:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
            sLbl:SetPoint("LEFT", timerEdit, "RIGHT", 2, 0)
            sLbl:SetText("s")
            
            timerEdit:SetScript("OnTextChanged", function()
                if f.UpdatePreview then f:UpdatePreview() end
            end)
        end
        
        cb.val = r.id
        cb:SetScript("OnClick", function()
            if f.UpdatePreview then f:UpdatePreview() end
        end)
        
        cb:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(r.tipTitle, 1, 0.82, 0)
            GameTooltip:AddLine(r.tipDesc, 1, 1, 1, true)
            GameTooltip:Show()
        end)
        cb:SetScript("OnLeave", function() GameTooltip:Hide() end)
        
        f.resetChecks[r.id] = cb
    end

    -- 2. Sequence Steps Header Bar
    local stepHeader = CreateFrame("Frame", nil, f)
    stepHeader:SetPoint("TOPLEFT", resetCard, "BOTTOMLEFT", 0, -4)
    stepHeader:SetPoint("TOPRIGHT", resetCard, "BOTTOMRIGHT", 0, -4)
    stepHeader:SetHeight(26)
    
    local stepCountLbl = stepHeader:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    stepCountLbl:SetPoint("LEFT", 4, 0)
    stepCountLbl:SetText(L["Steps"] or "Steps")
    f.stepCountLbl = stepCountLbl

    local timelineLbl = stepHeader:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    timelineLbl:SetPoint("LEFT", stepCountLbl, "RIGHT", 8, 0)
    timelineLbl:SetTextColor(0.4, 0.8, 1.0)
    timelineLbl:SetText("~0.0s")
    f.timelineLbl = timelineLbl
    
    local btnAdd = CreateFrame("Button", nil, stepHeader, "GameMenuButtonTemplate, BackdropTemplate")
    btnAdd:SetSize(86, 20)
    btnAdd:SetPoint("RIGHT", 0, 0)
    btnAdd:SetText(L["+ Add Step"] or "+ Add Step")
    MM:StyleButtonToModern(btnAdd)
    btnAdd:SetScript("OnClick", function() f:AddSpellRow() end)

    -- 3. Steps Scroll List
    local listScroll = CreateFrame("ScrollFrame", "$parent_SeqScroll", f, "UIPanelScrollFrameTemplate")
    listScroll:SetPoint("TOPLEFT", stepHeader, "BOTTOMLEFT", 0, -2)
    listScroll:SetPoint("BOTTOMRIGHT", -26, 115)
    MM:SkinScrollBar(listScroll)
    
    local listContent = CreateFrame("Frame", nil, listScroll)
    listContent:SetSize(260, 1)
    listScroll:SetScrollChild(listContent)
    f.listContent = listContent
    f.spells = {}

    -- 4. Live Code Preview & Action Footer Card
    local footerCard = CreateFrame("Frame", nil, f, "BackdropTemplate")
    footerCard:SetPoint("BOTTOMLEFT", 10, 8)
    footerCard:SetPoint("BOTTOMRIGHT", -10, 8)
    footerCard:SetHeight(102)
    footerCard:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, edgeSize = 10,
        insets = { left = 3, right = 3, top = 3, bottom = 3 }
    })
    footerCard:SetBackdropColor(0.06, 0.06, 0.09, 0.95)
    footerCard:SetBackdropBorderColor(0.2, 0.2, 0.3, 0.8)
    
    local previewTitle = footerCard:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    previewTitle:SetPoint("TOPLEFT", 8, -6)
    previewTitle:SetTextColor(0.4, 0.8, 1.0)
    previewTitle:SetText(L["Sequence Preview"] or "Sequence Preview")
    
    local previewEdit = CreateFrame("EditBox", nil, footerCard)
    previewEdit:SetPoint("TOPLEFT", 8, -22)
    previewEdit:SetPoint("BOTTOMRIGHT", -8, 34)
    previewEdit:SetFontObject("GameFontHighlightSmall")
    previewEdit:SetAutoFocus(false)
    previewEdit:SetMultiLine(true)
    previewEdit:SetTextInsets(4, 4, 4, 4)
    previewEdit:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    f.previewEdit = previewEdit
    
    -- Code Preview Background
    local pBg = previewEdit:CreateTexture(nil, "BACKGROUND")
    pBg:SetAllPoints()
    pBg:SetColorTexture(0, 0, 0, 0.5)

    -- Action Buttons
    local btnInsert = CreateFrame("Button", nil, footerCard, "GameMenuButtonTemplate, BackdropTemplate")
    btnInsert:SetSize(110, 22)
    btnInsert:SetPoint("BOTTOMLEFT", 8, 6)
    btnInsert:SetText(L["Insert to Macro"] or "Insert to Macro")
    MM:StyleButtonToModern(btnInsert)
    btnInsert:SetScript("OnClick", function()
        local seq = f:GenerateSequence()
        if seq and seq ~= "" and MM.outputBox then
            MM.outputBox:Insert(seq)
            if MM.GenerateMacroText then MM:GenerateMacroText() end
            if MM.UpdateCharCount then MM:UpdateCharCount(#MM.outputBox:GetText()) end
        end
    end)
    btnInsert:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(L["Insert into Macro Editor"] or "Insert into Macro Editor", 1, 1, 1)
        GameTooltip:AddLine(L["Appends or inserts this /castsequence line into your active macro."] or "Appends or inserts this /castsequence line into your active macro.", 0.8, 0.8, 0.8, true)
        GameTooltip:Show()
    end)
    btnInsert:SetScript("OnLeave", function() GameTooltip:Hide() end)
    
    local btnNewMacro = CreateFrame("Button", nil, footerCard, "GameMenuButtonTemplate, BackdropTemplate")
    btnNewMacro:SetSize(110, 22)
    btnNewMacro:SetPoint("BOTTOMRIGHT", -8, 6)
    btnNewMacro:SetText(L["Create as Macro"] or "Create as Macro")
    MM:StyleButtonToModern(btnNewMacro)
    btnNewMacro:SetScript("OnClick", function()
        local seq = f:GenerateSequence()
        if seq and seq ~= "" then
            if MM.ClearBuilder then MM:ClearBuilder() end
            if MM.nameInput then MM.nameInput:SetText("NewSequence") end
            if MM.outputBox then MM.outputBox:SetText("#showtooltip\n" .. seq) end
            if MM.ShowInspectorTab then MM:ShowInspectorTab("overview") end
            if MM.UpdateMacroPreviewIcon then MM:UpdateMacroPreviewIcon() end
        end
    end)
    btnNewMacro:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(L["Create as New Macro"] or "Create as New Macro", 1, 1, 1)
        GameTooltip:AddLine(L["Loads this complete sequence into a fresh macro on the workbench."] or "Loads this complete sequence into a fresh macro on the workbench.", 0.8, 0.8, 0.8, true)
        GameTooltip:Show()
    end)
    btnNewMacro:SetScript("OnLeave", function() GameTooltip:Hide() end)

    ----------------------------------------------------------------------------
    -- Methods & Step Management
    ----------------------------------------------------------------------------
    
    function f:UpdatePreview()
        local seq = f:GenerateSequence()
        if f.previewEdit then
            if seq and seq ~= "" then
                f.previewEdit:SetText(seq)
                f.previewEdit:SetTextColor(0.2, 1.0, 0.4)
            else
                f.previewEdit:SetText(L["(Add spells above to generate sequence...)"] or "(Add spells above to generate sequence...)")
                f.previewEdit:SetTextColor(0.5, 0.5, 0.5)
            end
        end
    end

    function f:ReAnchor()
        local y = 0
        local totalDuration = 0
        local hasCDSpells = 0
        
        for i, row in ipairs(f.spells) do
            row:ClearAllPoints()
            row:SetPoint("TOPLEFT", 0, -y)
            row:SetPoint("RIGHT", 0, 0)
            row:Show()
            row.numBadge:SetText(i)
            
            -- Enable/Disable Move buttons based on position
            if row.btnUp then
                if i == 1 then row.btnUp:Disable(); row.btnUp:SetAlpha(0.3) else row.btnUp:Enable(); row.btnUp:SetAlpha(1.0) end
            end
            if row.btnDown then
                if i == #f.spells then row.btnDown:Disable(); row.btnDown:SetAlpha(0.3) else row.btnDown:Enable(); row.btnDown:SetAlpha(1.0) end
            end
            
            local val = row.edit and row.edit:GetText()
            if val and val ~= "" then
                totalDuration = totalDuration + 1.5 -- Standard base GCD estimate
            end
            
            y = y + 42
        end
        
        f.listContent:SetHeight(y > 0 and y or 1)
        if f.stepCountLbl then
            f.stepCountLbl:SetText((L["Steps"] or "Steps") .. ": " .. #f.spells)
        end
        if f.timelineLbl then
            if totalDuration > 0 then
                f.timelineLbl:SetText(string.format("~%.1fs (GCD)", totalDuration))
            else
                f.timelineLbl:SetText("~0.0s")
            end
        end
        f:UpdatePreview()
    end
    
    function f:AddSpellRow(txt)
        local row = CreateFrame("Frame", nil, f.listContent, "BackdropTemplate")
        row:SetHeight(38)
        row:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = false, edgeSize = 8,
            insets = { left = 2, right = 2, top = 2, bottom = 2 }
        })
        row:SetBackdropColor(0.12, 0.12, 0.18, 0.8)
        row:SetBackdropBorderColor(0.2, 0.2, 0.25, 0.6)
        
        -- Step Number Badge
        local numBadge = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        numBadge:SetPoint("LEFT", 6, 0)
        numBadge:SetTextColor(0.4, 0.8, 1.0)
        numBadge:SetText(#f.spells + 1)
        row.numBadge = numBadge
        
        -- Drag & Drop Icon Slot
        local iconBtn = CreateFrame("Button", nil, row, "BackdropTemplate")
        iconBtn:SetSize(26, 26)
        iconBtn:SetPoint("LEFT", numBadge, "RIGHT", 6, 0)
        iconBtn:SetBackdrop({
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = 8,
            insets = { left = 1, right = 1, top = 1, bottom = 1 }
        })
        iconBtn:SetBackdropBorderColor(0.4, 0.4, 0.4, 0.8)
        
        local iconTex = iconBtn:CreateTexture(nil, "ARTWORK")
        iconTex:SetAllPoints()
        iconTex:SetTexCoord(0.08, 0.92, 0.08, 0.92)
        iconTex:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
        row.iconTex = iconTex
        
        -- Edit Box
        local edit = CreateFrame("EditBox", nil, row, "InputBoxTemplate")
        edit:SetSize(116, 20)
        edit:SetPoint("LEFT", iconBtn, "RIGHT", 6, 0)
        edit:SetAutoFocus(false)
        if txt then edit:SetText(txt) end
        row.edit = edit
        
        -- Cooldown Warning Indicator
        local cdBtn = CreateFrame("Button", nil, row)
        cdBtn:SetSize(16, 16)
        cdBtn:SetPoint("LEFT", edit, "RIGHT", 2, 0)
        local cdTex = cdBtn:CreateTexture(nil, "OVERLAY")
        cdTex:SetAllPoints()
        cdTex:SetTexture("Interface\\Icons\\spell_nature_timeprevention")
        cdBtn:Hide()
        row.cdBtn = cdBtn
        
        cdBtn:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(L["Cooldown Warning"] or "Cooldown Warning", 1, 0.8, 0.2)
            GameTooltip:AddLine(L["This spell has a cooldown and might halt your sequence if clicked too early."] or "This spell has a cooldown and might halt your sequence if clicked too early.", 1, 1, 1, true)
            GameTooltip:Show()
        end)
        cdBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
        
        local function UpdateRowIconAndCD()
            local val = edit:GetText()
            if val and val ~= "" then
                local texture
                if C_Spell and C_Spell.GetSpellTexture then texture = C_Spell.GetSpellTexture(val) end
                if not texture and C_Item then _, _, _, _, _, _, _, _, _, texture = C_Item.GetItemInfo(val) end
                if texture then iconTex:SetTexture(texture) else iconTex:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark") end
                
                -- CD check
                local duration = 0
                if C_Spell and C_Spell.GetSpellCooldown then
                    local cdInfo = C_Spell.GetSpellCooldown(val)
                    if cdInfo then duration = cdInfo.duration or 0 end
                end
                
                if duration > 1.5 then cdBtn:Show() else cdBtn:Hide() end
            else
                iconTex:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
                cdBtn:Hide()
            end
            f:UpdatePreview()
        end
        
        edit:SetScript("OnTextChanged", UpdateRowIconAndCD)
        
        -- Drag & Drop Handler
        local function HandleDrop(self)
            local type, id, subType = GetCursorInfo()
            local name
            if type == "spell" then
                if C_SpellBook and C_SpellBook.GetSpellBookItemName then
                    local bank = (subType == "pet") and Enum.SpellBookSpellBank.Pet or Enum.SpellBookSpellBank.Player
                    name = C_SpellBook.GetSpellBookItemName(id, bank)
                else
                    if C_Spell and C_Spell.GetSpellInfo then
                        local info = C_Spell.GetSpellInfo(id)
                        name = info and info.name
                    end
                end
            elseif type == "item" then
                if C_Item and C_Item.GetItemInfo then name = C_Item.GetItemInfo(id) end
            elseif type == "mount" and C_MountJournal then
                name = C_MountJournal.GetMountInfoByID(id)
            elseif type == "battlepet" and C_PetJournal then
                local _, customName, _, _, _, _, _, nameSource = C_PetJournal.GetPetInfoByPetID(id)
                name = customName or nameSource
            end
            
            if name then 
                edit:SetText(name) 
                ClearCursor() 
                UpdateRowIconAndCD()
            end
        end
        
        iconBtn:RegisterForDrag("LeftButton")
        iconBtn:SetScript("OnReceiveDrag", HandleDrop)
        iconBtn:SetScript("OnMouseUp", function() if GetCursorInfo() then HandleDrop() end end)
        edit:SetScript("OnReceiveDrag", HandleDrop)
        edit:SetScript("OnMouseUp", function() if GetCursorInfo() then HandleDrop() end end)
        
        -- Reorder Up Button (Arrow Up)
        local btnUp = CreateFrame("Button", nil, row, "UIPanelScrollUpButtonTemplate")
        btnUp:SetSize(16, 16)
        btnUp:SetPoint("RIGHT", -38, 0)
        btnUp:SetScript("OnClick", function()
            for k, v in ipairs(f.spells) do
                if v == row and k > 1 then
                    f.spells[k], f.spells[k-1] = f.spells[k-1], f.spells[k]
                    f:ReAnchor()
                    break
                end
            end
        end)
        btnUp:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(L["Move Up"] or "Move Up")
            GameTooltip:Show()
        end)
        btnUp:SetScript("OnLeave", function() GameTooltip:Hide() end)
        row.btnUp = btnUp
        
        -- Reorder Down Button (Arrow Down)
        local btnDown = CreateFrame("Button", nil, row, "UIPanelScrollDownButtonTemplate")
        btnDown:SetSize(16, 16)
        btnDown:SetPoint("RIGHT", -20, 0)
        btnDown:SetScript("OnClick", function()
            for k, v in ipairs(f.spells) do
                if v == row and k < #f.spells then
                    f.spells[k], f.spells[k+1] = f.spells[k+1], f.spells[k]
                    f:ReAnchor()
                    break
                end
            end
        end)
        btnDown:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(L["Move Down"] or "Move Down")
            GameTooltip:Show()
        end)
        btnDown:SetScript("OnLeave", function() GameTooltip:Hide() end)
        row.btnDown = btnDown

        -- Delete Button (✖)
        local del = CreateFrame("Button", nil, row, "UIPanelCloseButton")
        del:SetSize(18, 18)
        del:SetPoint("RIGHT", -2, 0)
        del:SetScript("OnClick", function()
            if #f.spells <= 1 then
                edit:SetText("")
                UpdateRowIconAndCD()
                return
            end
            
            for k, v in ipairs(f.spells) do
                if v == row then
                    table.remove(f.spells, k)
                    row:Hide()
                    f:ReAnchor()
                    break
                end
            end
        end)
        
        table.insert(f.spells, row)
        f:ReAnchor()
        UpdateRowIconAndCD()
    end
    
    function f:GenerateSequence()
        local resetParts = {}
        for k, cb in pairs(f.resetChecks) do
            if cb:GetChecked() then 
                if cb.val == "timer" then
                    local tVal = f.timerEdit and f.timerEdit:GetText() or "10"
                    if tVal and tVal ~= "" then
                        table.insert(resetParts, tVal)
                    end
                else
                    table.insert(resetParts, cb.val) 
                end
            end
        end
        
        local cmd = "/castsequence "
        if #resetParts > 0 then
            cmd = cmd .. "reset=" .. table.concat(resetParts, "/") .. " "
        end
        
        local spells = {}
        for _, row in ipairs(f.spells) do
            local t = row.edit:GetText()
            if t and t ~= "" then table.insert(spells, t) end
        end
        
        if #spells == 0 then return "" end
        return cmd .. table.concat(spells, ", ")
    end
    
    -- Initialize with 2 default rows
    f:AddSpellRow()
    f:AddSpellRow()
    MM.SequencePanel = f
end

--- Updates Sequence Studio with any pending steps added from other panels.
function MM:UpdateSequenceStudio()
    if not MM.SequencePanel then
        if MM.CreateSequencePanel then MM:CreateSequencePanel() end
    end
    
    local panel = MM.SequencePanel
    if panel and MM.SequenceSteps and #MM.SequenceSteps > 0 then
        for _, step in ipairs(MM.SequenceSteps) do
            local placed = false
            if panel.spells then
                for _, row in ipairs(panel.spells) do
                    local curText = row.edit and row.edit:GetText()
                    if not curText or curText == "" then
                        row.edit:SetText(step.name)
                        placed = true
                        break
                    end
                end
            end
            if not placed then
                panel:AddSpellRow(step.name)
            end
        end
        wipe(MM.SequenceSteps)
        if panel.ReAnchor then panel:ReAnchor() end
        if panel.UpdatePreview then panel:UpdatePreview() end
    end
end
