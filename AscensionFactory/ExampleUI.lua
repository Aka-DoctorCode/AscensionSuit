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
    local paletteFrame = uiContext:AcquireElement("Frame", parent or UIParent, {
        width = 200,
        height = 580
    })
    _G["AscensionSuitPaletteFrame"] = paletteFrame
    paletteFrame:SetFrameStrata("TOOLTIP")
    
    if parent then
        -- Integrated: Anchor to the main frame
        paletteFrame:SetPoint("TOPRIGHT", parent, "TOPLEFT", -5, 0)
    else
        -- Standalone: Anchor to center and enable UX behaviors
        paletteFrame:SetPoint("CENTER")
        if AscensionFactory.UX then
            AscensionFactory.UX:makeMovable(paletteFrame)
            AscensionFactory.UX:makeClosableWithEscape(paletteFrame)
        end
    end

    paletteFrame:SetBackdrop({
        bgFile = styles.textures.background,
        edgeFile = styles.textures.edge,
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    local backgroundColor = styles.colors.background
    paletteFrame:SetBackdropColor(backgroundColor[1], backgroundColor[2], backgroundColor[3], 0.25)
    paletteFrame:SetBackdropBorderColor(unpack(styles.colors.surfaceLight))

    -- Header
    uiContext:createHeader({ parent = paletteFrame, text = "Global Palette", yOffset = -15 })

    local currentY = -45
    
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
            local colorSwatch = uiContext:AcquireElement("Frame", paletteFrame, {
                anchorPoint = "TOPLEFT",
                xOffset = 10,
                yOffset = currentY,
                width = 20,
                height = 20
            })
            
            -- Visual Swatch
            local swatchTexture = uiContext:AcquireElement("Texture", colorSwatch, { drawLayer = "OVERLAY" })
            swatchTexture:SetAllPoints()
            swatchTexture:SetColorTexture(1, 1, 1, 1)
            swatchTexture:SetVertexColor(unpack(color))

            local colorLabel = uiContext:AcquireElement("FontString", paletteFrame, {
                anchorPoint = "LEFT",
                relativeTo = colorSwatch,
                relativePoint = "RIGHT",
                xOffset = 8,
                yOffset = 0,
                text = key
            })
            colorLabel:SetFontObject("GameFontNormalLarge")
            currentY = currentY - 28
        end
    end
    
    paletteFrame:SetHeight(math.abs(currentY) + 15)
    return paletteFrame
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
    local tabbedInterface = uiContext:createTabbedInterface({
        parent = frame,
        startY = nextY,
        initialIndex = 1,
        tabs = { "Intro", "Header", "Buttons", "Combat", "Advanced" }
    })

    -- Intro Panel
    local introPanel = tabbedInterface.panels[1]
        local _, nextY = uiContext:createHeader({
            parent = introPanel,
            text = "Welcome to the Ascension Factory UI",
            xOffset = 10,
            yOffset = -10
        })
        _, nextY = uiContext:createParagraph({
            parent = introPanel,
            text = "The main window enclosing this interface is an example of the Frame builder from 01Frame.lua. The sidebar navigation on the left, along with the dynamic panels you are currently viewing, demonstrates the TabbedInterface builder from 03TabbedInterface.lua.",
            xOffset = 10,
            yOffset = nextY - 10,
            fontSize = 24,
        })

        _, nextY = uiContext:createParagraph({
            parent = introPanel,
            text = "Below is an example of the TwoColumnInterface component, which splits the layout evenly.",
            xOffset = 10,
            yOffset = nextY - 10,
            fontSize = 16
        })

        local leftColumn, rightColumn = uiContext:createTwoColumns({
            parent = introPanel,
            yOffset = nextY - 20,
            height = 100,
            backgroundColor = styles.colors.surfaceLight,
            name = "MockUITwoColumn"
        })

        uiContext:createParagraph({
            parent = leftColumn,
            text = "This is the left column. It takes up half the width minus a small gap.",
            xOffset = 10,
            yOffset = -10,
            fontSize = 16
        })

        uiContext:createParagraph({
        parent = rightColumn,
        text = "This is the right column. It sits exactly 10 pixels away from the left column.",
        xOffset = 10,
        yOffset = -10,
        fontSize = 16
    })

    -- Header Panel
    local headerPanel = tabbedInterface.panels[2]
        local _, nextY = uiContext:createHeader({
            parent = headerPanel,
            text = "Header Text: Used for section titles.",
            xOffset = 10,
            yOffset = -10
        })
        _, nextY = uiContext:createLabel({
            parent = headerPanel,
            text = "Label Text: Used for standard options.",
            xOffset = 10,
            yOffset = nextY - 10
        })
        _, nextY = uiContext:createParagraph({
            parent = headerPanel,
            text = "Paragraph Text: Used for long descriptions or explanations like this one. It handles wrapping and smaller font size.",
            xOffset = 10,
            yOffset = nextY - 10,
            fontSize = 16
        })

    -- Buttons Panel
    local buttonPanel = tabbedInterface.panels[3]
        local _, buttonNextY = uiContext:createHeader({
            parent = buttonPanel,
            text = "Button Component",
            xOffset = 10,
            yOffset = -10
        })
        local buttonLeftColumn, buttonRightColumn = uiContext:createTwoColumns({
            parent = buttonPanel,
            yOffset = buttonNextY - 10,
            name = "MockUIButtonTwoColumn"
        })

        local exampleButton = uiContext:createButton({
            parent = buttonLeftColumn,
            name = "MockUIExampleBtn",
            text = "Enabled Button",
            width = 180,
            height = 60,
            xOffset = 30,
            yOffset = 0
        })

        local disabledButton = uiContext:createButton({
            parent = buttonLeftColumn,
            name = "MockUIDisabledBtn",
            text = "Disabled Button",
            width = 180,
            height = 60,
            xOffset = 30,
            yOffset = -70
        })
        disabledButton:Disable()

        local toggleLabel = uiContext:createLabel({
            parent = buttonLeftColumn,
            text = "Toggle Button",
            xOffset = 30,
            yOffset = -145
        })

        local exampleToggle = uiContext:createToggle({
            parent = buttonLeftColumn,
            name = "MockUIExampleToggle",
            width = 50,
            height = 24,
            xOffset = 30,
            yOffset = -175,
            getter = function() return false end,
            setter = function(state) end
        })

        local closeLabel = uiContext:createLabel({
            parent = buttonRightColumn,
            text = "Close",
            xOffset = 30,
            yOffset = 30
        })

        local iconClose = uiContext:createIconButton({
            parent = buttonRightColumn,
            name = "MockUIIconClose",
            iconType = "close",
            size = 30,
            xOffset = 30,
            yOffset = 0
        })

        local minimizeLabel = uiContext:createLabel({
            parent = buttonRightColumn,
            text = "Minimize",
            xOffset = 30,
            yOffset = -50
        })

        local iconMinimize = uiContext:createIconButton({
            parent = buttonRightColumn,
            name = "MockUIIconMinimize",
            iconType = "minimize",
            size = 30,
            xOffset = 30,
            yOffset = -80
        })

        local maximizeLabel = uiContext:createLabel({
            parent = buttonRightColumn,
            text = "Maximize",
            xOffset = 30,
            yOffset = -130
        })

        local iconMaximize = uiContext:createIconButton({
            parent = buttonRightColumn,
            name = "MockUIIconMaximize",
            iconType = "maximize",
            size = 30,
            xOffset = 30,
            yOffset = -160
        })

        local plusLabel = uiContext:createLabel({
            parent = buttonRightColumn,
            text = "Plus",
            xOffset = 130,
            yOffset = 30
        })

        local iconPlus = uiContext:createIconButton({
            parent = buttonRightColumn,
            name = "MockUIIconPlus",
            iconType = "plus",
            size = 30,
            xOffset = 130,
            yOffset = 0
        })

        local minusLabel = uiContext:createLabel({
            parent = buttonRightColumn,
            text = "Minus",
            xOffset = 130,
            yOffset = -50
        })

        local iconMinus = uiContext:createIconButton({
            parent = buttonRightColumn,
            name = "MockUIIconMinus",
            iconType = "minus",
            size = 30,
            xOffset = 130,
            yOffset = -80
        })

        local arrowLabel = uiContext:createLabel({
            parent = buttonRightColumn,
            text = "Arrow",
            xOffset = 130,
            yOffset = -130
        })

        local iconArrowDown = uiContext:createIconButton({
            parent = buttonRightColumn,
            name = "MockUIIconArrowDown",
            iconType = "arrowdown",
            size = 30,
            xOffset = 130,
            yOffset = -160
        })

    -- Combat Panel
    local combatLayout = uiContext:createLayoutModel(tabbedInterface.panels[4], -10)
    combatLayout:header("combatHeader", "Combat Settings")
    combatLayout:label("combatDesc", "Adjust combat-related behaviors.", 15)

    -- Advanced Panel
    local advancedLayout = uiContext:createLayoutModel(tabbedInterface.panels[5], -10)
    advancedLayout:header("advancedHeader", "Advanced Settings")
    advancedLayout:label("advancedDesc", "Danger zone settings.", 15)

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
