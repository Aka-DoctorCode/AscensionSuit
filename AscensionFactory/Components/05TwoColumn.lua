-------------------------------------------------------------------------------
-- Project: AscensionFactory
-- Author: Aka-DoctorCode
-- File: TwoColumnInterface.lua
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
-- 2. TWO COLUMN FACTORY
-- Objective: Creates a side-by-side split layout container for organizing UI elements.
-- Divides the parent width equally into a left and right frame.
-- Variables:
-- leftColumn (table): The created left-side frame container.
-- rightColumn (table): The created right-side frame container.
-- setBackground (function): Helper to optionally assign colored backgrounds to each column.
-------------------------------------------------------------------------------
function Context:createTwoColumns(options)
    local parent = options.parent or UIParent
    local yOffset = options.yOffset or 0
    local name = options.name or "TwoColumnLayout"
    local height = options.height

    -- Create the left side container frame and optionally name it.
    -- "Frame" is the basic empty UI container in WoW.
    -- parent: the frame this column belongs to.
    local leftColumn = self:AcquireElement("Frame", parent, {})
    if name then _G[name .. "Left"] = leftColumn end
    
    -- Anchor to the TOPLEFT of the parent, stretching to the middle (TOP).
    -- Leaves a 5 pixel margin on the left and right.
    leftColumn:SetPoint("TOPLEFT", parent, "TOPLEFT", 5, yOffset)
    leftColumn:SetPoint("TOPRIGHT", parent, "TOP", -5, yOffset)
    
    -- Create the right side container frame and optionally name it.
    local rightColumn = self:AcquireElement("Frame", parent, {})
    if name then _G[name .. "Right"] = rightColumn end
    
    -- Anchor to the TOP (middle) of the parent, stretching to the TOPRIGHT.
    rightColumn:SetPoint("TOPLEFT", parent, "TOP", 5, yOffset)
    rightColumn:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -5, yOffset)

    -- Helper utility to conditionally create an inner background texture layer.
    local function setBackground(frame, color)
        -- Acquire a "Texture" object directly, rendering on the "BACKGROUND" layer.
        local background = self:AcquireElement("Texture", frame, { drawLayer = "BACKGROUND" })
        background:SetAllPoints() -- Fill the column's entire area.
        if color then
            background:SetColorTexture(unpack(color))
        else
            background:SetColorTexture(0, 0, 0, 0)
        end
        frame.background = background
    end

    setBackground(leftColumn, options.leftBackgroundColor or options.backgroundColor)
    setBackground(rightColumn, options.rightBackgroundColor or options.backgroundColor)

    if height then
        leftColumn:SetHeight(height)
        rightColumn:SetHeight(height)
    else
        -- If no height provided, attach to the bottom of the parent
        leftColumn:SetPoint("BOTTOM", parent, "BOTTOM", 0, 0)
        rightColumn:SetPoint("BOTTOM", parent, "BOTTOM", 0, 0)
    end

    return leftColumn, rightColumn
end
