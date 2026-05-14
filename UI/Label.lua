-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Label.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-------------------------------------------------------------------------------
local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

-------------------------------------------------------------------------------
-- 2. LABEL FACTORY
-------------------------------------------------------------------------------
--- Creates a standardized text label with outline and custom color.
function Context:createLabel(options)
    if not options or not options.parent or not options.text or not options.yOffset then 
        return nil, 0 
    end

    local parent = options.parent
    local text = options.text
    local yOffset = options.yOffset
    local xOffset = options.xOffset
    local anchorFrame = options.anchorFrame

    -- Style Resolution
    local color = options.color
    if not color and self.styles and self.styles.colors then
        color = self.styles.colors.textLight
    end
    local labelSpacing = self.styles.dimensions.labelSpacing or 16
    local actualX = xOffset or self.styles.dimensions.contentPadding or 16

    -- FontString Creation
    local label = parent:CreateFontString(nil, "OVERLAY", self.styles.fonts.label)
    label:SetPoint("TOPLEFT", anchorFrame or parent, "TOPLEFT", actualX, yOffset)
    label:SetText(text)
    
    -- Customize font size and outline
    local fontPath, defaultSize, defaultFlags = label:GetFont()
    local finalSize = options.size or defaultSize
    local finalOutline = options.outline or "OUTLINE"
    label:SetFont(fontPath, finalSize, finalOutline)
    
    if color then
        label:SetTextColor(unpack(color))
    end

    return label, yOffset - labelSpacing
end
