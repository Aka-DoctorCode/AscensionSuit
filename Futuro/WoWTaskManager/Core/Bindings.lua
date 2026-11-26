--[[--------------------------------------------------------------------------
    WoW Task Manager - Core/Bindings.lua

    Key bindings. The binding list itself is Bindings.xml; this file supplies
    the labels the client's keybinding screen shows and the one global function
    the bindings call.

    The function is deliberately a plain global with a fixed set of actions and
    no way to run anything else: a binding is the one entry point into this
    addon from outside it, so it takes an action NAME, never code.
----------------------------------------------------------------------------]]

local ADDON_NAME, WTM = ...

_G.BINDING_HEADER_WOWTASKMANAGER = "WoW Task Manager"
_G.BINDING_NAME_WTM_TOGGLE_WINDOW     = "Open / close the window"
_G.BINDING_NAME_WTM_TOGGLE_MONITOR    = "Show / hide the compact monitor"
_G.BINDING_NAME_WTM_TOGGLE_RECORDING  = "Start / stop recording"
_G.BINDING_NAME_WTM_ADD_MARKER        = "Place a marker on the timeline"
_G.BINDING_NAME_WTM_OPEN_INCIDENTS    = "Open the Incidents page"
_G.BINDING_NAME_WTM_OPEN_LOCATIONS    = "Open the Locations page"

local ACTIONS = {
    window = function()
        if WTM.UI and WTM.UI.MainWindow then WTM.UI.MainWindow:Toggle() end
    end,
    monitor = function()
        if WTM.UI and WTM.UI.LiveMonitor then WTM.UI.LiveMonitor:Toggle() end
    end,
    recording = function()
        local now = WTM.Scheduler:SetSamplingEnabled(not WTM.Scheduler:IsRecording())
        WTM:Print(now and "Recording on." or "Recording off.")
    end,
    marker = function()
        WTM.Context:AddMarker("custom", "Marker (key)")
        WTM:Print("Marker placed.")
    end,
    incidents = function()
        if WTM.UI and WTM.UI.MainWindow then WTM.UI.MainWindow:Open("incidents") end
    end,
    locations = function()
        if WTM.UI and WTM.UI.MainWindow then WTM.UI.MainWindow:Open("locations") end
    end,
}
WTM.BindingActions = ACTIONS

function _G.WoWTaskManager_Bind(action)
    local fn = ACTIONS[action]
    -- Not initialised (or a duplicate copy that switched itself off): say
    -- nothing and do nothing rather than error on a key press.
    if not fn or WTM.duplicateOf or not WTM.state.initialized then return end
    local ok, err = pcall(fn)
    if not ok then geterrorhandler()(err) end
end
