-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Checkbox.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

function Context:createCheckbox(args)
    if not args or not args.parent then return nil, 0 end
    
    local parent = args.parent
    local text = args.text
    local tooltip = args.tooltip
    local getter = args.getter
    local setter = args.setter
    local yOffset = args.yOffset
    local xOffset = args.xOffset

    local checkboxSize = self.styles.dimensions.checkboxSize or 24
    local checkboxSpacing = self.styles.dimensions.checkboxSpacing or 24
    local labelColor = self.styles.colors.textLight

    local checkbox = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    checkbox:SetSize(checkboxSize, checkboxSize)
    local actualX = xOffset or self.styles.dimensions.contentPadding or 16
    checkbox:SetPoint("TOPLEFT", parent, "TOPLEFT", actualX, yOffset or -16)

    local label = checkbox.Text
    label:SetFontObject(self.styles.fonts.label)
    label:SetPoint("LEFT", checkbox, "RIGHT", 8, 0)
    label:SetText(text or "")
    if labelColor then
        label:SetTextColor(unpack(labelColor))
    end

    if getter then 
        checkbox:SetChecked(getter()) 
    end
    
    checkbox:SetScript("OnClick", function(self)
        if setter then setter(self:GetChecked()) end
    end)

    if tooltip and lib.UX and lib.UX.attachTooltip then
        lib.UX:attachTooltip(checkbox, text, tooltip)
    end

    local finalY = yOffset and (yOffset - checkboxSpacing) or -checkboxSpacing
    return checkbox, finalY
end
