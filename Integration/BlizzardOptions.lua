-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: BlizzardOptions.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-- -------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- -------------------------------------------------------------------------------
local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Integration = lib.Integration or {}
lib.Integration = Integration

-- -------------------------------------------------------------------------------
-- 2. SUITE METADATA & HELPERS
-- -------------------------------------------------------------------------------
local CREATOR_LOGO = "Interface\\AddOns\\AscensionSuit\\Media\\AkaDoctorCode.jpeg"
local LOGO_BASE = "Interface\\AddOns\\AscensionSuit\\Media\\ascension-logos\\"

local LOGO_MAP = {
    AscensionAccountSync      = LOGO_BASE .. "01-account-sync.png",
    AscensionCastBar          = LOGO_BASE .. "02-castbar.png",
    AscensionFactory          = LOGO_BASE .. "03-factory.png",
    AscensionKeybindSync      = LOGO_BASE .. "04-keybind-sync.png",
    AscensionMasque           = LOGO_BASE .. "05-masque.png",
    AscensionNotes            = LOGO_BASE .. "06-notes.png",
    AscensionProfessionHelper = LOGO_BASE .. "07-profession-helper.png",
    AscensionProgressDataBars = LOGO_BASE .. "08-progress-data-bars.png",
    AscensionQoL              = LOGO_BASE .. "09-qol.png",
    AscensionQuestTracker     = LOGO_BASE .. "10-quest-tracker.png",
    AscensionSuit             = LOGO_BASE .. "11-suit.png",
    AscensionTalentManager    = LOGO_BASE .. "12-talent-manager.png",
    AscensionTooltip          = LOGO_BASE .. "13-tooltip.png",
    AscensionSound            = LOGO_BASE .. "14-sound.png",
    AscensionMountManager     = LOGO_BASE .. "15-mount-manager.png",
    AscensionHearthstone      = LOGO_BASE .. "16-hearthstone.png",
    AscensionFPS              = LOGO_BASE .. "17-fps.png",
    AscensionAFK              = LOGO_BASE .. "18-afk.png",
}

local SUITE_ADDONS = {
    "AscensionAccountSync",
    "AscensionCastBar",
    "AscensionKeybindSync",
    "AscensionMasque",
    "AscensionNotes",
    "AscensionProfessionHelper",
    "AscensionProgressDataBars",
    "AscensionQoL",
    "AscensionQuestTracker",
    "AscensionSuit",
    "AscensionTalentManager",
    "AscensionTooltip",
}

local QOL_MODULES = {
    "AscensionAFK",
    "AscensionFPS",
    "AscensionHearthstone",
    "AscensionMountManager",
    "AscensionSound",
}

local function stripAscensionPrefix(name)
    if type(name) ~= "string" then return "" end
    local stripped = name:gsub("^Ascension%s*", "")
    return stripped ~= "" and stripped or name
end

local function isAddOnInstalled(name)
    if _G.C_AddOns and type(_G.C_AddOns.DoesAddOnExist) == "function" then
        return _G.C_AddOns.DoesAddOnExist(name)
    elseif type(_G.GetAddOnInfo) == "function" then
        local addonName = _G.GetAddOnInfo(name)
        return addonName ~= nil
    end
    return false
end

local function getAddOnIcon(name)
    if LOGO_MAP[name] then
        return LOGO_MAP[name]
    end
    return CREATOR_LOGO
end

local function isQoLModuleActive(moduleName)
    local db = _G.AscensionQoLDB
    if type(db) ~= "table" then return false end

    local profileKey
    if type(db.profileKeys) == "table" and type(_G.UnitName) == "function" and type(_G.GetRealmName) == "function" then
        local charKey = _G.UnitName("player") .. " - " .. _G.GetRealmName()
        profileKey = db.profileKeys[charKey]
    end
    profileKey = profileKey or "Default"

    local profile = type(db.profiles) == "table" and db.profiles[profileKey]
    if type(profile) == "table" and type(profile.modules) == "table" then
        if profile.modules[moduleName] ~= nil then
            return profile.modules[moduleName] and true or false
        end
    end

    return (moduleName == "AscensionFPS" or moduleName == "AscensionAFK")
