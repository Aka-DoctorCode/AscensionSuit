-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Input.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

function Context:createInput(args)
    if not args or not args.parent then return nil, 0 end

    local parent = args.parent
    local text = args.text
    local tooltip = args.tooltip
    local onEnterPressed = args.onEnterPressed
    local width = args.width
    local yOffset = args.yOffset or 0
    local xOffset = args.xOffset

    local actualX = xOffset or self.styles.dimensions.contentPadding or 16
    local actualWidth = width or 200

    local actualHeight = self.styles.dimensions.editBoxHeight or 28
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetSize(actualWidth, actualHeight)
    frame:SetPoint("TOPLEFT", actualX, yOffset - 4)

    local editBox = CreateFrame("EditBox", nil, frame, "BackdropTemplate")
    editBox:SetSize(actualWidth, actualHeight)
    editBox:SetPoint("TOPLEFT", 0, 0)
    editBox:SetAutoFocus(false)
    editBox:SetFontObject(self.styles.fonts.label)
    editBox:SetTextInsets(8, 8, 0, 0)

    editBox:SetBackdrop({
        bgFile = self.styles.files.bgFile,
        edgeFile = self.styles.files.edgeFile,
        edgeSize = 8,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })

    local styles = self.styles
    if styles.colors.surfaceHighlight then editBox:SetBackdropColor(unpack(styles.colors.surfaceHighlight)) end
    if styles.colors.blackDetail then editBox:SetBackdropBorderColor(unpack(styles.colors.blackDetail)) end

    editBox:SetScript("OnEnter", function(self)
        if not self:HasFocus() and styles.colors.primary then 
            self:SetBackdropColor(unpack(styles.colors.primary)) 
            self:SetBackdropBorderColor(unpack(styles.colors.textLight))
        end
    end)

    editBox:SetScript("OnLeave", function(self)
        if not self:HasFocus() then
            if styles.colors.surfaceHighlight then self:SetBackdropColor(unpack(styles.colors.surfaceHighlight)) end
            if styles.colors.blackDetail then self:SetBackdropBorderColor(unpack(styles.colors.blackDetail)) end
        end
    end)

    editBox:SetScript("OnEditFocusGained", function(self)
        if styles.colors.primary then self:SetBackdropBorderColor(unpack(styles.colors.primary)) end
        if styles.colors.surfaceDark then self:SetBackdropColor(unpack(styles.colors.surfaceDark)) end
    end)

    editBox:SetScript("OnEditFocusLost", function(self)
        if styles.colors.surfaceHighlight then self:SetBackdropColor(unpack(styles.colors.surfaceHighlight)) end
        if styles.colors.blackDetail then self:SetBackdropBorderColor(unpack(styles.colors.blackDetail)) end
    end)

    editBox:SetScript("OnEnterPressed", function(self)
        if onEnterPressed then onEnterPressed(self:GetText()) end
        self:ClearFocus()
    end)
    editBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)

    frame.editBox = editBox

    if tooltip and lib.UX and lib.UX.attachTooltip then
        lib.UX:attachTooltip(frame, text, tooltip)
    end

    return frame, yOffset - 34
end
