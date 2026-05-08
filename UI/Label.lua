-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Label.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

function Context:createLabel(args)
    if not args or not args.parent or not args.text or not args.yOffset then 
        return nil, 0 
    end

    local parent = args.parent
    local text = args.text
    local yOffset = args.yOffset
    local xOffset = args.xOffset
    local anchorFrame = args.anchorFrame

    local color = args.color
    if not color and self.styles and self.styles.colors then
        color = self.styles.colors.textLight
    end
    local labelSpacing = self.styles.dimensions.labelSpacing or 16
    local actualX = xOffset or self.styles.dimensions.contentPadding or 16

    local label = parent:CreateFontString(nil, "OVERLAY", self.styles.fonts.label)
    label:SetPoint("TOPLEFT", anchorFrame or parent, "TOPLEFT", actualX, yOffset)
    label:SetText(text)
    
    local font, size, flags = label:GetFont()
    label:SetFont(font, size, "OUTLINE")
    
    if color then
        label:SetTextColor(unpack(color))
    end

    return label, yOffset - labelSpacing
end
