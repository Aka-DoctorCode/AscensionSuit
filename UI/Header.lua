-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Header.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

function Context:createHeader(args)
    if not args or not args.parent or not args.text or not args.yOffset then 
        return nil, 0 
    end

    local parent = args.parent
    local text = args.text
    local yOffset = args.yOffset
    local color = args.color or self.styles.colors.gold
    local leftPadding = self.styles.dimensions.contentPadding or 16

    local header = parent:CreateFontString(nil, "OVERLAY", self.styles.fonts.header)
    header:SetPoint("TOPLEFT", leftPadding, yOffset)
    header:SetText(text)
    
    if color then
        header:SetTextColor(unpack(color))
    end

    local headerHeight = header:GetStringHeight() or 0
    local nextY = yOffset - headerHeight - 8

    return header, nextY
end
