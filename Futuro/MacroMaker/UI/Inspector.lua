--------------------------------------------------------------------------------
-- Macro Maker - Inspector Module
-- Version: 1.0
-- Author: Satyros
--
-- Description:
--   Manages the "Inspector" panel (Condition Editor, Icon Options, Command Library).
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

--------------------------------------------------------------------------------
-- Inspector Panel (Container)
--------------------------------------------------------------------------------

function MM:CreateInspectorColumn(parent)
    local panel = CreateFrame("Frame", "$parent_Inspector", parent, "BackdropTemplate")
    local PANEL_BACKDROP = {
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 10,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    }
    panel:SetBackdrop(PANEL_BACKDROP)
    panel:SetBackdropColor(0.06, 0.06, 0.08, 0.7)
    panel:SetBackdropBorderColor(0.18, 0.18, 0.2, 0.8)

    -- Anchored to the right side of the main window
    panel:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -12, -50)
    panel:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -12, 10)
    panel:SetWidth(340)
    
    MM.InspectorPanel = panel
    
    -- Inspector Tab Navigation Bar at Top (2 rows of 4 tabs for clean layout)
    local tabContainer = CreateFrame("Frame", nil, panel)
    tabContainer:SetPoint("TOPLEFT", 6, -6)
    tabContainer:SetPoint("TOPRIGHT", -6, -6)
    tabContainer:SetHeight(48)
    panel.tabContainer = tabContainer
    
    local tabRows = {
        {
            { id = "overview",   label = L["Overview"] or "Overview" },
            { id = "wizard",     label = L["Wizards"] or "Wizards" },
            { id = "conditions", label = L["Conditions"] or "Conditions" },
            { id = "sequence",   label = L["Sequence"] or "Sequence" },
            { id = "announce",   label = L["Announce"] or "Announce" },
        },
        {
            { id = "icons",      label = L["Icons"] or "Icons" },
            { id = "library",    label = L["Library"] or "Library" },
            { id = "preview",    label = L["Preview"] or "Preview" },
            { id = "health",     label = L["Health"] or "Health" },
            { id = "diff",       label = L["Diff"] or "Diff" },
        }
    }
    
    MM.inspectorTabButtons = {}
    local tabWidth = 63
    local tabGap = 3
    
    for rowIdx, rowList in ipairs(tabRows) do
        local yPos = (rowIdx == 1) and 0 or -24
        local startX = 0
        for _, t in ipairs(rowList) do
            local btn = CreateFrame("Button", nil, tabContainer, "BackdropTemplate")
            btn:SetPoint("TOPLEFT", startX, yPos)
            btn:SetSize(tabWidth, 22)
            btn:SetText(t.label)
            btn:SetNormalFontObject("GameFontNormalSmall")
            btn:SetHighlightFontObject("GameFontHighlightSmall")
            MM:StyleButtonToModern(btn)
            
            btn.tabId = t.id
            
            -- Home Designer Filled-Gold Sub-Tab Design
            btn:SetBackdropColor(0.12, 0.12, 0.14, 0.90)
            btn:SetBackdropBorderColor(0.24, 0.24, 0.28, 0.80)
            local fs = btn:GetFontString()
            if fs then fs:SetTextColor(0.85, 0.85, 0.85, 1) end

            btn:SetScript("OnEnter", function(self)
                local fstr = self:GetFontString()
                if self.isActive then
                    self:SetBackdropColor(0.25, 0.22, 0.15, 1.0)
                    self:SetBackdropBorderColor(1.0, 0.88, 0.50, 1.0)
                    if fstr then fstr:SetTextColor(1.0, 0.95, 0.65, 1) end
                else
                    self:SetBackdropColor(0.18, 0.17, 0.20, 0.95)
                    self:SetBackdropBorderColor(0.78, 0.61, 0.43, 1.0)
                    if fstr then fstr:SetTextColor(1.0, 0.85, 0.5, 1) end
                end
            end)
            btn:SetScript("OnLeave", function(self)
                local fstr = self:GetFontString()
                if self.isActive then
                    self:SetBackdropColor(0.20, 0.18, 0.13, 0.95)
                    self:SetBackdropBorderColor(0.85, 0.70, 0.25, 1.0)
                    if fstr then fstr:SetTextColor(1.0, 0.88, 0.45, 1) end
                else
                    self:SetBackdropColor(0.12, 0.12, 0.14, 0.90)
                    self:SetBackdropBorderColor(0.24, 0.24, 0.28, 0.80)
                    if fstr then fstr:SetTextColor(0.85, 0.85, 0.85, 1) end
                end
            end)

            btn:SetScript("OnClick", function()
                PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB)
                MM:ShowInspectorTab(t.id)
            end)
            
            MM.inspectorTabButtons[t.id] = btn
            startX = startX + tabWidth + tabGap
        end
    end
    
    -- Initialize sub-panels
    MM:CreateOverviewPanel()
    if MM.CreateConditionEditor then MM:CreateConditionEditor() end
    if MM.CreateOptionsWindow then MM:CreateOptionsWindow() end
    if MM.CreateLibraryPanel then MM:CreateLibraryPanel() end
    if MM.SetupCommandPanel then MM:SetupCommandPanel() end
    if MM.CreateWizardPanel then MM:CreateWizardPanel() end
    if MM.CreateHealthCheckPanel then MM:CreateHealthCheckPanel() end
    if MM.CreateAnnouncePanel then MM:CreateAnnouncePanel() end
    if MM.CreateDiffViewerPanel then MM:CreateDiffViewerPanel() end
    
    -- Default to showing Overview
    MM:ShowInspectorTab("overview")
end

--- Closes all Inspector sub-panels.
function MM:CloseInspectorPanels(except)
    if MM.OverviewPanel and MM.OverviewPanel ~= except and MM.OverviewPanel:IsShown() then MM.OverviewPanel:Hide() end
    if MM.OptionsWindow and MM.OptionsWindow ~= except and MM.OptionsWindow:IsShown() then MM.OptionsWindow:Hide() end
    if MM.CommandPanel and MM.CommandPanel ~= except and MM.CommandPanel:IsShown() then MM.CommandPanel:Hide() end
    if MM.ConditionEditor and MM.ConditionEditor ~= except and MM.ConditionEditor:IsShown() then MM.ConditionEditor:Hide() end
    if MM.SequencePanel and MM.SequencePanel ~= except and MM.SequencePanel:IsShown() then MM.SequencePanel:Hide() end
    if MM.LibraryPanel and MM.LibraryPanel ~= except and MM.LibraryPanel:IsShown() then MM.LibraryPanel:Hide() end
    if MM.LivePreviewPanel and MM.LivePreviewPanel ~= except and MM.LivePreviewPanel:IsShown() then MM.LivePreviewPanel:Hide() end
    if MM.WizardPanel and MM.WizardPanel ~= except and MM.WizardPanel:IsShown() then MM.WizardPanel:Hide() end
    if MM.HealthPanel and MM.HealthPanel ~= except and MM.HealthPanel:IsShown() then MM.HealthPanel:Hide() end
    if MM.AnnouncePanel and MM.AnnouncePanel ~= except and MM.AnnouncePanel:IsShown() then MM.AnnouncePanel:Hide() end
    if MM.DiffPanel and MM.DiffPanel ~= except and MM.DiffPanel:IsShown() then MM.DiffPanel:Hide() end
end

--- Highlights the active tab button in Inspector.
function MM:UpdateInspectorTabHighlight(activeTabId)
    if not MM.inspectorTabButtons then return end
    for id, btn in pairs(MM.inspectorTabButtons) do
        local fs = btn:GetFontString()
        if id == activeTabId then
            btn.isActive = true
            btn:SetBackdropColor(0.20, 0.18, 0.13, 0.95)
            btn:SetBackdropBorderColor(0.85, 0.70, 0.25, 1.0)
            if fs then fs:SetTextColor(1.0, 0.88, 0.45, 1) end
        else
            btn.isActive = false
            btn:SetBackdropColor(0.12, 0.12, 0.14, 0.90)
            btn:SetBackdropBorderColor(0.24, 0.24, 0.28, 0.80)
            if fs then fs:SetTextColor(0.85, 0.85, 0.85, 1) end
        end
    end
end

