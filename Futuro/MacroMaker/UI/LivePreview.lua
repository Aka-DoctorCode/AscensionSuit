--------------------------------------------------------------------------------
-- Macro Maker - Live Preview Module
-- Version: 3.0
-- Author: Satyros
--
-- Description:
--   Interactive Macro Simulator showing virtual action button outcome
--   and step-by-step execution evaluation pipeline.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

--- Toggles the Live Preview panel.
function MM:ToggleLivePreview()
    if MM.LivePreviewPanel and MM.LivePreviewPanel:IsShown() then
        MM:ShowInspectorTab("overview")
    else
        MM:ShowInspectorTab("preview")
    end
end

--- Creates the Live Preview UI.
function MM:CreateLivePreview()
    local f = CreateFrame("Frame", "MM_LivePreview", MM.InspectorPanel)
    f:SetPoint("TOPLEFT", MM.InspectorPanel, "TOPLEFT", 0, -56)
    f:SetPoint("BOTTOMRIGHT", MM.InspectorPanel, "BOTTOMRIGHT", 0, 0)
    f:Hide()
    
    -- Exclusive Visibility
    f:HookScript("OnShow", function(self)
        if MM.CloseInspectorPanels then MM:CloseInspectorPanels(self) end
        if MM.UpdateInspectorTabHighlight then MM:UpdateInspectorTabHighlight("preview") end
        MM:UpdateLivePreview()
    end)
    
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 15, -8)
    title:SetText(L["Live Preview"])
    
    -- Reset Simulation State Button
    local btnResetSim = CreateFrame("Button", nil, f, "GameMenuButtonTemplate, BackdropTemplate")
    btnResetSim:SetPoint("TOPRIGHT", -15, -6)
    btnResetSim:SetSize(75, 20)
    btnResetSim:SetText(L["Reset"] or "Reset")
    MM:StyleButtonToModern(btnResetSim)
    btnResetSim:SetScript("OnClick", function()
        MM:ClearLivePreview()
    end)
    btnResetSim:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Reset Simulation"] or "Reset Simulation", 1, 1, 1)
        GameTooltip:AddLine(L["Reset all modifier and combat condition toggles to default."] or "Reset all modifier and combat condition toggles to default.", 0.7, 0.7, 0.7, true)
        GameTooltip:Show()
    end)
    btnResetSim:SetScript("OnLeave", function() GameTooltip:Hide() end)

    -- Simulation Controls Container
    local ctrlBox = CreateFrame("Frame", nil, f, "BackdropTemplate")
    ctrlBox:SetPoint("TOPLEFT", 12, -30)
    ctrlBox:SetPoint("TOPRIGHT", -12, -30)
    ctrlBox:SetHeight(76)
    ctrlBox:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 8,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    ctrlBox:SetBackdropColor(0.04, 0.04, 0.05, 0.9)
    ctrlBox:SetBackdropBorderColor(0.25, 0.25, 0.3, 0.8)
    f.ctrlBox = ctrlBox

    -- Row 1: Modifiers (Pill Toggles: None, Shift, Ctrl, Alt)
    local lblMod = ctrlBox:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblMod:SetPoint("TOPLEFT", 8, -8)
    lblMod:SetText("|cffffd100" .. (L["Modifier:"] or "Modifier:") .. "|r")
    
    f.simMod = "nomod"
    local modButtons = {
        { id = "nomod", label = L["None"] or "None", x = 65, w = 48 },
        { id = "shift", label = "Shift", x = 117, w = 48 },
        { id = "ctrl",  label = "Ctrl",  x = 169, w = 48 },
        { id = "alt",   label = "Alt",   x = 221, w = 48 },
    }
    f.modBtnWidgets = {}
    for _, mb in ipairs(modButtons) do
        local b = CreateFrame("Button", nil, ctrlBox, "GameMenuButtonTemplate, BackdropTemplate")
        b:SetPoint("TOPLEFT", mb.x, -5)
        b:SetSize(mb.w, 20)
        b:SetText(mb.label)
        b:SetNormalFontObject("GameFontNormalSmall")
        MM:StyleButtonToModern(b)
        b:SetScript("OnClick", function()
            f.simMod = mb.id
            MM:UpdateSimModPills()
            MM:UpdateLivePreview()
        end)
        f.modBtnWidgets[mb.id] = b
    end

    -- Row 2: Environment Toggles (Combat, Stealth, Help, Harm, Dead)
    local envToggles = {
        { key = "simCombat", label = "Combat", x = 8 },
        { key = "simStealth", label = "Stealth", x = 70 },
        { key = "simHelp", label = "Friend", x = 132 },
        { key = "simHarm", label = "Enemy", x = 192 },
        { key = "simDead", label = "Dead", x = 248 },
    }
    for _, et in ipairs(envToggles) do
        local cb = CreateFrame("CheckButton", nil, ctrlBox, "SettingsCheckBoxTemplate")
        cb:SetSize(16, 16)
        cb:SetPoint("TOPLEFT", et.x, -46)
        
        local txt = ctrlBox:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        txt:SetPoint("LEFT", cb, "RIGHT", 2, 0)
        txt:SetText(et.label)
        
        cb:SetScript("OnClick", function(self)
            if et.key == "simHelp" and self:GetChecked() then f.simHarm:SetChecked(false) end
            if et.key == "simHarm" and self:GetChecked() then f.simHelp:SetChecked(false) end
            MM:UpdateLivePreview()
        end)
        f[et.key] = cb
    end

    -- 2. Virtual Action Button Hero Card
    local heroCard = CreateFrame("Frame", nil, f, "BackdropTemplate")
    heroCard:SetPoint("TOPLEFT", 12, -112)
    heroCard:SetPoint("TOPRIGHT", -12, -112)
    heroCard:SetHeight(74)
    heroCard:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 8,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    heroCard:SetBackdropColor(0.06, 0.08, 0.12, 0.95)
    heroCard:SetBackdropBorderColor(0.2, 0.5, 0.8, 0.9)
    f.heroCard = heroCard

    -- Action Button Slot Frame
    local slotFrame = CreateFrame("Frame", nil, heroCard, "BackdropTemplate")
    slotFrame:SetSize(46, 46)
    slotFrame:SetPoint("LEFT", 12, 0)
    slotFrame:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 6,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    slotFrame:SetBackdropColor(0, 0, 0, 1)
    slotFrame:SetBackdropBorderColor(0.9, 0.7, 0.1, 1)

    local heroIcon = slotFrame:CreateTexture(nil, "ARTWORK")
    heroIcon:SetPoint("TOPLEFT", 2, -2)
    heroIcon:SetPoint("BOTTOMRIGHT", -2, 2)
    heroIcon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    f.heroIcon = heroIcon

    local heroGlow = slotFrame:CreateTexture(nil, "OVERLAY")
    heroGlow:SetAllPoints()
    heroGlow:SetTexture("Interface\\Buttons\\CheckButtonHilight")
    heroGlow:SetBlendMode("ADD")
    heroGlow:SetAlpha(0.6)
    f.heroGlow = heroGlow

    local heroActionTitle = heroCard:CreateFontString(nil, "OVERLAY", "GameFontNormalMed2")
    heroActionTitle:SetPoint("TOPLEFT", slotFrame, "TOPRIGHT", 12, -2)
    heroActionTitle:SetPoint("RIGHT", -10, 0)
    heroActionTitle:SetJustifyH("LEFT")
    heroActionTitle:SetText(L["(No Action)"] or "(No Action)")
    f.heroActionTitle = heroActionTitle

    local heroSubText = heroCard:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    heroSubText:SetPoint("TOPLEFT", heroActionTitle, "BOTTOMLEFT", 0, -3)
    heroSubText:SetTextColor(0.4, 0.8, 1.0)
    heroSubText:SetText(L["Simulated Action Bar Output"] or "Simulated Action Bar Output")
    f.heroSubText = heroSubText

    local heroBadge = heroCard:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    heroBadge:SetPoint("BOTTOMLEFT", slotFrame, "BOTTOMRIGHT", 12, 4)
    heroBadge:SetText(L["Triggers under current conditions"] or "Triggers under current conditions")
    f.heroBadge = heroBadge

    -- Pipeline Header
    local lblPipe = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblPipe:SetPoint("TOPLEFT", 14, -192)
    lblPipe:SetText("|cffffd100" .. (L["Execution Evaluation Pipeline"] or "Execution Evaluation Pipeline") .. "|r")

    -- 3. Execution Pipeline ScrollFrame
    local scroll = CreateFrame("ScrollFrame", "$parent_ResultScroll", f, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", 12, -210)
    scroll:SetPoint("BOTTOMRIGHT", -28, 10)
    MM:SkinScrollBar(scroll)
    
    local resultContent = CreateFrame("Frame", nil, scroll)
    resultContent:SetSize(295, 1)
    scroll:SetScrollChild(resultContent)
    
    f.resultScroll = scroll
    f.resultContent = resultContent
    f.pipelineCards = {}
    
    MM.LivePreviewPanel = f
end

function MM:UpdateSimModPills()
    if not MM.LivePreviewPanel or not MM.LivePreviewPanel.modBtnWidgets then return end
    local f = MM.LivePreviewPanel
    for id, btn in pairs(f.modBtnWidgets) do
        if id == f.simMod then
            btn:SetBackdropBorderColor(1.0, 0.82, 0.0, 1.0)
            btn:SetBackdropColor(0.28, 0.22, 0.05, 0.95)
        else
            btn:SetBackdropBorderColor(0.25, 0.25, 0.28, 1.0)
            btn:SetBackdropColor(0.12, 0.12, 0.14, 0.9)
        end
    end
end

--- Clears the live preview checkboxes and results.
function MM:ClearLivePreview()
    if not MM.LivePreviewPanel then return end
    local f = MM.LivePreviewPanel
    
    f.simMod = "nomod"
    MM:UpdateSimModPills()
    
    if f.simCombat then f.simCombat:SetChecked(false) end
    if f.simStealth then f.simStealth:SetChecked(false) end
    if f.simDead then f.simDead:SetChecked(false) end
    if f.simHelp then f.simHelp:SetChecked(false) end
    if f.simHarm then f.simHarm:SetChecked(false) end
    
    MM:UpdateLivePreview()
end

--- Updates the preview results.
function MM:UpdateLivePreview()
    if not MM.LivePreviewPanel or not MM.LivePreviewPanel:IsShown() then return end
    local f = MM.LivePreviewPanel
    
    MM:UpdateSimModPills()
    
    -- Hide existing pipeline cards
    if f.pipelineCards then
        for _, card in ipairs(f.pipelineCards) do card:Hide() end
    end
    
    local simMod = f.simMod or "nomod"
    local simShift = (simMod == "shift")
    local simCtrl  = (simMod == "ctrl")
    local simAlt   = (simMod == "alt")
    local anyModActive = (simShift or simCtrl or simAlt)
    
    local simCombat = f.simCombat and f.simCombat:GetChecked()
    local simStealth = f.simStealth and f.simStealth:GetChecked()
    local simDead = f.simDead and f.simDead:GetChecked()
    local simHelp = f.simHelp and f.simHelp:GetChecked()
    local simHarm = f.simHarm and f.simHarm:GetChecked()
    
    -- Parse the output macro text
    local text = ""
    if MM.outputBox then text = MM.outputBox:GetText() or "" end
    
    if text == "" then
        f.heroIcon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
        f.heroActionTitle:SetText(L["(Empty Macro)"] or "(Empty Macro)")
        f.heroSubText:SetText(L["No macro code entered in Workbench."] or "No macro code entered in Workbench.")
        f.heroBadge:SetText("")
        f.heroCard:SetBackdropBorderColor(0.3, 0.3, 0.35, 0.8)
        f.heroCard:SetBackdropColor(0.04, 0.04, 0.05, 0.9)
        return
    end
    
    local pipelineIndex = 0
    local yOffset = 0
    local firstActionFired = false
    local heroActionSet = false
    
    for macroLine in text:gmatch("[^\r\n]+") do
        local trimmed = macroLine:match("^%s*(.-)%s*$")
        if trimmed and trimmed ~= "" then
            local cmd = trimmed:match("^(%S+)")
            if cmd then
                local lowerCmd = cmd:lower()
                
                if lowerCmd == "#showtooltip" then
                    -- Showtooltip evaluation
                    pipelineIndex = pipelineIndex + 1
                    local tipSource = trimmed:gsub("^#showtooltip%s*", "")
                    if tipSource == "" then tipSource = L["Auto / Context"] or "Auto / Context" end
                    MM:AddPipelineCard(f, pipelineIndex, yOffset, "META", "#showtooltip", tipSource, true, L["Resolves icon and tooltip dynamically."] or "Resolves icon and tooltip dynamically.", "Interface\\Icons\\INV_Misc_Book_09")
                    yOffset = yOffset + 58
                elseif lowerCmd == "/cast" or lowerCmd == "/use" or lowerCmd == "/castsequence" then
                    local payload = trimmed:gsub("^%S+%s*", "")
                    
                    for part in payload:gmatch("[^;]+") do
                        local pt = part:match("^%s*(.-)%s*$")
                        local condBlock = pt:match("^(%[.-%])") or ""
                        local spellName = pt:gsub("^%[.-%]%s*", ""):match("^%s*(.-)%s*$")
                        
                        local willFire = true
                        local skipReason = ""
                        local isModifierCondition = false
                        
                        if condBlock ~= "" then
                            local matchedOrBlock = false
                            
                            for bracket in condBlock:gmatch("%[(.-)%]") do
                                local blockMatches = true
                                for singleCond in bracket:gmatch("[^,]+") do
                                    singleCond = singleCond:match("^%s*(.-)%s*$"):lower()
                                    
                                    if singleCond == "combat" then
                                        if not simCombat then blockMatches = false skipReason = "Requires [combat]" end
                                    elseif singleCond == "nocombat" then
                                        if simCombat then blockMatches = false skipReason = "Requires [nocombat]" end
                                    elseif singleCond == "stealth" then
                                        if not simStealth then blockMatches = false skipReason = "Requires [stealth]" end
                                    elseif singleCond == "nostealth" then
                                        if simStealth then blockMatches = false skipReason = "Requires [nostealth]" end
                                    elseif singleCond == "dead" then
                                        if not simDead then blockMatches = false skipReason = "Requires [dead]" end
                                    elseif singleCond == "nodead" then
                                        if simDead then blockMatches = false skipReason = "Requires [nodead]" end
                                    elseif singleCond == "help" then
                                        if not simHelp then blockMatches = false skipReason = "Requires [help/friend]" end
                                    elseif singleCond == "harm" then
                                        if not simHarm then blockMatches = false skipReason = "Requires [harm/enemy]" end
                                    elseif singleCond == "exists" then
                                        if not (simHelp or simHarm) then blockMatches = false skipReason = "Requires [exists]" end
                                    elseif singleCond == "mod:shift" or singleCond == "modifier:shift" then
                                        isModifierCondition = true
                                        if not simShift then blockMatches = false skipReason = "Requires [mod:shift]" end
                                    elseif singleCond == "mod:ctrl" or singleCond == "modifier:ctrl" or singleCond == "mod:control" or singleCond == "modifier:control" then
                                        isModifierCondition = true
                                        if not simCtrl then blockMatches = false skipReason = "Requires [mod:ctrl]" end
                                    elseif singleCond == "mod:alt" or singleCond == "modifier:alt" then
                                        isModifierCondition = true
                                        if not simAlt then blockMatches = false skipReason = "Requires [mod:alt]" end
                                    elseif singleCond == "nomod" or singleCond == "nomodifier" then
                                        if anyModActive then blockMatches = false skipReason = "Requires [nomod]" end
                                    end
                                end
                                
                                if blockMatches then
                                    matchedOrBlock = true
                                    break
                                end
                            end
                            willFire = matchedOrBlock
                        else
                            -- No conditions: standard fallback line
                            if firstActionFired then
                                willFire = false
                                skipReason = L["Previous condition already executed."] or "Previous condition already executed."
                            end
                        end
                        
                        if firstActionFired and willFire then
                            willFire = false
                            skipReason = L["Skipped (Prior cast triggered)."] or "Skipped (Prior cast triggered)."
                        end
                        
                        pipelineIndex = pipelineIndex + 1
                        local icon = "Interface\\Icons\\INV_Misc_QuestionMark"
                        if C_Spell and C_Spell.GetSpellTexture then
                            local tex = C_Spell.GetSpellTexture(spellName)
                            if tex then icon = tex end
                        end
                        if icon == "Interface\\Icons\\INV_Misc_QuestionMark" and C_Item then
                            local _, _, _, _, _, _, _, _, _, tex = C_Item.GetItemInfo(spellName)
                            if tex then icon = tex end
                        end
                        
                        local badgeType = (lowerCmd == "/use") and "USE" or (lowerCmd == "/castsequence") and "SEQ" or "CAST"
                        local statusText = willFire and ("|cff00ff00" .. (L["TRIGGERED"] or "TRIGGERED") .. "|r " .. condBlock) 
                                                   or ("|cff888888" .. (L["SKIPPED"] or "SKIPPED") .. ": " .. skipReason .. "|r")
                        
                        MM:AddPipelineCard(f, pipelineIndex, yOffset, badgeType, lowerCmd .. " " .. spellName, statusText, willFire, condBlock, icon)
                        yOffset = yOffset + 58
                        
                        if willFire and not heroActionSet then
                            heroActionSet = true
                            firstActionFired = true
                            f.heroIcon:SetTexture(icon)
                            f.heroActionTitle:SetText("|cffffd100" .. lowerCmd .. " |r" .. spellName)
                            f.heroSubText:SetText("|cff00ff00" .. (L["Active Output: "] or "Active Output: ") .. "|r" .. (condBlock ~= "" and condBlock or "[Default]"))
                            f.heroBadge:SetText(L["Executing under current simulated state."] or "Executing under current simulated state.")
                            f.heroCard:SetBackdropBorderColor(0.2, 0.85, 0.4, 0.95)
                            f.heroCard:SetBackdropColor(0.04, 0.1, 0.06, 0.95)
                        end
                    end
                else
                    -- Custom Slash Command / Emote
                    pipelineIndex = pipelineIndex + 1
                    MM:AddPipelineCard(f, pipelineIndex, yOffset, "CMD", trimmed, "|cff00ff00" .. (L["TRIGGERED"] or "TRIGGERED") .. "|r", true, "", "Interface\\Icons\\INV_Misc_ChatIcon")
                    yOffset = yOffset + 58
                    if not heroActionSet then
                        heroActionSet = true
                        f.heroIcon:SetTexture("Interface\\Icons\\INV_Misc_ChatIcon")
                        f.heroActionTitle:SetText(trimmed)
                        f.heroSubText:SetText("|cff00ccff" .. (L["Command Action"] or "Command Action") .. "|r")
                        f.heroBadge:SetText(L["Executes immediately."] or "Executes immediately.")
                        f.heroCard:SetBackdropBorderColor(0.2, 0.7, 0.9, 0.95)
                        f.heroCard:SetBackdropColor(0.04, 0.08, 0.12, 0.95)
                    end
                end
            end
        end
    end
    
    if not heroActionSet then
        f.heroIcon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
        f.heroActionTitle:SetText("|cffff5555" .. (L["No Action Triggered"] or "No Action Triggered") .. "|r")
        f.heroSubText:SetText(L["None of the conditions matched the simulated state."] or "None of the conditions matched the simulated state.")
        f.heroBadge:SetText(L["Tip: Add a default [nomod] action without conditions."] or "Tip: Add a default [nomod] action without conditions.")
        f.heroCard:SetBackdropBorderColor(0.6, 0.2, 0.2, 0.9)
        f.heroCard:SetBackdropColor(0.1, 0.04, 0.04, 0.95)
    end
    
    f.resultContent:SetHeight(math.max(yOffset + 10, 1))
end

--- Helper: Adds or updates a styled pipeline evaluation card.
function MM:AddPipelineCard(panel, index, yOffset, badgeType, mainText, statusText, isTriggered, condBlock, iconPath)
    local card = panel.pipelineCards[index]
    if not card then
        card = CreateFrame("Frame", nil, panel.resultContent, "BackdropTemplate")
        card:SetSize(295, 52)
        card:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = false, tileSize = 16, edgeSize = 8,
            insets = { left = 2, right = 2, top = 2, bottom = 2 }
        })
        
        local icon = card:CreateTexture(nil, "ARTWORK")
        icon:SetSize(28, 28)
        icon:SetPoint("LEFT", 8, 0)
        card.icon = icon
        
        local badge = card:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        badge:SetPoint("TOPLEFT", icon, "TOPRIGHT", 8, 0)
        card.badge = badge
        
        local title = card:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        title:SetPoint("LEFT", badge, "RIGHT", 6, 0)
        title:SetPoint("RIGHT", -8, 0)
        title:SetJustifyH("LEFT")
        title:SetWordWrap(false)
        card.title = title
        
        local status = card:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
        status:SetPoint("BOTTOMLEFT", icon, "BOTTOMRIGHT", 8, 0)
        status:SetPoint("RIGHT", -8, 0)
        status:SetJustifyH("LEFT")
        status:SetWordWrap(false)
        card.status = status
        
        panel.pipelineCards[index] = card
    end
    
    card:ClearAllPoints()
    card:SetPoint("TOPLEFT", 0, -yOffset)
    card:SetPoint("RIGHT", panel.resultContent, "RIGHT", -4, 0)
    
    card.icon:SetTexture(iconPath or "Interface\\Icons\\INV_Misc_QuestionMark")
    
    -- Badge styling
    local badgeColors = {
        CAST = "|cff33ff99[CAST]|r",
        USE  = "|cff33ccff[USE]|r",
        SEQ  = "|cffff9933[SEQ]|r",
        CMD  = "|cffffd100[CMD]|r",
        META = "|cffaa88ff[META]|r",
    }
    card.badge:SetText(badgeColors[badgeType] or "[" .. badgeType .. "]")
    card.title:SetText(mainText)
    card.status:SetText(statusText)
    
    if isTriggered then
        card:SetBackdropColor(0.05, 0.12, 0.07, 0.9)
        card:SetBackdropBorderColor(0.2, 0.7, 0.3, 0.9)
        card.title:SetTextColor(1, 1, 1)
        card.icon:SetDesaturated(false)
    else
        card:SetBackdropColor(0.03, 0.03, 0.04, 0.7)
        card:SetBackdropBorderColor(0.18, 0.18, 0.2, 0.5)
        card.title:SetTextColor(0.5, 0.5, 0.5)
        card.icon:SetDesaturated(true)
    end
    
    card:Show()
end
