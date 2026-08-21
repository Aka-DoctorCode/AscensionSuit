-------------------------------------------------------------------------------
-- Project: AscensionFactory
-- Author: Aka-DoctorCode
-- File: ColorPicker.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- Objective: Import core AscensionFactory library and Context.
-- Variables:
-- MAJOR (string): Namespace identifier for addon library.
-- lib (table): Resolved library instance.
-- Context (table): Object factory table where creation methods attach.
-------------------------------------------------------------------------------
local MAJOR = "AscensionFactory"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

-------------------------------------------------------------------------------
-- 2. COLOR PICKER MODAL DIALOG (CUSTOM INTERFACE)
-- Objective: Provides a custom styled modal dialog with RGBA sliders,
-- old/new preview swatches, quick palette presets, and Accept/Cancel actions.
-------------------------------------------------------------------------------
function Context:getOrCreateColorPickerDialog()
    if self.colorPickerDialog then
        return self.colorPickerDialog
    end
    if lib.colorPickerDialog then
        return lib.colorPickerDialog
    end

    local styles = (self and self.styles) or lib.defaultStyles or lib.DefaultStyles
    local ux = lib.UX

    -- Create dialog container frame
    local dialog = CreateFrame("Frame", "AscensionFactoryColorPickerDialog", _G.UIParent, "BackdropTemplate")
    dialog:SetSize(340, 390)
    dialog:SetPoint("CENTER", _G.UIParent, "CENTER", 0, 0)
    dialog:SetFrameStrata("FULLSCREEN_DIALOG")
    dialog:SetClampedToScreen(true)
    dialog:EnableMouse(true)
    dialog:SetMovable(true)
    dialog:Hide()

    -- Border layer
    local dialogBorder = dialog:CreateTexture(nil, "BACKGROUND", nil, -2)
    dialogBorder:SetAllPoints(dialog)
    dialogBorder:SetColorTexture(unpack(styles.colors.border))
    dialog.border = dialogBorder

    -- Inner background layer
    local dialogBackground = dialog:CreateTexture(nil, "BACKGROUND", nil, -1)
    dialogBackground:SetPoint("TOPLEFT", dialog, "TOPLEFT", 2, -2)
    dialogBackground:SetPoint("BOTTOMRIGHT", dialog, "BOTTOMRIGHT", -2, 2)
    dialogBackground:SetColorTexture(unpack(styles.colors.background))
    dialog.background = dialogBackground

    -- Header Title
    local title = dialog:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    title:SetPoint("TOPLEFT", dialog, "TOPLEFT", 14, -12)
    title:SetText("COLOR PICKER")
    title:SetTextColor(unpack(styles.colors.primaryHover))
    title:SetFont(title:GetFont(), 13, "")
    dialog.title = title

    -- Draggable functionality on header
    if ux and ux.makeDraggable then
        ux.makeDraggable(dialog)
    end

    -- Close icon button in top right
    local closeButton = self:createIconButton({
        parent = dialog,
        iconType = "close",
        size = 22,
        anchorPoint = "TOPRIGHT",
        relativeTo = dialog,
        relativePoint = "TOPRIGHT",
        xOffset = -6,
        yOffset = -6,
        onClick = function()
            dialog:cancelAndClose()
        end
    })
    dialog.closeButton = closeButton

    -- Register with UISpecialFrames so Escape key closes it
    _G.table.insert(_G.UISpecialFrames, "AscensionFactoryColorPickerDialog")

    -- 2.1 COLOR PREVIEWS (Old vs New)
    local previewHeader = dialog:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    previewHeader:SetPoint("TOPLEFT", dialog, "TOPLEFT", 14, -40)
    previewHeader:SetText("PREVIEW")
    previewHeader:SetTextColor(unpack(styles.colors.steelHighlight))

    -- Current (Old) Color Box
    local currentBox = CreateFrame("Frame", nil, dialog)
    currentBox:SetSize(60, 36)
    currentBox:SetPoint("TOPLEFT", previewHeader, "BOTTOMLEFT", 0, -6)

    local currentBoxBorder = currentBox:CreateTexture(nil, "BACKGROUND", nil, -2)
    currentBoxBorder:SetAllPoints(currentBox)
    currentBoxBorder:SetColorTexture(unpack(styles.colors.border))

    local currentBoxBg = currentBox:CreateTexture(nil, "BACKGROUND", nil, -1)
    currentBoxBg:SetPoint("TOPLEFT", currentBox, "TOPLEFT", 1, -1)
    currentBoxBg:SetPoint("BOTTOMRIGHT", currentBox, "BOTTOMRIGHT", -1, 1)
    currentBoxBg:SetColorTexture(unpack(styles.colors.surfaceDark))

    local currentBoxColor = currentBox:CreateTexture(nil, "ARTWORK")
    currentBoxColor:SetPoint("TOPLEFT", currentBox, "TOPLEFT", 1, -1)
    currentBoxColor:SetPoint("BOTTOMRIGHT", currentBox, "BOTTOMRIGHT", -1, 1)
    dialog.currentBoxColor = currentBoxColor

    local currentLabel = dialog:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    currentLabel:SetPoint("TOP", currentBox, "BOTTOM", 0, -3)
    currentLabel:SetText("Current")
    currentLabel:SetTextColor(unpack(styles.colors.surfaceHover))

    -- Arrow separator
    local arrowLabel = dialog:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    arrowLabel:SetPoint("LEFT", currentBox, "RIGHT", 14, 0)
    arrowLabel:SetText("->")
    arrowLabel:SetTextColor(unpack(styles.colors.steelHighlight))

    -- New Color Box
    local newBox = CreateFrame("Frame", nil, dialog)
    newBox:SetSize(60, 36)
    newBox:SetPoint("LEFT", arrowLabel, "RIGHT", 14, 0)

    local newBoxBorder = newBox:CreateTexture(nil, "BACKGROUND", nil, -2)
    newBoxBorder:SetAllPoints(newBox)
    newBoxBorder:SetColorTexture(unpack(styles.colors.primary))
    dialog.newBoxBorder = newBoxBorder

    local newBoxBg = newBox:CreateTexture(nil, "BACKGROUND", nil, -1)
    newBoxBg:SetPoint("TOPLEFT", newBox, "TOPLEFT", 1, -1)
    newBoxBg:SetPoint("BOTTOMRIGHT", newBox, "BOTTOMRIGHT", -1, 1)
    newBoxBg:SetColorTexture(unpack(styles.colors.surfaceDark))

    local newBoxColor = newBox:CreateTexture(nil, "ARTWORK")
    newBoxColor:SetPoint("TOPLEFT", newBox, "TOPLEFT", 1, -1)
    newBoxColor:SetPoint("BOTTOMRIGHT", newBox, "BOTTOMRIGHT", -1, 1)
    dialog.newBoxColor = newBoxColor

    local newLabel = dialog:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    newLabel:SetPoint("TOP", newBox, "BOTTOM", 0, -3)
    newLabel:SetText("New")
    newLabel:SetTextColor(unpack(styles.colors.white))

    -- Hex String Display
    local hexLabel = dialog:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    hexLabel:SetPoint("LEFT", newBox, "RIGHT", 18, 0)
    hexLabel:SetText("#FFFFFF")
    hexLabel:SetTextColor(unpack(styles.colors.primaryHover))
    dialog.hexLabel = hexLabel

    -- 2.2 RGBA CHANNEL SLIDERS
    dialog.sliders = {}
    local channels = {
        { key = "r", label = "R", color = { 1.0, 0.2, 0.2 }, max = 255 },
        { key = "g", label = "G", color = { 0.2, 1.0, 0.2 }, max = 255 },
        { key = "b", label = "B", color = { 0.2, 0.4, 1.0 }, max = 255 },
        { key = "a", label = "A", color = { 0.9, 0.9, 0.9 }, max = 100 }
    }

    local sliderStartY = -115
    local sliderStepY = 38

    local function updateDialogStateFromSliders()
        local redVal = dialog.sliders.r.value / 255
        local greenVal = dialog.sliders.g.value / 255
        local blueVal = dialog.sliders.b.value / 255
        local alphaVal = dialog.sliders.a.value / 100

        dialog.workingColor = { redVal, greenVal, blueVal, alphaVal }
        dialog.newBoxColor:SetColorTexture(redVal, greenVal, blueVal, alphaVal)

        local hexCode = string.format("#%02X%02X%02X", math.floor(redVal * 255), math.floor(greenVal * 255), math.floor(blueVal * 255))
        dialog.hexLabel:SetText(hexCode)

        -- Real-time preview on target button if active
        if dialog.activeTarget and dialog.activeTarget.applyWorkingColor then
            dialog.activeTarget:applyWorkingColor(redVal, greenVal, blueVal, alphaVal)
        end
    end

    for index, channel in ipairs(channels) do
        local channelY = sliderStartY - ((index - 1) * sliderStepY)

        local channelText = dialog:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
        channelText:SetPoint("TOPLEFT", dialog, "TOPLEFT", 14, channelY)
        channelText:SetText(channel.label)
        channelText:SetTextColor(unpack(channel.color))

        local valueText = dialog:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        valueText:SetPoint("TOPRIGHT", dialog, "TOPRIGHT", -14, channelY)
        valueText:SetText("255")
        valueText:SetTextColor(unpack(styles.colors.white))

        -- Interactive Slider Bar
        local track = CreateFrame("Frame", nil, dialog)
        track:SetSize(275, 14)
        track:SetPoint("TOPLEFT", channelText, "BOTTOMLEFT", 0, -4)
        track:EnableMouse(true)

        local trackBorder = track:CreateTexture(nil, "BACKGROUND", nil, -2)
        trackBorder:SetAllPoints(track)
        trackBorder:SetColorTexture(unpack(styles.colors.border))

        local trackBg = track:CreateTexture(nil, "BACKGROUND", nil, -1)
        trackBg:SetPoint("TOPLEFT", track, "TOPLEFT", 1, -1)
        trackBg:SetPoint("BOTTOMRIGHT", track, "BOTTOMRIGHT", -1, 1)
        trackBg:SetColorTexture(unpack(styles.colors.surfaceDark))

        local trackFill = track:CreateTexture(nil, "ARTWORK", nil, -1)
        trackFill:SetPoint("TOPLEFT", track, "TOPLEFT", 1, -1)
        trackFill:SetPoint("BOTTOMLEFT", track, "BOTTOMLEFT", 1, 1)
        trackFill:SetWidth(0)
        trackFill:SetColorTexture(unpack(channel.color))
        trackFill:SetAlpha(0.6)

        local thumb = track:CreateTexture(nil, "ARTWORK", nil, 1)
        thumb:SetSize(5, 14)
        thumb:SetPoint("CENTER", track, "LEFT", 1, 0)
        thumb:SetColorTexture(unpack(styles.colors.white))

        local sliderData = {
            key = channel.key,
            max = channel.max,
            value = channel.max,
            track = track,
            trackFill = trackFill,
            thumb = thumb,
            valueText = valueText
        }

        local function updateSliderVisual(normalizedValue)
            local clamped = math.max(0, math.min(1, normalizedValue))
            local trackWidth = track:GetWidth() - 2
            local thumbX = 1 + (clamped * trackWidth)

            thumb:ClearAllPoints()
            thumb:SetPoint("CENTER", track, "LEFT", thumbX, 0)
            trackFill:SetWidth(clamped * trackWidth)

            local displayValue = math.floor(clamped * channel.max)
            sliderData.value = displayValue

            if channel.key == "a" then
                valueText:SetText(displayValue .. "%")
            else
                valueText:SetText(tostring(displayValue))
            end
        end
        sliderData.updateVisual = updateSliderVisual

        -- Mouse drag handlers
        local function handleCursorPosition()
            local cursorX = GetCursorPosition()
            local scale = track:GetEffectiveScale()
            local left = track:GetLeft() * scale
            local width = track:GetWidth() * scale
            if width > 0 then
                local fraction = (cursorX - left) / width
                updateSliderVisual(fraction)
                updateDialogStateFromSliders()
            end
        end

        track:SetScript("OnMouseDown", function(self, button)
            if button == "LeftButton" then
                self.isDragging = true
                handleCursorPosition()
                self:SetScript("OnUpdate", function()
                    if self.isDragging then
                        handleCursorPosition()
                    end
                end)
            end
        end)

        track:SetScript("OnMouseUp", function(self, button)
            if button == "LeftButton" then
                self.isDragging = false
                self:SetScript("OnUpdate", nil)
            end
        end)

        dialog.sliders[channel.key] = sliderData
    end

    -- 2.3 QUICK PRESET PALETTES
    local paletteHeader = dialog:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    paletteHeader:SetPoint("TOPLEFT", dialog, "TOPLEFT", 14, -270)
    paletteHeader:SetText("QUICK PALETTE")
    paletteHeader:SetTextColor(unpack(styles.colors.steelHighlight))

    local presetColors = {
        { 1.00, 0.45, 0.00, 1.00 }, -- Neon Orange
        { 1.00, 0.15, 0.15, 1.00 }, -- Neon Red
        { 1.00, 0.85, 0.10, 1.00 }, -- Gold
        { 0.10, 0.90, 0.35, 1.00 }, -- Emerald
        { 0.10, 0.80, 1.00, 1.00 }, -- Cyan
        { 0.20, 0.40, 1.00, 1.00 }, -- Electric Blue
        { 0.70, 0.20, 1.00, 1.00 }, -- Violet
        { 1.00, 1.00, 1.00, 1.00 }, -- White
    }

    local swatchTileSize = 30
    local swatchSpacing = 5
    for i, colorValues in ipairs(presetColors) do
        local presetTile = CreateFrame("Button", nil, dialog)
        presetTile:SetSize(swatchTileSize, 20)
        presetTile:SetPoint("TOPLEFT", paletteHeader, "BOTTOMLEFT", (i - 1) * (swatchTileSize + swatchSpacing), -6)

        local tileBorder = presetTile:CreateTexture(nil, "BACKGROUND", nil, -2)
        tileBorder:SetAllPoints(presetTile)
        tileBorder:SetColorTexture(unpack(styles.colors.border))

        local tileColor = presetTile:CreateTexture(nil, "ARTWORK")
        tileColor:SetPoint("TOPLEFT", presetTile, "TOPLEFT", 1, -1)
        tileColor:SetPoint("BOTTOMRIGHT", presetTile, "BOTTOMRIGHT", -1, 1)
        tileColor:SetColorTexture(unpack(colorValues))

        presetTile:SetScript("OnClick", function()
            dialog:loadColor(colorValues[1], colorValues[2], colorValues[3], colorValues[4])
        end)
    end

    -- 2.4 ACTION BUTTONS (Accept and Cancel)
    local acceptButton = self:createButton({
        parent = dialog,
        text = "Accept",
        width = 145,
        height = 28,
        anchorPoint = "BOTTOMLEFT",
        relativeTo = dialog,
        relativePoint = "BOTTOMLEFT",
        xOffset = 14,
        yOffset = 14,
        borderColors = {
            normal = styles.colors.primary,
            hover = styles.colors.primaryHover,
            active = styles.colors.primaryActive,
            disabled = styles.colors.surfaceLight
        },
        onClick = function()
            dialog:acceptAndClose()
        end
    })
    dialog.acceptButton = acceptButton

    local cancelButton = self:createButton({
        parent = dialog,
        text = "Cancel",
        width = 145,
        height = 28,
        anchorPoint = "BOTTOMRIGHT",
        relativeTo = dialog,
        relativePoint = "BOTTOMRIGHT",
        xOffset = -14,
        yOffset = 14,
        onClick = function()
            dialog:cancelAndClose()
        end
    })
    dialog.cancelButton = cancelButton

    -- 2.5 DIALOG CONTROLLER METHODS
    function dialog:loadColor(r, g, b, a)
        a = a or 1
        self.sliders.r.updateVisual(r)
        self.sliders.g.updateVisual(g)
        self.sliders.b.updateVisual(b)
        self.sliders.a.updateVisual(a)
        updateDialogStateFromSliders()
    end

    function dialog:openForTarget(target)
        self.activeTarget = target
        local initialR, initialG, initialB, initialA = target:getColor()
        self.originalColor = { initialR, initialG, initialB, initialA }

        self.currentBoxColor:SetColorTexture(initialR, initialG, initialB, initialA)
        self:loadColor(initialR, initialG, initialB, initialA)
        self:Show()
    end

    function dialog:acceptAndClose()
        if self.activeTarget then
            local color = self.workingColor
            self.activeTarget:commitColor(color[1], color[2], color[3], color[4])
        end
        self:Hide()
        self.activeTarget = nil
    end

    function dialog:cancelAndClose()
        if self.activeTarget and self.originalColor then
            local orig = self.originalColor
            self.activeTarget:commitColor(orig[1], orig[2], orig[3], orig[4])
        end
        self:Hide()
        self.activeTarget = nil
    end

    lib.colorPickerDialog = dialog
    if self then
        self.colorPickerDialog = dialog
    end
    return dialog