--- Switches the Inspector column to the given tab.
function MM:ShowInspectorTab(tabId)
    MM:CloseInspectorPanels()
    MM:UpdateInspectorTabHighlight(tabId)
    
    if tabId == "overview" then
        if not MM.OverviewPanel then MM:CreateOverviewPanel() end
        MM.OverviewPanel:Show()
        MM:UpdateOverviewPanel()
    elseif tabId == "wizard" then
        if not MM.WizardPanel and MM.CreateWizardPanel then MM:CreateWizardPanel() end
        if MM.WizardPanel then MM.WizardPanel:Show() end
    elseif tabId == "conditions" then
        if not MM.ConditionEditor then MM:CreateConditionEditor() end
        MM.ConditionEditor:Show()
    elseif tabId == "icons" then
        if not MM.OptionsWindow then MM:CreateOptionsWindow() end
        MM.OptionsWindow:Show()
    elseif tabId == "sequence" then
        if not MM.SequencePanel and MM.CreateSequencePanel then MM:CreateSequencePanel() end
        if MM.SequencePanel then MM.SequencePanel:Show() end
    elseif tabId == "library" then
        if not MM.LibraryPanel and MM.CreateLibraryPanel then MM:CreateLibraryPanel() end
        if MM.LibraryPanel then MM.LibraryPanel:Show() end
    elseif tabId == "preview" then
        if not MM.LivePreviewPanel and MM.CreateLivePreview then MM:CreateLivePreview() end
        if MM.LivePreviewPanel then 
            MM.LivePreviewPanel:Show()
            if MM.UpdateLivePreview then MM:UpdateLivePreview() end
        end
    elseif tabId == "health" then
        if not MM.HealthPanel and MM.CreateHealthCheckPanel then MM:CreateHealthCheckPanel() end
        if MM.HealthPanel then MM.HealthPanel:Show() end
    elseif tabId == "announce" then
        if not MM.AnnouncePanel and MM.CreateAnnouncePanel then MM:CreateAnnouncePanel() end
        if MM.AnnouncePanel then MM.AnnouncePanel:Show() end
    elseif tabId == "diff" then
        if not MM.DiffPanel and MM.CreateDiffViewerPanel then MM:CreateDiffViewerPanel() end
        if MM.DiffPanel then MM.DiffPanel:Show() end
    elseif tabId == "commands" then
        if not MM.CommandPanel and MM.SetupCommandPanel then MM:SetupCommandPanel() end
        if MM.CommandPanel then MM.CommandPanel:Show() end
    end
end

--------------------------------------------------------------------------------
-- Overview Dashboard Panel
--------------------------------------------------------------------------------

function MM:CreateOverviewPanel()
    local f = CreateFrame("Frame", "MM_OverviewPanel", MM.InspectorPanel)
    f:SetPoint("TOPLEFT", MM.InspectorPanel, "TOPLEFT", 0, -56)
    f:SetPoint("BOTTOMRIGHT", MM.InspectorPanel, "BOTTOMRIGHT", 0, 0)
    
    f:HookScript("OnShow", function(self)
        MM:CloseInspectorPanels(self)
        if MM.UpdateInspectorTabHighlight then MM:UpdateInspectorTabHighlight("overview") end
        MM:UpdateOverviewPanel()
    end)
    
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 15, -8)
    title:SetText(L["Macro Overview"] or "Macro Overview")
    
    -- Macro Summary Card
    local card = CreateFrame("Frame", nil, f, "BackdropTemplate")
    card:SetPoint("TOPLEFT", 12, -32)
    card:SetPoint("TOPRIGHT", -12, -32)
    card:SetHeight(82)
    card:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 8,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    card:SetBackdropColor(0.04, 0.04, 0.05, 0.9)
    card:SetBackdropBorderColor(0.3, 0.3, 0.35, 0.8)
    f.summaryCard = card
    
    local cardIcon = card:CreateTexture(nil, "ARTWORK")
    cardIcon:SetSize(44, 44)
    cardIcon:SetPoint("LEFT", 10, 0)
    cardIcon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    f.cardIcon = cardIcon
    
    local cardName = card:CreateFontString(nil, "OVERLAY", "GameFontNormalMed2")
    cardName:SetPoint("TOPLEFT", cardIcon, "TOPRIGHT", 10, -2)
    cardName:SetText(L["(Unnamed Macro)"] or "(Unnamed Macro)")
    f.cardName = cardName
    
    local cardScope = card:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    cardScope:SetPoint("TOPLEFT", cardName, "BOTTOMLEFT", 0, -3)
    cardScope:SetTextColor(0.6, 0.8, 1.0)
    cardScope:SetText(L["Account Macro"] or "Account Macro")
    f.cardScope = cardScope
    
    local charBarText = card:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    charBarText:SetPoint("TOPRIGHT", card, "TOPRIGHT", -12, -10)
    charBarText:SetText("0 / 255 (0%)")
    f.charBarText = charBarText
    
    local charBarBg = CreateFrame("Frame", nil, card, "BackdropTemplate")
    charBarBg:SetPoint("BOTTOMLEFT", cardIcon, "BOTTOMRIGHT", 10, 8)
    charBarBg:SetPoint("BOTTOMRIGHT", card, "BOTTOMRIGHT", -12, 8)
    charBarBg:SetHeight(8)
    charBarBg:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 4,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    charBarBg:SetBackdropColor(0, 0, 0, 0.8)
    charBarBg:SetBackdropBorderColor(0.4, 0.4, 0.4, 0.6)
    
    local charBarFill = charBarBg:CreateTexture(nil, "ARTWORK")
    charBarFill:SetPoint("TOPLEFT", 1, -1)
    charBarFill:SetPoint("BOTTOMLEFT", 1, 1)
    charBarFill:SetWidth(0)
    charBarFill:SetColorTexture(0.2, 0.8, 0.2, 0.9)
    f.charBarFill = charBarFill
    f.charBarBg = charBarBg
    
    -- Modifiers Summary Header
    local lblModHeader = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblModHeader:SetPoint("TOPLEFT", 14, -122)
    lblModHeader:SetText("|cffffd100" .. (L["Configured Actions"] or "Configured Actions") .. "|r")
    
    local modSummaryFrame = CreateFrame("Frame", nil, f, "BackdropTemplate")
    modSummaryFrame:SetPoint("TOPLEFT", 12, -140)
    modSummaryFrame:SetPoint("TOPRIGHT", -12, -140)
    modSummaryFrame:SetHeight(105)
    modSummaryFrame:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 8,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    modSummaryFrame:SetBackdropColor(0.04, 0.04, 0.05, 0.9)
    modSummaryFrame:SetBackdropBorderColor(0.25, 0.25, 0.3, 0.8)
    
    f.modLines = {}
    local modKeys = {
        { key = "nomod", label = L["Standard"] or "Standard", color = "|cffffffff" },
        { key = "shift", label = L["Shift"] or "Shift", color = "|cff33ff99" },
        { key = "ctrl", label = L["Ctrl"] or "Ctrl", color = "|cff3399ff" },
        { key = "alt", label = L["Alt"] or "Alt", color = "|cffff9933" },
    }
    local mY = -8
    for _, m in ipairs(modKeys) do
        local l = modSummaryFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        l:SetPoint("TOPLEFT", 10, mY)
        l:SetPoint("TOPRIGHT", -10, mY)
        l:SetJustifyH("LEFT")
        l:SetWordWrap(false)
        l:SetText(m.color .. m.label .. ":|r |cff888888[" .. (L["Empty"] or "Empty") .. "]|r")
        f.modLines[m.key] = { fontString = l, prefix = m.color .. m.label .. ":|r " }
        mY = mY - 22
    end

    -- Macro Health & Statistics (Replaced duplicate buttons)
    local lblStatsHeader = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblStatsHeader:SetPoint("TOPLEFT", 14, -256)
    lblStatsHeader:SetText("|cffffd100" .. (L["Macro Statistics & Health"] or "Macro Statistics & Health") .. "|r")
    
    local statsCard = CreateFrame("Frame", nil, f, "BackdropTemplate")
    statsCard:SetPoint("TOPLEFT", 12, -274)
    statsCard:SetPoint("TOPRIGHT", -12, -274)
    statsCard:SetHeight(125)
    statsCard:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 8,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    statsCard:SetBackdropColor(0.04, 0.04, 0.05, 0.9)
    statsCard:SetBackdropBorderColor(0.25, 0.25, 0.3, 0.8)
    f.statsCard = statsCard
    
    local statLines = {
        { key = "syntax", icon = "Interface\\RAIDFRAME\\ReadyCheck-Ready", label = L["Syntax Status:"] or "Syntax Status:", val = "|cff00ff00" .. (L["Valid (0 Errors)"] or "Valid (0 Errors)") .. "|r" },
        { key = "lines", icon = "Interface\\GossipFrame\\DailyActiveQuestIcon", label = L["Code Lines:"] or "Code Lines:", val = "0" },
        { key = "tooltip", icon = "Interface\\Icons\\INV_Misc_Book_09", label = L["Tooltip Mode:"] or "Tooltip Mode:", val = "#showtooltip" },
        { key = "remaining", icon = "Interface\\Icons\\Spell_ChargePositive", label = L["Remaining Limit:"] or "Remaining Limit:", val = "255 chars free" },
    }
    
    f.statWidgets = {}
    local sY = -8
    for _, sl in ipairs(statLines) do
        local row = CreateFrame("Frame", nil, statsCard)
        row:SetPoint("TOPLEFT", 8, sY)
        row:SetPoint("TOPRIGHT", -8, sY)
        row:SetHeight(24)
        
        local icon = row:CreateTexture(nil, "ARTWORK")
        icon:SetSize(16, 16)
        icon:SetPoint("LEFT", 2, 0)
        icon:SetTexture(sl.icon)
        
        local lbl = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        lbl:SetPoint("LEFT", icon, "RIGHT", 6, 0)
        lbl:SetText(sl.label)
        
        local val = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        val:SetPoint("RIGHT", -4, 0)
        val:SetText(sl.val)
        
        f.statWidgets[sl.key] = { row = row, icon = icon, label = lbl, val = val }
        sY = sY - 26
    end
    
    -- Keyboard Shortcuts Tips
    local shortcutsFrame = CreateFrame("Frame", nil, f, "BackdropTemplate")
    shortcutsFrame:SetPoint("BOTTOMLEFT", 12, 10)
    shortcutsFrame:SetPoint("BOTTOMRIGHT", -12, 10)
    shortcutsFrame:SetHeight(75)
    shortcutsFrame:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 6,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    shortcutsFrame:SetBackdropColor(0.03, 0.03, 0.04, 0.8)
    shortcutsFrame:SetBackdropBorderColor(0.2, 0.2, 0.25, 0.8)
    
    local sTitle = shortcutsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    sTitle:SetPoint("TOPLEFT", 8, -6)
    sTitle:SetText("|cffffd100" .. (L["Shortcuts & Tips"] or "Shortcuts & Tips") .. "|r")
    
    local sText1 = shortcutsFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    sText1:SetPoint("TOPLEFT", 8, -24)
    sText1:SetText("|cff00ff00Ctrl+S:|r " .. (L["Save"] or "Save") .. "   |cff00ff00Ctrl+N:|r " .. (L["New"] or "New") .. "   |cff00ff00Ctrl+D:|r " .. (L["Duplicate"] or "Duplicate"))
    
    local sText2 = shortcutsFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    sText2:SetPoint("TOPLEFT", 8, -42)
    sText2:SetText("|cff00ff00Ctrl+Z/Y:|r " .. (L["Undo/Redo"] or "Undo/Redo") .. "   |cff00ff00Drag & Drop:|r " .. (L["From Action Source"] or "From Action Source"))
    
    MM.OverviewPanel = f
    f:Hide()
