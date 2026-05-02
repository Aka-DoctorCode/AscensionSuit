-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Draggable.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local UX = lib.UX or {}
lib.UX = UX

---Makes a frame draggable and optionally saves its position to a config table.
---@param frame frame
---@param config table?
function UX:makeMovable(frame, config)
    if not frame then return end
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        if config then
            local point, _, relPoint, x, y = self:GetPoint()
            config.point = point
            config.relativePoint = relPoint
            config.x = x
            config.y = y
        end
    end)

    -- Load position if config exists
    if config and config.point then
        frame:ClearAllPoints()
        frame:SetPoint(config.point, _G.UIParent, config.relativePoint or config.point, config.x or 0, config.y or 0)
    end
end
