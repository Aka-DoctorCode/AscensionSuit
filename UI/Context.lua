-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Context.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-- -------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- -------------------------------------------------------------------------------
local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

-- -------------------------------------------------------------------------------
-- 2. DEFAULT STYLES
-- -------------------------------------------------------------------------------
lib.DefaultStyles = {
    colors = {
    -- primary         = { 0.300, 0.000, 0.400, 1.00 },--#4C0066FF
    -- sidebarAccent   = { 0.000, 0.480, 1.000, 0.95 },--#0078FFFF
    -- sidebarActive   = { 0.000, 0.400, 1.000, 0.20 },--#0066FF33
        -- Backgrounds Colors
        mainBackground  = {0.050,0.050,0.050,0.95},--#0D0D0DF2
        surfaceDark     = {0.150,0.150,0.150,0.90},--#262626E6
        surfaceLight    = {0.250,0.250,0.250,1.00},--#404040FF
        surfaceHover    = {0.250,0.250,0.250,0.60},--#40404099

        -- Detail Colors
        primary         = {0.200,0.000,0.500,1.00},--#330078FF
        primaryAlpha    = {0.750,0.500,0.980,0.15},--#BF80FA33
        sidebarAccent   = {0.400,0.075,0.925,0.90},--#6601F899
        sidebarActive   = {0.400,0.075,0.925,0.20},--#6601F833
        sidebarHover    = {0.400,0.000,0.925,0.80},--#6601F8CC
        redDetail       = {1.000,0.270,0.270,1.00},--#FF4444FF
        blackDetail     = {0.000,0.000,0.000,1.00},--#000000FF

        -- Text Colors
        gold            = {0.930,0.730,0.120,1.00},--#EDBA1FFF
        textLight       = {1.000,1.000,1.000,1.00},--#FFFFFFFF
    },
    files = {
        bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Buttons\\WHITE8X8", -- edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border"
        arrow    = "Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Up",
        close    = "Interface\\Buttons\\UI-Panel-CloseButton",
        maximize = "Interface\\Buttons\\ui-panel-hidebutton-up",
        minimize = "Interface\\Buttons\\ui-panel-hidebutton-disabled",
    },
    dimensions = {
        sidebarWidth       = 160, -- Width of the left navigation menu
        sidebarAccentWidth = 3,   -- Thickness of the sidebar selection indicator
        contentPadding     = 16,  -- Internal margin for layout containers
        headerSpacing      = 32,  -- Vertical gap between section headers
        labelSpacing       = 16,  -- Default spacing for text labels
        titleTop           = -16, -- Vertical offset for page titles
        titleLeft          = 16,  -- Horizontal offset for page titles
        tabWidth           = 144, -- Width of individual interface tabs
        tabHeight          = 30,  -- Height of individual interface tabs
        tabSpacing         = 6,   -- Horizontal gap between tabs
        checkboxSize       = 28,  -- Size of the square checkbox box
        checkboxSpacing    = 36,  -- Vertical space occupied by a checkbox entry
        sliderWidth        = 160, -- Width of the slider bar
        sliderSpacing      = 64,  -- Vertical space occupied by a slider group
        dropdownWidth      = 160, -- Default width for dropdown menus
        dropdownHeight     = 44,  -- Total vertical height for a dropdown entry
        colorPickerSize    = 22,  -- Size of the color selection preview box
        colorPickerSpacing = 28,  -- Vertical space occupied by a color picker
        buttonHeight       = 28,  -- Standard height for all interface buttons
        editBoxHeight      = 28,  -- Standard height for all text input fields
        backdropEdgeSize   = 8,   -- Border thickness for framed components
    },
    fonts = {
        header = "GameFontNormalHuge",
        label  = "GameFontHighlightLarge",
        desc   = "GameFontHighlightMedium",
    },
    textures = {
        bar   = "Interface\\Buttons\\WHITE8X8",
        spark = "Interface\\CastingBar\\UI-CastingBar-Spark",
    }
}

-- -------------------------------------------------------------------------------
-- 3. CONTEXT OBJECT DEFINITION
-- -------------------------------------------------------------------------------
local Context = {}
Context.__index = Context

--- Creates a specialized layout model within the context.
function Context:createLayoutModel(parent, startY)
    if lib.LayoutModel then
        return lib.LayoutModel:new(self, parent, startY)
    end
end

-- -------------------------------------------------------------------------------
-- 4. CONTEXT FACTORY
-- -------------------------------------------------------------------------------
--- Initializes a new Context instance for an addon.
function lib:CreateContext()
    local ctx = setmetatable({
        styles = lib.DefaultStyles,
        layoutModel = nil
    }, Context)

    if lib.LayoutModel then
        ctx.layoutModel = lib.LayoutModel:new(ctx)
    end
    
    return ctx
end

-- -------------------------------------------------------------------------------
-- 5. EXPORTS
-- -------------------------------------------------------------------------------
lib.Context = Context
