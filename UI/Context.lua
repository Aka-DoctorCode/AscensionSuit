-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Context.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

lib.DefaultStyles = {
    colors = {
        primary           = { 0.498, 0.075, 0.925, 1.0 },
        gold              = { 1.000, 0.800, 0.200, 1.0 },
        backgroundDark    = { 0.020, 0.020, 0.031, 0.95 },
        surfaceDark       = { 0.047, 0.039, 0.082, 1.0 },
        surfaceHighlight  = { 0.165, 0.141, 0.239, 1.0 },
        blackDetail       = { 0.0, 0.0, 0.0, 1.0 },
        whiteDetail       = { 1.0, 1.0, 1.0, 1.0 },
        textLight         = { 0.886, 0.910, 0.941, 1.0 },
        textDim           = { 0.580, 0.640, 0.720, 1.0 },
        sidebarBg         = { 0.10, 0.10, 0.10, 0.95 },
        sidebarHover      = { 0.20, 0.20, 0.20, 0.5 },
        sidebarAccent     = { 0.00, 0.48, 1.00, 0.95 },
        sidebarActive     = { 0.00, 0.40, 1.00, 0.2 },
        success           = { 0.062, 0.725, 0.505, 1.0 },
        warning           = { 0.960, 0.619, 0.043, 1.0 },
        error             = { 0.937, 0.266, 0.266, 1.0 },
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
        sidebarWidth       = 160,
        sidebarAccentWidth = 3,
        contentPadding     = 16,
        headerSpacing      = 32,
        labelSpacing       = 16,
        titleTop           = -16,
        titleLeft          = 16,
        tabWidth           = 144,
        tabHeight          = 30,
        tabSpacing         = 6,
        checkboxSize       = 36,
        checkboxSpacing    = 40,
        sliderWidth        = 160,
        sliderSpacing      = 56,
        dropdownWidth      = 160,
        dropdownHeight     = 48,
        colorPickerSize    = 24,
        colorPickerSpacing = 32,
        buttonHeight       = 24,
        editBoxHeight      = 28,
        backdropEdgeSize   = 8,
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

function lib:CreateContext(addonStyles)
    local styles = {}
    for k, v in pairs(lib.DefaultStyles) do
        if addonStyles and addonStyles[k] and type(v) == "table" and type(addonStyles[k]) == "table" then
            styles[k] = {}
            for sk, sv in pairs(v) do
                styles[k][sk] = addonStyles[k][sk] ~= nil and addonStyles[k][sk] or sv
            end
            -- Also include any extra keys from addonStyles that are not in defaults
            for sk, sv in pairs(addonStyles[k]) do
                if styles[k][sk] == nil then
                    styles[k][sk] = sv
                end
            end
        else
            styles[k] = (addonStyles and addonStyles[k] ~= nil) and addonStyles[k] or v
        end
    end

    local ctx = setmetatable({
        styles = styles,
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
