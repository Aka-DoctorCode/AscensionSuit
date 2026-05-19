-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Text.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-------------------------------------------------------------------------------
local MAJOR = "AscensionFactory"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

-------------------------------------------------------------------------------
-- 2. HEADER FACTORY
-------------------------------------------------------------------------------
-- Creates a stylized section header
function Context:createHeader(options)
    local styles = self.styles
    local parent = options.parent or UIParent

    local header = parent:CreateFontString(nil, "OVERLAY", styles.fonts.header)

    header:SetText(options.text)
    header:SetPoint(
        options.selfAnchorPoint or "TOPLEFT",
        parent,
        options.anchorToPoint or "TOPLEFT",
        options.xOffset or 0,
        options.yOffset or 0
    )
    header:SetTextColor(unpack(styles.colors.gold))
    header:SetShadowColor(unpack(options.shadowColor or styles.colors.surfaceDark))
    header:SetShadowOffset(2, -2)
    header:SetFont(options.fontFamily or "fonts/frizqt___cyr.ttf", options.fontSize or 24)

    local headerHeight = header:GetStringHeight() or 0
    local nextY = (options.yOffset or 0) - headerHeight - (options.spaceBelow or 0)

    return header, nextY
end

-------------------------------------------------------------------------------
-- 3. LABEL FACTORY
-------------------------------------------------------------------------------
-- Creates a standard text label
function Context:createLabel(options)
    local styles = self.styles
    local parent = options.parent or UIParent

    local label = parent:CreateFontString(nil, "OVERLAY", styles.fonts.label)

    label:SetText(options.text)
    label:SetPoint(
        options.selfAnchorPoint or "TOPLEFT",
        parent,
        options.anchorToPoint or "TOPLEFT",
        options.xOffset or 0,
        options.yOffset or 0
    )
    label:SetTextColor(unpack(styles.colors.white))
    label:SetShadowColor(unpack(options.shadowColor or styles.colors.black))
    label:SetShadowOffset(1, -1)
    label:SetFont(options.fontFamily or "fonts/frizqt___cyr.ttf", options.fontSize or 18)

    local labelHeight = label:GetStringHeight() or 0
    local nextY = (options.yOffset or 0) - labelHeight - (options.spaceBelow or 0)

    return label, nextY
end

-------------------------------------------------------------------------------
-- 4. PARAGRAPH FACTORY
-------------------------------------------------------------------------------
-- Creates a standard text paragraph
function Context:createParagraph(options)
    local styles = self.styles
    local parent = options.parent or UIParent

    local paragraph = parent:CreateFontString(nil, "OVERLAY", styles.fonts.text)

    paragraph:SetText(options.text)
    paragraph:SetPoint(
        options.selfAnchorPoint or "TOPLEFT",
        parent,
        options.anchorToPoint or "TOPLEFT",
        options.xOffset or 0,
        options.yOffset or 0
    )
    paragraph:SetTextColor(unpack(styles.colors.white))
    paragraph:SetFont(options.fontFamily or "fonts/frizqt___cyr.ttf", options.fontSize or 12)

    local paragraphHeight = paragraph:GetStringHeight() or 0
    local nextY = (options.yOffset or 0) - paragraphHeight - (options.spaceBelow or 0)

    return paragraph, nextY
end
