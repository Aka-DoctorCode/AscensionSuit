-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Draggable.lua
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
-- 2. MOVEMENT LOGIC
-- -------------------------------------------------------------------------------
--- Enables a frame to be moved by clicking and dragging with the left mouse button.
--- Optionally saves and loads the frame's position using a configuration table.
function UX:makeMovable(frame, config)
    if not frame then return end
    
    -- Setup Interaction
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    
    -- Drag Event Handlers
    frame:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)
    
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        
        -- Save coordinates if persistent config is provided
        if config then
            local point, _, relPoint, x, y = self:GetPoint()
            config.point = point
            config.relativePoint = relPoint
            config.x = x
            config.y = y
        end
    end)

    -- Load saved position if available
    if config and config.point then
        frame:ClearAllPoints()
        frame:SetPoint(config.point, _G.UIParent, config.relativePoint or config.point, config.x or 0, config.y or 0)
    end
end
