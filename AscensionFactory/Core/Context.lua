-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Context.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- Objective: Initialize the LayoutModel namespace and link it to the global AscensionFactory library.
-- Variables:
-- MAJOR: The namespace identifier for the addon library.
-------------------------------------------------------------------------------
local MAJOR = "AscensionFactory"
-- LibStub:GetLibrary retrieves the globally registered instance of our factory library.
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end -- Stop execution if the library wasn't found in memory.

-------------------------------------------------------------------------------
-- 2. DEFAULT STYLES
-- Objective: Define the central repository for all default UI rendering tokens (colors, fonts, textures).
-- Variables:
-------------------------------------------------------------------------------
-- DefaultStyles acts as the central repository for all UI rendering tokens.
lib.DefaultStyles = lib.DefaultStyles or {
    colors = {
        -- Backgrounds Colors
        background      = {0.010,0.005,0.020,0.90},--#030105E6
        panelBackground = {0.010,0.005,0.020,0.50},--#03010580
        surfaceDark     = {0.040,0.035,0.060,0.90},--#0A090FE6
        surfaceLight    = {0.120,0.120,0.180,0.90},--#1F1F2EE6
        surfaceHover    = {0.180,0.180,0.260,0.90},--#2E2E42E6
        border          = {0.102,0.000,0.200,1.00},--#1A0033FF
        -- Detail Colors
        primary         = {0.141,0.000,0.275,1.00},--#240046FF
        primaryHover    = {0.286,0.000,0.761,1.00},--#4900C2FF        
        primaryActive   = {0.169,0.114,0.259,1.00},--#2B1D42FF
        -- Common Colors
        red             = {1.000,0.270,0.270,1.00},--#FF4545FF
        redHover        = {1.000,0.400,0.400,1.00},--#FF6666FF
        black           = {0.000,0.000,0.000,1.00},--#000000FF
        gold            = {0.930,0.730,0.120,1.00},--#EDBA1FFF
        white           = {1.000,1.000,1.000,1.00},--#FFFFFFFF
    },
    -- Font paths map to default WoW global fonts.
    fonts = {
        -- Largest built-in font
        header = "GameFontHighlightHuge",  
        -- Medium built-in font
        label  = "GameFontHighlightLarge", 
        -- Small standard font
        text   = "GameFontNormal",         
    },
    -- Texture paths refer to internal WoW texture files used across the client.
    textures = {
        -- Standard solid white texture for tinting
        background = "Interface\\ChatFrame\\ChatFrameBackground", 
        -- Pure white 8x8 square for basic shapes
        flat       = "Interface\\Buttons\\WHITE8X8",
        -- Standard Blizzard tooltip border graphic
        edge       = "Interface\\Tooltips\\UI-Tooltip-Border", 
        -- Dropdown arrow icon
        arrow      = "Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Up", 
        -- Glowing spark used on sliders
        spark      = "Interface\\CastingBar\\UI-CastingBar-Spark", 
    }
}
