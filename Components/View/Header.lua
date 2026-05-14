-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Header.lua
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
-- 2. HEADER FACTORY
-------------------------------------------------------------------------------
--- Creates a stylized section header with thick outline and custom color.
function Context:createHeader(options)
    local styles = self.styles
    local parent = options.parent
    local text = options.text
    
    -- Position Control
    local anchorFrame = options.anchorFrame
    local yOffset = options.yOffset or 0
    local xOffset = options.xOffset or 0

    -- Style Resolution
    local color = options.color or styles.colors.gold

    -- FontString Creation
    local header = parent:CreateFontString(nil, "OVERLAY", self.styles.fonts.header)
    header:SetPoint("TOPLEFT", anchorFrame or parent, "TOPLEFT", xOffset, yOffset)
    header:SetText(text)
    
    -- Customize font size and outline
    local fontPath, defaultSize, defaultFlags = header:GetFont()
    local finalSize = options.size or defaultSize
    local finalOutline = options.outline or "THICKOUTLINE"
    header:SetFont(fontPath, finalSize, finalOutline)

    if color then
        header:SetTextColor(unpack(color))
    end

    -- Return next layout position
    local headerHeight = header:GetStringHeight() or 0
    local nextY = yOffset - headerHeight - 8

    return header, nextY
end
