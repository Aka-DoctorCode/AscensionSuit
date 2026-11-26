--[[--------------------------------------------------------------------------
    WoW Task Manager - UI/Media.lua

    Optional texture files under Media/ (icons, card frames, glow, logo).

    Lua inside WoW cannot ask whether a file exists, and a texture path that
    points at nothing renders as a green square rather than failing. So the
    list below is the single source of truth for what ships, and
    tools/release-check.sh fails if it disagrees with the files on disk.

    Every caller must work without the file: Path() returns nil for anything
    not listed, and the caller falls back to its flat, file-free look.
----------------------------------------------------------------------------]]

local ADDON_NAME, WTM = ...

local UI = WTM.UI
local Media = {}
UI.Media = Media

local ROOT = "Interface\\AddOns\\" .. ADDON_NAME .. "\\Media\\"

-- One entry per file actually present, as "Folder/name" without extension,
-- e.g. ["UI/dot"] = true. Keep in sync with Media/ (release-check enforces it).
Media.PRESENT = {
    ["Icons/icon_profiler_active"]       = true,
    ["Icons/icon_profiler"]              = true,
    ["Icons/icon_locations_active"]      = true,
    ["Icons/icon_locations"]             = true,
    ["Empty/empty_collecting"]         = true,
    ["Empty/empty_no_errors"]          = true,
    ["Empty/empty_no_incidents"]       = true,
    ["Empty/empty_no_sessions"]        = true,
    ["Empty/empty_not_recording"]      = true,
    ["Empty/empty_profiling_off"]      = true,
    ["Empty/empty_unavailable"]        = true,
    ["Icons/icon_alerts"]              = true,
    ["Icons/icon_alerts_active"]       = true,
    ["Icons/icon_compare"]             = true,
    ["Icons/icon_compare_active"]      = true,
    ["Icons/icon_dashboard"]           = true,
    ["Icons/icon_dashboard_active"]    = true,
    ["Icons/icon_diagnostics"]         = true,
    ["Icons/icon_diagnostics_active"]  = true,
    ["Icons/icon_errors"]              = true,
    ["Icons/icon_errors_active"]       = true,
    ["Icons/icon_events"]              = true,
    ["Icons/icon_events_active"]       = true,
    ["Icons/icon_frames"]              = true,
    ["Icons/icon_frames_active"]       = true,
    ["Icons/icon_impact"]              = true,
    ["Icons/icon_impact_active"]       = true,
    ["Icons/icon_incidents"]           = true,
    ["Icons/icon_incidents_active"]    = true,
    ["Icons/icon_memory"]              = true,
    ["Icons/icon_memory_active"]       = true,
    ["Icons/icon_network"]             = true,
    ["Icons/icon_network_active"]      = true,
    ["Icons/icon_overview"]            = true,
    ["Icons/icon_overview_active"]     = true,
    ["Icons/icon_performance"]         = true,
    ["Icons/icon_performance_active"]  = true,
    ["Icons/icon_processes"]           = true,
    ["Icons/icon_processes_active"]    = true,
    ["Icons/icon_recording"]           = true,
    ["Icons/icon_recording_active"]    = true,
    ["Icons/icon_reports"]             = true,
    ["Icons/icon_reports_active"]      = true,
    ["Icons/icon_resources"]           = true,
    ["Icons/icon_resources_active"]    = true,
    ["Icons/icon_sessions"]            = true,
    ["Icons/icon_sessions_active"]     = true,
    ["Icons/icon_settings"]            = true,
    ["Icons/icon_settings_active"]     = true,
    ["Icons/icon_system"]              = true,
    ["Icons/icon_system_active"]       = true,
    ["Icons/icon_timeline"]            = true,
    ["Icons/icon_timeline_active"]     = true,
    ["Status/copy"]                    = true,
    ["Status/export"]                  = true,
    ["Status/eye"]                     = true,
    ["Status/eye_off"]                 = true,
    ["Status/filter"]                  = true,
    ["Status/library"]                 = true,
    ["Status/lock"]                    = true,
    ["Status/marker_combat"]           = true,
    ["Status/marker_encounter"]        = true,
    ["Status/marker_error"]            = true,
    ["Status/marker_keystone"]         = true,
    ["Status/marker_loading"]          = true,
    ["Status/marker_note"]             = true,
    ["Status/marker_zone"]             = true,
    ["Status/pin"]                     = true,
    ["Status/pin_off"]                 = true,
    ["Status/refresh"]                 = true,
    ["Status/search"]                  = true,
    ["Status/severity_freeze"]         = true,
    ["Status/severity_heavy"]          = true,
    ["Status/severity_minor"]          = true,
    ["Status/severity_stutter"]        = true,
    ["Status/sort_asc"]                = true,
    ["Status/sort_desc"]               = true,
    ["Status/status_crit"]             = true,
    ["Status/status_info"]             = true,
    ["Status/status_ok"]               = true,
    ["Status/status_paused"]           = true,
    ["Status/status_unavailable"]      = true,
    ["Status/status_warn"]             = true,
    ["Status/trash"]                   = true,
    ["Status/trend_down"]              = true,
    ["Status/trend_flat"]              = true,
    ["Status/trend_up"]                = true,
    ["UI/button_border"]               = true,
    ["UI/button_normal"]               = true,
    ["UI/button_primary_sheen"]        = true,
    ["UI/card_border"]                 = true,
    ["UI/card_fill"]                   = true,
    ["UI/card_shadow"]                 = true,
    ["UI/checkbox_off"]                = true,
    ["UI/checkbox_on"]                 = true,
    ["UI/close_x"]                     = true,
    ["UI/divider_fade"]                = true,
    ["UI/dot"]                         = true,
    ["UI/dropdown_chevron"]            = true,
    ["UI/glow"]                        = true,
    ["UI/logo_256"]                    = true,
    ["UI/logo_64"]                     = true,
    ["UI/logo_mono_256"]               = true,
    ["UI/minimap_icon"]                = true,
    ["UI/minimap_ring"]                = true,
    ["UI/nav_active_rule"]             = true,
    ["UI/nav_hover"]                   = true,
    ["UI/progress_fill"]               = true,
    ["UI/progress_track"]              = true,
    ["UI/radio_off"]                   = true,
    ["UI/radio_on"]                    = true,
    ["UI/scrollbar_thumb"]             = true,
    ["UI/scrollbar_track"]             = true,
    ["UI/slider_thumb"]                = true,
    ["UI/slider_track"]                = true,
    ["UI/sparkline_fade"]              = true,
    ["UI/spinner_01"]                  = true,
    ["UI/spinner_02"]                  = true,
    ["UI/spinner_03"]                  = true,
    ["UI/spinner_04"]                  = true,
    ["UI/spinner_05"]                  = true,
    ["UI/spinner_06"]                  = true,
    ["UI/spinner_07"]                  = true,
    ["UI/spinner_08"]                  = true,
    ["UI/tab_underline"]               = true,
    ["UI/tooltip_bg"]                  = true,
}

