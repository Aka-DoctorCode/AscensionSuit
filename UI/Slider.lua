-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Slider.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

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
    local slider = CreateFrame("Slider", sliderName, parent, "OptionsSliderTemplate")
    slider:SetPoint("TOPLEFT", actualX, yOffset - 4)
    slider:SetWidth(width)
    slider:SetMinMaxValues(minVal, maxVal)
    slider:SetValueStep(step)
    slider:SetObeyStepOnDrag(true)

    local val = minVal
    if getter then val = getter() or minVal end

    local lowText = _G[sliderName .. "Low"]
    if lowText then
        lowText:SetFontObject(self.styles.fonts.label)
        lowText:SetText(tostring(minVal))
        if self.styles.colors.textDim then lowText:SetTextColor(unpack(self.styles.colors.textDim)) end
    end

    local highText = _G[sliderName .. "High"]
    if highText then
        highText:SetFontObject(self.styles.fonts.label)
        highText:SetText(tostring(maxVal))
        if self.styles.colors.textDim then highText:SetTextColor(unpack(self.styles.colors.textDim)) end
    end

    slider:SetValue(val)

    local function updateValue(inputValue)
        local numericValue = tonumber(inputValue)
        if numericValue then
            local finalVal = math.max(minVal, math.min(maxVal, numericValue))
            slider:SetValue(finalVal)
            if setter then setter(finalVal) end
        end
    end

    local btnSize = self.styles.dimensions.editBoxHeight or 28
    local controlsFrame = CreateFrame("Frame", nil, parent)
    controlsFrame:SetPoint("TOPLEFT", slider, "BOTTOMLEFT", 0, -8)
    controlsFrame:SetPoint("TOPRIGHT", slider, "BOTTOMRIGHT", 0, -8)
    controlsFrame:SetHeight(btnSize + 10)

    local editBox = CreateFrame("EditBox", nil, controlsFrame, "InputBoxTemplate")
    editBox:SetSize(btnSize + 20, btnSize + 20)
    editBox:SetPoint("CENTER", controlsFrame, "CENTER", 0, 0)
    editBox:SetAutoFocus(false)
    editBox:SetJustifyH("CENTER")
    editBox:SetFontObject(self.styles.fonts.label)
    editBox:SetText(tostring(math.floor(val * 100) / 100))

    editBox:SetScript("OnEnterPressed", function(self)
        updateValue(self:GetText())
        self:ClearFocus()
    end)

    local btnMinus = self:createStepButton({
        parent = controlsFrame,
        symbol = "-",
        size = btnSize,
        onClick = function() updateValue(slider:GetValue() - step) end,
        styles = self.styles
    })
    if btnMinus then btnMinus:SetPoint("RIGHT", editBox, "LEFT", -12, 0) end

    local btnPlus = self:createStepButton({
        parent = controlsFrame,
        symbol = "+",
        size = btnSize,
        onClick = function() updateValue(slider:GetValue() + step) end,
        styles = self.styles
    })
    if btnPlus then btnPlus:SetPoint("LEFT", editBox, "RIGHT", 12, 0) end

    slider:SetScript("OnValueChanged", function(_, value)
        editBox:SetText(tostring(math.floor(value * 100) / 100))
    end)

    slider:SetScript("OnMouseUp", function(self)
        if setter then setter(self:GetValue()) end
    end)

    if tooltip and lib.UX and lib.UX.attachTooltip then
        lib.UX:attachTooltip(slider, text, tooltip)
    end

    local nextY = yOffset - (slider:GetHeight() + 4 + controlsFrame:GetHeight() + 16 + 4)
    return slider, nextY
end
