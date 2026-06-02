-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: PositionManager.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-- -------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- -------------------------------------------------------------------------------
local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

-- -------------------------------------------------------------------------------
-- 2. POSITION STORAGE HELPERS
-- -------------------------------------------------------------------------------
--- Initializes a position storage table in the global AscensionUIPositions registry.
--- Ensures that UI elements can persist their locations across sessions.
function lib:initPositionStorage(moduleKey, defaultTable)
    _G.AscensionUIPositions = _G.AscensionUIPositions or {}
    if not _G.AscensionUIPositions[moduleKey] then
        _G.AscensionUIPositions[moduleKey] = defaultTable or { point = "CENTER", x = 0, y = 0 }
    end
    return _G.AscensionUIPositions[moduleKey]
end

--- Updates a position table with a frame's current screen coordinates.
function lib:updatePositionFromFrame(frame, positionTable)
    if not frame or not positionTable then return end
    local point, _, relPoint, x, y = frame:GetPoint()
    positionTable.point = point
    positionTable.relativePoint = relPoint
    positionTable.x = x
    positionTable.y = y
end
