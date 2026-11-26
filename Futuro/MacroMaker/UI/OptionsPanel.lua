--------------------------------------------------------------------------------
-- Macro Maker - Blizzard Settings Panel (Options Canvas)
-- Ultima Suite - Retail 12.1.0 (Midnight)
-- Author: Satyros
--
-- Ultima Tabbed Canvas with Dynamic Scroll-Body:
-- Dedicated tabs for Generator & Profiles, Editor, Audio Feedback, Backup/Export, Minimap, and Help.
--------------------------------------------------------------------------------

local _, MM = ...
local L = MM.L or {}

local function GetText(key, default)
    local isGerman = (GetLocale and GetLocale() == "deDE")
    local loc = MM.L or L
    if isGerman then
        if loc then
            local val = loc[key]
            if val and val ~= "" and val ~= key then
                return val
            end
        end
        return default or key
    else
        if not key:match("^[A-Z0-9_]+$") then
            return key
        end
        if loc then
            local val = loc[key]
            if val and val ~= "" and val ~= key then
                return val
            end
        end
        if default and not default:match("[äöüÄÖÜß]") then
            return default
        end
        return key
    end
end

local function GetSafeSetting(key, default)
    if MM.db and MM.db.settings and MM.db.settings[key] ~= nil then
        return MM.db.settings[key]
    end
    return default
end

local function SetSafeSetting(key, value)
    if not MM.db then return end
    MM.db.settings = MM.db.settings or {}
    MM.db.settings[key] = value
end

function MM:OpenOptions()
    if InCombatLockdown and InCombatLockdown() then
        local combatMsg = GetText("COMBAT_CANNOT_OPEN_OPTIONS", "Cannot open settings during combat!")
        print(string.format("|cffffd100%s:|r %s", GetText("ADDON_TITLE", "Macro Maker"), combatMsg))
        return
    end

    if not MM.settingsCategory and MM.RegisterOptions then
        MM:RegisterOptions()
    end

    local catID = nil
    if MM.settingsCategory then
        if type(MM.settingsCategory.GetID) == "function" then
            local ok, id = pcall(MM.settingsCategory.GetID, MM.settingsCategory)
            if ok and (type(id) == "number" or type(id) == "string") then
                catID = id
            end
        elseif MM.settingsCategory.ID then
            catID = MM.settingsCategory.ID
        end
    end

    local opened = false
    if catID and Settings and Settings.OpenToCategory then
        local ok = pcall(Settings.OpenToCategory, catID)
        if ok then opened = true end
    end

    if not opened and Settings and Settings.OpenToCategory then
        local ok = pcall(Settings.OpenToCategory, "Macro Maker")
        if ok then opened = true end
    end

    if not opened then
        if SettingsPanel and SettingsPanel.Open then
            pcall(SettingsPanel.Open, SettingsPanel)
        elseif InterfaceOptionsFrame_OpenToCategory then
            pcall(InterfaceOptionsFrame_OpenToCategory, "Macro Maker")
        end
    end
end

