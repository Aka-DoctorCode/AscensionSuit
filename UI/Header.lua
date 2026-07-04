-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Header.lua
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
-- 2. HEADER FACTORY
-- -------------------------------------------------------------------------------
--- Creates a stylized section header with thick outline and custom color.
function Context:createHeader(args)
    local parent = args.parent
    local text = args.text
    local yOffset = args.yOffset
    local xOffset = args.xOffset
    local anchorFrame = args.anchorFrame

    -- Style Resolution
    local color = args.color
    if not color and self.styles and self.styles.colors then
        color = self.styles.colors.gold
    end
    local leftPadding = self.styles.dimensions.contentPadding or 16
    local actualX = xOffset or leftPadding

    -- FontString Creation
    local header = parent:CreateFontString(nil, "OVERLAY", self.styles.fonts.header)
    header:SetPoint("TOPLEFT", anchorFrame or parent, "TOPLEFT", actualX, yOffset)
    header:SetText(text)
    
    -- Customize font size and outline
    local fontPath, defaultSize, defaultFlags = header:GetFont()
    local finalSize = args.size or defaultSize
    local finalOutline = args.outline or "OUTLINE"
    header:SetFont(fontPath, finalSize, finalOutline)

    if color then
        header:SetTextColor(unpack(color))
    end

    -- Return next layout position
    local headerHeight = header:GetStringHeight() or 0
    local nextY = yOffset - headerHeight - 8

    return header, nextY
end
