-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: UI.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local addonName, addonTable = ...
local AscensionUI = LibStub:GetLibrary("AscensionSuit-UI")
if not AscensionUI then return end

-------------------------------------------------------------------------------
-- CONTEXT INITIALIZATION
-------------------------------------------------------------------------------

local ctx = AscensionUI:CreateContext()
local styles = ctx.styles

-------------------------------------------------------------------------------
-- PALETTE MENU LOGIC
-------------------------------------------------------------------------------
--- Creates a visual palette viewer showing all defined theme colors.
local function CreatePaletteFrame(parent)
    local pFrame = CreateFrame("Frame", "AscensionSuitPaletteFrame", parent or UIParent, "BackdropTemplate")
    pFrame:SetSize(200, 580)
    pFrame:SetFrameStrata("TOOLTIP")
    
    if parent then
        -- Integrated: Anchor to the main frame
        pFrame:SetPoint("TOPRIGHT", parent, "TOPLEFT", -5, 0)
    else
        -- Standalone: Anchor to center and enable UX behaviors
        pFrame:SetPoint("CENTER")
        if AscensionUI.UX then
            AscensionUI.UX:makeMovable(pFrame)
            AscensionUI.UX:makeClosableWithEscape(pFrame)
        end
    end

    pFrame:SetBackdrop({
        bgFile = styles.files.bgFile,
        edgeFile = styles.files.edgeFile,
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    local bg = styles.colors.mainBackground
    pFrame:SetBackdropColor(bg[1], bg[2], bg[3], 0.25)
    pFrame:SetBackdropBorderColor(unpack(styles.colors.surfaceLight))

    -- Header
    ctx:createHeader({ parent = pFrame, text = "Global Palette", yOffset = -15 })

    -- Add Close Button
    local closeBtn = ctx:createCloseButton(pFrame, function() pFrame:Hide() end)
    closeBtn:SetPoint("TOPRIGHT", 5, 5)

    local py = -45
    
    local colorKeys = {
        "mainBackground",
        "surfaceDark",
        "surfaceLight",
        "surfaceHover",
        "primary",
        "primaryAlpha",
        "sidebarAccent",
        "sidebarActive",
        "sidebarHover",
        "redDetail",
        "blackDetail",
        "gold",
        "textLight",
    }

    for _, key in ipairs(colorKeys) do
        local color = styles.colors[key]
        if color then
            local sw = CreateFrame("Frame", nil, pFrame)
            sw:SetSize(20, 20)
            sw:SetPoint("TOPLEFT", 10, py)
            
            -- Visual Swatch
            local tex = sw:CreateTexture(nil, "OVERLAY")
            tex:SetAllPoints()
            tex:SetColorTexture(1, 1, 1, 1)
            tex:SetVertexColor(unpack(color))

            local lbl = pFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
            lbl:SetPoint("LEFT", sw, "RIGHT", 8, 0)
            lbl:SetText(key)
            py = py - 28
        end
    end
    
    pFrame:SetHeight(math.abs(py) + 15)
    return pFrame
end

-------------------------------------------------------------------------------
-- MAIN GALLERY CREATION
-------------------------------------------------------------------------------
--- Orchestrates the creation of the entire UI component gallery.
local function CreateMockUI()
    local frame = ctx:createMainFrame({
        width = 850,
        height = 500,
    })

    -- Sidebar Palette
    CreatePaletteFrame(frame)
    frame:Show()
end

-------------------------------------------------------------------------------
-- SLASH COMMANDS
-------------------------------------------------------------------------------

SLASH_MOCKUI1 = "/mockui"
SlashCmdList["MOCKUI"] = function()
    if AscensionSuitMockFrame and AscensionSuitMockFrame:IsShown() then
        AscensionSuitMockFrame:Hide()
    else
        CreateMockUI()
    end
end

-- /palette: Opens the standalone color palette
SLASH_ASPALETTE1 = "/palette"
SlashCmdList["ASPALETTE"] = function()
    if AscensionSuitPaletteFrame and not AscensionSuitPaletteFrame:GetParent() then
        AscensionSuitPaletteFrame:SetShown(not AscensionSuitPaletteFrame:IsShown())
    else
        if AscensionSuitPaletteFrame then AscensionSuitPaletteFrame:Hide() end
        local p = CreatePaletteFrame(nil)
        p:Show()
    end
end
