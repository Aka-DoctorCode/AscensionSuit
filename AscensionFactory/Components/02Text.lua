-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Text.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- Objective: Import the core AscensionFactory library and Context.
-- This ensures the UI elements can be built upon the existing framework.
-- Variables:
-- MAJOR (string): The namespace identifier for the addon library.
-- lib (table): The resolved library instance.
-- Context (table): The object factory table where creation methods are attached.
-------------------------------------------------------------------------------
local MAJOR = "AscensionFactory"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

-------------------------------------------------------------------------------
-- 2. HEADER FACTORY
-- Objective: Creates a stylized section header text element.
-- It acquires a FontString from the pool and sets custom fonts, shadows, and colors.
-- Variables:
-- options (table): Configuration table (text, anchors, offsets, colors, font details).
-- parent (table): The parent frame this header is attached to.
-- header (table): The allocated FontString UI element.
-- nextY (number): The calculated Y offset for the next element below this header.
-------------------------------------------------------------------------------
function Context:createHeader(options)
    local styles = self.styles
    local parent = options.parent or UIParent

    -- Acquire a FontString element from the pool.
    -- "FontString": The WoW UI object type specifically designed for rendering text.
    -- parent: The frame that this text will attach to.
    -- { ... }: Configuration table for positioning.
    local header = self:AcquireElement("FontString", parent, {
        text = options.text
    })

    header:SetTextColor(unpack(styles.colors.gold))
    header:SetShadowColor(unpack(options.shadowColor or styles.colors.surfaceDark))
    header:SetShadowOffset(2, -2)
    header:SetFont(options.fontFamily or "fonts/frizqt___cyr.ttf", options.fontSize or 24)

    return header
end

-------------------------------------------------------------------------------
-- 3. LABEL FACTORY
-- Objective: Creates a standard single-line text label for UI forms and descriptions.
-- It applies standard shadow styling and a base font size.
-- Variables:
-- options (table): Configuration table containing anchor data, text string, and optional styles.
-- parent (table): The container frame anchoring the label.
-- label (table): The created FontString instance.
-- nextY (number): The calculated Y coordinate for positioning the next element in layout flow.
-------------------------------------------------------------------------------
function Context:createLabel(options)
    local styles = self.styles
    local parent = options.parent or UIParent

    -- Acquire a FontString element from the pool.
    -- "FontString": The WoW UI object type for text rendering.
    -- parent: The frame container.
    local label = self:AcquireElement("FontString", parent, {
        text = options.text
    })

    label:SetTextColor(unpack(styles.colors.white))
    label:SetShadowColor(unpack(options.shadowColor or styles.colors.black))
    label:SetShadowOffset(1, -1)
    label:SetFont(options.fontFamily or "fonts/frizqt___cyr.ttf", options.fontSize or 18)

    return label
end

-------------------------------------------------------------------------------
-- 4. PARAGRAPH FACTORY
-- Objective: Creates a multi-line text block that automatically wraps words to fit.
-- Useful for long descriptions, tooltips, or instructions inside panels.
-- Variables:
-- options (table): Configuration table including a rightOffset to constrain wrap width.
-- parent (table): The container frame anchoring the text.
-- paragraph (table): The created FontString instance with SetWordWrap enabled.
-- nextY (number): Calculated Y offset after computing the total wrapped text height.
-------------------------------------------------------------------------------
function Context:createParagraph(options)
    local styles = self.styles
    local parent = options.parent or UIParent

    -- Acquire a FontString element from the pool.
    local paragraph = self:AcquireElement("FontString", parent, {
        text = options.text
    })

    if options.rightOffset then
        paragraph:SetPoint("RIGHT", parent, "RIGHT", options.rightOffset, 0)
    end
    paragraph:SetWordWrap(true)
    paragraph:SetJustifyH("LEFT")
    
    paragraph:SetTextColor(unpack(styles.colors.white))
    paragraph:SetFont(options.fontFamily or "fonts/frizqt___cyr.ttf", options.fontSize or 12)

    return paragraph
end