end

-------------------------------------------------------------------------------
-- 3. COLOR PICKER SWATCH FACTORY
-- Objective: Creates stylized color picker swatch button row.
-------------------------------------------------------------------------------
function Context:createColorPicker(options)
    local uiContext = self
    local styles = (self and self.styles) or (lib and (lib.defaultStyles or lib.DefaultStyles))
    local text = options.text or ""
    local hasAlpha = options.hasAlpha ~= false

    -- 1. BASE BUTTON INHERITANCE
    local buttonOptions = {}
    for key, value in pairs(options) do
        buttonOptions[key] = value
    end
    buttonOptions.borderColors = buttonOptions.borderColors or {
        normal = styles.colors.border,
        hover = styles.colors.primaryHover,
        active = styles.colors.primaryActive,
        disabled = styles.colors.surfaceLight
    }

    local colorPicker = self:createButton(buttonOptions)

    local buttonHeight = colorPicker:GetHeight()
    local swatchSize = options.swatchSize or options.boxSize or options.size or buttonHeight

    -- Color state normalization helper
    local function parseColorInput(input)
        if type(input) == "table" then
            local r = input.r or input[1] or 1
            local g = input.g or input[2] or 1
            local b = input.b or input[3] or 1
            local a = input.a or input[4] or 1
            return r, g, b, a
        end
        return 1, 1, 1, 1
    end

    -- Initial color resolution
    local currentR, currentG, currentB, currentA = 1, 1, 1, 1
    if options.getter then
        local getterResult = options.getter()
        currentR, currentG, currentB, currentA = parseColorInput(getterResult)
    elseif options.color then
        currentR, currentG, currentB, currentA = parseColorInput(options.color)
    end

    colorPicker.currentColor = { currentR, currentG, currentB, currentA }

    -- 2. SWATCH GEOMETRY SETUP
    local swatchBorder = colorPicker.border
    swatchBorder:ClearAllPoints()
    swatchBorder:SetPoint("LEFT", colorPicker, "LEFT", 0, 0)
    swatchBorder:SetSize(swatchSize, swatchSize)
    swatchBorder:Show()
    colorPicker.swatchBorder = swatchBorder

    -- Swatch background underlay (for alpha transparency visualization)
    if not colorPicker.swatchBackground then
        local swatchBackground = colorPicker:CreateTexture(nil, "BACKGROUND", nil, -1)
        colorPicker.swatchBackground = swatchBackground
    end
    colorPicker.swatchBackground:ClearAllPoints()
    colorPicker.swatchBackground:SetPoint("TOPLEFT", swatchBorder, "TOPLEFT", 1, -1)
    colorPicker.swatchBackground:SetSize(swatchSize - 2, swatchSize - 2)
    colorPicker.swatchBackground:SetColorTexture(unpack(styles.colors.background))
    colorPicker.swatchBackground:Show()

    -- Active color fill layer
    if not colorPicker.swatchColor then
        local swatchColor = colorPicker:CreateTexture(nil, "ARTWORK")
        colorPicker.swatchColor = swatchColor
    end
    colorPicker.swatchColor:ClearAllPoints()
    colorPicker.swatchColor:SetPoint("TOPLEFT", swatchBorder, "TOPLEFT", 1, -1)
    colorPicker.swatchColor:SetSize(swatchSize - 2, swatchSize - 2)
    colorPicker.swatchColor:Show()

    local function updateSwatchAppearance()
        local color = colorPicker.currentColor
        colorPicker.swatchColor:SetColorTexture(color[1], color[2], color[3], color[4])
    end
    updateSwatchAppearance()

    -- 3. LABEL POSITIONING
    local label = colorPicker:GetFontString()
    if label then
        colorPicker.label = label
        label:ClearAllPoints()
        label:SetJustifyH("LEFT")
        label:SetWidth(0)
        if text ~= "" then
            label:SetPoint("LEFT", swatchBorder, "RIGHT", 8, 0)
            label:Show()
            local labelWidth = label:GetStringWidth() or 0
            if not options.width then
                colorPicker:SetWidth(swatchSize + 8 + labelWidth)
            end
        else
            label:Hide()
            if not options.width then
                colorPicker:SetWidth(swatchSize)
            end
        end
    end

    -- 4. COLOR UPDATE AND BROADCASTING
    function colorPicker:applyWorkingColor(r, g, b, a)
        self.currentColor = { r, g, b, a }
        updateSwatchAppearance()
        if options.onChange then
            options.onChange(self.currentColor, r, g, b, a)
        end
    end

    function colorPicker:commitColor(r, g, b, a)
        self.currentColor = { r, g, b, a }
        updateSwatchAppearance()
        if options.setter then
            options.setter(self.currentColor, r, g, b, a)
        end
        if options.onChange then
            options.onChange(self.currentColor, r, g, b, a)
        end
    end

    -- 5. OPEN CUSTOM COLOR PICKER DIALOG
    local function openDialog()
        if not colorPicker:IsEnabled() then return end

        if options.useBlizzardPicker then
            -- Fallback to retail ColorPickerFrame if explicitly requested
            local previousR = colorPicker.currentColor[1]
            local previousG = colorPicker.currentColor[2]
            local previousB = colorPicker.currentColor[3]
            local previousA = colorPicker.currentColor[4]

            local function onColorChange()
                local newR, newG, newB
                if ColorPickerFrame.GetColorRGB then
                    newR, newG, newB = ColorPickerFrame:GetColorRGB()
                end
                newR = newR or previousR
                newG = newG or previousG
                newB = newB or previousB
                local newA = (ColorPickerFrame.GetColorAlpha and ColorPickerFrame:GetColorAlpha()) or previousA
                colorPicker:commitColor(newR, newG, newB, newA)
            end

            local function onColorCancel(previousValues)
                colorPicker:commitColor(previousR, previousG, previousB, previousA)
            end

            if ColorPickerFrame.SetupColorPickerAndShow then
                ColorPickerFrame:SetupColorPickerAndShow({
                    r = previousR,
                    g = previousG,
                    b = previousB,
                    hasOpacity = hasAlpha,
                    opacity = previousA,
                    swatchFunc = onColorChange,
                    opacityFunc = onColorChange,
                    cancelFunc = onColorCancel
                })
            end
        else
            local dialog = (uiContext and uiContext.getOrCreateColorPickerDialog and uiContext:getOrCreateColorPickerDialog()) or Context:getOrCreateColorPickerDialog()
            dialog:openForTarget(colorPicker)
        end
    end

    colorPicker:SetScript("OnClick", function(self, buttonName, down)
        if options.onClick then
            options.onClick(self, self.currentColor, buttonName, down)
        end
        openDialog()
    end)

    -- 6. EXTERNAL CONTROL METHODS
    function colorPicker:getColor()
        local color = self.currentColor
        return color[1], color[2], color[3], color[4], color
    end
    colorPicker.GetColor = colorPicker.getColor

    function colorPicker:setColor(firstArg, g, b, a)
        local newR, newG, newB, newA
        if type(firstArg) == "table" then
            newR, newG, newB, newA = parseColorInput(firstArg)
        else
            newR = firstArg or 1
            newG = g or 1
            newB = b or 1
            newA = a or 1
        end
        self:commitColor(newR, newG, newB, newA)
    end
    colorPicker.SetColor = colorPicker.setColor

    function colorPicker:setText(newText)
        if self.label then
            self.label:SetText(newText)
            self.label:SetWidth(0)
            local labelWidth = self.label:GetStringWidth() or 0
            if not options.width then
                self:SetWidth(swatchSize + 8 + labelWidth)
            end
        end
    end
    colorPicker.SetText = colorPicker.setText

    function colorPicker:openColorPicker()
        openDialog()
    end
    colorPicker.OpenColorPicker = colorPicker.openColorPicker

    return colorPicker
end
