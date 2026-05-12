-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Stepper.lua
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
-- 2. STEPPER FACTORY
-- -------------------------------------------------------------------------------
--- Creates a numeric input component with plus/minus buttons for precise stepping.
function Context:createStepper(args)
    if not args or not args.parent then return nil, 0 end

    local parent = args.parent
    local text = args.text
    local minVal = args.minVal or 0
    local maxVal = args.maxVal or 100
    local step = args.step or 1
    local getter = args.getter
    local setter = args.setter
    local tooltip = args.tooltip
    local width = args.width or 120
    local yOffset = args.yOffset or 0
    local xOffset = args.xOffset

    local actualX = xOffset or self.styles.dimensions.contentPadding or 16
    local val = minVal
    if getter then val = getter() or minVal end

    -- -------------------------------------------------------------------------------
    -- 3. INTERNAL LOGIC
    -- -------------------------------------------------------------------------------
    --- Validates input and updates the state.
    local function updateValue(editBox, inputValue)
        local numericValue = tonumber(inputValue)
        if numericValue then
            numericValue = math.max(minVal, math.min(maxVal, numericValue))
            editBox:SetText(tostring(math.floor(numericValue * 100) / 100))
            if setter then setter(numericValue) end
        else
            -- Revert to current value on invalid input
            if getter then
                editBox:SetText(tostring(math.floor(getter() * 100) / 100))
            end
        end
    end

    -- Controls Frame
    local btnSize = self.styles.dimensions.editBoxHeight or 28
    local controlsFrame = CreateFrame("Frame", nil, parent)
    controlsFrame:SetPoint("TOPLEFT", actualX, yOffset - 4)
    controlsFrame:SetSize(width, btnSize)

    -- Integrated Input Field
    local inputWidth = 40
    local inputFrame = self:createInput({
        parent = controlsFrame,
        width = inputWidth,
        yOffset = 0,
        xOffset = (width - inputWidth) / 2,
        onEnterPressed = function(val) updateValue(controlsFrame.editBox, val) end
    })
    local editBox = inputFrame.editBox
    controlsFrame.editBox = editBox
    editBox:SetJustifyH("CENTER")
    editBox:SetText(tostring(math.floor(val * 100) / 100))

    -- Minus Button
    local btnMinus = self:createStepButton({
        parent = controlsFrame,
        symbol = "-",
        size = btnSize,
        onClick = function() updateValue(editBox, (getter and getter() or val) - step) end,
        styles = self.styles
    })
    if btnMinus then btnMinus:SetPoint("RIGHT", editBox, "LEFT", -4, 0) end

    -- Plus Button
    local btnPlus = self:createStepButton({
        parent = controlsFrame,
        symbol = "+",
        size = btnSize,
        onClick = function() updateValue(editBox, (getter and getter() or val) + step) end,
        styles = self.styles
    })
    if btnPlus then btnPlus:SetPoint("LEFT", editBox, "RIGHT", 4, 0) end

    -- UX Integration
    if tooltip and lib.UX and lib.UX.attachTooltip then
        lib.UX:attachTooltip(controlsFrame, text, tooltip)
    end

    local totalDescent = btnSize + 16 + 4
    return controlsFrame, yOffset - totalDescent
end
