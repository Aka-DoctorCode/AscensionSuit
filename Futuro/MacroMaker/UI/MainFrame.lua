--------------------------------------------------------------------------------
-- Macro Maker - Main Frame Module
-- Version: 2.0
-- Author: Satyros
--
-- Description:
--   Manages the main addon window ("MacroMakerFrame").
--   Handles initialization, dragging, and column orchestration.
--------------------------------------------------------------------------------

local AddOnName, MM = ...



--------------------------------------------------------------------------------
-- Main UI Toggle & creation
--------------------------------------------------------------------------------

--- Toggles the visibility of the Main Frame.
--- If not created, it initializes the frame.
--- Closes other standard WoW UI panels to avoid clutter.
function MM:ToggleUI()
    if not MM.MainFrame then
        MM:CreateMainFrame()
        local closeList = {
            "PlayerSpellsFrame", "SpellBookFrame", 
            "CharacterFrame", "PVEFrame", 
            "EncounterJournal", "CollectionsJournal",
            "ProfessionsFrame", "MacroFrame"
        }
        for _, name in ipairs(closeList) do
            local f = _G[name]
            if f and f:IsShown() then f:Hide() end
        end

        if UltimaBridge and UltimaBridge.RestoreWindowPosition then
            MM.db = MM.db or {}
            MM.db.settings = MM.db.settings or {}
            MM.db.settings.window = MM.db.settings.window or {}
            UltimaBridge:RestoreWindowPosition(MM.MainFrame, MM.db.settings.window, "TOP", 0, -118)
        else
            if MM.MainFrame:GetNumPoints() == 0 then
                MM.MainFrame:ClearAllPoints()
                MM.MainFrame:SetPoint("TOP", UIParent, "TOP", 0, -118)
            end
        end
        MM.MainFrame:Show()
        if MM.UpdateOverviewPanel then MM:UpdateOverviewPanel() end
        return
    end
    
    if MM.MainFrame:IsShown() then
        MM.MainFrame:Hide()
    else
        local closeList = {
            "PlayerSpellsFrame", "SpellBookFrame", 
            "CharacterFrame", "PVEFrame", 
            "EncounterJournal", "CollectionsJournal",
            "ProfessionsFrame", "MacroFrame"
        }
        for _, name in ipairs(closeList) do
            local f = _G[name]
            if f and f:IsShown() then f:Hide() end
        end

        if UltimaBridge and UltimaBridge.RestoreWindowPosition then
            MM.db = MM.db or {}
            MM.db.settings = MM.db.settings or {}
            MM.db.settings.window = MM.db.settings.window or {}
            UltimaBridge:RestoreWindowPosition(MM.MainFrame, MM.db.settings.window, "TOP", 0, -118)
        else
            if MM.MainFrame:GetNumPoints() == 0 then
                MM.MainFrame:ClearAllPoints()
                MM.MainFrame:SetPoint("TOP", UIParent, "TOP", 0, -118)
            end
        end
        MM.MainFrame:Show()
        if MM.UpdateOverviewPanel then MM:UpdateOverviewPanel() end
    end
end

