-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Checkbox.lua
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
-- 2. CHECKBOX FACTORY
-- -------------------------------------------------------------------------------
--- Creates a customized checkbox component with hover effects and state management.
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

    -- Base CheckButton
    local checkbox = CreateFrame("CheckButton", nil, parent, "BackdropTemplate")
    checkbox:SetSize(checkboxSize, checkboxSize)
    local actualX = xOffset or self.styles.dimensions.contentPadding or 16
    checkbox:SetPoint("TOPLEFT", parent, "TOPLEFT", actualX, yOffset or -16)

    -- Custom Backdrop Styling
    checkbox:SetBackdrop({
        bgFile = self.styles.files.bgFile,
        edgeFile = self.styles.files.edgeFile,
        edgeSize = 2,
        insets = { left = 2, right = 3, top = 2, bottom = 3 }
    })
    if self.styles.colors.surfaceLight then checkbox:SetBackdropColor(unpack(self.styles.colors.surfaceLight)) end
    if self.styles.colors.blackDetail then checkbox:SetBackdropBorderColor(unpack(self.styles.colors.blackDetail)) end

    -- Custom Checkmark
    local check = checkbox:CreateTexture(nil, "OVERLAY")
    check:SetSize(checkboxSize - 8, checkboxSize - 8)
    check:SetPoint("CENTER")
    if self.styles.colors.primary then check:SetColorTexture(unpack(self.styles.colors.primary)) end
    checkbox:SetCheckedTexture(check)

    -- Text Label
    local label = checkbox:CreateFontString(nil, "OVERLAY", self.styles.fonts.label)
    label:SetPoint("LEFT", checkbox, "RIGHT", 2, 0)
    label:SetText(text or "")
    if labelColor then
        label:SetTextColor(unpack(labelColor))
    end

    -- -------------------------------------------------------------------------------
    -- 3. EVENT HANDLERS
    -- -------------------------------------------------------------------------------
    local styles = self.styles
    checkbox:SetScript("OnEnter", function(self)
        if styles.colors.primary then 
            self:SetBackdropBorderColor(unpack(styles.colors.primary))
            local r, g, b = unpack(styles.colors.primary)
            self:SetBackdropColor(r, g, b, 0.3)
        end
        if label then label:SetTextColor(1, 1, 1) end
    end)

    checkbox:SetScript("OnLeave", function(self)
        if styles.colors.blackDetail then self:SetBackdropBorderColor(unpack(styles.colors.blackDetail)) end
        if styles.colors.surfaceLight then self:SetBackdropColor(unpack(styles.colors.surfaceLight)) end
        if labelColor then label:SetTextColor(unpack(labelColor)) end
    end)

    -- State Synchronization
    if getter then 
        checkbox:SetChecked(getter()) 
    end
    
    checkbox:SetScript("OnClick", function(self)
        if setter then setter(self:GetChecked()) end
    end)

    -- UX Integration
    if tooltip and lib.UX and lib.UX.attachTooltip then
        lib.UX:attachTooltip(checkbox, text, tooltip)
    end

    local finalY = yOffset and (yOffset - checkboxSpacing) or -checkboxSpacing
    return checkbox, finalY
end
