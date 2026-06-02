------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Context.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-------------------------------------------------------------------------------
local MAJOR = "AscensionFactory"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

-------------------------------------------------------------------------------
-- 2. DEFAULT STYLES
-------------------------------------------------------------------------------
lib.DefaultStyles = lib.DefaultStyles or {
    colors = {
        -- Backgrounds Colors
        background      = {0.010,0.005,0.020,0.90},--#030105E6
        panelBackground = {0.010,0.005,0.020,0.50},--#03010580
        surfaceDark     = {0.040,0.035,0.060,0.90},--#0A090FE6
        surfaceLight    = {0.120,0.120,0.180,0.90},--#1F1F2EE6
        surfaceHover    = {0.180,0.180,0.260,0.90},--#2E2E42E6
        border          = {0.102,0.000,0.200,1.00},--#1A0033FF
        -- defaultBorder   = {0.235,0.035,0.424,1.00},--#3C096CFF
        -- defaultBorder   = {0.169,0.114,0.259,1.00},--#2B1D42FF
        -- Detail Colors
        primaryHover  = {0.263,0.380,0.933,1.00},--#4361EEFF

        -- accent        = {0.969,0.145,0.522,1.00},--#F72585FF
        -- accent        = {0.690,0.000,1.000,1.00},--#B000FFFF
        -- accent        = {0.855,0.439,0.839,1.00},--#DA70D6FF
        -- primary       = {0.416,0.051,0.678,1.00},--#6A0DADFF
        -- primary       = {0.616,0.306,0.867,1.00},--#9D4EDDFF
        -- primary       = {0.286,0.000,0.761,1.00},--#4900C2FF        
        -- primary       = {0.247,0.216,0.788,1.00},--#3F37C9FF
        -- primary       = {0.071,0.000,0.141,1.00},--#120024FF
        -- primaryActive = {0.627,0.125,0.941,1.00},--#A020F0FF
        -- primaryActive = {0.298,0.788,0.941,1.00},--#4CC9F0FF
        -- primaryActive = {0.545,0.243,1.000,1.00},--#8B3EFFFF
        -- primaryActive = {0.447,0.035,0.718,1.00},--#7209B7FF
        -- primaryActive = {0.235,0.000,0.400,1.00},--#3C0066FF
        -- primaryHover  = {0.710,0.090,0.620,1.00},--#B5179EFF
        -- primaryHover  = {0.380,0.000,1.000,1.00},--#6100FFFF
        -- primaryHover  = {0.141,0.000,0.275,1.00},--#240046FF
        -- primaryHover  = {0.541,0.169,0.886,1.00},--#8A2BE2FF
        -- Common Colors
        red             = {1.000,0.270,0.270,1.00},--#FF4545FF
        redHover        = {1.000,0.400,0.400,1.00},--#FF6666FF
        black           = {0.000,0.000,0.000,1.00},--#000000FF
        gold            = {0.930,0.730,0.120,1.00},--#EDBA1FFF
        white           = {1.000,1.000,1.000,1.00},--#FFFFFFFF
    },
    fonts = {
        header = "GameFontHighlightHuge",
        label  = "GameFontHighlightLarge",
        text   = "GameFontNormal",
    },
    textures = {
        background = "Interface\\ChatFrame\\ChatFrameBackground",
        flat       = "Interface\\Buttons\\WHITE8X8",
        edge       = "Interface\\Tooltips\\UI-Tooltip-Border",
        arrow      = "Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Up",
        spark      = "Interface\\CastingBar\\UI-CastingBar-Spark",
    }
}