end

local function scaleFontSize(fontString, multiplier)
    local fontPath, fontSize, fontFlags = fontString:GetFont()
    if fontPath and fontSize then
        fontString:SetFont(fontPath, fontSize * multiplier, fontFlags)
    end
end

local function getFactoryStyles()
    local factoryLib = LibStub:GetLibrary("AscensionFactory", true)
    if factoryLib then
        local uiContext = factoryLib.Context or (type(factoryLib.createContext) == "function" and factoryLib:createContext())
        local styles = (uiContext and uiContext.styles) or factoryLib.defaultStyles
        if styles then
            return styles
        end
    end
    return lib.DefaultStyles
end

local function ensureParentCategory()
    if Integration.suiteCategory or Integration.suitePanel then
        return Integration.suiteCategory, Integration.suitePanel
    end

    local suitePanel = CreateFrame("Frame", "AscensionSuit_BlizParentPanel", _G.UIParent)
    suitePanel.name = "Ascension Suit"
    suitePanel:Hide()

    local styles = getFactoryStyles()
    local fontHeader = styles and styles.fonts and styles.fonts.header or "GameFontHighlightHuge"
    local fontDesc = styles and styles.fonts and styles.fonts.label or "GameFontNormal"
    local primary = styles and styles.colors and styles.colors.primary or { 1.0, 0.38, 0.0, 1.0 }
    local white = styles and styles.colors and styles.colors.white or { 0.92, 0.97, 1.0, 1.0 }

    local function buildOrRefreshSuiteUI()
        if not suitePanel.isInitialized then
            suitePanel.isInitialized = true

            local scrollFrame = CreateFrame("ScrollFrame", "AscensionSuit_BlizScrollFrame", suitePanel, "UIPanelScrollFrameTemplate")
            scrollFrame:SetPoint("TOPLEFT", suitePanel, "TOPLEFT", 0, 0)
            scrollFrame:SetPoint("BOTTOMRIGHT", suitePanel, "BOTTOMRIGHT", -26, 0)

            local content = CreateFrame("Frame", nil, scrollFrame)
            content:SetWidth(580)
            scrollFrame:SetScrollChild(content)

            -- Creator Logo (top-right, 150x150)
            local creatorLogo = content:CreateTexture(nil, "ARTWORK")
            creatorLogo:SetSize(150, 150)
            creatorLogo:SetPoint("TOPRIGHT", content, "TOPRIGHT", -16, -16)
            creatorLogo:SetTexture(CREATOR_LOGO, nil, nil, "TRILINEAR")

            local title = content:CreateFontString(nil, "OVERLAY", fontHeader)
            title:SetPoint("TOPLEFT", 16, -16)
            title:SetText("Ascension Suit")
            title:SetTextColor(unpack(primary))
            scaleFontSize(title, 1.5)

            local desc = content:CreateFontString(nil, "OVERLAY", fontDesc)
            desc:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -10)
            desc:SetPoint("RIGHT", creatorLogo, "LEFT", -12, 0)
            desc:SetJustifyH("LEFT")
            desc:SetTextColor(unpack(white))
            desc:SetText("Central hub for the Ascension Suit addons. Select an installed addon from the left menu to open its configuration.")

            local addonsHeader = content:CreateFontString(nil, "OVERLAY", fontHeader)
            addonsHeader:SetPoint("TOPLEFT", content, "TOPLEFT", 16, -180)
            addonsHeader:SetText("Suit Addons")
            addonsHeader:SetTextColor(unpack(primary))

            -- 3-column grid helper (150x150 icons)
            local cols = 3
            local cellWidth = 180
            local cellHeight = 190
            local colSpacing = 10
            local rowSpacing = 10

            local function createGrid(anchorTo, items)
                local rows = math.ceil(#items / cols)
                local grid = CreateFrame("Frame", nil, content)
                grid:SetPoint("TOPLEFT", anchorTo, "BOTTOMLEFT", 0, -10)
                grid:SetSize(cols * cellWidth + (cols - 1) * colSpacing, rows * cellHeight + (rows - 1) * rowSpacing)

                local cells = {}
                for i, name in ipairs(items) do
                    local col = (i - 1) % cols
                    local row = math.floor((i - 1) / cols)

                    local cell = CreateFrame("Frame", nil, grid)
                    cell:SetSize(cellWidth, cellHeight)
                    cell:SetPoint("TOPLEFT", grid, "TOPLEFT", col * (cellWidth + colSpacing), -row * (cellHeight + rowSpacing))

                    local icon = cell:CreateTexture(nil, "ARTWORK")
                    icon:SetSize(150, 150)
                    icon:SetPoint("TOP", cell, "TOP", 0, 0)
                    cell.icon = icon

                    local label = cell:CreateFontString(nil, "OVERLAY", fontDesc)
                    label:SetPoint("TOP", icon, "BOTTOM", 0, -4)
                    label:SetWidth(cellWidth)
                    label:SetJustifyH("CENTER")
                    label:SetTextColor(unpack(white))
                    label:SetText(stripAscensionPrefix(name))
                    cell.label = label

                    local status = cell:CreateFontString(nil, "OVERLAY", fontDesc)
                    status:SetPoint("TOP", label, "BOTTOM", 0, -2)
                    status:SetWidth(cellWidth)
                    status:SetJustifyH("CENTER")
                    cell.status = status

                    cells[i] = cell
                end
                return grid, cells
            end

            local addonsGrid, addonCells = createGrid(addonsHeader, SUITE_ADDONS)
            suitePanel.addonCells = addonCells

            local qolHeader = content:CreateFontString(nil, "OVERLAY", fontHeader)
            qolHeader:SetPoint("TOPLEFT", addonsGrid, "BOTTOMLEFT", 0, -20)
            qolHeader:SetText("QoL Modules")
            qolHeader:SetTextColor(unpack(primary))

            local qolGrid, qolCells = createGrid(qolHeader, QOL_MODULES)
            suitePanel.qolCells = qolCells

            local totalHeight = 180 + 28 + addonsGrid:GetHeight() + 36 + qolGrid:GetHeight() + 40
            content:SetHeight(totalHeight)
        end

        for i, name in ipairs(SUITE_ADDONS) do
            local cell = suitePanel.addonCells[i]
            if cell then
                local installed = isAddOnInstalled(name)
                cell.icon:SetTexture(getAddOnIcon(name), nil, nil, "TRILINEAR")
                cell.icon:SetDesaturated(not installed)
                if installed then
                    cell.status:SetText("|cff00ff00[Installed]|r")
                else
                    cell.status:SetText("|cff888888[Not Installed]|r")
                end
            end
        end

        local qolInstalled = isAddOnInstalled("AscensionQoL")
        for i, modName in ipairs(QOL_MODULES) do
            local cell = suitePanel.qolCells[i]
            if cell then
                local active = qolInstalled and isQoLModuleActive(modName)
                cell.icon:SetTexture(getAddOnIcon(modName), nil, nil, "TRILINEAR")
                cell.icon:SetDesaturated(not active)
                if not qolInstalled then
                    cell.status:SetText("|cff888888[Not Installed]|r")
                elseif active then
                    cell.status:SetText("|cff00ff00[Active]|r")
                else
                    cell.status:SetText("|cffff4444[Inactive]|r")
                end
            end
        end
    end

    suitePanel:HookScript("OnShow", buildOrRefreshSuiteUI)

    if _G.Settings and type(_G.Settings.RegisterCanvasLayoutCategory) == "function" then
        local category = _G.Settings.RegisterCanvasLayoutCategory(suitePanel, suitePanel.name)
        _G.Settings.RegisterAddOnCategory(category)
        Integration.suiteCategory = category
    elseif _G.InterfaceOptions_AddCategory then
        _G.InterfaceOptions_AddCategory(suitePanel)
    end

    Integration.suitePanel = suitePanel
    return Integration.suiteCategory, Integration.suitePanel
end

-- -------------------------------------------------------------------------------
-- 3. BLIZZARD OPTIONS INTEGRATION
-- -------------------------------------------------------------------------------
--- Registers a stub panel in the standard Blizzard Interface Options / Settings menu
--- under the shared "Ascension Suit" parent category.
--- @param addonName string Unique addon identifier.
--- @param displayName string|nil Human-readable title displayed in the Blizzard options tree.
--- @param openConfigCallback function Callback to open the addon's custom window.
--- @return table blizzardPanel The registered Blizzard frame.
function Integration:registerBlizzardPanel(addonName, displayName, openConfigCallback)
    if not addonName then return nil end

    local parentCategory = ensureParentCategory()

    local blizzardPanel = CreateFrame("Frame", addonName .. "_BlizPanel", _G.UIParent)
    blizzardPanel.name = stripAscensionPrefix(displayName or addonName)
    blizzardPanel:Hide()

    local styles = getFactoryStyles()
    local fontHeader = styles and styles.fonts and styles.fonts.header or "GameFontHighlightHuge"
    local fontDesc = styles and styles.fonts and styles.fonts.label or "GameFontNormal"
    local primaryColor = styles and styles.colors and styles.colors.primary or { 1.0, 0.38, 0.0, 1.0 }
    local whiteColor = styles and styles.colors and styles.colors.white or { 0.92, 0.97, 1.0, 1.0 }

    local function buildBlizUI()
        if blizzardPanel.isInitialized then return end
        blizzardPanel.isInitialized = true

        -- Section Title (2x size)
        local title = blizzardPanel:CreateFontString(nil, "OVERLAY", fontHeader)
        title:SetPoint("TOPLEFT", 16, -16)
        title:SetText(blizzardPanel.name)
        title:SetTextColor(unpack(primaryColor))
        scaleFontSize(title, 2)

        -- Redirect Message (2x size)
        local description = blizzardPanel:CreateFontString(nil, "OVERLAY", fontDesc)
        description:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -16)
        description:SetPoint("RIGHT", blizzardPanel, "RIGHT", -16, 0)
        description:SetJustifyH("LEFT")
        description:SetSpacing(6)
        description:SetTextColor(unpack(whiteColor))
        description:SetText("All configuration options have been moved to the addon's dedicated settings window.")
        scaleFontSize(description, 2)

        -- Action Button (Blizzard/Ace style, 240x36, centered text)
        local openMenuButton = CreateFrame("Button", addonName .. "BlizzardOptionsOpenButton", blizzardPanel, "UIPanelButtonTemplate")
        openMenuButton:SetSize(240, 36)
        openMenuButton:SetPoint("CENTER", blizzardPanel, "CENTER", 0, 0)
        openMenuButton:SetText("OPEN SETTINGS")
        local btnText = openMenuButton:GetFontString()
        if btnText then
            btnText:SetJustifyH("CENTER")
            btnText:SetJustifyV("MIDDLE")
        end

        openMenuButton:SetScript("OnClick", function()
            local settingsPanel = _G["SettingsPanel"]
            if settingsPanel and settingsPanel:IsShown() then
                if not (_G.InCombatLockdown and _G.InCombatLockdown()) and type(_G.HideUIPanel) == "function" then
                    _G.HideUIPanel(settingsPanel)
                end
            elseif _G["InterfaceOptionsFrame"] and _G["InterfaceOptionsFrame"]:IsShown() then
                _G["InterfaceOptionsFrame"]:Hide()
            end

            if openConfigCallback then
                openConfigCallback()
            end
        end)
    end

    blizzardPanel:HookScript("OnShow", buildBlizUI)

    -- Register as subcategory under "Ascension Suit"
    if _G.Settings and type(_G.Settings.RegisterCanvasLayoutSubcategory) == "function" and parentCategory then
        local category = _G.Settings.RegisterCanvasLayoutSubcategory(parentCategory, blizzardPanel, blizzardPanel.name)
        blizzardPanel.settingsCategory = category
    elseif _G.InterfaceOptions_AddCategory then
        blizzardPanel.parent = "Ascension Suit"
        _G.InterfaceOptions_AddCategory(blizzardPanel)
    end

    return blizzardPanel
end

Integration.RegisterBlizzardPanel = Integration.registerBlizzardPanel
