-------------------------------------------------------------------------------
-- Project: AscensionFactory
-- Author: Aka-DoctorCode
-- File: Core.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------

-- 1. INITIALIZATION
-------------------------------------------------------------------------------

local MAJOR, MINOR = "AscensionFactory", 1
local lib = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end

local Context = lib.Context or {}
if not lib.Context then lib.Context = Context end

-------------------------------------------------------------------------------

-- 2. CONTEXT OBJECT DEFINITION
-------------------------------------------------------------------------------
Context.__index = Context

-- Initializes a new Context instance for elements of the addon.
function lib:CreateContext()
    local uiContext = setmetatable({
        styles = lib.DefaultStyles,
        layoutModel = nil
    }, Context)

    if lib.LayoutModel then
        uiContext.layoutModel = lib.LayoutModel:new(uiContext)
    end
    
    return uiContext
end
