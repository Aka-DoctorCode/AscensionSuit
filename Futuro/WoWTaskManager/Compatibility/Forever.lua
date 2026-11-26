--[[--------------------------------------------------------------------------
    Compatibility/Forever.lua  --  World of Warcraft: Forever 1.60.x

    Blizzard's classic-progression client (game type "camelot", TOC suffix
    _Camelot / _Forever). It rides the classic version line but runs
    Mainline's UI and API surface, so this mirrors Retail rather than the
    Classic flavors.

    Nothing here assumes an API exists: every optional event and CVar is still
    probed by the generic layer (Core/Compat.lua), so a name that this client
    does not know is skipped instead of raising an error. Without this file the
    flavor fell back to "no module", which left markerEvents, knownCVars,
    unsupported and notes unset on this client only.
----------------------------------------------------------------------------]]

local ADDON_NAME, WTM = ...

local M = {}
WTM._flavorModules.forever = M

function M.Apply(Compat)
    Compat.markerEvents = {
        combat    = { "PLAYER_REGEN_DISABLED", "PLAYER_REGEN_ENABLED" },
        zone      = { "ZONE_CHANGED_NEW_AREA", "PLAYER_ENTERING_WORLD" },
        loading   = { "LOADING_SCREEN_ENABLED", "LOADING_SCREEN_DISABLED" },
        encounter = { "ENCOUNTER_START", "ENCOUNTER_END" },
        keystone  = { "CHALLENGE_MODE_START", "CHALLENGE_MODE_COMPLETED" },
    }

    Compat.knownCVars = {
        "maxFPS", "maxFPSBk", "targetFPS", "renderScale",
        "vsync", "gxMaxFrameLatency",
        "graphicsQuality", "gxWindowedResolution", "gxFullscreenResolution",
        "scriptProfile", "scriptErrors", "uiScale", "useUiScale",
    }

    Compat.unsupported = {}

    Compat.notes = "WoW: Forever: Mainline API surface. Addon CPU figures still require scriptProfile; "
        .. "marker events and CVars the client does not know are skipped automatically."
end
