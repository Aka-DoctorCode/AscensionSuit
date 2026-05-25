-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: ColorPicker.lua
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
-- 2. COLOR PICKER FACTORY
-- -------------------------------------------------------------------------------
--- Creates a color picker component that interfaces with the Blizzard ColorPickerFrame.
function Context:createColorPicker(args)
    if not args or not args.parent then return nil, 0 end

    local parent = args.parent
    local text = args.text
    local getter = args.getter
    local setter = args.setter
    local yOffset = args.yOffset or 0
    local xOffset = args.xOffset
    local hasAlpha = args.hasAlpha
    local tooltip = args.tooltip

    local actualX = (xOffset or self.styles.dimensions.contentPadding or 16) + 4
    local pickerSize = self.styles.dimensions.colorPickerSize or 20
    local pickerSpacing = self.styles.dimensions.colorPickerSpacing or 24

    -- Base Button (The Swatch)
    local button = CreateFrame("Button", nil, parent)
    button:SetSize(pickerSize, pickerSize)
    button:SetPoint("TOPLEFT", actualX, yOffset)

    -- Color Texture
    local texture = button:CreateTexture(nil, "OVERLAY")
    texture:SetAllPoints()
    if getter then texture:SetColorTexture(getter()) end
    button.tex = texture

    -- White Border/Background
    local background = button:CreateTexture(nil, "BACKGROUND")
    background:SetPoint("TOPLEFT", -1, 1)
    background:SetPoint("BOTTOMRIGHT", 1, -1)
    background:SetColorTexture(1, 1, 1, 1)

    -- Label
    local label = button:CreateFontString(nil, "OVERLAY", self.styles.fonts.label)
    label:SetPoint("LEFT", button, "RIGHT", 10, 0)
    label:SetText(text)

    -- -------------------------------------------------------------------------------
    -- 3. CALLBACKS & LOGIC
    -- -------------------------------------------------------------------------------
    --- Internal callback for handling color picker changes.
    local function colorCallback(restore)
        local colorPicker = _G["ColorPickerFrame"]
        local r, g, b, a
        if type(restore) == "table" then
            r, g, b, a = unpack(restore)
        else
            if colorPicker and colorPicker.GetColorRGB then
                r, g, b = colorPicker:GetColorRGB()
            end
            a = (colorPicker and colorPicker.GetColorAlpha and colorPicker:GetColorAlpha()) or
                (colorPicker and colorPicker.GetColorOpacity and 1 - colorPicker:GetColorOpacity()) or 1
        end
        local finalAlpha = a or 1
        if setter then setter(r or 1, g or 1, b or 1, finalAlpha) end
        button.tex:SetColorTexture(r or 1, g or 1, b or 1, finalAlpha)
    end

    button:SetScript("OnClick", function()
        local colorPicker = _G["ColorPickerFrame"]
        if not getter then return end
        local r, g, b, a = getter()
        local currentAlpha = a or 1
        local info = {
            swatchFunc = function() colorCallback() end,
            opacityFunc = function() colorCallback() end,
            cancelFunc = function() colorCallback({ r or 1, g or 1, b or 1, currentAlpha }) end,
            hasOpacity = hasAlpha,
            opacity = currentAlpha,
            r = r or 1,
            g = g or 1,
            b = b or 1
        }

        -- Handle API changes for Retail/Classic versions
        if colorPicker and colorPicker.SetupColorPickerAndShow then
            colorPicker:SetupColorPickerAndShow(info)
        elseif colorPicker then
            colorPicker.func = info.swatchFunc
            colorPicker.opacityFunc = info.opacityFunc
            colorPicker.cancelFunc = info.cancelFunc
            colorPicker.hasOpacity = info.hasOpacity
            colorPicker.opacity = info.opacity
            if colorPicker.SetColorRGB then colorPicker:SetColorRGB(info.r, info.g, info.b) end
            colorPicker:Show()
        end
    end)

    -- UX Integration
    if tooltip and lib.UX and lib.UX.attachTooltip then 
        lib.UX:attachTooltip(button, text, tooltip) 
    end

    return button, yOffset - pickerSpacing
end
