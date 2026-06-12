-------------------------------------------------------------------------------
-- Project: AscensionFactory
-- Author: Aka-DoctorCode
-- File: Core.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- Objective: Initialize the AscensionFactory library using LibStub and prepare the Context namespace.
-- Variables:
-- MAJOR: Name of the addon library.
-- MINOR: Version number of the library.
-- lib: Global shared library object provided by LibStub. It ensures that only the newest version of this library gets loaded globally.
-- Context: An Object factory table where state and creation methods reside.
-------------------------------------------------------------------------------

local MAJOR, MINOR = "AscensionFactory", 1
local lib = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end

local Context = lib.Context or {}
if not lib.Context then lib.Context = Context end

-------------------------------------------------------------------------------
-- 2. CONTEXT OBJECT DEFINITION
-- Objective: Define the core Context class that addons will instantiate to interact with AscensionFactory.
-- Variables:
-- uiContext: The newly created instance of the Context class.
-------------------------------------------------------------------------------
-- Setup Lua OOP inheritance. __index to itself means any new table created from this blueprint will automatically have access to all its functions.
Context.__index = Context

--- Initializes a new Context instance for elements of the addon.
--- @return table uiContext (The new context instance containing styles and a layout model)
function lib:CreateContext()
    -- Create a new table that inherits from the Context blueprint via setmetatable.
    local uiContext = setmetatable({
        -- Link the globally defined default color and font palettes.
        styles = lib.DefaultStyles,
        -- Placeholder for the dynamic positioning cursor engine.
        layoutModel = nil
    }, Context)

    -- If the LayoutModel class script has loaded, instantiate a new layout engine linked directly to this UI context.
    if lib.LayoutModel then
        uiContext.layoutModel = lib.LayoutModel:new(uiContext)
    end
    
    return uiContext
end
