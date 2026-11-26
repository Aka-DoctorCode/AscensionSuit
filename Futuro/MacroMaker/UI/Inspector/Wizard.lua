--------------------------------------------------------------------------------
-- Macro Maker - Smart Wizard Studio
-- Version: 3.3.0
-- Author: Satyros
--
-- Description:
--   Interactive Wizard for generating common high-value macro patterns:
--   1. Harm/Help Dual-Cast (Damage + Heal on same button)
--   2. Smart Mouseover with comprehensive target/cursor fallbacks
--   3. PvP Arena 1-3 Set Generator
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

function MM:CreateWizardPanel()
    local f = CreateFrame("Frame", "MM_WizardPanel", MM.InspectorPanel)
    f:SetPoint("TOPLEFT", MM.InspectorPanel, "TOPLEFT", 0, -56)
    f:SetPoint("BOTTOMRIGHT", MM.InspectorPanel, "BOTTOMRIGHT", 0, 0)
    f:Hide()
    
    f:HookScript("OnShow", function()
        MM:CloseInspectorPanels(f)
        if MM.UpdateInspectorTabHighlight then MM:UpdateInspectorTabHighlight("wizard") end
    end)
    
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 15, -6)
    title:SetText(L["Smart Wizard Studio"] or "Smart Wizard Studio")
    
    MM.WizardPanel = f
    
    -- Scrollable Container for Wizard Sections
    local scrollFrame = CreateFrame("ScrollFrame", "MM_WizardScrollFrame", f, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 6, -26)
    scrollFrame:SetPoint("BOTTOMRIGHT", -26, 8)
    
    local content = CreateFrame("Frame", nil, scrollFrame)
    content:SetWidth(295)
    content:SetHeight(620)
    scrollFrame:SetScrollChild(content)
    f.content = content
    MM:SkinScrollBar(scrollFrame)
    
    local function CreateSectionBox(parent, yOffset, height, titleText)
        local box = CreateFrame("Frame", nil, parent, "BackdropTemplate")
        box:SetPoint("TOPLEFT", 4, -yOffset)
        box:SetPoint("TOPRIGHT", -4, -yOffset)
        box:SetHeight(height)
        box:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = false, tileSize = 16, edgeSize = 8,
            insets = { left = 2, right = 2, top = 2, bottom = 2 }
        })
        box:SetBackdropColor(0.04, 0.04, 0.06, 0.85)
        box:SetBackdropBorderColor(0.25, 0.25, 0.28, 0.9)
        
        local header = box:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        header:SetPoint("TOPLEFT", 8, -6)
        header:SetText("|cffffd100" .. titleText .. "|r")
        box.header = header
        
        return box
    end
    
    local function SetupDragDrop(editBox)
        editBox:SetScript("OnReceiveDrag", function(self)
            local infoType, info1, info2 = GetCursorInfo()
            if infoType == "spell" then
                local spellName = C_Spell and C_Spell.GetSpellName and C_Spell.GetSpellName(info1) or info2
                if spellName then self:SetText(spellName) end
                ClearCursor()
            elseif infoType == "item" then
                local itemName = C_Item and C_Item.GetItemNameByID and C_Item.GetItemNameByID(info1) or info2
                if itemName then self:SetText(itemName) end
                ClearCursor()
            end
        end)
    end

    ----------------------------------------------------------------------------
    -- 1. Harm/Help Dual-Cast Section
    ----------------------------------------------------------------------------
    local boxDual = CreateSectionBox(content, 0, 220, L["Harm/Help Dual-Cast"] or "Harm/Help Dual-Cast")
    
    -- Friendly Spell
    local lblHelp = boxDual:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblHelp:SetPoint("TOPLEFT", 10, -26)
    lblHelp:SetText(L["Help / Heal Spell:"] or "Help / Heal Spell:")
    
    local txtHelp = CreateFrame("EditBox", nil, boxDual, "InputBoxTemplate")
    txtHelp:SetPoint("TOPLEFT", 14, -42)
    txtHelp:SetSize(265, 20)
    txtHelp:SetAutoFocus(false)
    SetupDragDrop(txtHelp)
    boxDual.txtHelp = txtHelp
    
    -- Harmful Spell
    local lblHarm = boxDual:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblHarm:SetPoint("TOPLEFT", 10, -68)
    lblHarm:SetText(L["Harm / Attack Spell:"] or "Harm / Attack Spell:")
    
    local txtHarm = CreateFrame("EditBox", nil, boxDual, "InputBoxTemplate")
    txtHarm:SetPoint("TOPLEFT", 14, -84)
    txtHarm:SetSize(265, 20)
    txtHarm:SetAutoFocus(false)
    SetupDragDrop(txtHarm)
    boxDual.txtHarm = txtHarm
    
    -- Checkboxes
    local chkMO = CreateFrame("CheckButton", nil, boxDual, "SettingsCheckBoxTemplate")
    chkMO:SetPoint("TOPLEFT", 10, -112)
    chkMO:SetChecked(true)
    local lblMO = boxDual:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblMO:SetPoint("LEFT", chkMO, "RIGHT", 4, 0)
    lblMO:SetText(L["Prioritize Mouseover"] or "Prioritize Mouseover")
    
    local chkSelf = CreateFrame("CheckButton", nil, boxDual, "SettingsCheckBoxTemplate")
    chkSelf:SetPoint("TOPLEFT", 150, -112)
    chkSelf:SetChecked(true)
    local lblSelf = boxDual:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblSelf:SetPoint("LEFT", chkSelf, "RIGHT", 4, 0)
    lblSelf:SetText(L["Player Fallback (Self)"] or "Player Fallback")
    
    local chkTooltip = CreateFrame("CheckButton", nil, boxDual, "SettingsCheckBoxTemplate")
    chkTooltip:SetPoint("TOPLEFT", 10, -140)
    chkTooltip:SetChecked(true)
    local lblTooltip = boxDual:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblTooltip:SetPoint("LEFT", chkTooltip, "RIGHT", 4, 0)
    lblTooltip:SetText(L["Dynamic Tooltip"] or "Dynamic Tooltip")
    
    -- Generate Button
    local btnGenDual = CreateFrame("Button", nil, boxDual, "GameMenuButtonTemplate, BackdropTemplate")
    btnGenDual:SetPoint("BOTTOMLEFT", 12, 12)
    btnGenDual:SetPoint("BOTTOMRIGHT", -12, 12)
    btnGenDual:SetHeight(26)
    btnGenDual:SetText(L["Generate Dual-Cast Macro"] or "Generate Dual-Cast Macro")
    MM:StyleButtonToModern(btnGenDual)
    btnGenDual:SetScript("OnClick", function()
        local helpSpell = strtrim(txtHelp:GetText() or "")
        local harmSpell = strtrim(txtHarm:GetText() or "")
        if helpSpell == "" or harmSpell == "" then
            if MM.Notify then MM:Notify(L["Please enter both a friendly and enemy spell."] or "Bitte sowohl Freund- als auch Feindzauber eingeben.", "error") end
            return
        end
        
        local lines = {}
        if chkTooltip:GetChecked() then
            table.insert(lines, string.format("#showtooltip [help] %s; %s", helpSpell, harmSpell))
        end
        
        local parts = {}
        if chkMO:GetChecked() then
            table.insert(parts, string.format("[@mouseover,help,nodead] %s", helpSpell))
        end
        table.insert(parts, string.format("[help,nodead] %s", helpSpell))
        
        if chkMO:GetChecked() then
            table.insert(parts, string.format("[@mouseover,harm,nodead] %s", harmSpell))
        end
        table.insert(parts, string.format("[harm,nodead] %s", harmSpell))
        
        if chkSelf:GetChecked() then
            table.insert(parts, string.format("[@player] %s", helpSpell))
        end
        table.insert(parts, helpSpell)
        
        local fullCode = table.concat(lines, "\n") .. (chkTooltip:GetChecked() and "\n" or "") .. "/use " .. table.concat(parts, "; ")
        
        MM:ClearBuilder()
        if MM.nameInput then MM.nameInput:SetText(helpSpell .. "/" .. harmSpell) end
        MM:ParseMacroToBuilder(fullCode)
        if MM.Notify then MM:Notify(L["Dual-cast macro loaded into Builder!"] or "Dual-Cast Makro in Builder geladen!", "success") end
    end)

    ----------------------------------------------------------------------------
    -- 2. Smart Mouseover Section
    ----------------------------------------------------------------------------
    local boxMO = CreateSectionBox(content, 228, 175, L["Smart Mouseover"] or "Smart Mouseover")
    
    local lblMOSpell = boxMO:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblMOSpell:SetPoint("TOPLEFT", 10, -26)
    lblMOSpell:SetText(L["Spell / Ability:"] or "Spell / Ability:")
    
    local txtMOSpell = CreateFrame("EditBox", nil, boxMO, "InputBoxTemplate")
    txtMOSpell:SetPoint("TOPLEFT", 14, -42)
    txtMOSpell:SetSize(265, 20)
    txtMOSpell:SetAutoFocus(false)
    SetupDragDrop(txtMOSpell)
    boxMO.txtMOSpell = txtMOSpell
    
    local chkCursor = CreateFrame("CheckButton", nil, boxMO, "SettingsCheckBoxTemplate")
    chkCursor:SetPoint("TOPLEFT", 10, -74)
    local lblCursor = boxMO:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblCursor:SetPoint("LEFT", chkCursor, "RIGHT", 4, 0)
    lblCursor:SetText(L["Cursor Ground Target"] or "Cursor Ground Target")
    
    local chkTargetFallback = CreateFrame("CheckButton", nil, boxMO, "SettingsCheckBoxTemplate")
    chkTargetFallback:SetPoint("TOPLEFT", 150, -74)
    chkTargetFallback:SetChecked(true)
    local lblTarg = boxMO:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblTarg:SetPoint("LEFT", chkTargetFallback, "RIGHT", 4, 0)
    lblTarg:SetText(L["Target Fallback"] or "Target Fallback")
    
    local btnGenMO = CreateFrame("Button", nil, boxMO, "GameMenuButtonTemplate, BackdropTemplate")
    btnGenMO:SetPoint("BOTTOMLEFT", 12, 12)
    btnGenMO:SetPoint("BOTTOMRIGHT", -12, 12)
    btnGenMO:SetHeight(26)
    btnGenMO:SetText(L["Generate Mouseover Macro"] or "Generate Mouseover Macro")
    MM:StyleButtonToModern(btnGenMO)
    btnGenMO:SetScript("OnClick", function()
        local spell = strtrim(txtMOSpell:GetText() or "")
        if spell == "" then
            if MM.Notify then MM:Notify(L["Enter a spell name"] or "Zauber eingeben", "error") end
            return
        end
        
        local fullCode = "#showtooltip\n"
        if chkCursor:GetChecked() then
            fullCode = fullCode .. "/use [@cursor] " .. spell
        else
            local parts = { "[@mouseover,exists,nodead]" }
            if chkTargetFallback:GetChecked() then
                table.insert(parts, "[@target,exists,nodead]")
            end
            table.insert(parts, "[]")
            fullCode = fullCode .. "/use " .. table.concat(parts, "") .. " " .. spell
        end
        
        MM:ClearBuilder()
        if MM.nameInput then MM.nameInput:SetText(spell .. " MO") end
        MM:ParseMacroToBuilder(fullCode)
        if MM.Notify then MM:Notify(L["Mouseover macro loaded into Builder!"] or "Mouseover Makro in Builder geladen!", "success") end
    end)

    ----------------------------------------------------------------------------
    -- 3. PvP Arena 1-3 Set Section
    ----------------------------------------------------------------------------
    local boxArena = CreateSectionBox(content, 412, 180, L["PvP Arena 1-3 Set"] or "PvP Arena 1-3 Set")
    
    local lblArenaSpell = boxArena:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblArenaSpell:SetPoint("TOPLEFT", 10, -26)
    lblArenaSpell:SetText(L["CC / Interrupt Spell:"] or "CC / Interrupt Spell:")
    
    local txtArenaSpell = CreateFrame("EditBox", nil, boxArena, "InputBoxTemplate")
    txtArenaSpell:SetPoint("TOPLEFT", 14, -42)
    txtArenaSpell:SetSize(265, 20)
    txtArenaSpell:SetAutoFocus(false)
    SetupDragDrop(txtArenaSpell)
    boxArena.txtArenaSpell = txtArenaSpell
    
    local chkArenaFocus = CreateFrame("CheckButton", nil, boxArena, "SettingsCheckBoxTemplate")
    chkArenaFocus:SetPoint("TOPLEFT", 10, -74)
    chkArenaFocus:SetChecked(true)
    local lblArenaFocus = boxArena:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblArenaFocus:SetPoint("LEFT", chkArenaFocus, "RIGHT", 4, 0)
    lblArenaFocus:SetText("Focus Modifier (Shift)")
    
    local btnCreateArena = CreateFrame("Button", nil, boxArena, "GameMenuButtonTemplate, BackdropTemplate")
    btnCreateArena:SetPoint("BOTTOMLEFT", 12, 12)
    btnCreateArena:SetPoint("BOTTOMRIGHT", -12, 12)
    btnCreateArena:SetHeight(26)
    btnCreateArena:SetText(L["Create Arena 1, 2, 3 Macros"] or "Create Arena 1, 2, 3 Macros")
    MM:StyleButtonToModern(btnCreateArena)
    btnCreateArena:SetScript("OnClick", function()
        local spell = strtrim(txtArenaSpell:GetText() or "")
        if spell == "" then
            if MM.Notify then MM:Notify(L["Enter a spell name"] or "Zauber eingeben", "error") end
            return
        end
        
        local isChar = (MM.selectedScope == "character")
        local global, perChar = GetNumMacros()
        local limit = isChar and (MAX_CHARACTER_MACROS or 30) or 120
        local used = isChar and perChar or global
        
        if (limit - used) < 3 then
            if MM.Notify then MM:Notify(string.format(L["Not enough free macro slots (need 3, have %d)."] or "Not enough free macro slots (need 3, have %d).", limit - used), "error") end
            return
        end
        
        local withFocus = chkArenaFocus:GetChecked()
        local shortName = spell:sub(1, 10)
        
        for i = 1, 3 do
            local mName = shortName .. " " .. i
            local code = "#showtooltip " .. spell .. "\n"
            if withFocus then
                code = code .. "/use [@focus,mod:shift][@arena" .. i .. "] " .. spell
            else
                code = code .. "/use [@arena" .. i .. "] " .. spell
            end
            CreateMacro(mName, 134400, code, isChar)
        end
        
        if MM.UpdateMacroList then MM:UpdateMacroList() end
        if MM.Notify then MM:Notify(string.format(L["Created 3 Arena macros: %s 1, 2, 3"] or "3 Arena-Makros erstellt: %s 1, 2, 3", shortName), "success") end
    end)

    ----------------------------------------------------------------------------
    -- 4. Burst & Cooldown Stacker Section
    ----------------------------------------------------------------------------
    local boxBurst = CreateSectionBox(content, 600, 270, L["Burst & Cooldown Stacker"] or "Burst & Cooldown Stacker")
    
    local lblBurstCD = boxBurst:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblBurstCD:SetPoint("TOPLEFT", 10, -26)
    lblBurstCD:SetText(L["Major Cooldown Spell:"] or "Major Cooldown Spell:")
    
    local txtBurstCD = CreateFrame("EditBox", nil, boxBurst, "InputBoxTemplate")
    txtBurstCD:SetPoint("TOPLEFT", 14, -42)
    txtBurstCD:SetSize(265, 20)
    txtBurstCD:SetAutoFocus(false)
    SetupDragDrop(txtBurstCD)
    boxBurst.txtBurstCD = txtBurstCD
    
    local lblBurstRacial = boxBurst:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblBurstRacial:SetPoint("TOPLEFT", 10, -68)
    lblBurstRacial:SetText(L["Racial / Secondary Buff:"] or "Racial / Secondary Buff:")
    
    local txtBurstRacial = CreateFrame("EditBox", nil, boxBurst, "InputBoxTemplate")
    txtBurstRacial:SetPoint("TOPLEFT", 14, -84)
    txtBurstRacial:SetSize(205, 20)
    txtBurstRacial:SetAutoFocus(false)
    SetupDragDrop(txtBurstRacial)
    boxBurst.txtBurstRacial = txtBurstRacial
    
    local btnDetectRacial = CreateFrame("Button", nil, boxBurst, "GameMenuButtonTemplate, BackdropTemplate")
    btnDetectRacial:SetPoint("LEFT", txtBurstRacial, "RIGHT", 6, 0)
    btnDetectRacial:SetSize(54, 20)
    btnDetectRacial:SetText(L["Auto"] or "Auto")
    MM:StyleButtonToModern(btnDetectRacial)
    btnDetectRacial:SetScript("OnClick", function()
        local _, race = UnitRace("player")
        local racialMap = {
            ["Orc"] = "Blood Fury",
            ["Troll"] = "Berserking",
            ["DarkIronDwarf"] = "Fireblood",
            ["MagharOrc"] = "Ancestral Call",
            ["Dwarf"] = "Stoneform",
            ["Tauren"] = "War Stomp",
            ["BloodElf"] = "Arcane Torrent",
            ["Goblin"] = "Rocket Barrage",
            ["LightforgedDraenei"] = "Light's Judgment",
            ["Dracthyr"] = "Tail Swipe",
        }
        local detected = racialMap[race]
        if detected then
            txtBurstRacial:SetText(detected)
            if MM.Notify then MM:Notify(string.format(L["Detected racial: %s"] or "Detected racial: %s", detected), "info") end
        else
            if MM.Notify then MM:Notify(L["No offensive racial found for your race."] or "No offensive racial found for your race.", "warning") end
        end
    end)
    btnDetectRacial:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Detect Racial"] or "Detect Racial", 1, 0.82, 0)
        GameTooltip:AddLine(L["Auto-detects your character's offensive racial ability."] or "Auto-detects your character's offensive racial ability.", 1, 1, 1, true)
        GameTooltip:Show()
    end)
    btnDetectRacial:SetScript("OnLeave", function() GameTooltip:Hide() end)
    
    local lblBurstOpener = boxBurst:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblBurstOpener:SetPoint("TOPLEFT", 10, -110)
    lblBurstOpener:SetText(L["Opener / Attack Spell:"] or "Opener / Attack Spell:")
    
    local txtBurstOpener = CreateFrame("EditBox", nil, boxBurst, "InputBoxTemplate")
    txtBurstOpener:SetPoint("TOPLEFT", 14, -126)
    txtBurstOpener:SetSize(265, 20)
    txtBurstOpener:SetAutoFocus(false)
    SetupDragDrop(txtBurstOpener)
    boxBurst.txtBurstOpener = txtBurstOpener
    
    local chkTrinket1 = CreateFrame("CheckButton", nil, boxBurst, "SettingsCheckBoxTemplate")
    chkTrinket1:SetPoint("TOPLEFT", 10, -154)
    chkTrinket1:SetChecked(true)
    local lblT1 = boxBurst:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblT1:SetPoint("LEFT", chkTrinket1, "RIGHT", 4, 0)
    lblT1:SetText(L["Trinket 13"] or "Trinket 13")
    
    local chkTrinket2 = CreateFrame("CheckButton", nil, boxBurst, "SettingsCheckBoxTemplate")
    chkTrinket2:SetPoint("TOPLEFT", 105, -154)
    chkTrinket2:SetChecked(true)
    local lblT2 = boxBurst:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblT2:SetPoint("LEFT", chkTrinket2, "RIGHT", 4, 0)
    lblT2:SetText(L["Trinket 14"] or "Trinket 14")
    
    local chkBurstPot = CreateFrame("CheckButton", nil, boxBurst, "SettingsCheckBoxTemplate")
    chkBurstPot:SetPoint("TOPLEFT", 195, -154)
    chkBurstPot:SetChecked(false)
    local lblPot = boxBurst:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblPot:SetPoint("LEFT", chkBurstPot, "RIGHT", 4, 0)
    lblPot:SetText(L["Potion"] or "Potion")
    
    local btnGenBurst = CreateFrame("Button", nil, boxBurst, "GameMenuButtonTemplate, BackdropTemplate")
    btnGenBurst:SetPoint("BOTTOMLEFT", 12, 12)
    btnGenBurst:SetPoint("BOTTOMRIGHT", -12, 12)
    btnGenBurst:SetHeight(26)
    btnGenBurst:SetText(L["Generate Burst Macro"] or "Generate Burst Macro")
    MM:StyleButtonToModern(btnGenBurst)
    btnGenBurst:SetScript("OnClick", function()
        local cdSpell = strtrim(txtBurstCD:GetText() or "")
        local racialSpell = strtrim(txtBurstRacial:GetText() or "")
        local openerSpell = strtrim(txtBurstOpener:GetText() or "")
        
        if cdSpell == "" and openerSpell == "" then
            if MM.Notify then MM:Notify(L["Please enter at least a major cooldown or opener spell."] or "Bitte mindestens Cooldown oder Opener eingeben.", "error") end
            return
        end
        
        if cdSpell ~= "" and openerSpell ~= "" and MM.Validator then
            local cdOffGCD = MM.Validator:IsOffGCD(cdSpell)
            local opOffGCD = MM.Validator:IsOffGCD(openerSpell)
            if not cdOffGCD and not opOffGCD then
                if MM.Notify then MM:Notify(L["Warning: Both cooldown and opener trigger GCD. Opener may not fire on same click."] or "Warning: Both cooldown and opener trigger GCD. Opener may not fire on same click.", "warning") end
            end
        end
        
        local lines = {}
        local primary = cdSpell ~= "" and cdSpell or openerSpell
        table.insert(lines, "#showtooltip " .. primary)
        if chkTrinket1:GetChecked() then table.insert(lines, "/use 13") end
        if chkTrinket2:GetChecked() then table.insert(lines, "/use 14") end
        if chkBurstPot:GetChecked() then table.insert(lines, "/use #MacroMaker:pot") end
        if racialSpell ~= "" then table.insert(lines, "/use " .. racialSpell) end
        if cdSpell ~= "" then table.insert(lines, "/use " .. cdSpell) end
        if openerSpell ~= "" and openerSpell ~= cdSpell then table.insert(lines, "/use " .. openerSpell) end
        
        local fullCode = table.concat(lines, "\n")
        MM:ClearBuilder()
        if MM.nameInput then MM.nameInput:SetText((cdSpell ~= "" and cdSpell or "Burst"):sub(1, 12)) end
        MM:ParseMacroToBuilder(fullCode)
        if MM.Notify then MM:Notify(L["Burst macro loaded into Builder!"] or "Burst-Makro in Builder geladen!", "success") end
    end)

    ----------------------------------------------------------------------------
    -- 5. Click-Cast Dual Action Section ([btn:1] / [btn:2])
    ----------------------------------------------------------------------------
    local boxClick = CreateSectionBox(content, 878, 205, L["Click-Cast Dual Action"] or "Click-Cast Dual Action")
    
    local lblClick1 = boxClick:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblClick1:SetPoint("TOPLEFT", 10, -26)
    lblClick1:SetText(L["Left-Click (btn:1) Action:"] or "Left-Click (btn:1) Action:")
    
    local txtClick1 = CreateFrame("EditBox", nil, boxClick, "InputBoxTemplate")
    txtClick1:SetPoint("TOPLEFT", 14, -42)
    txtClick1:SetSize(265, 20)
    txtClick1:SetAutoFocus(false)
    SetupDragDrop(txtClick1)
    boxClick.txtClick1 = txtClick1
    
    local lblClick2 = boxClick:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblClick2:SetPoint("TOPLEFT", 10, -68)
    lblClick2:SetText(L["Right-Click (btn:2) Action:"] or "Right-Click (btn:2) Action:")
    
    local txtClick2 = CreateFrame("EditBox", nil, boxClick, "InputBoxTemplate")
    txtClick2:SetPoint("TOPLEFT", 14, -84)
    txtClick2:SetSize(265, 20)
    txtClick2:SetAutoFocus(false)
    SetupDragDrop(txtClick2)
    boxClick.txtClick2 = txtClick2
    
    local chkClickTip = CreateFrame("CheckButton", nil, boxClick, "SettingsCheckBoxTemplate")
    chkClickTip:SetPoint("TOPLEFT", 10, -112)
    chkClickTip:SetChecked(true)
    local lblClickTip = boxClick:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblClickTip:SetPoint("LEFT", chkClickTip, "RIGHT", 4, 0)
    lblClickTip:SetText(L["Dynamic Tooltip for Right-Click"] or "Dynamic Tooltip for Right-Click")
    
    local btnGenClick = CreateFrame("Button", nil, boxClick, "GameMenuButtonTemplate, BackdropTemplate")
    btnGenClick:SetPoint("BOTTOMLEFT", 12, 12)
    btnGenClick:SetPoint("BOTTOMRIGHT", -12, 12)
    btnGenClick:SetHeight(26)
    btnGenClick:SetText(L["Generate Click-Cast Macro"] or "Generate Click-Cast Macro")
    MM:StyleButtonToModern(btnGenClick)
    btnGenClick:SetScript("OnClick", function()
        local s1 = strtrim(txtClick1:GetText() or "")
        local s2 = strtrim(txtClick2:GetText() or "")
        if s1 == "" or s2 == "" then
            if MM.Notify then MM:Notify(L["Enter both Left-Click and Right-Click actions."] or "Bitte Links- und Rechtsklick-Aktion eingeben.", "error") end
            return
        end
        
        local fullCode = ""
        if chkClickTip:GetChecked() then
            fullCode = string.format("#showtooltip [btn:2] %s; %s\n", s2, s1)
        else
            fullCode = "#showtooltip\n"
        end
        fullCode = fullCode .. string.format("/use [btn:2] %s; %s", s2, s1)
        
        MM:ClearBuilder()
        if MM.nameInput then MM.nameInput:SetText((s1 .. "/" .. s2):sub(1, 14)) end
        MM:ParseMacroToBuilder(fullCode)
        if MM.Notify then MM:Notify(L["Click-Cast macro loaded into Builder!"] or "Klick-Wechsel Makro in Builder geladen!", "success") end
    end)

    ----------------------------------------------------------------------------
    -- 6. Smart Mount & Travel Section
    ----------------------------------------------------------------------------
    local boxTravel = CreateSectionBox(content, 1091, 235, L["Smart Mount & Travel"] or "Smart Mount & Travel")
    
    local lblFly = boxTravel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblFly:SetPoint("TOPLEFT", 10, -26)
    lblFly:SetText(L["Flying / Skyriding Mount:"] or "Flying / Skyriding Mount:")
    
    local txtFly = CreateFrame("EditBox", nil, boxTravel, "InputBoxTemplate")
    txtFly:SetPoint("TOPLEFT", 14, -42)
    txtFly:SetSize(265, 20)
    txtFly:SetAutoFocus(false)
    txtFly:SetText("Summon Favorite Mount")
    SetupDragDrop(txtFly)
    boxTravel.txtFly = txtFly
    
    local lblGround = boxTravel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblGround:SetPoint("TOPLEFT", 10, -68)
    lblGround:SetText(L["Ground Mount (Fallback):"] or "Ground Mount (Fallback):")
    
    local txtGround = CreateFrame("EditBox", nil, boxTravel, "InputBoxTemplate")
    txtGround:SetPoint("TOPLEFT", 14, -84)
    txtGround:SetSize(265, 20)
    txtGround:SetAutoFocus(false)
    SetupDragDrop(txtGround)
    boxTravel.txtGround = txtGround
    
    local chkRepairMod = CreateFrame("CheckButton", nil, boxTravel, "SettingsCheckBoxTemplate")
    chkRepairMod:SetPoint("TOPLEFT", 10, -112)
    chkRepairMod:SetChecked(true)
    local lblRep = boxTravel:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblRep:SetPoint("LEFT", chkRepairMod, "RIGHT", 4, 0)
    lblRep:SetText(L["Shift: Smart Repair Mount"] or "Shift: Smart Repair Mount")
    
    local chkClassTravel = CreateFrame("CheckButton", nil, boxTravel, "SettingsCheckBoxTemplate")
    chkClassTravel:SetPoint("TOPLEFT", 10, -138)
    chkClassTravel:SetChecked(true)
    local lblCTrav = boxTravel:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblCTrav:SetPoint("LEFT", chkClassTravel, "RIGHT", 4, 0)
    lblCTrav:SetText(L["Combat/Indoors: Class Form"] or "Combat/Indoors: Class Form")
    
    local btnGenTravel = CreateFrame("Button", nil, boxTravel, "GameMenuButtonTemplate, BackdropTemplate")
    btnGenTravel:SetPoint("BOTTOMLEFT", 12, 12)
    btnGenTravel:SetPoint("BOTTOMRIGHT", -12, 12)
    btnGenTravel:SetHeight(26)
    btnGenTravel:SetText(L["Generate Travel Macro"] or "Generate Travel Macro")
    MM:StyleButtonToModern(btnGenTravel)
    btnGenTravel:SetScript("OnClick", function()
        local flyMount = strtrim(txtFly:GetText() or "")
        if flyMount == "" then flyMount = "Summon Favorite Mount" end
        local groundMount = strtrim(txtGround:GetText() or "")
        
        local lines = { "#showtooltip" }
        if chkRepairMod:GetChecked() then
            table.insert(lines, "/use [mod:shift] #MacroMaker:repair")
        end
        
        local _, class = UnitClass("player")
        if chkClassTravel:GetChecked() then
            if class == "DRUID" then
                table.insert(lines, "/use [indoors][combat] Travel Form")
            elseif class == "SHAMAN" then
                table.insert(lines, "/use [indoors][combat] Ghost Wolf")
            end
        end
        
        table.insert(lines, "/use [swimming] " .. flyMount)
        table.insert(lines, "/use [flyable,nocombat] " .. flyMount)
        if groundMount ~= "" then
            table.insert(lines, "/use " .. groundMount)
        else
            table.insert(lines, "/use " .. flyMount)
        end
        
        local fullCode = table.concat(lines, "\n")
        MM:ClearBuilder()
        if MM.nameInput then MM.nameInput:SetText("Mount") end
        MM:ParseMacroToBuilder(fullCode)
        if MM.Notify then MM:Notify(L["Travel macro loaded into Builder!"] or "Reise-Makro in Builder geladen!", "success") end
    end)

    ----------------------------------------------------------------------------
    -- 7. Smart Interrupt & CC Section
    ----------------------------------------------------------------------------
    local boxKick = CreateSectionBox(content, 1334, 210, L["Smart Interrupt & CC"] or "Smart Interrupt & CC")
    
    local lblKick = boxKick:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblKick:SetPoint("TOPLEFT", 10, -26)
    lblKick:SetText(L["Interrupt / CC Spell:"] or "Interrupt / CC Spell:")
    
    local txtKick = CreateFrame("EditBox", nil, boxKick, "InputBoxTemplate")
    txtKick:SetPoint("TOPLEFT", 14, -42)
    txtKick:SetSize(265, 20)
    txtKick:SetAutoFocus(false)
    SetupDragDrop(txtKick)
    boxKick.txtKick = txtKick
    
    local chkStopCast = CreateFrame("CheckButton", nil, boxKick, "SettingsCheckBoxTemplate")
    chkStopCast:SetPoint("TOPLEFT", 10, -74)
    chkStopCast:SetChecked(true)
    local lblStopCast = boxKick:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblStopCast:SetPoint("LEFT", chkStopCast, "RIGHT", 4, 0)
    lblStopCast:SetText(L["Add /stopcasting"] or "Add /stopcasting")
    
    local chkKickFocus = CreateFrame("CheckButton", nil, boxKick, "SettingsCheckBoxTemplate")
    chkKickFocus:SetPoint("TOPLEFT", 10, -100)
    chkKickFocus:SetChecked(true)
    local lblKFocus = boxKick:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblKFocus:SetPoint("LEFT", chkKickFocus, "RIGHT", 4, 0)
    lblKFocus:SetText(L["Shift: Focus Target (@focus)"] or "Shift: Focus Target (@focus)")
    
    local chkKickMO = CreateFrame("CheckButton", nil, boxKick, "SettingsCheckBoxTemplate")
    chkKickMO:SetPoint("TOPLEFT", 10, -126)
    chkKickMO:SetChecked(true)
    local lblKMO = boxKick:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblKMO:SetPoint("LEFT", chkKickMO, "RIGHT", 4, 0)
    lblKMO:SetText(L["Mouseover Priority (@mouseover)"] or "Mouseover Priority (@mouseover)")
    
    local btnGenKick = CreateFrame("Button", nil, boxKick, "GameMenuButtonTemplate, BackdropTemplate")
    btnGenKick:SetPoint("BOTTOMLEFT", 12, 12)
    btnGenKick:SetPoint("BOTTOMRIGHT", -12, 12)
    btnGenKick:SetHeight(26)
    btnGenKick:SetText(L["Generate Interrupt Macro"] or "Generate Interrupt Macro")
    MM:StyleButtonToModern(btnGenKick)
    btnGenKick:SetScript("OnClick", function()
        local spell = strtrim(txtKick:GetText() or "")
        if spell == "" then
            if MM.Notify then MM:Notify(L["Enter a spell name"] or "Zauber eingeben", "error") end
            return
        end
        
        local lines = { "#showtooltip " .. spell }
        if chkStopCast:GetChecked() then
            table.insert(lines, "/stopcasting")
        end
        
        local parts = {}
        if chkKickFocus:GetChecked() then
            table.insert(parts, "[@focus,mod:shift,harm,nodead]")
        end
        if chkKickMO:GetChecked() then
            table.insert(parts, "[@mouseover,harm,nodead]")
        end
        table.insert(parts, "[]")
        table.insert(lines, "/use " .. table.concat(parts, "") .. " " .. spell)
        
        local fullCode = table.concat(lines, "\n")
        MM:ClearBuilder()
        if MM.nameInput then MM.nameInput:SetText((spell .. " Kick"):sub(1, 14)) end
        MM:ParseMacroToBuilder(fullCode)
        if MM.Notify then MM:Notify(L["Interrupt macro loaded into Builder!"] or "Interrupt-Makro in Builder geladen!", "success") end
    end)

    ----------------------------------------------------------------------------
    -- 8. Hero Talents & Dynamic Ability Switcher ([known:ID])
    ----------------------------------------------------------------------------
    local boxHero = CreateSectionBox(content, 1552, 215, L["Hero Talents & Dynamic Ability Switcher"] or "Hero Talents & Dynamic Switcher")

    local lblHero1 = boxHero:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblHero1:SetPoint("TOPLEFT", 10, -26)
    lblHero1:SetText(L["Primary / Hero Spell:"] or "Primary / Hero Spell:")

    local txtHero1 = CreateFrame("EditBox", nil, boxHero, "InputBoxTemplate")
    txtHero1:SetPoint("TOPLEFT", 14, -42)
    txtHero1:SetSize(185, 20)
    txtHero1:SetAutoFocus(false)
    SetupDragDrop(txtHero1)
    boxHero.txtHero1 = txtHero1

    local lblHeroID = boxHero:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblHeroID:SetPoint("LEFT", txtHero1, "RIGHT", 10, 0)
    lblHeroID:SetText("ID:")

    local txtHeroID = CreateFrame("EditBox", nil, boxHero, "InputBoxTemplate")
    txtHeroID:SetPoint("LEFT", lblHeroID, "RIGHT", 6, 0)
    txtHeroID:SetSize(60, 20)
    txtHeroID:SetAutoFocus(false)
    boxHero.txtHeroID = txtHeroID

    local lblHero2 = boxHero:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblHero2:SetPoint("TOPLEFT", 10, -68)
    lblHero2:SetText(L["Alternative / Base Spell:"] or "Alternative / Base Spell:")

    local txtHero2 = CreateFrame("EditBox", nil, boxHero, "InputBoxTemplate")
    txtHero2:SetPoint("TOPLEFT", 14, -84)
    txtHero2:SetSize(265, 20)
    txtHero2:SetAutoFocus(false)
    SetupDragDrop(txtHero2)
    boxHero.txtHero2 = txtHero2

    local chkHeroTooltip = CreateFrame("CheckButton", nil, boxHero, "SettingsCheckBoxTemplate")
    chkHeroTooltip:SetPoint("TOPLEFT", 10, -112)
    chkHeroTooltip:SetChecked(true)
    local lblHTip = boxHero:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblHTip:SetPoint("LEFT", chkHeroTooltip, "RIGHT", 4, 0)
    lblHTip:SetText(L["Dynamic Tooltip (#showtooltip)"] or "Dynamic Tooltip (#showtooltip)")

    local btnGenHero = CreateFrame("Button", nil, boxHero, "GameMenuButtonTemplate, BackdropTemplate")
    btnGenHero:SetPoint("BOTTOMLEFT", 12, 12)
    btnGenHero:SetPoint("BOTTOMRIGHT", -12, 12)
    btnGenHero:SetHeight(26)
    btnGenHero:SetText(L["Generate Hero Talent Macro"] or "Generate Hero Talent Macro")
    MM:StyleButtonToModern(btnGenHero)
    btnGenHero:SetScript("OnClick", function()
        local s1 = strtrim(txtHero1:GetText() or "")
        local s2 = strtrim(txtHero2:GetText() or "")
        local talentID = tonumber(strtrim(txtHeroID:GetText() or ""))

        if s1 == "" and s2 == "" then
            if MM.Notify then MM:Notify(L["Please enter at least one spell name."] or "Bitte mindestens einen Zaubernamen eingeben.", "error") end
            return
        end

        local fullCode = ""
        if MM.SmartTemplates and MM.SmartTemplates.GenerateHeroTalentMacro then
            fullCode = MM.SmartTemplates:GenerateHeroTalentMacro(s1, talentID, s2)
        else
            if talentID and talentID > 0 and s2 ~= "" then
                fullCode = string.format("#showtooltip\n/use [known:%d] %s; %s", talentID, s1, s2)
            elseif s2 ~= "" then
                fullCode = string.format("#showtooltip\n/use %s\n/use %s", s1, s2)
            else
                fullCode = string.format("#showtooltip %s\n/use %s", s1, s1)
            end
        end

        MM:ClearBuilder()
        if MM.nameInput then MM.nameInput:SetText((s1 ~= "" and s1 or s2):sub(1, 14)) end
        MM:ParseMacroToBuilder(fullCode)
        if MM.Notify then MM:Notify(L["Hero Talent macro loaded into Builder!"] or "Helden-Talent Makro in Builder geladen!", "success") end
    end)

    content:SetHeight(1790)
end
