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
        background      = {0.010,0.005,0.020,0.97},--#0500109F
        surfaceDark     = {0.040,0.035,0.060,1.00},--#0A090FFF
        surfaceLight    = {0.120,0.120,0.180,1.00},--#1F1F2EFF
        surfaceHover    = {0.180,0.180,0.260,1.00},--#2E2E42FF
        -- Detail Colors
        primary         = {0.165,0.102,0.302,1.00},--#2A1A4DFF
        primaryHover    = {0.250,0.150,0.450,1.00},--#402673FF
        primaryActive   = {0.298,0.165,0.522,0.80},--#4C2A85CC
        secondary       = {0.300,0.350,0.500,1.00},--#4C5980FF
        secondaryHover  = {0.380,0.440,0.620,1.00},--#61709EFF
        secondaryActive = {0.300,0.350,0.500,0.20},--#4C598033
        red             = {1.000,0.270,0.270,1.00},--#FF4444FF
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
