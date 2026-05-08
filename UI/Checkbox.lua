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

    local checkbox = CreateFrame("CheckButton", nil, parent, "BackdropTemplate")
    checkbox:SetSize(checkboxSize, checkboxSize)
    local actualX = xOffset or self.styles.dimensions.contentPadding or 16
    checkbox:SetPoint("TOPLEFT", parent, "TOPLEFT", actualX, yOffset or -16)

    -- Custom background
    checkbox:SetBackdrop({
        bgFile = self.styles.files.bgFile,
        edgeFile = self.styles.files.edgeFile,
        edgeSize = 8,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    if self.styles.colors.surfaceHighlight then checkbox:SetBackdropColor(unpack(self.styles.colors.surfaceHighlight)) end
    if self.styles.colors.blackDetail then checkbox:SetBackdropBorderColor(unpack(self.styles.colors.blackDetail)) end

    -- Custom Checkmark (Shown when checked)
    local check = checkbox:CreateTexture(nil, "OVERLAY")
    check:SetSize(checkboxSize - 8, checkboxSize - 8)
    check:SetPoint("CENTER")
    if self.styles.colors.primary then check:SetColorTexture(unpack(self.styles.colors.primary)) end
    checkbox:SetCheckedTexture(check)

    local label = checkbox:CreateFontString(nil, "OVERLAY", self.styles.fonts.label)
    label:SetPoint("LEFT", checkbox, "RIGHT", 2, 0)
    label:SetText(text or "")
    if labelColor then
        label:SetTextColor(unpack(labelColor))
    end

    -- Hover effect
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
        if styles.colors.surfaceHighlight then self:SetBackdropColor(unpack(styles.colors.surfaceHighlight)) end
        if labelColor then label:SetTextColor(unpack(labelColor)) end
    end)

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
