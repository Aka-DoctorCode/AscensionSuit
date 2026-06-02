-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Utilities.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-- -------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- -------------------------------------------------------------------------------
local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local UX = lib.UX or {}
lib.UX = UX

-- -------------------------------------------------------------------------------
-- 2. UI UTILITIES
-- -------------------------------------------------------------------------------
--- Hides all children and regions of a frame.
--- Primarily used for recycling UI panels or clearing content before a redraw.
function UX:cleanupContent(contentFrame)
    if not contentFrame then return end
    
    -- Hide all child frames
    if contentFrame.GetChildren then
        local children = { contentFrame:GetChildren() }
        for _, child in ipairs(children) do
            if child.Hide then
                child:Hide()
                child:ClearAllPoints()
            end
        end
    end
    
    -- Hide all regions (textures, fontstrings)
    if contentFrame.GetRegions then
        local regions = { contentFrame:GetRegions() }
        for _, region in ipairs(regions) do
            if region.Hide then
                region:Hide()
                region:ClearAllPoints()
            end
        end
    end
end
