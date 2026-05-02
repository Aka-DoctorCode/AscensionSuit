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

    local frame = CreateFrame("Frame", nil, parent)
    frame:SetSize(actualWidth, 24)
    frame:SetPoint("TOPLEFT", actualX, yOffset - 4)

    local editBox = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
    editBox:SetSize(actualWidth, 20)
    editBox:SetPoint("TOPLEFT", 6, 0)
    editBox:SetAutoFocus(false)
    editBox:SetFontObject(self.styles.fonts.label)

    editBox:SetScript("OnEnterPressed", function(self)
        if onEnterPressed then onEnterPressed(self:GetText()) end
        self:ClearFocus()
    end)

    if tooltip and lib.UX and lib.UX.attachTooltip then
        lib.UX:attachTooltip(frame, text, tooltip)
    end

    return frame, yOffset - 34
end
