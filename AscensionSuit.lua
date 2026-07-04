-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: AscensionSuit.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-- -------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- -------------------------------------------------------------------------------
local MAJOR, MINOR = "AscensionSuit-UI", 2
local lib = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end

local Context = lib.Context or {}
if not lib.Context then lib.Context = Context end