function MM:RegisterOptions()
    if MM.settingsCategory or MM.settingsPanel then
        return
    end

    local panel = CreateFrame("Frame", "MacroMakerSettingsPanel", UIParent)
    panel.name = "Macro Maker"
    MM.settingsPanel = panel
    MM.OptionsPanel = panel

    -- Header / Title
    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText(string.format("|cffffd100%s|r - %s", GetText("ADDON_TITLE", "Macro Maker"), GetText("TAB_SETTINGS", "Settings")))

    local desc = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    desc:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)
    desc:SetText(GetText("ADDON_SUBTITLE", "Visual Macro Studio, Talent Profiles & Action Bar Optimizer"))

    ----------------------------------------------------------------------------
    -- UI Control Helpers
    ----------------------------------------------------------------------------
    local function SetupCheckbox(cb, labelText, tooltipText, isChecked, onClickFunc)
        local fs = cb.Text or cb.text or _G[cb:GetName() .. "Text"]
        if fs then
            fs:SetText(labelText or "")
            fs:SetFontObject("GameFontHighlight")
        end
        cb:SetChecked(isChecked == true)
        cb:SetScript("OnClick", onClickFunc)
        if tooltipText then
            cb:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:AddLine(labelText or "", 1, 1, 1)
                GameTooltip:AddLine(tooltipText, 0.85, 0.85, 0.85, true)
                GameTooltip:Show()
            end)
            cb:SetScript("OnLeave", function()
                GameTooltip:Hide()
            end)
        end
    end

    local function CreateActionButton(name, parent, width, height, text, tooltip, onClick, isRed)
        local btn = CreateFrame("Button", name, parent, "BackdropTemplate")
        btn:SetSize(width or 230, height or 24)
        btn:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = false, tileSize = 16, edgeSize = 10,
            insets = { left = 2, right = 2, top = 2, bottom = 2 }
        })
        if isRed then
            btn:SetBackdropColor(0.16, 0.08, 0.08, 0.9)
            btn:SetBackdropBorderColor(0.4, 0.2, 0.2, 1)
        else
            btn:SetBackdropColor(0.12, 0.12, 0.14, 0.9)
            btn:SetBackdropBorderColor(0.25, 0.25, 0.28, 1)
        end

        local btnText = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        btnText:SetPoint("CENTER")
        btnText:SetText(text or "")
        btn.Text = btnText

        btn:SetScript("OnEnter", function(self)
            if isRed then
                self:SetBackdropBorderColor(1.0, 0.3, 0.3, 1)
                self:SetBackdropColor(0.24, 0.1, 0.1, 0.95)
                btnText:SetTextColor(1.0, 0.8, 0.8)
            else
                self:SetBackdropBorderColor(0.78, 0.61, 0.43, 1.0)
                self:SetBackdropColor(0.18, 0.17, 0.20, 0.95)
                btnText:SetTextColor(1.0, 0.85, 0.5)
            end
            if tooltip then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:AddLine(text, 1, 1, 1)
                GameTooltip:AddLine(tooltip, 0.85, 0.85, 0.85, true)
                GameTooltip:Show()
            end
        end)
        btn:SetScript("OnLeave", function(self)
            if isRed then
                self:SetBackdropBorderColor(0.4, 0.2, 0.2, 1)
                self:SetBackdropColor(0.16, 0.08, 0.08, 0.9)
                btnText:SetTextColor(1, 1, 1)
            else
                self:SetBackdropBorderColor(0.24, 0.24, 0.28, 0.8)
                self:SetBackdropColor(0.12, 0.12, 0.14, 0.9)
                btnText:SetTextColor(0.85, 0.85, 0.85)
            end
            GameTooltip:Hide()
        end)
        btn:SetScript("OnClick", onClick)
        return btn
    end

    local function CreateSectionHeader(parent, text, x, y, width)
        local fs = parent:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        fs:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
        fs:SetText("|cffffd100" .. text .. "|r")

        local line = parent:CreateTexture(nil, "ARTWORK")
        line:SetHeight(1)
        line:SetPoint("TOPLEFT", fs, "BOTTOMLEFT", 0, -3)
        line:SetPoint("RIGHT", parent, "LEFT", x + (width or 260), 0)
        line:SetColorTexture(0.35, 0.32, 0.25, 0.5)

        return fs, line
    end

    ----------------------------------------------------------------------------
    -- Tab Definitions & Header Bar
    ----------------------------------------------------------------------------
    local tabDefs = {
        { id = 1, text = GetText("TAB_CORE_PROFILES", "Core & Profiles") },
        { id = 2, text = GetText("TAB_STUDIO", "Studio & Syntax") },
        { id = 3, text = GetText("TAB_AUDIO", "Audio & Cues") },
        { id = 4, text = GetText("TAB_BACKUP", "Backup & Sharing") },
        { id = 5, text = GetText("TAB_ACTION_BARS", "Action Bars & UI") },
        { id = 6, text = GetText("TAB_HELP", "Help & Info") },
    }

    local tabButtons = {}
    panel.tabButtons = tabButtons
    panel.tabPages = {}

    -- Master Scroll Frame for all tab pages
    local scrollFrame = CreateFrame("ScrollFrame", "MacroMakerOptionsScrollFrame", panel, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", panel, "TOPLEFT", 12, -74)
    scrollFrame:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -26, 8)
    scrollFrame:EnableMouseWheel(true)
    scrollFrame:SetScript("OnMouseWheel", function(self, delta)
        local cur = self:GetVerticalScroll()
        local maxScroll = self:GetVerticalScrollRange()
        local step = 32
        local new = cur - (delta * step)
        if new < 0 then new = 0 end
        if new > maxScroll then new = maxScroll end
        self:SetVerticalScroll(new)
    end)

    local scrollBar = _G[scrollFrame:GetName() .. "ScrollBar"]
    if scrollBar then
        local track = scrollBar:CreateTexture(nil, "BACKGROUND")
        track:SetPoint("TOPLEFT", scrollBar, "TOPLEFT", 2, -18)
        track:SetPoint("BOTTOMRIGHT", scrollBar, "BOTTOMRIGHT", -2, 18)
        track:SetColorTexture(0, 0, 0, 0.35)
    end

    local content = CreateFrame("Frame", "MacroMakerOptionsContent", scrollFrame)
    content:SetSize(580, 520)
    scrollFrame:SetScrollChild(content)

    local function CreateTabPage(id)
        local page = CreateFrame("Frame", nil, content)
        page:SetAllPoints(content)
        page:Hide()
        panel.tabPages[id] = page
        return page
    end

    local function SelectTab(tabId)
        for id, btn in pairs(tabButtons) do
            if id == tabId then
                btn:SetBackdropColor(0.22, 0.19, 0.14, 0.95)
                btn:SetBackdropBorderColor(0.85, 0.68, 0.25, 1)
                btn.Text:SetTextColor(1, 0.85, 0.3)
                if btn.Indicator then btn.Indicator:Show() end
            else
                btn:SetBackdropColor(0.08, 0.08, 0.10, 0.8)
                btn:SetBackdropBorderColor(0.25, 0.25, 0.28, 0.8)
                btn.Text:SetTextColor(0.75, 0.75, 0.75)
                if btn.Indicator then btn.Indicator:Hide() end
            end
        end

        for id, page in pairs(panel.tabPages) do
            if id == tabId then
                page:Show()
            else
                page:Hide()
            end
        end
        scrollFrame:SetVerticalScroll(0)
    end

    -- Create horizontal tab buttons
    local tabWidth = 92
    local tabHeight = 22
    for i, def in ipairs(tabDefs) do
        local btn = CreateFrame("Button", "MM_OptTabBtn_" .. def.id, panel, "BackdropTemplate")
        btn:SetSize(tabWidth, tabHeight)
        btn:SetPoint("TOPLEFT", panel, "TOPLEFT", 12 + ((i - 1) * (tabWidth + 4)), -46)
        btn:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = false, tileSize = 16, edgeSize = 8,
            insets = { left = 2, right = 2, top = 2, bottom = 2 }
        })

        local txt = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        txt:SetPoint("LEFT", btn, "LEFT", 4, 0)
        txt:SetPoint("RIGHT", btn, "RIGHT", -4, 0)
        txt:SetJustifyH("CENTER")
        txt:SetWordWrap(false)
        txt:SetText(def.text)
        btn.Text = txt

        local ind = btn:CreateTexture(nil, "OVERLAY")
        ind:SetHeight(2)
        ind:SetPoint("BOTTOMLEFT", btn, "BOTTOMLEFT", 2, 1)
        ind:SetPoint("BOTTOMRIGHT", btn, "BOTTOMRIGHT", -2, 1)
        ind:SetColorTexture(1.0, 0.82, 0.0, 1.0)
        ind:Hide()
        btn.Indicator = ind

        btn:SetScript("OnClick", function() SelectTab(def.id) end)
        tabButtons[def.id] = btn
    end

    local col1X = 6
    local col2X = 300

    ----------------------------------------------------------------------------
    -- TAB 1: Core & Profile
    ----------------------------------------------------------------------------
    local page1 = CreateTabPage(1)
    CreateSectionHeader(page1, GetText("HEADER_TALENT_PROFILES", "Talent Loadouts & Profiles"), col1X, -6)

    local cbLoadout = CreateFrame("CheckButton", "MM_Opt_Loadout", page1, "UICheckButtonTemplate")
    cbLoadout:SetPoint("TOPLEFT", page1, "TOPLEFT", col1X, -30)
    SetupCheckbox(cbLoadout, GetText("AUTO_LOADOUT_PROFILES", "Automatic Talent Loadout Switch"), GetText("AUTO_LOADOUT_PROFILES_DESC", "Automatically switches saved macro sets when changing talents or specialization."), GetSafeSetting("loadoutProfilesEnabled", true), function(self)
        SetSafeSetting("loadoutProfilesEnabled", self:GetChecked())
    end)

    local cbProfiles = CreateFrame("CheckButton", "MM_Opt_Profiles", page1, "UICheckButtonTemplate")
    cbProfiles:SetPoint("TOPLEFT", cbLoadout, "BOTTOMLEFT", 0, -4)
    SetupCheckbox(cbProfiles, GetText("SPEC_PROFILES_ENABLE", "Manage Specialization Profiles"), GetText("SPEC_PROFILES_ENABLE_DESC", "Maintains separate macro lists for each class specialization."), GetSafeSetting("profilesEnabled", false), function(self)
        SetSafeSetting("profilesEnabled", self:GetChecked())
    end)

    CreateSectionHeader(page1, GetText("HEADER_ACTION_BARS", "Action Bar Behavior"), col2X, -6)

    local cbHideText = CreateFrame("CheckButton", "MM_Opt_HideText", page1, "UICheckButtonTemplate")
    cbHideText:SetPoint("TOPLEFT", page1, "TOPLEFT", col2X, -30)
    SetupCheckbox(cbHideText, GetText("HIDE_MACRO_TEXT", "Hide Macro Names on Action Bars"), GetText("HIDE_MACRO_TEXT_DESC", "Removes white macro name text on action bars for a cleaner UI."), GetSafeSetting("hideActionText", false), function(self)
        SetSafeSetting("hideActionText", self:GetChecked())
        if MM.UpdateActionBarText then MM:UpdateActionBarText() end
    end)

    ----------------------------------------------------------------------------
    -- TAB 2: Studio & Syntax
    ----------------------------------------------------------------------------
    local page2 = CreateTabPage(2)
    CreateSectionHeader(page2, GetText("HEADER_STUDIO_EDITOR", "Macro Editor & Quick Start"), col1X, -6)

    local btnOpenStudio = CreateActionButton("MM_Opt_BtnStudio", page2, 240, 24, GetText("TOGGLE_WINDOW", "Open Macro Maker Studio"), GetText("TOGGLE_WINDOW_DESC", "Opens the interactive Macro Studio with live preview and condition builder."), function()
        MM:ToggleUI()
    end, false)
    btnOpenStudio:SetPoint("TOPLEFT", page2, "TOPLEFT", col1X, -30)

    local editorInfo = page2:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    editorInfo:SetPoint("TOPLEFT", btnOpenStudio, "BOTTOMLEFT", 0, -12)
    editorInfo:SetWidth(270)
    editorInfo:SetJustifyH("LEFT")
    editorInfo:SetText(GetText("STUDIO_EDITOR_DESC", "Macro Maker validates syntax (/cast, /use, [mod], [@cursor], [@mouseover]) in real-time and tracks the 255 character limit."))

    CreateSectionHeader(page2, GetText("HEADER_TEMPLATES", "Smart Templates & Snippets"), col2X, -6)

    local templatesInfo = page2:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    templatesInfo:SetPoint("TOPLEFT", page2, "TOPLEFT", col2X, -30)
    templatesInfo:SetWidth(270)
    templatesInfo:SetJustifyH("LEFT")
    templatesInfo:SetText(GetText("TEMPLATES_INFO_DESC", "Includes ready-to-use templates for:\n• Mouseover spells (@cursor, @mouseover)\n• Focus interrupts (@focus)\n• Castsequence rotations (/castsequence)\n• Trinket & Burst combos"))

    ----------------------------------------------------------------------------
    -- TAB 3: Audio & Töne
    ----------------------------------------------------------------------------
    local page3 = CreateTabPage(3)
    CreateSectionHeader(page3, GetText("HEADER_SOUND_CUES", "Audio Feedback"), col1X, -6)

    local cbSound = CreateFrame("CheckButton", "MM_Opt_Sound", page3, "UICheckButtonTemplate")
    cbSound:SetPoint("TOPLEFT", page3, "TOPLEFT", col1X, -30)
    SetupCheckbox(cbSound, GetText("ENABLE_SOUND_FEEDBACK", "Enable Sound Effects"), GetText("ENABLE_SOUND_DESC", "Plays subtle audio cues when saving, copying, deleting, or on syntax errors."), GetSafeSetting("soundFeedback", true), function(self)
        SetSafeSetting("soundFeedback", self:GetChecked())
    end)

    -- Test buttons
    local btnTestSave = CreateActionButton("MM_Opt_BtnTestSave", page3, 240, 24, GetText("TEST_SOUND_SAVE", "Test: Save"), GetText("TEST_SOUND_SAVE_DESC", "Plays confirmation chime when saving a macro."), function()
        MM:PlaySoundCue("save")
    end, false)
    btnTestSave:SetPoint("TOPLEFT", cbSound, "BOTTOMLEFT", 4, -10)

    local btnTestCopy = CreateActionButton("MM_Opt_BtnTestCopy", page3, 240, 24, GetText("TEST_SOUND_COPY", "Test: Copy / Duplicate"), GetText("TEST_SOUND_COPY_DESC", "Plays page-turning sound when duplicating."), function()
        MM:PlaySoundCue("copy")
    end, false)
    btnTestCopy:SetPoint("TOPLEFT", btnTestSave, "BOTTOMLEFT", 0, -6)

    local btnTestDelete = CreateActionButton("MM_Opt_BtnTestDelete", page3, 240, 24, GetText("TEST_SOUND_DELETE", "Test: Delete"), GetText("TEST_SOUND_DELETE_DESC", "Plays delete sound effect."), function()
        MM:PlaySoundCue("delete")
    end, false)
    btnTestDelete:SetPoint("TOPLEFT", btnTestCopy, "BOTTOMLEFT", 0, -6)

    local btnTestError = CreateActionButton("MM_Opt_BtnTestError", page3, 240, 24, GetText("TEST_SOUND_ERROR", "Test: Syntax Warning"), GetText("TEST_SOUND_ERROR_DESC", "Plays error chime on invalid macro commands."), function()
        MM:PlaySoundCue("error")
    end, false)
    btnTestError:SetPoint("TOPLEFT", btnTestDelete, "BOTTOMLEFT", 0, -6)

    ----------------------------------------------------------------------------
    -- TAB 4: Backup & Vorlagen
    ----------------------------------------------------------------------------
    local page4 = CreateTabPage(4)
    CreateSectionHeader(page4, GetText("HEADER_BACKUP_EXPORT", "Data Backup & Sharing"), col1X, -6)

    local btnExportBackup = CreateActionButton("MM_Opt_BtnExportBackup", page4, 240, 24, GetText("EXPORT_BACKUP", "Export Complete Backup"), GetText("EXPORT_BACKUP_DESC", "Creates a compressed string with all macros and profiles for external backup."), function()
        if MM.ShowImportExportWindow and MM.EncodeCompressedPayload then
            local encoded = MM:EncodeCompressedPayload(MM.db, "Backup")
            MM:ShowImportExportWindow("export", encoded)
        end
    end, false)
    btnExportBackup:SetPoint("TOPLEFT", page4, "TOPLEFT", col1X, -30)

    local btnRestoreBackup = CreateActionButton("MM_Opt_BtnRestoreBackup", page4, 240, 24, GetText("RESTORE_BACKUP", "Restore Backup"), GetText("RESTORE_BACKUP_DESC", "Restores macros and profiles from a previously exported backup string."), function()
        if MM.ShowImportExportWindow then
            MM:ShowImportExportWindow("import_backup", "")
        end
    end, false)
    btnRestoreBackup:SetPoint("TOPLEFT", btnExportBackup, "BOTTOMLEFT", 0, -6)

    CreateSectionHeader(page4, GetText("HEADER_LIBRARY_SHARE", "Personal Library"), col2X, -6)

    local btnExportLib = CreateActionButton("MM_Opt_BtnExportLib", page4, 240, 24, GetText("EXPORT_LIB", "Export Library"), GetText("EXPORT_LIB_DESC", "Shares personal library macros with other players via share string."), function()
        if MM.ExportLibrary and MM.ShowImportExportWindow then
            local data = MM:ExportLibrary()
            MM:ShowImportExportWindow("export", data)
        end
    end, false)
    btnExportLib:SetPoint("TOPLEFT", page4, "TOPLEFT", col2X, -30)

    ----------------------------------------------------------------------------
    -- TAB 5: Anzeige & Leisten
    ----------------------------------------------------------------------------
    local page5 = CreateTabPage(5)
    CreateSectionHeader(page5, GetText("HEADER_MINIMAP_DISPLAY", "Minimap & Windows"), col1X, -6)

    local cbMinimap = CreateFrame("CheckButton", "MM_Opt_Minimap", page5, "UICheckButtonTemplate")
    cbMinimap:SetPoint("TOPLEFT", page5, "TOPLEFT", col1X, -30)
    SetupCheckbox(cbMinimap, GetText("SHOW_MINIMAP_BUTTON", "Show Minimap Button"), GetText("SHOW_MINIMAP_DESC", "Shows or hides the Macro Maker icon around the minimap."), not (MM.db and MM.db.settings and MM.db.settings.minimap and MM.db.settings.minimap.hide), function(self)
        if MM.db and MM.db.settings then
            MM.db.settings.minimap = MM.db.settings.minimap or {}
            MM.db.settings.minimap.hide = not self:GetChecked()
            MM:UpdateMinimapState()
        end
    end)

    ----------------------------------------------------------------------------
    -- TAB 6: Hilfe & Info
    ----------------------------------------------------------------------------
    local page6 = CreateTabPage(6)
    CreateSectionHeader(page6, GetText("HEADER_HELP_INFO", "Chat Commands & Quick Guide"), col1X, -6)

    local guideBox = CreateFrame("Frame", nil, page6, "BackdropTemplate")
    guideBox:SetSize(568, 120)
    guideBox:SetPoint("TOPLEFT", page6, "TOPLEFT", col1X, -30)
    guideBox:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 10,
        insets = { left = 3, right = 3, top = 3, bottom = 3 }
    })
    guideBox:SetBackdropColor(0.04, 0.04, 0.05, 0.9)
    guideBox:SetBackdropBorderColor(0.22, 0.22, 0.26, 1.0)

    local guideTitle = guideBox:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    guideTitle:SetPoint("TOPLEFT", 12, -8)
    guideTitle:SetText(GetText("GUIDE_TITLE", "|cffffd100Macro Maker - Quick Commands|r"))

    local guideText = guideBox:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    guideText:SetPoint("TOPLEFT", guideTitle, "BOTTOMLEFT", 0, -4)
    guideText:SetPoint("BOTTOMRIGHT", -12, 6)
    guideText:SetJustifyH("LEFT")
    guideText:SetJustifyV("TOP")
    guideText:SetText(GetText("HELP_GUIDE_BODY", "|cffffd100/mm|r  -  Open Macro Maker Studio\n|cffffd100/mm new|r  -  Create new empty macro in visual builder\n|cffffd100/mm backup|r  -  Create immediate full backup of all macros\n|cffffd100/mm options|r  -  Open these AddOn settings\n|cffffd100Tip:|r In the editor, use the template wizard for 1-click mouseover and focus macros!"))

    local creditsBox = CreateFrame("Frame", nil, page6, "BackdropTemplate")
    creditsBox:SetSize(568, 70)
    creditsBox:SetPoint("TOPLEFT", guideBox, "BOTTOMLEFT", 0, -12)
    creditsBox:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 10,
        insets = { left = 3, right = 3, top = 3, bottom = 3 }
    })
    creditsBox:SetBackdropColor(0.05, 0.06, 0.09, 0.95)
    creditsBox:SetBackdropBorderColor(0.78, 0.61, 0.43, 0.8)

    local creditsTitle = creditsBox:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    creditsTitle:SetPoint("TOPLEFT", 12, -8)
    creditsTitle:SetText("|cffffd100" .. GetText("CREDITS_TITLE", "Author & Suite Acknowledgements") .. "|r")

    local creditsText = creditsBox:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    creditsText:SetPoint("TOPLEFT", creditsTitle, "BOTTOMLEFT", 0, -4)
    creditsText:SetPoint("BOTTOMRIGHT", -12, 6)
    creditsText:SetJustifyH("LEFT")
    creditsText:SetJustifyV("TOP")
    creditsText:SetText(string.format(GetText("CREDITS_DESC", "Macro Maker v%s • Author: Satyros • Ultima Suite (WoW Midnight 12.1.0)\nCrafted for clean, unrivaled macro optimization on every character.\n\nSpecial thanks & inspiration to Macro Toolkit and the macro crafting community."), (C_AddOns and C_AddOns.GetAddOnMetadata and C_AddOns.GetAddOnMetadata("MacroMaker", "Version")) or MM.version or "3.5.0"))

    -- Reset to Default Settings Button
    local btnReset = CreateActionButton("MM_Opt_BtnReset", page6, 240, 24, GetText("RESET_DEFAULTS", "Reset to Default Settings"), GetText("RESET_DEFAULTS_DESC", "Resets all Macro Maker options to default values."), function()
        if MM.db and MM.db.settings then
            wipe(MM.db.settings)
            MM.db.settings = {
                minimap = { hide = false, minimapPos = 220 },
                hideActionText = false,
                profilesEnabled = false,
                soundFeedback = true,
                soundSave = "None",
                loadoutProfilesEnabled = true,
                editorFont = "Friz Quadrata TT",
                window = {},
            }
        end
        if panel.refresh then panel.refresh() end
        print(string.format("|cffffd100%s:|r %s", GetText("ADDON_TITLE", "Macro Maker"), GetText("SETTINGS_RESET_MSG", "Settings successfully reset to defaults.")))
    end, true)
    btnReset:SetPoint("TOPLEFT", creditsBox, "BOTTOMLEFT", 0, -14)

    ----------------------------------------------------------------------------
    -- Refresh & Handlers
    ----------------------------------------------------------------------------
    local function RefreshOptions()
        cbLoadout:SetChecked(GetSafeSetting("loadoutProfilesEnabled", true))
        cbProfiles:SetChecked(GetSafeSetting("profilesEnabled", false))
        cbHideText:SetChecked(GetSafeSetting("hideActionText", false))

        cbSound:SetChecked(GetSafeSetting("soundFeedback", true))

        cbMinimap:SetChecked(not (MM.db and MM.db.settings and MM.db.settings.minimap and MM.db.settings.minimap.hide))
    end

    panel.refresh = RefreshOptions
    panel.default = function()
        if MM.db and MM.db.settings then
            wipe(MM.db.settings)
            MM.db.settings = {
                minimap = { hide = false, minimapPos = 220 },
                hideActionText = false,
                profilesEnabled = false,
                soundFeedback = true,
                soundSave = "None",
                loadoutProfilesEnabled = true,
                editorFont = "Friz Quadrata TT",
                window = {},
            }
        end
        RefreshOptions()
    end
    panel:SetScript("OnShow", function()
        RefreshOptions()
        SelectTab(1)
    end)

    SelectTab(1)

    -- Register into Blizzard Settings Canvas Layout
    if Settings and Settings.RegisterCanvasLayoutCategory then
        local category = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
        Settings.RegisterAddOnCategory(category)
        MM.settingsCategory = category
    elseif InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(panel)
    end
end
