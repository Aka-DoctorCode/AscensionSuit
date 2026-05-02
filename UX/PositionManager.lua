-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: PositionManager.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

---Initializes a position storage table in the global AscensionUIPositions.
---@param moduleKey string The key for the module (e.g. "AscensionSound")
---@param defaultTable table The default position table {point, relativePoint, x, y}
function lib:initPositionStorage(moduleKey, defaultTable)
    _G.AscensionUIPositions = _G.AscensionUIPositions or {}
    if not _G.AscensionUIPositions[moduleKey] then
        _G.AscensionUIPositions[moduleKey] = defaultTable or { point = "CENTER", x = 0, y = 0 }
    end
    return _G.AscensionUIPositions[moduleKey]
end

---Updates a position table from a frame's current coordinates.
---@param frame frame The frame to get coordinates from
---@param positionTable table The table to update
function lib:updatePositionFromFrame(frame, positionTable)
    if not frame or not positionTable then return end
    local point, _, relPoint, x, y = frame:GetPoint()
    positionTable.point = point
    positionTable.relativePoint = relPoint
    positionTable.x = x
    positionTable.y = y
end