end

--- Updates the Overview dashboard with current workbench and macro state.
function MM:UpdateOverviewPanel()
    if not MM.OverviewPanel or not MM.OverviewPanel:IsShown() then return end
    local f = MM.OverviewPanel
    
    -- Macro Name
    local name = (MM.nameInput and MM.nameInput:GetText() ~= "") and MM.nameInput:GetText() or (L["(Unnamed Macro)"] or "(Unnamed Macro)")
    f.cardName:SetText(name)
    
    -- Icon
    local tex = MM.selectedStaticIcon or (MM.previewIcon and MM.previewIcon:GetTexture()) or "Interface\\Icons\\INV_Misc_QuestionMark"
    f.cardIcon:SetTexture(tex)
    
    -- Scope
    local scopeName = (MM.selectedScope == "character") and (L["Character Macro"] or "Character Macro") 
                      or (MM.selectedScope == "library") and (L["Personal Library"] or "Personal Library")
                      or (L["Account Macro"] or "Account Macro")
    f.cardScope:SetText(scopeName)
    
    -- Char Count & Progress Bar
    local body = MM.outputBox and MM.outputBox:GetText() or ""
    local len = #body
    local maxLen = 255
    local pct = math.min(1.0, len / maxLen)
    local maxWidth = f.charBarBg:GetWidth() - 2
    if maxWidth > 0 then
        f.charBarFill:SetWidth(math.max(1, maxWidth * pct))
    end
    
    if len > maxLen then
        f.charBarFill:SetColorTexture(1.0, 0.1, 0.1, 0.95)
        f.charBarText:SetText("|cffff2020" .. len .. " / " .. maxLen .. " (" .. (L["TRUNCATED"] or "TRUNCATED") .. ")|r")
    elseif len > 240 then
        f.charBarFill:SetColorTexture(1.0, 0.4, 0.0, 0.95)
        f.charBarText:SetText("|cffff6600" .. len .. " / " .. maxLen .. " (" .. math.floor(pct * 100) .. "%)|r")
    elseif len > 200 then
        f.charBarFill:SetColorTexture(1.0, 0.8, 0.0, 0.95)
        f.charBarText:SetText("|cffffcc00" .. len .. " / " .. maxLen .. " (" .. math.floor(pct * 100) .. "%)|r")
    else
        f.charBarFill:SetColorTexture(0.2, 0.8, 0.2, 0.9)
        f.charBarText:SetText(len .. " / " .. maxLen .. " (" .. math.floor(pct * 100) .. "%)")
    end
    
    -- Modifier Lines
    local activeLineCount = 0
    if MM.rows and f.modLines then
        for k, info in pairs(f.modLines) do
            local row = MM.rows[k]
            local text = ""
            if row and row.lines and #row.lines > 0 then
                local spells = {}
                for _, line in ipairs(row.lines) do
                    local s = line.spellInput and line.spellInput:GetText()
                    if s and s ~= "" then
                        table.insert(spells, s)
                        activeLineCount = activeLineCount + 1
                    end
                end
                if #spells > 0 then
                    text = table.concat(spells, ", ")
                end
            end
            
            if text ~= "" then
                info.fontString:SetText(info.prefix .. "|cffffffff" .. text .. "|r")
            else
                info.fontString:SetText(info.prefix .. "|cff777777[" .. (L["Empty"] or "Empty") .. "]|r")
            end
        end
    end
    
    -- Statistics Updates
    if f.statWidgets then
        -- Syntax
        local hasErrors = (MM.currentErrors and #MM.currentErrors > 0)
        if hasErrors then
            f.statWidgets.syntax.icon:SetTexture("Interface\\RAIDFRAME\\ReadyCheck-NotReady")
            f.statWidgets.syntax.val:SetText("|cffff3333" .. #MM.currentErrors .. " " .. (L["Errors"] or "Errors") .. "|r")
        else
            f.statWidgets.syntax.icon:SetTexture("Interface\\RAIDFRAME\\ReadyCheck-Ready")
            f.statWidgets.syntax.val:SetText("|cff00ff00" .. (L["Valid Syntax"] or "Valid Syntax") .. "|r")
        end
        
        -- Code Lines
        local rawLineCount = 0
        for _ in body:gmatch("[^\r\n]+") do rawLineCount = rawLineCount + 1 end
        f.statWidgets.lines.val:SetText(rawLineCount .. " " .. (L["Lines"] or "Lines"))
        
        -- Tooltip
        if MM.useShowTooltip then
            f.statWidgets.tooltip.val:SetText("|cff00ffcc#showtooltip|r")
        else
            f.statWidgets.tooltip.val:SetText("|cff888888" .. (L["Static Icon"] or "Static Icon") .. "|r")
        end
        
        -- Remaining Limit
        local remaining = maxLen - len
        if remaining < 0 then
            f.statWidgets.remaining.val:SetText("|cffff2020" .. remaining .. " " .. (L["chars"] or "chars") .. "|r")
        else
            f.statWidgets.remaining.val:SetText("|cff00ff00" .. remaining .. " " .. (L["chars free"] or "chars free") .. "|r")
        end
    end
end

--------------------------------------------------------------------------------
-- Helper: Create Row with Checkbox
--------------------------------------------------------------------------------
function MM:CreateInspectorCheckRow(parent, labelText)
    local row = CreateFrame("Button", nil, parent)
    row:SetHeight(24)
    
    local cb = CreateFrame("CheckButton", nil, row, "SettingsCheckBoxTemplate")
    cb:SetSize(20, 20)
    cb:SetPoint("LEFT", 0, 0)
    
    if cb.SetHighlightTexture then cb:SetHighlightTexture("") end
    
    local txt = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    txt:SetPoint("LEFT", cb, "RIGHT", 5, 0)
    txt:SetText(labelText)
    
    row:SetWidth(25 + txt:GetStringWidth())
    
    local hl = row:CreateTexture(nil, "HIGHLIGHT")
    hl:SetAllPoints()
    hl:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    hl:SetBlendMode("ADD")
    hl:SetAlpha(0.3)
    
    cb:HookScript("OnEnter", function() row:LockHighlight() end)
    cb:HookScript("OnLeave", function() row:UnlockHighlight() end)
    
    row:SetScript("OnClick", function()
        cb:Click()
    end)
    
    return row, cb
end

--------------------------------------------------------------------------------
-- Options Window (Icons & Settings)
--------------------------------------------------------------------------------

--- Toggles the visibility of the Options Window.
function MM:ToggleOptionsWindow()
    if MM.OptionsWindow and MM.OptionsWindow:IsShown() then
        MM:ShowInspectorTab("overview")
    else
        MM:ShowInspectorTab("icons")
    end
end

--- Creates the Options Window interface.
function MM:CreateOptionsWindow()
    local f = CreateFrame("Frame", "MM_OptionsWindow", MM.InspectorPanel)
    f:SetPoint("TOPLEFT", MM.InspectorPanel, "TOPLEFT", 0, -56)
    f:SetPoint("BOTTOMRIGHT", MM.InspectorPanel, "BOTTOMRIGHT", 0, 0)
    
    -- Exclusive Visibility Logic
    f:HookScript("OnShow", function(self)
        MM:CloseInspectorPanels(self)
        if MM.UpdateInspectorTabHighlight then MM:UpdateInspectorTabHighlight("icons") end
    end)
    
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 15, -8)
    title:SetText(L["Icon Options"])
    
    MM.OptionsWindow = f
    
    -- 1. Modern Tooltip Configuration Card
    local headerCard = CreateFrame("Frame", nil, f, "BackdropTemplate")
    headerCard:SetPoint("TOPLEFT", 10, -28)
    headerCard:SetPoint("TOPRIGHT", -10, -28)
    headerCard:SetHeight(72)
    headerCard:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, edgeSize = 10,
        insets = { left = 3, right = 3, top = 3, bottom = 3 }
    })
    headerCard:SetBackdropColor(0.08, 0.08, 0.12, 0.85)
    headerCard:SetBackdropBorderColor(0.25, 0.25, 0.35, 0.7)
    
    -- #showtooltip Checkbox
    local chkShowC = CreateFrame("CheckButton", nil, headerCard, "SettingsCheckBoxTemplate")
    chkShowC:SetSize(18, 18)
    chkShowC:SetPoint("TOPLEFT", 8, -6)
    if chkShowC.SetHighlightTexture then chkShowC:SetHighlightTexture("") end
    
    local lblShowC = headerCard:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblShowC:SetPoint("LEFT", chkShowC, "RIGHT", 4, 0)
    lblShowC:SetText(L["Include #showtooltip"])
    
    -- Tooltip Source Input Label
    local lblSource = headerCard:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    lblSource:SetPoint("TOPLEFT", 8, -28)
    lblSource:SetText(L["Tooltip Source (Actions override empty):"])
    
    -- Tooltip Source EditBox
    local tooltipSourceInput = CreateFrame("EditBox", nil, headerCard, "InputBoxTemplate")
    tooltipSourceInput:SetSize(236, 20)
    tooltipSourceInput:SetPoint("TOPLEFT", 12, -44)
    tooltipSourceInput:SetAutoFocus(false)
    tooltipSourceInput:SetText(MM.tooltipSource or "")
    
    -- Tooltip Icon Slot (Drag & Drop)
    local tooltipIconSlot = CreateFrame("Button", nil, headerCard, "BackdropTemplate")
    tooltipIconSlot:SetSize(24, 24)
    tooltipIconSlot:SetPoint("LEFT", tooltipSourceInput, "RIGHT", 6, 0)
    tooltipIconSlot:SetBackdrop({
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 8,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    tooltipIconSlot:SetBackdropBorderColor(0.4, 0.4, 0.4, 0.8)
    
    local tIconTex = tooltipIconSlot:CreateTexture(nil, "ARTWORK")
    tIconTex:SetAllPoints()
    tIconTex:SetTexCoord(0.08, 0.92, 0.08, 0.92)
    tIconTex:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    f.tooltipIconTex = tIconTex

    local function UpdateTooltipIconDisplay()
        local val = tooltipSourceInput:GetText()
        if val and val ~= "" then
            local texture
            if C_Spell and C_Spell.GetSpellTexture then texture = C_Spell.GetSpellTexture(val) end
            if not texture and C_Item then _, _, _, _, _, _, _, _, _, texture = C_Item.GetItemInfo(val) end
            if texture then tIconTex:SetTexture(texture) else tIconTex:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark") end
        else
            tIconTex:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
        end
    end
    
    f:HookScript("OnShow", function()
        tooltipSourceInput:SetText(MM.tooltipSource or "")
        UpdateTooltipIconDisplay()
        
        -- Init Recent Icons if needed
        if not MM.sessionRecentIcons then MM.sessionRecentIcons = {} end
        
        if f.chkShowTooltip then
             f.chkShowTooltip:SetChecked(MM.useShowTooltip)
        end
        
        if MM.useShowTooltip then
             tooltipSourceInput:Enable()
             lblSource:SetTextColor(0.8, 0.8, 0.8)
             tooltipIconSlot:SetAlpha(1.0)
        else
             tooltipSourceInput:Disable()
             lblSource:SetTextColor(0.4, 0.4, 0.4)
             tooltipIconSlot:SetAlpha(0.4)
        end
    end)
    
    -- Drag & Drop Handler for Tooltip Source
    local function HandleTooltipDrop()
        local type, id, subType = GetCursorInfo()
        local name
        if type == "spell" then
             if subType == "pet" and C_SpellBook and C_SpellBook.GetSpellBookItemName then
                name = C_SpellBook.GetSpellBookItemName(id, Enum.SpellBookSpellBank.Pet)
             elseif C_SpellBook and C_SpellBook.GetSpellBookItemName then
                name = C_SpellBook.GetSpellBookItemName(id, Enum.SpellBookSpellBank.Player)
             else 
                if C_Spell and C_Spell.GetSpellInfo then
                    local info = C_Spell.GetSpellInfo(id)
                    name = info and info.name
                end
             end
        elseif type == "item" then
             name = C_Item and C_Item.GetItemInfo and C_Item.GetItemInfo(id)
        elseif type == "mount" and C_MountJournal then
             name = C_MountJournal.GetMountInfoByID(id)
        elseif type == "battlepet" and C_PetJournal then
             local _, customName, _, _, _, _, _, nameSource = C_PetJournal.GetPetInfoByPetID(id)
             name = customName or nameSource
        end
        
        if name then
             tooltipSourceInput:SetText(name)
             ClearCursor()
             MM.tooltipSource = name
             MM:GenerateMacroText()
             UpdateTooltipIconDisplay()
        end
    end
    
    tooltipSourceInput:SetScript("OnReceiveDrag", HandleTooltipDrop)
    tooltipIconSlot:RegisterForDrag("LeftButton")
    tooltipIconSlot:SetScript("OnReceiveDrag", HandleTooltipDrop)
    tooltipIconSlot:SetScript("OnMouseUp", function() if GetCursorInfo() then HandleTooltipDrop() end end)
    
    tooltipSourceInput:SetScript("OnTextChanged", function(self)
        MM.tooltipSource = self:GetText()
        MM:GenerateMacroText()
        UpdateTooltipIconDisplay()
    end)
    
    MM.OptionsWindow.tooltipSourceInput = tooltipSourceInput
    MM.OptionsWindow.lblSource = lblSource
    
    -- Checkbox Logic
    chkShowC:SetScript("OnClick", function(self)
        MM.useShowTooltip = self:GetChecked()
        if MM.useShowTooltip then
            tooltipSourceInput:Enable()
            lblSource:SetTextColor(0.8, 0.8, 0.8)
            tooltipIconSlot:SetAlpha(1.0)
        else
            tooltipSourceInput:Disable()
            lblSource:SetTextColor(0.4, 0.4, 0.4)
            tooltipIconSlot:SetAlpha(0.4)
        end
        MM:GenerateMacroText()
    end)
    f.chkShowTooltip = chkShowC
    
    -- 2. Category Filter Bar (Modern Segment Buttons)
    local catBar = CreateFrame("Frame", nil, f)
    catBar:SetPoint("TOPLEFT", 10, -104)
    catBar:SetPoint("TOPRIGHT", -10, -104)
    catBar:SetHeight(22)
    
    local cats = {
        { id = "all", label = L["All"] or "All" },
        { id = "class", label = L["Class"] or "Class" },
        { id = "abilities", label = L["Abilities"] or "Abilities" },
        { id = "inventory", label = L["Inventory"] or "Inventory" },
        { id = "recent", label = L["Recent"] or "Recent" },
    }
    
    f.catButtons = {}
    local catWidth = 60
    local gap = 5
    for i, c in ipairs(cats) do
        local btn = CreateFrame("Button", nil, catBar, "GameMenuButtonTemplate, BackdropTemplate")
        btn:SetSize(catWidth, 20)
        btn:SetPoint("TOPLEFT", (i - 1) * (catWidth + gap), 0)
        btn:SetText(c.label)
        btn:SetNormalFontObject("GameFontNormalSmall")
        MM:StyleButtonToModern(btn)
        btn.category = c.id
        
        btn:SetScript("OnClick", function(self)
            MM.iconCategory = self.category
            MM.iconPage = 1
            f:UpdateCategoryHighlight()
            if MM.OptionsWindow.iconSearch then
                MM:UpdateIconGrid(MM.OptionsWindow.iconSearch:GetText())
            else
                MM:UpdateIconGrid("")
            end
        end)
        
        table.insert(f.catButtons, btn)
    end
    
    function f:UpdateCategoryHighlight()
        for _, btn in ipairs(f.catButtons) do
            if btn.category == MM.iconCategory then
                btn:SetBackdropBorderColor(1, 0.82, 0, 1)
                btn:SetBackdropColor(0.22, 0.18, 0.08, 0.95)
                local txt = btn:GetFontString()
                if txt then txt:SetTextColor(1, 0.85, 0.1) end
            else
                btn:SetBackdropBorderColor(0.25, 0.25, 0.35, 0.7)
                btn:SetBackdropColor(0.1, 0.1, 0.14, 0.8)
                local txt = btn:GetFontString()
                if txt then txt:SetTextColor(0.75, 0.75, 0.75) end
            end
        end
    end
    
    MM.iconCategory = "all"
    f:UpdateCategoryHighlight()

    -- 3. Icon Selector Frame (Search, Grid, Pagination)
    local iconFrame = CreateFrame("Frame", nil, f)
    iconFrame:SetPoint("TOPLEFT", 10, -128) 
    iconFrame:SetPoint("BOTTOMRIGHT", -10, 10)
    f.iconSelector = iconFrame
    iconFrame:Show()
    f:SetHeight(450)

    -- Icon Search Box with Clear Button
    local iconSearch = CreateFrame("EditBox", nil, iconFrame, "InputBoxTemplate")
    iconSearch:SetHeight(20)
    iconSearch:SetPoint("TOPLEFT", 0, -2)
    iconSearch:SetPoint("TOPRIGHT", 0, -2)
    MM.OptionsWindow.iconSearch = iconSearch
    iconSearch:SetAutoFocus(false)
    
    local clearSearchBtn = CreateFrame("Button", nil, iconSearch, "UIPanelCloseButton")
    clearSearchBtn:SetSize(16, 16)
    clearSearchBtn:SetPoint("RIGHT", 2, 0)
    clearSearchBtn:Hide()
    clearSearchBtn:SetScript("OnClick", function()
        if MM.iconSearchTimer then
            MM.iconSearchTimer:Cancel()
            MM.iconSearchTimer = nil
        end
        iconSearch:SetText("")
        iconSearch:SetFocus()
        MM.iconPage = 1
        MM:UpdateIconGrid("")
    end)
    
    iconSearch:HookScript("OnTextChanged", function(self)
        local txt = self:GetText()
        if txt and txt ~= "" then clearSearchBtn:Show() else clearSearchBtn:Hide() end
        MM.iconPage = 1 
        if MM.iconSearchTimer then
            MM.iconSearchTimer:Cancel()
        end
        MM.iconSearchTimer = C_Timer.NewTimer(0.2, function()
            MM:UpdateIconGrid(txt)
            MM.iconSearchTimer = nil
        end)
    end)
    
    local lblS = iconSearch:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    lblS:SetPoint("LEFT", 4, 0)
    lblS:SetText(L["Search Icons..."])
    iconSearch:HookScript("OnEditFocusGained", function() lblS:Hide() end)
    iconSearch:HookScript("OnEditFocusLost", function() if iconSearch:GetText()=="" then lblS:Show() end end)
    
    -- Scroll Frame
    local scroll = CreateFrame("ScrollFrame", "$parent_IconScroll", iconFrame, "UIPanelScrollFrameTemplate")
    MM:SkinScrollBar(scroll)
    scroll:SetPoint("TOPLEFT", 0, -28)
    scroll:SetPoint("BOTTOMRIGHT", -25, 30) 
    
    local child = CreateFrame("Frame")
    child:SetSize(260, 1)
    scroll:SetScrollChild(child)
    f.iconGrid = child
    MM.iconButtons = {}
    
    -- Pagination
    MM.iconPage = 1
    MM.iconPageSize = 200
    
    -- Mouse Wheel Page Flipping
    local function OnGridMouseWheel(self, delta)
        local totalPages = MM.OptionsWindow and MM.OptionsWindow.totalPages or 1
        if delta > 0 then
            if MM.iconPage > 1 then
                MM.iconPage = MM.iconPage - 1
                MM:UpdateIconGrid(iconSearch:GetText())
                scroll:SetVerticalScroll(0)
            end
        elseif delta < 0 then
            if MM.iconPage < totalPages then
                MM.iconPage = MM.iconPage + 1
                MM:UpdateIconGrid(iconSearch:GetText())
                scroll:SetVerticalScroll(0)
            end
        end
    end
    iconFrame:EnableMouseWheel(true)
    iconFrame:SetScript("OnMouseWheel", OnGridMouseWheel)
    scroll:EnableMouseWheel(true)
    scroll:SetScript("OnMouseWheel", OnGridMouseWheel)
    child:EnableMouseWheel(true)
    child:SetScript("OnMouseWheel", OnGridMouseWheel)
    
    -- Drag & Drop into icon grid to select icon
    local function HandleGridDrop()
        local type, id, subType = GetCursorInfo()
        local texture
        if type == "spell" then
            if C_Spell and C_Spell.GetSpellTexture then texture = C_Spell.GetSpellTexture(id) end
        elseif type == "item" then
            if C_Item and C_Item.GetItemIconByID then texture = C_Item.GetItemIconByID(id) end
            if not texture and C_Item and C_Item.GetItemInfo then _, _, _, _, _, _, _, _, _, texture = C_Item.GetItemInfo(id) end
        elseif type == "mount" and C_MountJournal then
            local _, _, icon = C_MountJournal.GetMountInfoByID(id)
            texture = icon
        elseif type == "battlepet" and C_PetJournal then
            local _, _, _, _, icon = C_PetJournal.GetPetInfoByPetID(id)
            texture = icon
        end
        
        if texture then
            ClearCursor()
            MM.selectedStaticIcon = texture
            if not MM.sessionRecentIcons then MM.sessionRecentIcons = {} end
            table.insert(MM.sessionRecentIcons, 1, texture)
            MM:GenerateMacroText()
            MM:UpdateMacroPreviewIcon()
            MM:UpdateIconGrid(iconSearch:GetText())
        end
    end
    
    iconFrame:SetScript("OnReceiveDrag", HandleGridDrop)
    iconFrame:SetScript("OnMouseUp", function() if GetCursorInfo() then HandleGridDrop() end end)
    
    local btnPrev = CreateFrame("Button", nil, iconFrame, "GameMenuButtonTemplate, BackdropTemplate")
    btnPrev:SetPoint("BOTTOMLEFT", 0, 0)
    btnPrev:SetSize(80, 22)
    btnPrev:SetText(L["Previous"])
    MM:StyleButtonToModern(btnPrev)
    btnPrev:SetScript("OnClick", function()
        if MM.iconPage > 1 then
            MM.iconPage = MM.iconPage - 1
            MM:UpdateIconGrid(iconSearch:GetText())
            scroll:SetVerticalScroll(0)
        end
    end)
    f.btnPrev = btnPrev
    
    local btnNext = CreateFrame("Button", nil, iconFrame, "GameMenuButtonTemplate, BackdropTemplate")
    btnNext:SetPoint("BOTTOMRIGHT", 0, 0)
    btnNext:SetSize(80, 22)
    btnNext:SetText(L["Next"])
    MM:StyleButtonToModern(btnNext)
    btnNext:SetScript("OnClick", function()
        MM.iconPage = MM.iconPage + 1
        MM:UpdateIconGrid(iconSearch:GetText())
        scroll:SetVerticalScroll(0)
    end)
    f.btnNext = btnNext
    
    local lblPage = iconFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblPage:SetPoint("BOTTOM", 0, 5)
    lblPage:SetText(L["Page"] .. " 1")
    f.lblPage = lblPage
    
    MM:UpdateIconGrid("")
    f:Hide()
end

------ Updates the icon grid based on search filter.
function MM:UpdateIconGrid(filter)
    local list = MM.OptionsWindow and MM.OptionsWindow.iconGrid
    if not list then return end
    local icons = GetMacroIcons()
    local filteredIcons = {}
    local isLazyAll = false
    local totalIcons = 0
    
    filter = filter and string.lower(filter) or ""
    
    local seen = {}
    local function AddIcon(icon, name)
        if icon and not seen[icon] then
            table.insert(filteredIcons, {texture = icon, name = name})
            seen[icon] = true
        end
    end

    -- Tag / Keyword Alias Mapping for intuitive search
    local KEYWORD_TAGS = {
        ["heal"] = { "nature", "holy", "restoration", "renew", "heal", "regrowth", "mend" },
        ["fire"] = { "fire", "flame", "pyro", "burn", "ember", "lava", "cinder", "immolation" },
        ["frost"] = { "frost", "ice", "chill", "blizzard", "frozen", "glacial" },
        ["shadow"] = { "shadow", "void", "dark", "death", "soul", "necro", "curse" },
        ["nature"] = { "nature", "lightning", "earth", "wind", "storm", "poison" },
        ["sword"] = { "sword", "blade", "weapon_shortblade", "broadsword", "claymore" },
        ["shield"] = { "shield", "buckler", "protect", "defense", "armor" },
        ["mount"] = { "mount", "horse", "wolf", "drake", "dragon", "talbuk", "tiger" },
        ["pet"] = { "pet", "companion", "critter", "cat", "dog", "bear" },
        ["buff"] = { "buff", "aura", "blessing", "shout", "presence" },
        ["debuff"] = { "curse", "disease", "poison", "wound", "bleed", "burn" },
        ["tank"] = { "shield", "defend", "armor", "taunt", "fortitude" },
    }
    
    local searchTerms = nil
    if filter ~= "" then
        searchTerms = { filter }
        local tagList = KEYWORD_TAGS[filter]
        if tagList then
            for _, tag in ipairs(tagList) do
                table.insert(searchTerms, tag)
            end
        end
    end

    local function MatchesFilter(text)
        if not text then return false end
        if not searchTerms then return true end
        local lText = string.lower(text)
        for t = 1, #searchTerms do
            if string.find(lText, searchTerms[t], 1, true) then
                return true
            end
        end
        return false
    end

    local function MatchesFastFilter(entry)
        if not searchTerms then return true end
        for t = 1, #searchTerms do
            if string.find(entry, searchTerms[t], 1, true) then
                return true
            end
        end
        return false
    end

    if MM.iconCategory == "class" then
        local _, classFile = UnitClass("player")
        classFile = classFile and string.lower(classFile) or ""
        
        -- 1. Player Spellbook items
        local numSpells = 0
        if C_SpellBook and C_SpellBook.GetNumSpellBookItems then numSpells = C_SpellBook.GetNumSpellBookItems() end
        for i = 1, numSpells or 0 do
            local name = C_SpellBook.GetSpellBookItemName(i, Enum.SpellBookSpellBank.Player)
            local info = C_SpellBook.GetSpellBookItemInfo(i, Enum.SpellBookSpellBank.Player)
            if info and info.iconID then
                if filter == "" or MatchesFilter(name) then
                    AddIcon(info.iconID, name)
                end
            end
        end
        
        -- 2. Class icons from Icon DB (fast pre-filter)
        if MM_ICON_DB and #MM_ICON_DB > 0 then
            for _, entry in ipairs(MM_ICON_DB) do
                if string.find(entry, classFile, 1, true) then
                    if filter == "" or MatchesFastFilter(entry) then
                        local id, name = strsplit("|", entry)
                        if id then AddIcon(tonumber(id), name) end
                    end
                end
            end
        end

    elseif MM.iconCategory == "abilities" then
        -- Global Abilities Search (spell_, ability_)
        if MM_ICON_DB and #MM_ICON_DB > 0 then
            local db = MM_ICON_DB
            for _, entry in ipairs(db) do
                if string.find(entry, "|spell_", 1, true) or string.find(entry, "|ability_", 1, true) then
                    if filter == "" or MatchesFastFilter(entry) then
                        local id, name = strsplit("|", entry)
                        if id then AddIcon(tonumber(id), name) end
                    end
                end
            end
        else
            local icons = GetMacroIcons()
            for _, icon in ipairs(icons) do
                AddIcon(icon) 
            end
        end

    elseif MM.iconCategory == "inventory" then
        -- Global Inventory Search (inv_, item_)
        if MM_ICON_DB and #MM_ICON_DB > 0 then
            local db = MM_ICON_DB
            for _, entry in ipairs(db) do
                if string.find(entry, "|inv_", 1, true) or string.find(entry, "|item_", 1, true) then
                    if filter == "" or MatchesFastFilter(entry) then
                        local id, name = strsplit("|", entry)
                        if id then AddIcon(tonumber(id), name) end
                    end
                end
            end
        else
            local icons = GetMacroIcons()
            for _, icon in ipairs(icons) do
                AddIcon(icon)
            end
        end
        
    elseif MM.iconCategory == "recent" then
        local recents = (MM.db and MM.db.recentIcons) or MM.sessionRecentIcons
        if recents then
            for _, iconPath in ipairs(recents) do
                AddIcon(iconPath)
            end
        end
        
    else
        -- Search "All"
        if filter == "" and MM_ICON_DB and #MM_ICON_DB > 0 then
            -- High performance lazy mode for empty search in 32k icon DB:
            -- Avoids unpacking 32,000 tables into memory.
            isLazyAll = true
            totalIcons = #MM_ICON_DB
        elseif MM_ICON_DB and #MM_ICON_DB > 0 then
            -- Filtered search: fast byte pre-filter skips 99% of entries without string/table allocations
            local db = MM_ICON_DB
            for _, entry in ipairs(db) do
                if MatchesFastFilter(entry) then
                    local id, name = strsplit("|", entry)
                    if id then AddIcon(tonumber(id), name) end
                end
            end
            
            local numSpells = 0
            if C_SpellBook and C_SpellBook.GetNumSpellBookItems then numSpells = C_SpellBook.GetNumSpellBookItems() end
            for i = 1, numSpells or 0 do
                local name = C_SpellBook.GetSpellBookItemName(i, Enum.SpellBookSpellBank.Player)
                if name and MatchesFilter(name) then
                    local info = C_SpellBook.GetSpellBookItemInfo(i, Enum.SpellBookSpellBank.Player)
                    if info and info.iconID then AddIcon(info.iconID, name) end
                end
            end
        else
            for _, icon in ipairs(icons) do
                if filter == "" then
                    AddIcon(icon)
                else
                    local s = string.lower(tostring(icon))
                    if MatchesFilter(s) then AddIcon(icon) end
                end
            end
        end
    end
    
    if not isLazyAll then
        totalIcons = #filteredIcons
    end
    local totalPages = math.ceil(totalIcons / MM.iconPageSize)
    if MM.iconPage > totalPages and totalPages > 0 then MM.iconPage = totalPages end
    if MM.iconPage < 1 then MM.iconPage = 1 end
    MM.OptionsWindow.totalPages = totalPages
    
    MM.OptionsWindow.lblPage:SetText(L["Page"] .. " " .. MM.iconPage .. " / " .. (totalPages > 0 and totalPages or 1))
    
    if MM.iconPage == 1 then MM.OptionsWindow.btnPrev:Disable() else MM.OptionsWindow.btnPrev:Enable() end
    if MM.iconPage >= totalPages then MM.OptionsWindow.btnNext:Disable() else MM.OptionsWindow.btnNext:Enable() end
    
    local startIndex = (MM.iconPage - 1) * MM.iconPageSize + 1
    local endIndex = math.min(startIndex + MM.iconPageSize - 1, totalIcons)
    
    -- Hide current buttons
    for _, btn in pairs(MM.iconButtons) do btn:Hide() end
    
    local colCount = 7
    local size = 36
    local gap = 4
    local y = 0
    local btnIdx = 0
    
    for i = startIndex, endIndex do
        local iconPath, iconName
        if isLazyAll then
            local entry = MM_ICON_DB[i]
            if entry then
                local id, name = strsplit("|", entry)
                iconPath = tonumber(id)
                iconName = name
            end
        else
            local iconData = filteredIcons[i]
            if iconData then
                iconPath = iconData.texture
                iconName = iconData.name
            end
        end
        
        if iconPath then
            btnIdx = btnIdx + 1
            local btn = MM.iconButtons[btnIdx]
         
         if not btn then
             btn = CreateFrame("Button", nil, list, "BackdropTemplate")
             btn:SetSize(size, size)
             
             local tex = btn:CreateTexture(nil, "ARTWORK")
             tex:SetAllPoints()
             tex:SetTexCoord(0.08, 0.92, 0.08, 0.92)
             btn.icon = tex
             
             -- Golden Selection Border
             local selBorder = CreateFrame("Frame", nil, btn, "BackdropTemplate")
             selBorder:SetPoint("TOPLEFT", -2, 2)
             selBorder:SetPoint("BOTTOMRIGHT", 2, -2)
             selBorder:SetBackdrop({
                 edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                 edgeSize = 10,
                 insets = { left = 1, right = 1, top = 1, bottom = 1 }
             })
             selBorder:SetBackdropBorderColor(1, 0.82, 0, 1)
             selBorder:Hide()
             btn.selBorder = selBorder
             
             btn:SetScript("OnClick", function(self)
                  MM.selectedStaticIcon = self.texturePath
                  
                  -- Add to Recent (Persistent in DB)
                  if not MM.sessionRecentIcons then MM.sessionRecentIcons = {} end
                  if MM.db and not MM.db.recentIcons then MM.db.recentIcons = {} end
                  local recents = (MM.db and MM.db.recentIcons) or MM.sessionRecentIcons
                  
                  for k, v in ipairs(recents) do
                      if v == self.texturePath then
                          table.remove(recents, k)
                          break
                      end
                  end
                  table.insert(recents, 1, self.texturePath)
                  if #recents > 28 then
                      table.remove(recents)
                  end
                  
                  MM:GenerateMacroText()
                  MM:UpdateMacroPreviewIcon()
                  MM:UpdateIconGrid(MM.OptionsWindow and MM.OptionsWindow.iconSearch and MM.OptionsWindow.iconSearch:GetText() or "")
             end)
              
             btn:SetScript("OnEnter", function(self)
                  GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                  if self.iconName then
                      GameTooltip:AddLine(self.iconName, 1, 1, 1)
                  else
                      GameTooltip:AddLine(L["Unknown Icon"], 0.7, 0.7, 0.7)
                  end
                  if self.texturePath then
                       GameTooltip:AddLine("ID: " .. tostring(self.texturePath), 0.5, 0.5, 0.5)
                  end
                  if self.iconName then
                      local lowerName = string.lower(self.iconName)
                      local typeStr = nil
                      if string.find(lowerName, "^spell_") then typeStr = L["Spell"]
                      elseif string.find(lowerName, "^ability_") then typeStr = L["Ability"]
                      elseif string.find(lowerName, "^inv_") or string.find(lowerName, "^item_") then typeStr = L["Item/Inventory"] 
                      elseif string.find(lowerName, "^achievement_") then typeStr = L["Achievement"]
                      elseif string.find(lowerName, "^race_") then typeStr = L["Race"]
                      elseif string.find(lowerName, "^classicon_") then typeStr = L["Class"]
                      end
                      if typeStr then
                          GameTooltip:AddDoubleLine(L["Type"]..":", typeStr, 1, 0.82, 0, 1, 1, 1)
                      end
                  end
                  GameTooltip:AddLine(" ")
                  GameTooltip:AddLine(L["Click to select"], 0, 1, 0)
                  GameTooltip:Show()
             end)
              
             btn:SetScript("OnLeave", function(self)
                  GameTooltip:Hide()
             end)
             
             MM.iconButtons[btnIdx] = btn
         end
         
         btn.icon:SetTexture(iconPath)
         btn.texturePath = iconPath
         btn.iconName = iconName
         
         -- Show gold border if active
         if btn.selBorder then
             local isSelected = (MM.selectedStaticIcon and (tostring(MM.selectedStaticIcon) == tostring(iconPath)))
             if isSelected then btn.selBorder:Show() else btn.selBorder:Hide() end
         end
         
         local col = (btnIdx - 1) % colCount
         local row = math.floor((btnIdx - 1) / colCount)
         btn:SetPoint("TOPLEFT", col * (size + gap), -row * (size + gap))
         btn:Show()
         
         y = (row + 1) * (size + gap)
        end
    end
    list:SetHeight(y > 0 and y or 1)
end

--------------------------------------------------------------------------------
-- Command Panel (Library)
--------------------------------------------------------------------------------

-- Command Data Definition
MM.CommandCategories = {
    [L["Targeting"]] = {
        {name="/target", desc="Target unit"},
        {name="/assist", desc="Assist unit"},
        {name="/cleartarget", desc="Clear target"},
        {name="/focus", desc="Set focus"},
        {name="/clearfocus", desc="Clear focus"}, 
        {name="/targetlasttarget", desc="Target last"},
        {name="/targetenemy", desc="Target enemy"},
        {name="/targetfriend", desc="Target friend"},
        {name="/targetparty", desc="Target party member"},
        {name="/targetraid", desc="Target raid member"},
    },
    [L["Action & Spells"]] = {
        {name="/cast", desc="Cast spell"},
        {name="/castsequence", desc="Cast sequence"},
        {name="/castrandom", desc="Cast random"},
        {name="/use", desc="Use item/slot"},
        {name="/userandom", desc="Use random item"},
        {name="/stopcasting", desc="Stop casting"},
        {name="/startattack", desc="Start auto-attack"},
        {name="/stopattack", desc="Stop auto-attack"},
        {name="/petattack", desc="Pet attack"},
        {name="/petfollow", desc="Pet follow"},
        {name="/petstay", desc="Pet stay"},
        {name="/petpassive", desc="Pet passive"},
        {name="/petdefensive", desc="Pet defensive"},
        {name="/petaggressive", desc="Pet aggressive"},
        {name="/follow", desc="Follow unit"},
        {name="/cancelform", desc="Cancel form/stance"},
        {name="/cancelaura", desc="Cancel buff"},
        {name="/equip", desc="Equip item"},
        {name="/equipslot", desc="Equip to slot"},
        {name="/changeactionbar", desc="Change bar page"},
        {name="/swapactionbar", desc="Swap bar pages"},
        {name="/click", desc="Click button"},
        {name="/dismount", desc="Dismount"},
    },
    [L["Chat & Group"]] = {
        {name="/say", desc="Say"},
        {name="/yell", desc="Yell"},
        {name="/party", desc="Party chat"},
        {name="/raid", desc="Raid chat"},
        {name="/instance", desc="Instance chat"},
        {name="/guild", desc="Guild chat"},
        {name="/whisper", desc="Whisper"},
        {name="/reply", desc="Reply"},
        {name="/emote", desc="Custom emote"},
        {name="/invite", desc="Invite player"},
        {name="/kick", desc="Kick player"},
        {name="/promote", desc="Promote"},
        {name="/demote", desc="Demote"},
        {name="/readycheck", desc="Ready check"},
        {name="/rolecheck", desc="Role check"},
        {name="/bg", desc="Battleground chat"},
        {name="/rw", desc="Raid Warning"},
        {name="/leave", desc="Leave channel/group"},
    },
    [L["Interface & Utility"]] = {
        {name="/reload", desc="Reload UI"},
        {name="/fstack", desc="Frame Stack"},
        {name="/eventtrace", desc="Event Trace"},
        {name="/console", desc="Console command"},
        {name="/run", desc="Run Lua"},
        {name="/script", desc="Run Lua script"},
        {name="/dump", desc="Dump variable"},
        {name="/stopmacro", desc="Stop macro execution"},
        {name="/exit", desc="Exit game"},
        {name="/logout", desc="Logout"},
        {name="/camp", desc="Logout to char select"},
        {name="/afk", desc="Toggle AFK"},
        {name="/ping", desc="Smart Ping"},
        {name="/countdown", desc="Countdown Timer"},
    },
    [L["Emotes & Animations"]] = {
        {name="/dance", desc="Dance"},
        {name="/sleep", desc="Sleep"},
        {name="/fart", desc="Fart"},
        {name="/groan", desc="Groan"},
        {name="/hug", desc="Hug"},
        {name="/kiss", desc="Kiss"},
        {name="/ready", desc="Ready"},
        {name="/wave", desc="Wave"},
        {name="/bow", desc="Bow"},
        {name="/check", desc="Check"},
        {name="/cheer", desc="Cheer"},
        {name="/clap", desc="Clap"},
        {name="/cry", desc="Cry"},
        {name="/laugh", desc="Laugh"},
        {name="/point", desc="Point"},
        {name="/rude", desc="Rude"},
        {name="/salute", desc="Salute"},
        {name="/shrug", desc="Shrug"},
        {name="/shy", desc="Shy"},
        {name="/sigh", desc="Sigh"},
        {name="/sit", desc="Sit"},
        {name="/stand", desc="Stand"},
        {name="/talk", desc="Talk"},
        {name="/thank", desc="Thank"},
        {name="/train", desc="Train"},
        {name="/yes", desc="Yes"},
        {name="/no", desc="No"},
        {name="/helpme", desc="Help me!"},
        {name="/cower", desc="Cower"},
        {name="/pat", desc="Pat"},
        {name="/whistle", desc="Whistle"},
        {name="/hungry", desc="Hungry"},
        {name="/thirsty", desc="Thirsty"},
        {name="/wait", desc="Wait"},
        {name="/gasp", desc="Gasp"},
        {name="/cough", desc="Cough"},
        {name="/moan", desc="Moan"},
        {name="/spit", desc="Spit"},
        {name="/oops", desc="Oops"},
        {name="/threat", desc="Threaten"},
        {name="/charge", desc="Charge"},
    },
}

--- Opens or toggles the Command Panel for a specific builder row/line.
--- @param line table The builder row/line object to edit commands for.
function MM:OpenCommandPanel(line)
    if not MM.CommandPanel and MM.SetupCommandPanel then
        MM:SetupCommandPanel()
    end
    
    if not line then
        if MM.currentEditLine then
            line = MM.currentEditLine
        elseif MM.rows and MM.rows["nomod"] and MM.rows["nomod"].lines and MM.rows["nomod"].lines[1] then
            line = MM.rows["nomod"].lines[1]
        end
    end
    
    -- Toggle off if clicking the same line while open
    if MM.CommandPanel and MM.CommandPanel:IsShown() and MM.currentEditLine == line then
        MM.currentEditLine = nil
        MM:ShowInspectorTab("overview")
        return
    end
    
    MM.currentEditLine = line
    MM:ShowInspectorTab("commands")
end

--- Creates the Command Panel interface.
function MM:SetupCommandPanel()
    local frame = CreateFrame("Frame", "MM_CommandPanel", MM.InspectorPanel)
    frame:SetPoint("TOPLEFT", MM.InspectorPanel, "TOPLEFT", 0, -56)
    frame:SetPoint("BOTTOMRIGHT", MM.InspectorPanel, "BOTTOMRIGHT", 0, 0)
    frame:Hide()
    
    -- Exclusive Visibility Logic
    frame:HookScript("OnShow", function(self)
        MM:CloseInspectorPanels(self)
        if MM.UpdateInspectorTabHighlight then MM:UpdateInspectorTabHighlight("commands") end
        
        -- Initialize to "Targeting" if clean open
        if not MM.selectedCommandCategory then
             MM.selectedCommandCategory = L["Targeting"]
             if MM.CommandDropdown and MM.CommandDropdown.Label then 
                 MM.CommandDropdown.Label:SetText(L["Targeting"]) 
             end
             MM:UpdateCommandList(L["Targeting"])
        end
    end)
    
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 15, -8)
    title:SetText(L["Commands"])

    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", -4, -2)
    closeBtn:SetSize(22, 22)
    closeBtn:SetScript("OnClick", function()
        MM:ShowInspectorTab("overview")
    end)

    MM.CommandPanel = frame
    
    -- 1. Category Dropdown
    local cmdDropdown = CreateFrame("DropdownButton", "MM_CommandDropdown", frame, "WowStyle1DropdownTemplate")
    cmdDropdown:SetPoint("TOPLEFT", 12, -28)
    cmdDropdown:SetWidth(150)
    
    local lbl = cmdDropdown:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lbl:SetPoint("LEFT", 10, 0)
    lbl:SetPoint("RIGHT", -25, 0)
    lbl:SetJustifyH("LEFT")
    lbl:SetText(L["Targeting"])
    cmdDropdown.Label = lbl
    MM.CommandDropdown = cmdDropdown
    
    cmdDropdown:SetupMenu(function(dropdown, rootDescription)
        local cats = {
            L["Targeting"], 
            L["Action & Spells"], 
            L["Chat & Group"], 
            L["Interface & Utility"], 
            L["Emotes & Animations"]
        }
        
        for _, cat in ipairs(cats) do
            rootDescription:CreateButton(cat, function()
                MM.selectedCommandCategory = cat
                if dropdown.Label then dropdown.Label:SetText(cat) end
                local filter = frame.searchBox and frame.searchBox:GetText() or ""
                MM:UpdateCommandList(cat, filter)
            end)
        end
    end)
    
    -- 2. Search / Filter Box
    local searchBox = CreateFrame("EditBox", "$parent_CmdSearch", frame, "BackdropTemplate")
    searchBox:SetPoint("LEFT", cmdDropdown, "RIGHT", 6, 0)
    searchBox:SetPoint("RIGHT", -12, 0)
    searchBox:SetHeight(22)
    searchBox:SetAutoFocus(false)
    searchBox:SetFontObject("GameFontHighlightSmall")
    searchBox:SetTextInsets(6, 18, 0, 0)
    searchBox:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 8,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    searchBox:SetBackdropColor(0.06, 0.06, 0.08, 0.95)
    searchBox:SetBackdropBorderColor(0.25, 0.25, 0.3, 0.8)
    
    local searchPlaceholder = searchBox:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    searchPlaceholder:SetPoint("LEFT", 6, 0)
    searchPlaceholder:SetText(L["Search..."] or "Search...")
    searchBox.placeholder = searchPlaceholder
    
    local clearBtn = CreateFrame("Button", nil, searchBox)
    clearBtn:SetSize(14, 14)
    clearBtn:SetPoint("RIGHT", -4, 0)
    local clearTex = clearBtn:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    clearTex:SetAllPoints()
    clearTex:SetText("×")
    clearBtn:Hide()
    
    clearBtn:SetScript("OnClick", function()
        searchBox:SetText("")
        searchBox:ClearFocus()
    end)
    
    searchBox:SetScript("OnTextChanged", function(self)
        local text = self:GetText()
        if text and text ~= "" then
            searchPlaceholder:Hide()
            clearBtn:Show()
        else
            searchPlaceholder:Show()
            clearBtn:Hide()
        end
        MM:UpdateCommandList(MM.selectedCommandCategory or L["Targeting"], text)
    end)
    searchBox:SetScript("OnEscapePressed", function(self)
        self:SetText("")
        self:ClearFocus()
    end)
    frame.searchBox = searchBox
    
    -- 3. Command List ScrollFrame
    local scrollFrame = CreateFrame("ScrollFrame", "$parent_CmdScroll", frame, "UIPanelScrollFrameTemplate")
    
    MM:SkinScrollBar(scrollFrame)
    scrollFrame:SetPoint("TOPLEFT", 12, -56)
    scrollFrame:SetPoint("BOTTOMRIGHT", -32, 12)
    
    local scrollChild = CreateFrame("Frame")
    scrollChild:SetSize(290, 1) 
    scrollFrame:SetScrollChild(scrollChild)
    
    frame.listContent = scrollChild
    MM.commandButtons = {}
    
    MM:UpdateCommandList(L["Targeting"])
end

--- Updates the list of commands displayed in the Command Panel.
function MM:UpdateCommandList(category, filterText)
    if not MM.CommandPanel or not MM.CommandPanel.listContent then return end
    
    local list = MM.CommandPanel.listContent
    local dynamicData = {}
    local filter = (filterText and string.lower(filterText:match("^%s*(.-)%s*$"))) or ""
    
    if filter ~= "" then
        -- Search across ALL command categories for quick discovery
        local added = {}
        for _, catList in pairs(MM.CommandCategories) do
            for _, cmd in ipairs(catList) do
                if not added[cmd.name] then
                    local cName = string.lower(cmd.name)
                    local cDesc = string.lower(L[cmd.desc] or cmd.desc)
                    if string.find(cName, filter, 1, true) or string.find(cDesc, filter, 1, true) then
                        table.insert(dynamicData, cmd)
                        added[cmd.name] = true
                    end
                end
            end
        end
    else
        local data = MM.CommandCategories[category] or {}
        for _, v in ipairs(data) do table.insert(dynamicData, v) end
        
        if category == L["Chat & Group"] and GetChannelList then
            local channelList = { GetChannelList() }
            for i = 1, #channelList, 3 do
                local id = channelList[i]
                local name = channelList[i+1]
                local disabled = channelList[i+2]
                if id and name and not disabled then
                    table.insert(dynamicData, 1, {name = "/" .. id, desc = name})
                end
            end
        end
    end
    
    -- Hide existing buttons
    if not MM.commandButtons then MM.commandButtons = {} end
    for _, btn in pairs(MM.commandButtons) do btn:Hide() end
    
    local yOffset = 0
    local itemWidth = 286
    
    for i, cmd in ipairs(dynamicData) do
        local btn = MM.commandButtons[i]
        if not btn then
            btn = CreateFrame("Button", nil, list, "BackdropTemplate")
            btn:SetSize(itemWidth, 26)
            
            btn:SetBackdrop({
                bgFile = "Interface\\Buttons\\WHITE8x8",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                tile = false, tileSize = 16, edgeSize = 8,
                insets = { left = 2, right = 2, top = 2, bottom = 2 }
            })
            btn:SetBackdropColor(0.08, 0.08, 0.10, 0.92)
            btn:SetBackdropBorderColor(0.20, 0.20, 0.24, 0.85)
            
            -- Left accent indicator line (Cyan)
            local accent = btn:CreateTexture(nil, "OVERLAY")
            accent:SetSize(3, 16)
            accent:SetPoint("LEFT", 4, 0)
            accent:SetColorTexture(0.0, 0.75, 1.0, 0.8)
            btn.accent = accent
            
            -- Command Name (Left)
            local textLeft = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            textLeft:SetPoint("LEFT", accent, "RIGHT", 6, 0)
            textLeft:SetJustifyH("LEFT")
            textLeft:SetTextColor(0.2, 0.8, 1.0)
            btn.textLeft = textLeft
            
            -- Command Description (Right)
            local textRight = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            textRight:SetPoint("RIGHT", -22, 0)
            textRight:SetPoint("LEFT", textLeft, "RIGHT", 6)
            textRight:SetJustifyH("RIGHT")
            textRight:SetWordWrap(false)
            textRight:SetTextColor(0.70, 0.70, 0.74)
            btn.textRight = textRight
            
            -- Insert Plus Icon (Far Right)
            local plus = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            plus:SetPoint("RIGHT", -7, 0)
            plus:SetText("|cff555566+|r")
            btn.plus = plus
            
            -- Hover Highlight Texture
            local hl = btn:CreateTexture(nil, "HIGHLIGHT")
            hl:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
            hl:SetBlendMode("ADD")
            hl:SetAlpha(0.18)
            hl:SetAllPoints()
            btn.hl = hl
            
            -- Interactive Scripts
            btn:HookScript("OnEnter", function(self)
                self:SetBackdropBorderColor(0.0, 0.75, 1.0, 1.0)
                self:SetBackdropColor(0.14, 0.16, 0.20, 0.98)
                if self.accent then self.accent:SetColorTexture(0.0, 0.95, 1.0, 1.0) end
                if self.textLeft then self.textLeft:SetTextColor(1.0, 1.0, 1.0) end
                if self.textRight then self.textRight:SetTextColor(1.0, 0.82, 0.0) end
                if self.plus then self.plus:SetText("|cffffd100+|r") end
                
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(self.commandName or "", 0.2, 0.8, 1.0)
                if self.commandDesc and self.commandDesc ~= "" then
                    GameTooltip:AddLine(self.commandDesc, 1, 1, 1, true)
                end
                GameTooltip:AddLine(" ", 1, 1, 1)
                GameTooltip:AddLine(L["Click to insert into active macro row."] or "Click to insert into active macro row.", 0.2, 1.0, 0.4, true)
                GameTooltip:Show()
            end)
            
            btn:HookScript("OnLeave", function(self)
                self:SetBackdropBorderColor(0.20, 0.20, 0.24, 0.85)
                self:SetBackdropColor(0.08, 0.08, 0.10, 0.92)
                if self.accent then self.accent:SetColorTexture(0.0, 0.75, 1.0, 0.8) end
                if self.textLeft then self.textLeft:SetTextColor(0.2, 0.8, 1.0) end
                if self.textRight then self.textRight:SetTextColor(0.70, 0.70, 0.74) end
                if self.plus then self.plus:SetText("|cff555566+|r") end
                GameTooltip:Hide()
            end)
            
            btn:HookScript("OnMouseDown", function(self)
                self:SetBackdropColor(0.04, 0.04, 0.06, 1.0)
                self:SetBackdropBorderColor(0.0, 0.55, 0.8, 1.0)
            end)
            
            btn:HookScript("OnMouseUp", function(self)
                if self:IsMouseOver() then
                    self:SetBackdropColor(0.14, 0.16, 0.20, 0.98)
                    self:SetBackdropBorderColor(0.0, 0.75, 1.0, 1.0)
                end
            end)
            
            btn:SetScript("OnClick", function(self)
                MM:InsertCommand(self.commandName)
            end)
            
            MM.commandButtons[i] = btn
        end
        
        btn:SetPoint("TOPLEFT", 2, yOffset)
        btn:SetWidth(itemWidth)
        
        btn.commandName = cmd.name
        btn.commandDesc = L[cmd.desc] or cmd.desc
        
        btn.textLeft:SetText(cmd.name)
        btn.textRight:SetText(L[cmd.desc] or cmd.desc)
        
        btn:Show()
        yOffset = yOffset - 28
    end
    
    list:SetHeight(math.abs(yOffset) + 10)
end

--- Inserts the selected command into the active Builder row input.
function MM:InsertCommand(cmdName)
    if MM.currentEditLine and MM.currentEditLine.spellInput then
         MM.currentEditLine.spellInput:SetText(cmdName)
         
         -- Smart Focus: If command triggered an argument box, focus that
         if MM.currentEditLine.argInput and MM.currentEditLine.argInput:IsShown() then
             MM.currentEditLine.argInput:SetFocus()
         else
             MM.currentEditLine.spellInput:SetFocus() 
         end
         
         MM:GenerateMacroText()
         
         -- Auto-close command panel after selection and return to overview
         MM:ShowInspectorTab("overview")
    elseif MM.outputBox then
         local cur = MM.outputBox:GetText() or ""
         if cur ~= "" and not cur:match("\n$") then cur = cur .. "\n" end
         MM.outputBox:SetText(cur .. cmdName .. " ")
         MM.outputBox:SetFocus()
         if MM.GenerateMacroFromText then MM:GenerateMacroFromText() end
         MM:ShowInspectorTab("overview")
    end
end
