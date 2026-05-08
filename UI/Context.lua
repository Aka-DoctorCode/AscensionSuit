-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Context.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

    -- primary         = { 0.300, 0.000, 0.400, 1.00 },--#4C0066FF
    -- sidebarAccent   = { 0.000, 0.480, 1.000, 0.95 },--#0078FFFF
    -- sidebarActive   = { 0.000, 0.400, 1.000, 0.20 },--#0066FF33
    -- primaryAlpha    = { 0.750, 0.500, 0`.980, 0.15 },--#BF80FA33

lib.DefaultStyles = {
    colors = {
        -- backgrounds colors
        backgroundDark  = { 0.020, 0.020, 0.020, 0.95 },--#050505F2
        surfaceDark     = { 0.050, 0.040, 0.080, 1.00 },--#0D0A14FF
        surfaceHighlight= { 0.170, 0.140, 0.240, 1.00 },--#2B243DFF
        -- Details Colors
        primary         = { 0.750, 0.500, 0.980, 1.00 },--#BF80FAFF
        sidebarAccent   = { 0.400, 0.075, 0.925, 0.90 },--#6601F899
        sidebarActive   = { 0.400, 0.075, 0.925, 0.20 },--#6601F833
        sidebarHover    = { 0.200, 0.200, 0.200, 0.50 },--#33333380
        error           = { 1.000, 0.270, 0.270, 1.00 },--#FF4444FF
        blackDetail     = { 0.100, 0.100, 0.100, 1.00 },--#191919FF
        -- Text Colors
        gold            = { 0.930, 0.730, 0.120, 1.00 },--#EDBA1FFF
        textLight       = { 0.900, 0.900, 0.900, 1.00 },--#E6E6E6FF
    },
    files = {
        bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
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
        titleTop           = -16, -- Vertical oFFset for page titles
        titleLeft          = 16,  -- Horizontal oFFset for page titles
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

local Context = {}
Context.__index = Context

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


function Context:createLayoutModel(parent, startY)
    if lib.LayoutModel then
        return lib.LayoutModel:new(self, parent, startY)
    end
end

lib.Context = Context
