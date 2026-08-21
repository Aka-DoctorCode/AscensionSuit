-------------------------------------------------------------------------------
-- Project: AscensionFactory
-- Author: Aka-DoctorCode
-- File: ExampleUI.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local addonName, addonTable = ...
local AscensionFactory = LibStub:GetLibrary("AscensionFactory")
if not AscensionFactory then return end

-------------------------------------------------------------------------------
-- CONTEXT INITIALIZATION
-------------------------------------------------------------------------------

local uiContext = AscensionFactory:createContext()
local styles = uiContext.styles

-------------------------------------------------------------------------------
-- PALETTE MENU LOGIC
-------------------------------------------------------------------------------
--- Creates a visual palette viewer showing all defined theme colors.
local function createPaletteFrame(parent)
    local paletteFrame = uiContext:acquireElement("Frame", parent or UIParent, {
        width = 200,
        height = 580
    })
    _G["AscensionFactoryPaletteFrame"] = paletteFrame
    paletteFrame.globalName = "AscensionFactoryPaletteFrame"
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
            local colorSwatch = uiContext:acquireElement("Frame", paletteFrame, {
                anchorPoint = "TOPLEFT",
                xOffset = 10,
                yOffset = currentY,
                width = 20,
                height = 20
            })
            
            -- Visual Swatch
            local swatchTexture = uiContext:acquireElement("Texture", colorSwatch, { drawLayer = "OVERLAY" })
            swatchTexture:SetAllPoints()
            swatchTexture:SetColorTexture(1, 1, 1, 1)
            swatchTexture:SetVertexColor(unpack(color))

            local colorLabel = uiContext:acquireElement("FontString", paletteFrame, {
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
local function createMockUi()
    local frame = uiContext:createMainFrame({
        name = "AscensionFactoryMockFrame",
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
        tabs = { "Framing", "Text", "Buttons", "Inputs", "Sliders", "Steppers" }
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
            text = "The main window enclosing this interface is an example of the Frame builder from 01Frame.lua. The sidebar navigation on the left, along with the dynamic panels you are currently viewing, demonstrates the TabbedInterface builder from 02TabbedInterface.lua.",
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
            height = 40,
            xOffset = 30,
            yOffset = 0
        })

        local disabledButton = uiContext:createButton({
            parent = buttonLeftColumn,
            name = "MockUIDisabledBtn",
            text = "Disabled Button",
            width = 180,
            height = 30,
            xOffset = 30,
            yOffset = -50
        })
        disabledButton:Disable()

        local toggleLabel = uiContext:createLabel({
            parent = buttonLeftColumn,
            text = "Toggle Button",
            xOffset = 30,
            yOffset = -95
        })

        local exampleToggle = uiContext:createToggle({
            parent = buttonLeftColumn,
            name = "MockUIExampleToggle",
            width = 50,
            height = 24,
            xOffset = 30,
            yOffset = -120,
            getter = function() return false end,
            setter = function(state) end
        })

        local checkboxLabel = uiContext:createLabel({
            parent = buttonLeftColumn,
            text = "Checkbox Component",
            xOffset = 30,
            yOffset = -160
        })

        local exampleCheckbox = uiContext:createCheckbox({
            parent = buttonLeftColumn,
            name = "MockUIExampleCheckbox",
            text = "Enable Auto Target",
            checked = true,
            xOffset = 30,
            yOffset = -190,
        })

        local disabledCheckbox = uiContext:createCheckbox({
            parent = buttonLeftColumn,
            name = "MockUIDisabledCheckbox",
            text = "Locked Feature",
            checked = true,
            xOffset = 30,
            yOffset = -220,
        })
        disabledCheckbox:Disable()

        local dialogButtonLabel = uiContext:createLabel({
            parent = buttonLeftColumn,
            text = "Dialog Actions",
            xOffset = 30,
            yOffset = -260
        })

        local exampleAccept = uiContext:createDialogButton({
            parent = buttonLeftColumn,
            name = "MockUIAcceptButton",
            variant = "accept",
            xOffset = 30,
            yOffset = -285
        })

        local exampleCancel = uiContext:createDialogButton({
            parent = buttonLeftColumn,
            name = "MockUICancelButton",
            variant = "cancel",
            xOffset = 130,
            yOffset = -285
        })

        local exampleNeutral = uiContext:createDialogButton({
            parent = buttonLeftColumn,
            name = "MockUINeutralButton",
            variant = "neutral",
            text = "Apply",
            xOffset = 30,
            yOffset = -320
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

        local plusLabel = uiContext:createLabel({
            parent = buttonRightColumn,
            text = "Plus",
            xOffset = 30,
            yOffset = -50
        })

        local iconPlus = uiContext:createIconButton({
            parent = buttonRightColumn,
            name = "MockUIIconPlus",
            iconType = "plus",
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

        local minimizeLabel = uiContext:createLabel({
            parent = buttonRightColumn,
            text = "Minimize",
            xOffset = 130,
            yOffset = 30
        })

        local iconMinimize = uiContext:createIconButton({
            parent = buttonRightColumn,
            name = "MockUIIconMinimize",
            iconType = "minimize",
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

    -- Inputs Panel
    local inputPanel = tabbedInterface.panels[4]
        local _, inputNextY = uiContext:createHeader({
            parent = inputPanel,
            text = "Input Field Component",
            xOffset = 10,
            yOffset = -10
        })

        local inputLeftColumn, inputRightColumn = uiContext:createTwoColumns({
            parent = inputPanel,
            yOffset = inputNextY - 10,
            name = "MockUIInputTwoColumn"
        })

        -- Left Column: Single-line and Special Inputs
        local singleLineTitle = uiContext:createLabel({
            parent = inputLeftColumn,
            text = "Single-Line Input (with placeholder)",
            xOffset = 20,
            yOffset = 10
        })

        local exampleInput = uiContext:createInputField({
            parent = inputLeftColumn,
            name = "MockUIStandardInput",
            width = 240,
            height = 26,
            placeholder = "Enter character name...",
            xOffset = 20,
            yOffset = -15
        })

        local clearInputTitle = uiContext:createLabel({
            parent = inputLeftColumn,
            text = "With Clear Button",
            xOffset = 20,
            yOffset = -55
        })

        local clearInput = uiContext:createInputField({
            parent = inputLeftColumn,
            name = "MockUIClearInput",
            width = 240,
            height = 26,
            text = "Pre-filled Search Query",
            showClear = true,
            xOffset = 20,
            yOffset = -80
        })

        local numericTitle = uiContext:createLabel({
            parent = inputLeftColumn,
            text = "Numeric Only Input (Max 4 digits)",
            xOffset = 20,
            yOffset = -120
        })

        local numericInput = uiContext:createInputField({
            parent = inputLeftColumn,
            name = "MockUINumericInput",
            width = 120,
            height = 26,
            numeric = true,
            maxLetters = 4,
            placeholder = "9999",
            xOffset = 20,
            yOffset = -145
        })

        -- Right Column: Multi-Line Text Area
        local multiLineTitle = uiContext:createLabel({
            parent = inputRightColumn,
            text = "Multi-Line Text Area",
            xOffset = 20,
            yOffset = 10
        })

        local exampleTextArea = uiContext:createInputField({
            parent = inputRightColumn,
            name = "MockUITextArea",
            multiLine = true,
            width = 250,
            height = 100,
            showScrollbar = true,
            placeholder = "Type notes or macro commands here...",
            xOffset = 20,
            yOffset = -15
        })

    -- Sliders Panel
    local sliderPanel = tabbedInterface.panels[5]
        local _, sliderNextY = uiContext:createHeader({
            parent = sliderPanel,
            text = "Slider & Scrollbar Component",
            xOffset = 10,
            yOffset = -10
        })

        local sliderLeftColumn, sliderRightColumn = uiContext:createTwoColumns({
            parent = sliderPanel,
            yOffset = sliderNextY - 10,
            name = "MockUISliderTwoColumn"
        })

        -- Left Column: Horizontal Sliders
        local horizontalTitle = uiContext:createLabel({
            parent = sliderLeftColumn,
            text = "Horizontal Sliders",
            xOffset = 20,
            yOffset = 10
        })

        local slider1ValueLabel = uiContext:createLabel({
            parent = sliderLeftColumn,
            text = "Standard: 50%",
            xOffset = 20,
            yOffset = -20
        })

        local exampleHorizontalSlider = uiContext:createSlider({
            parent = sliderLeftColumn,
            name = "MockUIHorizontalSlider1",
            orientation = "HORIZONTAL",
            length = 260,
            height = 16,
            minValue = 0,
            maxValue = 100,
            step = 1,
            value = 50,
            xOffset = 20,
            yOffset = -45,
            onValueChanged = function(self, val, isUserInput)
                slider1ValueLabel:SetText(string.format("Standard: %d%%", math.floor(val)))
            end
        })

        local slider2ValueLabel = uiContext:createLabel({
            parent = sliderLeftColumn,
            text = "With Progress Fill: 75%",
            xOffset = 20,
            yOffset = -80
        })

        local exampleFilledSlider = uiContext:createSlider({
            parent = sliderLeftColumn,
            name = "MockUIHorizontalSlider2",
            orientation = "HORIZONTAL",
            length = 260,
            height = 16,
            minValue = 0,
            maxValue = 100,
            step = 5,
            value = 75,
            showFill = true,
            xOffset = 20,
            yOffset = -105,
            onValueChanged = function(self, val, isUserInput)
                slider2ValueLabel:SetText(string.format("With Progress Fill: %d%%", math.floor(val)))
            end
        })

        local slider3ValueLabel = uiContext:createLabel({
            parent = sliderLeftColumn,
            text = "Stepped (1-10): Value 4",
            xOffset = 20,
            yOffset = -140
        })

        local exampleSteppedSlider = uiContext:createSlider({
            parent = sliderLeftColumn,
            name = "MockUIHorizontalSlider3",
            orientation = "HORIZONTAL",
            length = 260,
            height = 16,
            minValue = 1,
            maxValue = 10,
            step = 1,
            value = 4,
            showFill = true,
            xOffset = 20,
            yOffset = -165,
            onValueChanged = function(self, val, isUserInput)
                slider3ValueLabel:SetText(string.format("Stepped (1-10): Value %d", math.floor(val)))
            end
        })

        -- Right Column: Vertical Sliders / Scrollbars
        local verticalTitle = uiContext:createLabel({
            parent = sliderRightColumn,
            text = "Vertical Scrollbars",
            xOffset = 30,
            yOffset = 10
        })

        local verticalScrollbarLabel = uiContext:createLabel({
            parent = sliderRightColumn,
            text = "Scrollbar",
            xOffset = 30,
            yOffset = -20
        })

        local exampleVerticalScrollbar = uiContext:createSlider({
            parent = sliderRightColumn,
            name = "MockUIVerticalScrollbar",
            orientation = "VERTICAL",
            length = 200,
            width = 14,
            minValue = 0,
            maxValue = 100,
            step = 5,
            value = 20,
            xOffset = 45,
            yOffset = -45
        })

        local verticalFillLabel = uiContext:createLabel({
            parent = sliderRightColumn,
            text = "Filled Meter",
            xOffset = 130,
            yOffset = -20
        })

        local exampleVerticalFilled = uiContext:createSlider({
            parent = sliderRightColumn,
            name = "MockUIVerticalFilled",
            orientation = "VERTICAL",
            length = 200,
            width = 14,
            minValue = 0,
            maxValue = 100,
            step = 1,
            value = 60,
            showFill = true,
            inverted = true,
            xOffset = 150,
            yOffset = -45
        })

    -- Steppers Panel
    local stepperPanel = tabbedInterface.panels[6]
        local _, stepperNextY = uiContext:createHeader({
            parent = stepperPanel,
            text = "Stepper Component",
            xOffset = 10,
            yOffset = -10
        })

        local stepperLeftColumn, stepperRightColumn = uiContext:createTwoColumns({
            parent = stepperPanel,
            yOffset = stepperNextY - 10,
            name = "MockUIStepperTwoColumn"
        })

        -- Left Column: Standard Steppers
        local standardStepperTitle = uiContext:createLabel({
            parent = stepperLeftColumn,
            text = "Standard Stepper (0 - 100, Step 1)",
            xOffset = 20,
            yOffset = 10
        })

        local standardStepper = uiContext:createStepper({
            parent = stepperLeftColumn,
            name = "MockUIStandardStepper",
            width = 140,
            height = 26,
            minValue = 0,
            maxValue = 100,
            step = 1,
            value = 10,
            xOffset = 20,
            yOffset = -15
        })

        local clampedStepperTitle = uiContext:createLabel({
            parent = stepperLeftColumn,
            text = "Clamped Low Range (1 - 5)",
            xOffset = 20,
            yOffset = -55
        })

        local clampedStepper = uiContext:createStepper({
            parent = stepperLeftColumn,
            name = "MockUIClampedStepper",
            width = 120,
            height = 26,
            minValue = 1,
            maxValue = 5,
            step = 1,
            value = 1,
            xOffset = 20,
            yOffset = -80
        })

        -- Right Column: Decimal & Negative Steppers
        local decimalStepperTitle = uiContext:createLabel({
            parent = stepperRightColumn,
            text = "Decimal Stepper (0.0 - 10.0, Step 0.5)",
            xOffset = 20,
            yOffset = 10
        })

        local decimalStepper = uiContext:createStepper({
            parent = stepperRightColumn,
            name = "MockUIDecimalStepper",
            width = 140,
            height = 26,
            minValue = 0.0,
            maxValue = 10.0,
            step = 0.5,
            decimals = 1,
            value = 2.5,
            xOffset = 20,
            yOffset = -15
        })

        local negativeStepperTitle = uiContext:createLabel({
            parent = stepperRightColumn,
            text = "Range with Negatives (-50 to +50)",
            xOffset = 20,
            yOffset = -55
        })

        local negativeStepper = uiContext:createStepper({
            parent = stepperRightColumn,
            name = "MockUINegativeStepper",
            width = 140,
            height = 26,
            minValue = -50,
            maxValue = 50,
            step = 10,
            value = 0,
            allowNegative = true,
            xOffset = 20,
            yOffset = -80
        })

    -- Sidebar Palette
    createPaletteFrame(frame)
    frame:Show()
end

-------------------------------------------------------------------------------
-- SLASH COMMANDS
-------------------------------------------------------------------------------

SLASH_MOCKUI1 = "/afui"
SlashCmdList["MOCKUI"] = function()
    if AscensionFactoryMockFrame and AscensionFactoryMockFrame:IsShown() then
        AscensionFactoryMockFrame:Hide()
    else
        createMockUi()
    end
end

-- /palette: Opens the standalone color palette
SLASH_ASPALETTE1 = "/afp"
SlashCmdList["ASPALETTE"] = function()
    if AscensionFactoryPaletteFrame and AscensionFactoryPaletteFrame:GetParent() == UIParent then
        AscensionFactoryPaletteFrame:SetShown(not AscensionFactoryPaletteFrame:IsShown())
    else
        if AscensionFactoryPaletteFrame then AscensionFactoryPaletteFrame:Hide() end
        local p = createPaletteFrame(nil)
        p:Show()
    end
end

-------------------------------------------------------------------------------
-- 5. EXTENSION & EXPANSION NOTES
-- Objective: Guidelines for adapting the gallery testbed into production addon interfaces.
--
-- How to expand:
-- 1. Adding New Component Gallery Tabs:
--    Add a new tab name to `tabs = { ... }` in `createMockUi()` and bind its corresponding content panel
--    to demonstrate new widgets as they are developed.
-- 2. Live Theme Customizer:
--    Add interactive color pickers into `createPaletteFrame` allowing real-time modification
--    of `uiContext.styles.colors` with instant visual re-rendering.
-- 3. Slash Command Registration:
--    Use `SLASH_<NAME>1 = "/cmd"` and `SlashCmdList["<NAME>"]` pattern for opening/toggling addon panels.
-------------------------------------------------------------------------------
