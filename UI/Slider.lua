-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Slider.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-- -------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- -------------------------------------------------------------------------------
local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

-- -------------------------------------------------------------------------------
-- 2. SLIDER FACTORY
-- -------------------------------------------------------------------------------
--- Creates a premium slider component with a thin track and integrated stepper.
function Context:createSlider(args)
    if not args or not args.parent then return nil, 0 end

    local parent = args.parent
    local text = args.text
    local minVal = args.minVal or 0
    local maxVal = args.maxVal or 100
    local step = args.step or 1
    local getter = args.getter
    local setter = args.setter
    local tooltip = args.tooltip
    local width = args.width or self.styles.dimensions.sliderWidth
    local yOffset = args.yOffset or 0
    local xOffset = args.xOffset

    local actualX = xOffset or self.styles.dimensions.contentPadding or 16
    local sliderName = "AscensionSuitSlider_" .. tostring(math.random(1000000, 9999999))
    
    -- Slider Frame
    local slider = CreateFrame("Slider", sliderName, parent, "BackdropTemplate")
    slider:SetPoint("TOPLEFT", actualX, yOffset - 24)
    slider:SetWidth(width)
    slider:SetHeight(8) -- Thin premium track
    slider:SetMinMaxValues(minVal, maxVal)
    slider:SetValueStep(step)
    slider:SetObeyStepOnDrag(true)
    slider:SetOrientation("HORIZONTAL")

    -- Custom track styling
    slider:SetBackdrop({
        bgFile = self.styles.files.bgFile,
        edgeFile = self.styles.files.edgeFile,
        edgeSize = 1,
        insets = { left = 0, right = 0, top = 0, bottom = 0 }
    })
    if self.styles.colors.surfaceLight then slider:SetBackdropColor(unpack(self.styles.colors.surfaceLight)) end
    if self.styles.colors.blackDetail then slider:SetBackdropBorderColor(unpack(self.styles.colors.blackDetail)) end

    -- Custom Thumb
    local thumb = slider:CreateTexture(nil, "ARTWORK")
    thumb:SetSize(16, 16)
    if self.styles.colors.primary then thumb:SetColorTexture(unpack(self.styles.colors.primary)) end
    slider:SetThumbTexture(thumb)

    -- Label
    local label = slider:CreateFontString(nil, "OVERLAY", self.styles.fonts.label)
    label:SetPoint("BOTTOMLEFT", slider, "TOPLEFT", 0, 8)
    label:SetText(text or "")
    if self.styles.colors.textLight then label:SetTextColor(unpack(self.styles.colors.textLight)) end

    local val = minVal
    if getter then val = getter() or minVal end
    slider:SetValue(val)

    -- -------------------------------------------------------------------------------
    -- 3. COMPONENT INTEGRATION (Stepper)
    -- -------------------------------------------------------------------------------
    local stepper, _ = self:createStepper({
        parent = parent,
        minVal = minVal,
        maxVal = maxVal,
        step = step,
        getter = getter,
        setter = function(v) 
            slider:SetValue(v)
            if setter then setter(v) end
        end,
        width = width,
        yOffset = yOffset,
        xOffset = actualX
    })

    -- Re-anchor stepper below the slider
    stepper:ClearAllPoints()
    stepper:SetPoint("TOPLEFT", slider, "BOTTOMLEFT", 0, -4)
    stepper:SetPoint("TOPRIGHT", slider, "BOTTOMRIGHT", 0, -4)

    -- -------------------------------------------------------------------------------
    -- 4. EVENT HANDLERS
    -- -------------------------------------------------------------------------------
    slider:SetScript("OnValueChanged", function(_, value)
        if stepper.editBox then
            -- Sync stepper text with slider value
            stepper.editBox:SetText(tostring(math.floor(value * 100) / 100))
        end
    end)

    slider:SetScript("OnMouseUp", function(self)
        if setter then setter(self:GetValue()) end
    end)

    -- UX Integration
    if tooltip and lib.UX and lib.UX.attachTooltip then
        lib.UX:attachTooltip(slider, text, tooltip)
    end

    local nextY = yOffset - 85
    return slider, nextY
end
