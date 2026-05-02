-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Button.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

function Context:createButton(args)
    if not args or not args.parent then return nil, 0 end

    local parent = args.parent
    local text = args.text
    local onClick = args.onClick
    local tooltip = args.tooltip
    local width = args.width
    local height = args.height
    local yOffset = args.yOffset or 0
    local xOffset = args.xOffset

    local actualX = xOffset or self.styles.dimensions.contentPadding or 16
    local actualWidth = width or 120
    local actualHeight = height or 28

    local btn = CreateFrame("Button", nil, parent, "BackdropTemplate")
    btn:SetSize(actualWidth, actualHeight)
    btn:SetPoint("TOPLEFT", actualX, yOffset)
    btn:SetFrameLevel(parent:GetFrameLevel() + 10)

    btn:SetBackdrop({
        bgFile = self.styles.files.bgFile,
        edgeFile = self.styles.files.edgeFile,
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    
    if self.styles.colors.surfaceHighlight then btn:SetBackdropColor(unpack(self.styles.colors.surfaceHighlight)) end
    if self.styles.colors.blackDetail then btn:SetBackdropBorderColor(unpack(self.styles.colors.blackDetail)) end

    local btnText = btn:CreateFontString(nil, "OVERLAY", self.styles.fonts.label)
    btnText:SetPoint("CENTER", 0, 0)
    btnText:SetText(text)
    if self.styles.colors.textLight then btnText:SetTextColor(unpack(self.styles.colors.textLight)) end
    btn.text = btnText

    local styles = self.styles
    btn:SetScript("OnEnter", function(self)
        if styles.colors.primary then self:SetBackdropColor(unpack(styles.colors.primary)) end
        if styles.colors.textLight then self:SetBackdropBorderColor(unpack(styles.colors.textLight)) end
    end)

    btn:SetScript("OnLeave", function(self)
        if styles.colors.surfaceHighlight then self:SetBackdropColor(unpack(styles.colors.surfaceHighlight)) end
        if styles.colors.blackDetail then self:SetBackdropBorderColor(unpack(styles.colors.blackDetail)) end
    end)

    btn:SetScript("OnMouseDown", function(self) self.text:SetPoint("CENTER", 1, -1) end)
    btn:SetScript("OnMouseUp", function(self) self.text:SetPoint("CENTER", 0, 0) end)
    btn:SetScript("OnClick", function() if onClick then onClick() end end)

    if tooltip and lib.UX and lib.UX.attachTooltip then 
        lib.UX:attachTooltip(btn, text, tooltip) 
    end

    return btn, yOffset - (actualHeight + 10)
end