--- Creates the Main Frame and initializes its sub-columns.
function MM:CreateMainFrame()
    -- Standard PortraitFrameTemplate for consistent WoW aesthetic
    local f = CreateFrame("Frame", "MacroMakerFrame", UIParent, "PortraitFrameTemplate")
    f:SetSize(1200, 750)
    f:SetClampedToScreen(true)
    f:SetClampRectInsets(100, -100, -50, 50)
    f:SetMovable(true)
    f:EnableMouse(true)
    
    -- Window Management & Persistence (Native UltimaBridge)
    MM.db = MM.db or {}
    MM.db.settings = MM.db.settings or {}
    MM.db.settings.window = MM.db.settings.window or {}
    if UltimaBridge and UltimaBridge.MakeWindowDraggable then
        UltimaBridge:RestoreWindowPosition(f, MM.db.settings.window, "TOP", 0, -118)
        UltimaBridge:MakeWindowDraggable(f, MM.db.settings.window)
    else
        f:ClearAllPoints()
        f:SetPoint("TOP", UIParent, "TOP", 0, -118)
        f:RegisterForDrag("LeftButton") 
        f:SetScript("OnDragStart", function(self) self:StartMoving() end)
        f:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
    end
    
    f:SetFrameStrata("DIALOG") 
    table.insert(UISpecialFrames, "MacroMakerFrame") 

    -- Standard Close Button (Blizzard style)
    local closeBtn = f.CloseButton or CreateFrame("Button", nil, f, "UIPanelCloseButton")
    closeBtn:ClearAllPoints()
    closeBtn:SetSize(22, 22)
    closeBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", -3, -1)
    closeBtn:SetScript("OnClick", function() f:Hide() end)
    f.CloseButton = closeBtn

    local function GetTopTitleLevel(targetFrame)
        local lvl = targetFrame:GetFrameLevel() + 30
        if targetFrame.NineSlice and targetFrame.NineSlice.GetFrameLevel then
            lvl = math.max(lvl, targetFrame.NineSlice:GetFrameLevel() + 20)
        end
        if targetFrame.TitleContainer and targetFrame.TitleContainer.GetFrameLevel then
            lvl = math.max(lvl, targetFrame.TitleContainer:GetFrameLevel() + 20)
        end
        return math.max(lvl, 200)
    end

    local topLevel = GetTopTitleLevel(f)
    closeBtn:SetFrameLevel(topLevel)
    if closeBtn.Raise then closeBtn:Raise() end

    -- Settings Cog Button in Title Bar
    local settingsBtn = CreateFrame("Button", "$parentSettingsBtn", f, "BackdropTemplate")
    settingsBtn:SetSize(20, 20)
    settingsBtn:SetPoint("RIGHT", closeBtn, "LEFT", -2, 0)
    settingsBtn:SetFrameLevel(topLevel + 1)
    settingsBtn:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 8,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    settingsBtn:SetBackdropColor(0.1, 0.12, 0.15, 0.9)
    settingsBtn:SetBackdropBorderColor(0.3, 0.35, 0.4, 0.9)

    local gearIcon = settingsBtn:CreateTexture(nil, "OVERLAY")
    gearIcon:SetSize(14, 14)
    gearIcon:SetPoint("CENTER", 0, 0)

    local atlasWorked = false
    if gearIcon.SetAtlas then
        local ok = pcall(function() gearIcon:SetAtlas("transmog-icon-settings") end)
        if ok and gearIcon:GetTexture() then
            atlasWorked = true
        end
    end
    if not atlasWorked then
        gearIcon:SetTexture("Interface\\WorldMap\\GEAR_64GREY")
        if not gearIcon:GetTexture() then
            gearIcon:SetTexture("Interface\\Icons\\Trade_Engineering")
            gearIcon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
        end
    end
    gearIcon:SetVertexColor(0.85, 0.88, 0.92, 1)

    settingsBtn:SetScript("OnEnter", function(self)
        self:SetBackdropBorderColor(0.78, 0.61, 0.43, 1.0)
        self:SetBackdropColor(0.18, 0.17, 0.20, 0.95)
        gearIcon:SetVertexColor(1.0, 0.85, 0.5, 1.0)
        GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
        local title = (MM.L and (MM.L["TAB_SETTINGS"] or MM.L["Settings"] or MM.L["SETTINGS"])) or "Settings"
        GameTooltip:AddLine("|cffffd100" .. title .. "|r", 1, 1, 1)
        GameTooltip:AddLine(string.format(MM.L and MM.L["SETTINGS_BUTTON_DESC"] or "Click to open %s options & settings.", "Macro Maker"), 0.85, 0.85, 0.85, true)
        GameTooltip:Show()
    end)
    settingsBtn:SetScript("OnLeave", function(self)
        self:SetBackdropBorderColor(0.3, 0.35, 0.4, 0.9)
        self:SetBackdropColor(0.1, 0.12, 0.15, 0.9)
        gearIcon:SetVertexColor(0.85, 0.88, 0.92, 1)
        GameTooltip:Hide()
    end)
    settingsBtn:SetScript("OnMouseDown", function()
        gearIcon:SetPoint("CENTER", 1, -1)
    end)
    settingsBtn:SetScript("OnMouseUp", function()
        gearIcon:SetPoint("CENTER", 0, 0)
    end)
    settingsBtn:SetScript("OnClick", function()
        if MM.OpenOptions then
            MM:OpenOptions()
        end
    end)
    if settingsBtn.Raise then settingsBtn:Raise() end
    f.SettingsButton = settingsBtn
    f.settingsBtn = settingsBtn

    f:HookScript("OnShow", function(self)
        local lvl = GetTopTitleLevel(self)
        if self.CloseButton then
            self.CloseButton:SetFrameLevel(lvl)
            if self.CloseButton.Raise then self.CloseButton:Raise() end
        end
        if self.SettingsButton then
            self.SettingsButton:SetFrameLevel(lvl + 1)
            if self.SettingsButton.Raise then self.SettingsButton:Raise() end
        end
    end)

    -- Title & Icon
    f:SetTitle("Macro Maker")
    f:SetPortraitToAsset("Interface\\MacroFrame\\MacroFrame-Icon")
    
    MM.MainFrame = f

    function MM:UpdateTheme(themeID)
        themeID = themeID or (_G.UltimaTheme and _G.UltimaTheme.GetTheme and _G.UltimaTheme:GetTheme()) or "BLIZZARD"
        local panels = { self.ManagerPanel, self.SourcePanel, self.InspectorPanel, self.BuilderPanel }
        for _, p in ipairs(panels) do
            if p and _G.UltimaTheme and _G.UltimaTheme.ApplyBackdrop then
                _G.UltimaTheme:ApplyBackdrop(p, "INSET", nil, themeID)
            end
        end
    end

    
    -- Initialize Dividers Table
    MM.Dividers = {}
    
    -- Initialize Columns
    MM:CreateManagerColumn(f)
    MM:CreateSourceColumn(f)
    MM:CreateInspectorColumn(f)
    MM:CreateBuilderColumn(f)
    MM:UpdateTheme()
    
    -- Create Visual Dividers
    local function CreateDivider(anchorFrame, xOffset)
        local div = f:CreateTexture(nil, "ARTWORK")
        div:SetWidth(2)
        div:SetPoint("TOPLEFT", anchorFrame, "TOPRIGHT", xOffset, 10)
        div:SetPoint("BOTTOMLEFT", anchorFrame, "BOTTOMRIGHT", xOffset, -10)
        
        -- Matching Champion Companion inset border color
        div:SetColorTexture(0.18, 0.18, 0.2, 0.8) 
        
        table.insert(MM.Dividers, { div = div })
        return div
    end
    
    -- Dividers are omitted for a cleaner layout style matching Champion Companion

    f:Hide() 
    
    f:HookScript("OnHide", function()
        if MM.ConditionEditor then
            MM.ConditionEditor:Hide()
        end
    end)
    
    -- Initialize Tutorial System
    if MM.InitTutorial then MM:InitTutorial() end
    
    -- Keyboard Shortcuts (Ctrl+S, Ctrl+N, Ctrl+D, Ctrl+Z, Ctrl+Y)
    f:EnableKeyboard(true)
    f:SetPropagateKeyboardInput(true)
    f:SetScript("OnKeyDown", function(self, key)
        if IsControlKeyDown() then
            if key == "S" then
                self:SetPropagateKeyboardInput(false)
                MM:SaveMacro()
                return
            elseif key == "N" then
                self:SetPropagateKeyboardInput(false)
                MM:ClearBuilder()
                return
            elseif key == "D" then
                self:SetPropagateKeyboardInput(false)
                MM:DuplicateMacro()
                return
            elseif key == "Z" then
                self:SetPropagateKeyboardInput(false)
                if MM.History then MM.History:Undo() end
                return
            elseif key == "Y" then
                self:SetPropagateKeyboardInput(false)
                if MM.History then MM.History:Redo() end
                return
            end
        end
        self:SetPropagateKeyboardInput(true)
    end)
end