-- Shape bounds inside each texture, in texture pixels {width, height, left,
-- top, right, bottom}. The artwork keeps a transparent margin; a stretched
-- 9-slice has to start at the SHAPE, not at the file edge, or every widget
-- would come out a few pixels smaller than its frame.
Media.BOUNDS = {
    ["UI/button_normal"]           = { 64, 32, 2, 2, 62, 30 },
    ["UI/button_border"]           = { 64, 32, 2, 2, 62, 30 },
    ["UI/button_primary_sheen"]    = { 64, 32, 2, 2, 63, 26 },
    ["UI/card_fill"]               = { 64, 64, 4, 4, 60, 60 },
    ["UI/card_border"]             = { 64, 64, 4, 4, 60, 60 },
    ["UI/card_shadow"]             = { 64, 64, 1, 1, 63, 63 },
    ["UI/tooltip_bg"]              = { 64, 64, 10, 10, 54, 54 },
    ["UI/progress_track"]          = { 64, 16, 2, 3, 62, 13 },
    ["UI/progress_fill"]           = { 64, 16, 2, 3, 62, 13 },
    ["UI/slider_track"]            = { 64, 16, 4, 6, 60, 10 },
    ["UI/scrollbar_track"]         = { 16, 64, 6, 3, 10, 61 },
    ["UI/scrollbar_thumb"]         = { 16, 64, 5, 3, 11, 61 },
    ["UI/tab_underline"]           = { 64, 8, 4, 2, 60, 6 },
    ["UI/nav_active_rule"]         = { 8, 64, 0, 10, 3, 54 },
    ["UI/nav_hover"]               = { 64, 32, 0, 0, 59, 32 },
    ["UI/divider_fade"]            = { 256, 4, 4, 0, 252, 3 },
}

--- False when the user switched artwork off (/wtm art off, or Settings). Read
--- from the saved profile each time so the switch needs no extra bookkeeping;
--- the artwork is applied while a window is built, so it takes effect on the
--- next /reload. Before the database exists the answer is "on".
function Media.Enabled()
    local db = WTM.db
    local ui = db and db.profile and db.profile.ui
    return not (ui and ui.artwork == false)
end

--- Full texture path for "Folder/name", or nil when that file does not ship.
function Media.Path(name)
    if type(name) ~= "string" or not Media.PRESENT[name] then return nil end
    if not Media.Enabled() then return nil end
    return ROOT .. name:gsub("/", "\\") .. ".tga"
end

--- Points `texture` at a shipped file and tints it, or falls back to a flat
--- colour. Returns true when the file was used.
function Media.Apply(texture, name, r, g, b, a)
    local path = Media.Path(name)
    if path then
        texture:SetTexture(path)
        texture:SetVertexColor(r, g, b, a or 1)
        return true
    end
    texture:SetColorTexture(r, g, b, a or 1)
    return false
end
