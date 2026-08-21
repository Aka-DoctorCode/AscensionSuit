-------------------------------------------------------------------------------
-- Project: AscensionFactory
-- Author: Aka-DoctorCode
-- File: 09Slider.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- Objective: Import the core AscensionFactory library and Context.
-- This ensures the UI elements can be built upon the existing framework.
-- Variables:
-- MAJOR (string): The namespace identifier for the addon library.
-- lib (table): The resolved library instance.
-- Context (table): The object factory table where creation methods are attached.
-------------------------------------------------------------------------------
local MAJOR = "AscensionFactory"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

-------------------------------------------------------------------------------
-- 2. SLIDER FACTORY
-- Objective: Creates a versatile slider and scrollbar component supporting both
-- HORIZONTAL and VERTICAL orientations, custom diamond thumb geometry, track fill,
-- mouse dragging, step snapping, and mouse wheel navigation.
-- Variables:
-- options (table): Configuration table (orientation, length, min, max, step, onValueChanged, etc.).
-- slider (table): The created Slider/Frame element.
-- track, border, fill, thumb (tables): Visual textures and interactive handles.
-------------------------------------------------------------------------------
function Context:createSlider(options)
    options = options or {}
    local styles = self.styles
    local parent = options.parent or UIParent

    -- 2.1 MANDATORY VALIDATION (Orientation & Length)
    if not options.orientation then
        error("AscensionFactory: createSlider requires explicit 'orientation' ('HORIZONTAL' or 'VERTICAL')", 2)
    end

    local orientation = string.upper(tostring(options.orientation))
    if orientation ~= "HORIZONTAL" and orientation ~= "VERTICAL" then
        error(string.format("AscensionFactory: Invalid orientation '%s'. Expected 'HORIZONTAL' or 'VERTICAL'", tostring(options.orientation)), 2)
    end

    local length
    local thickness
    local width
    local height

    if orientation == "HORIZONTAL" then
        length = options.length or options.width
        if not length then
            error("AscensionFactory: createSlider requires explicit 'length' or 'width' for HORIZONTAL orientation", 2)
        end
        thickness = options.height or options.thickness or 16
        width = length
        height = thickness
    else
        length = options.length or options.height
        if not length then
            error("AscensionFactory: createSlider requires explicit 'length' or 'height' for VERTICAL orientation", 2)
        end
        thickness = options.width or options.thickness or 14
        width = thickness
        height = length
    end

    -- 2.2 BASE FRAME SETUP
    local slider = self:acquireElement("Frame", parent, {
        width = width,
        height = height
    })
    slider:EnableMouse(true)

    if options.name then
        _G[options.name] = slider
    end

    if options.point or options.anchorPoint or options.xOffset or options.yOffset then
        slider:ClearAllPoints()
        slider:SetPoint(
            options.point or options.anchorPoint or "TOPLEFT",
            options.relativeTo or parent,
            options.relativePoint or options.point or options.anchorPoint or "TOPLEFT",
            options.xOffset or 0,
            options.yOffset or 0
        )
    end

    -- 2.3 EXPLICIT TRACK & BORDER TEXTURES
    if not slider.border then
        local border = slider:CreateTexture(nil, "BACKGROUND", nil, -2)
        border:SetAllPoints(slider)
        slider.border = border
    end
    slider.border:SetColorTexture(unpack(options.borderColor or styles.colors.border))
    slider.border:Show()

    if not slider.track then
        local track = slider:CreateTexture(nil, "BACKGROUND", nil, -1)
        slider.track = track
    end
    slider.track:ClearAllPoints()
    slider.track:SetPoint("TOPLEFT", slider, "TOPLEFT", 1, -1)
    slider.track:SetPoint("BOTTOMRIGHT", slider, "BOTTOMRIGHT", -1, 1)
    slider.track:SetColorTexture(unpack(options.trackColor or styles.colors.surfaceDark))
    slider.track:Show()

    -- 2.4 OPTIONAL PROGRESS FILL
    local showFill = options.showFill or options.fill or false
    if not slider.fill then
        local fill = slider:CreateTexture(nil, "BACKGROUND", nil, 0)
        slider.fill = fill
    end
    slider.fill:SetColorTexture(unpack(options.fillColor or styles.colors.primary))
    if not showFill then
        slider.fill:Hide()
    end

    -- 2.5 DIAMOND THUMB SETUP
    local thumbSize = options.thumbSize or (thickness - 2)
    local diamondInnerSize = math.max(6, math.floor(thumbSize * 0.65))

    local thumb = slider.thumb
    if not thumb then
        thumb = self:acquireElement("Button", slider, {
            width = thumbSize,
            height = thumbSize
        })
        slider.thumb = thumb
    end
    thumb:SetSize(thumbSize, thumbSize)
    thumb:EnableMouse(true)

    if not thumb.diamond then
        local diamond = thumb:CreateTexture(nil, "ARTWORK")
        thumb.diamond = diamond
    end
    thumb.diamond:ClearAllPoints()
    thumb.diamond:SetSize(diamondInnerSize, diamondInnerSize)
    thumb.diamond:SetPoint("CENTER", thumb, "CENTER", 0, 0)
    thumb.diamond:SetRotation(math.rad(45))
    thumb.diamond:SetColorTexture(unpack(styles.colors.white))
    thumb.diamond:Show()

    -- 2.6 STATE CONFIGURATION
    slider.orientation = orientation
    slider.minValue = options.minValue or options.min or 0
    slider.maxValue = options.maxValue or options.max or 100
    slider.step = options.step or options.stepSize or 1
    slider.isDragging = false
    slider.showFill = showFill
    slider.thickness = thickness
    slider.thumbSize = thumbSize
    slider.inverted = options.inverted or false

    local currentValue = options.value or options.defaultValue or slider.minValue
    if options.getter then
        currentValue = options.getter() or currentValue
    end

    -- 2.7 THUMB POSITIONING & FILL ENGINE
    local function updateThumbPosition()
        local range = slider.maxValue - slider.minValue
        local pct = 0
        if range > 0 then
            pct = math.max(0, math.min(1, (currentValue - slider.minValue) / range))
        end

        local currentWidth = slider:GetWidth()
        local currentHeight = slider:GetHeight()
        local currentThumbSize = slider.thumbSize

        thumb:ClearAllPoints()

        if slider.orientation == "HORIZONTAL" then
            local travelDistance = math.max(0, currentWidth - currentThumbSize - 2)
            local xPos = 1 + (pct * travelDistance)
            thumb:SetPoint("LEFT", slider, "LEFT", xPos, 0)

            if slider.showFill and slider.fill:IsShown() then
                slider.fill:ClearAllPoints()
                slider.fill:SetPoint("TOPLEFT", slider, "TOPLEFT", 1, -1)
                slider.fill:SetPoint("BOTTOMLEFT", slider, "BOTTOMLEFT", 1, 1)
                slider.fill:SetWidth(math.max(1, xPos + (currentThumbSize * 0.5)))
            end
        else
            local travelDistance = math.max(0, currentHeight - currentThumbSize - 2)
            local effectivePct = slider.inverted and (1 - pct) or pct
            local yPos = -1 - (effectivePct * travelDistance)
            thumb:SetPoint("TOP", slider, "TOP", 0, yPos)

            if slider.showFill and slider.fill:IsShown() then
                slider.fill:ClearAllPoints()
                if slider.inverted then
                    slider.fill:SetPoint("BOTTOMLEFT", slider, "BOTTOMLEFT", 1, 1)
                    slider.fill:SetPoint("BOTTOMRIGHT", slider, "BOTTOMRIGHT", -1, 1)
                    slider.fill:SetHeight(math.max(1, (pct * travelDistance) + (currentThumbSize * 0.5)))
                else
                    slider.fill:SetPoint("TOPLEFT", slider, "TOPLEFT", 1, -1)
                    slider.fill:SetPoint("TOPRIGHT", slider, "TOPRIGHT", -1, -1)
                    slider.fill:SetHeight(math.max(1, -yPos + (currentThumbSize * 0.5)))
                end
            end
        end
    end

    local function applyValue(newValue, isUserInput, isSilent)
        local steppedValue = newValue
        if slider.step and slider.step > 0 then
            steppedValue = math.floor((newValue - slider.minValue) / slider.step + 0.5) * slider.step + slider.minValue
        end
        steppedValue = math.max(slider.minValue, math.min(slider.maxValue, steppedValue))

        local valueChanged = (steppedValue ~= currentValue)
        currentValue = steppedValue

        updateThumbPosition()

        if valueChanged and not isSilent then
            if options.setter then
                options.setter(currentValue)
            end
            if options.onValueChanged then
                options.onValueChanged(slider, currentValue, isUserInput or false)
            end
        end
    end

    -- 2.8 DRAGGING & COORDINATE CONVERSION ENGINE
    local function calculateValueFromCursor()
        local scale = UIParent:GetEffectiveScale()
        local cursorX, cursorY = GetCursorPosition()
        cursorX = cursorX / scale
        cursorY = cursorY / scale

        local range = slider.maxValue - slider.minValue
        if range <= 0 then return slider.minValue end

        local pct = 0
        if slider.orientation == "HORIZONTAL" then
            local left = slider:GetLeft() or 0
            local widthAvailable = math.max(1, slider:GetWidth() - slider.thumbSize - 2)
            local relativeX = cursorX - left - (slider.thumbSize * 0.5) - 1
            pct = math.max(0, math.min(1, relativeX / widthAvailable))
        else
            local top = slider:GetTop() or 0
            local heightAvailable = math.max(1, slider:GetHeight() - slider.thumbSize - 2)
            local relativeY = top - cursorY - (slider.thumbSize * 0.5) - 1
            pct = math.max(0, math.min(1, relativeY / heightAvailable))
            if slider.inverted then
                pct = 1 - pct
            end
        end

        return slider.minValue + (pct * range)
    end

    -- 2.9 INTERACTION SCRIPTS & HOVER (Managed via UX:makeHoverable)
    if lib.UX and lib.UX.makeHoverable then
        lib.UX:makeHoverable(thumb, {
            tooltip = options.tooltip,
            track = thumb.diamond,
            border = slider.border,
            trackColors = {
                normal = styles.colors.white,
                hover = styles.colors.primaryHover,
                active = styles.colors.primaryActive,
                disabled = styles.colors.surfaceHover
            },
            borderColors = {
                normal = options.borderColor or styles.colors.border,
                hover = styles.colors.primaryHover,
                active = styles.colors.primaryActive,
                disabled = styles.colors.border
            },
            onAfterStateChange = function(element, state)
                if slider.isDragging then
                    thumb.diamond:SetColorTexture(unpack(styles.colors.primaryActive))
                    slider.border:SetColorTexture(unpack(styles.colors.primaryActive))
                end
            end
        })
    end

    local function startDragging()
        slider.isDragging = true
        if thumb.updateAppearance then
            thumb.updateAppearance("active")
        end

        slider:SetScript("OnUpdate", function()
            local targetValue = calculateValueFromCursor()
            applyValue(targetValue, true, false)
        end)
    end

    local function stopDragging()
        if slider.isDragging then
            slider.isDragging = false
            slider:SetScript("OnUpdate", nil)

            if thumb.updateAppearance then
                thumb.updateAppearance((thumb:IsMouseOver() or slider:IsMouseOver()) and "hover" or "normal")
            end
        end
    end

    thumb:HookScript("OnMouseDown", function(self, buttonName)
        if buttonName == "LeftButton" then
            startDragging()
        end
    end)

    thumb:HookScript("OnMouseUp", function(self, buttonName)
        if buttonName == "LeftButton" then
            stopDragging()
        end
    end)

    slider:HookScript("OnEnter", function()
        if not slider.isDragging and thumb.updateAppearance then
            thumb.updateAppearance("hover")
        end
    end)

    slider:HookScript("OnLeave", function()
        if not slider.isDragging and thumb.updateAppearance then
            thumb.updateAppearance(thumb:IsMouseOver() and "hover" or "normal")
        end
    end)

    slider:HookScript("OnMouseDown", function(self, buttonName)
        if buttonName == "LeftButton" then
            local targetValue = calculateValueFromCursor()
            applyValue(targetValue, true, false)
            startDragging()
        end
    end)

    slider:HookScript("OnMouseUp", function(self, buttonName)
        if buttonName == "LeftButton" then
            stopDragging()
        end
    end)

    slider:HookScript("OnHide", function()
        stopDragging()
    end)

    slider:EnableMouseWheel(true)
    slider:SetScript("OnMouseWheel", function(self, delta)
        local stepAmount = slider.step or 1
        local deltaValue
        if slider.orientation == "HORIZONTAL" then
            local isForward = (delta > 0)
            if slider.inverted then
                isForward = not isForward
            end
            deltaValue = isForward and stepAmount or -stepAmount
        else
            local isIncrease = (delta > 0 and slider.inverted) or (delta < 0 and not slider.inverted)
            deltaValue = isIncrease and stepAmount or -stepAmount
        end
        applyValue(currentValue + deltaValue, true, false)
    end)

    -- 2.10 PUBLIC API METHODS
    function slider:getValue()
        return currentValue
    end
    slider.GetValue = slider.getValue

    function slider:setValue(val, isSilent, isUserInput)
        applyValue(val, isUserInput, isSilent)
    end
    slider.SetValue = slider.setValue

    function slider:setMinMaxValues(minVal, maxVal)
        self.minValue = minVal
        self.maxValue = maxVal
        applyValue(currentValue, false, true)
    end
    slider.SetMinMaxValues = slider.setMinMaxValues

    function slider:getMinMaxValues()
        return self.minValue, self.maxValue
    end
    slider.GetMinMaxValues = slider.getMinMaxValues

    function slider:setStep(newStep)
        self.step = newStep
    end
    slider.SetStep = slider.setStep

    function slider:setThumbSize(newSize)
        self.thumbSize = newSize
        self.thumb:SetSize(newSize, newSize)
        local newInner = math.max(6, math.floor(newSize * 0.65))
        self.thumb.diamond:SetSize(newInner, newInner)
        updateThumbPosition()
    end
    slider.SetThumbSize = slider.setThumbSize

    function slider:setFill(enabled)
        self.showFill = enabled
        if enabled then
            self.fill:Show()
        else
            self.fill:Hide()
        end
        updateThumbPosition()
    end
    slider.SetFill = slider.setFill

    function slider:updateThumbPosition()
        updateThumbPosition()
    end
    slider.UpdateThumbPosition = slider.updateThumbPosition

    -- Initial position calculation
    applyValue(currentValue, false, true)

    return slider
end

-------------------------------------------------------------------------------
-- 3. EXTENSION & EXPANSION NOTES
-- Objective: Guidelines for tick marks, value indicator callouts, and dual-handle range sliders.
--
-- How to expand:
-- 1. Value Indicator Tooltip/Callout:
--    Attach a small dynamic label above the diamond thumb displaying the live value while dragging.
-- 2. Stepped Tick Marks:
--    Render subtle vertical tick line textures along the slider track corresponding to discrete step values.
-- 3. Dual-Handle Range Slider:
--    Instantiate two diamond thumbs (minHandle and maxHandle) to allow selecting a range [min, max]
--    with a filled progress zone between both thumbs.
-------------------------------------------------------------------------------
