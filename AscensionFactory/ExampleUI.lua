-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: UI.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local addonName, addonTable = ...
local AscensionFactory = LibStub:GetLibrary("AscensionFactory")
if not AscensionFactory then return end

-------------------------------------------------------------------------------
-- CONTEXT INITIALIZATION
-------------------------------------------------------------------------------

local uiContext = AscensionFactory:CreateContext()
local styles = uiContext.styles

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
        if AscensionFactory.UX then
            AscensionFactory.UX:makeMovable(pFrame)
            AscensionFactory.UX:makeClosableWithEscape(pFrame)
        end
    end

    pFrame:SetBackdrop({
        bgFile = styles.textures.background,
        edgeFile = styles.textures.edge,
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    local bg = styles.colors.background
    pFrame:SetBackdropColor(bg[1], bg[2], bg[3], 0.25)
    pFrame:SetBackdropBorderColor(unpack(styles.colors.surfaceLight))

    -- Header
    uiContext:createHeader({ parent = pFrame, text = "Global Palette", yOffset = -15 })

    local py = -45
    
    local colorKeys = {}
    if styles and styles.colors then
        for key in pairs(styles.colors) do
            table.insert(colorKeys, key)
        end
        table.sort(colorKeys)
    end

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
    local frame = uiContext:createMainFrame({
        name = "AscensionSuitMockFrame",
        width = 1000,
        height = 500,
    })
    local header, nextY = uiContext:createHeader({
        parent = frame,
        text = "Ascension Factory",
        xOffset = 10,
        yOffset = -10,
        fontSize = 34,
        spaceBelow = 4,
    })

    -- Attach Tabbed Interface (Sidebar)
    uiContext:createTabbedInterface({
        parent = frame,
        startY = nextY,
        initialIndex = 1,
    })

    -- Sidebar Palette
    CreatePaletteFrame(frame)
    frame:Show()
end

-------------------------------------------------------------------------------
-- SLASH COMMANDS
-------------------------------------------------------------------------------

SLASH_MOCKUI1 = "/afui"
SlashCmdList["MOCKUI"] = function()
    if AscensionSuitMockFrame and AscensionSuitMockFrame:IsShown() then
        AscensionSuitMockFrame:Hide()
    else
        CreateMockUI()
    end
end

-- /palette: Opens the standalone color palette
SLASH_ASPALETTE1 = "/afp"
SlashCmdList["ASPALETTE"] = function()
    if AscensionSuitPaletteFrame and not AscensionSuitPaletteFrame:GetParent() then
        AscensionSuitPaletteFrame:SetShown(not AscensionSuitPaletteFrame:IsShown())
    else
        if AscensionSuitPaletteFrame then AscensionSuitPaletteFrame:Hide() end
        local p = CreatePaletteFrame(nil)
        p:Show()
    end
end
