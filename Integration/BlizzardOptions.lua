-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: BlizzardOptions.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Integration = lib.Integration or {}
lib.Integration = Integration

function Integration:registerBlizzardPanel(addonName, displayName, openConfigCallback)
    local blizzardPanel = CreateFrame("Frame", addonName .. "_BlizPanel", UIParent)
    blizzardPanel.name = displayName or addonName
    blizzardPanel:Hide()

    local function buildBlizUI()
        if blizzardPanel.isInitialized then return end

        local styles = lib.DefaultStyles
        local fontHeader = styles and styles.fonts.header or "GameFontNormalHuge"
        local fontDesc = styles and styles.fonts.label or "GameFontNormal"
        local primaryColor = styles and styles.colors.primary or {1, 0.8, 0.2}

        local title = blizzardPanel:CreateFontString(nil, "OVERLAY", fontHeader)
        title:SetPoint("TOPLEFT", 16, -16)
        title:SetText(blizzardPanel.name)
        title:SetTextColor(unpack(primaryColor))

        local description = blizzardPanel:CreateFontString(nil, "OVERLAY", fontDesc)
        description:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -12)
        description:SetPoint("RIGHT", -16, 0)
        description:SetJustifyH("LEFT")
        description:SetText("All configuration options have been moved to a specialized high-performance menu for a better user experience.")

        local openMenuButton = CreateFrame("Button", nil, blizzardPanel, "UIPanelButtonTemplate")
        openMenuButton:SetSize(280, 45)
        openMenuButton:SetPoint("CENTER", blizzardPanel, "CENTER", 0, 0)
        openMenuButton:SetText("OPEN SETTINGS")

        openMenuButton:SetScript("OnClick", function()
            local settingsPanel = _G["SettingsPanel"]
            if settingsPanel and settingsPanel:IsShown() then
                if type(settingsPanel.Close) == "function" then
                    settingsPanel:Close()
                end
            end
            if openConfigCallback then openConfigCallback() end
        end)

        blizzardPanel.isInitialized = true
    end

    blizzardPanel:SetScript("OnShow", buildBlizUI)

    local settings = _G["Settings"]
    if settings and settings.RegisterCanvasLayoutCategory then
        local category = settings.RegisterCanvasLayoutCategory(blizzardPanel, blizzardPanel.name)
        if category then
            settings.RegisterAddOnCategory(category)
        end
    else
        local addCategory = _G["InterfaceOptions_AddCategory"]
        if addCategory then 
            addCategory(blizzardPanel) 
        end
    end
end
