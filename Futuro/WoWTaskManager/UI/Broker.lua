--[[--------------------------------------------------------------------------
    WoW Task Manager - UI/Broker.lua

    A LibDataBroker data source, so Titan Panel, ChocolateBar, Bazooka, ElvUI's
    data texts and the rest can show FPS and latency in a bar and open this
    addon from it.

    It only exists when LibDataBroker-1.1 is already loaded by something else:
    this addon does not ship the library and does nothing at all without it.
    The tooltip lists the heaviest addons, which is the question people look at
    a bar to ask.
----------------------------------------------------------------------------]]

local ADDON_NAME, WTM = ...

local Fmt = WTM.Format

local Broker = WTM:NewModule("Broker")
WTM.Broker = Broker

local OBJECT_NAME = "WoW Task Manager"
local FALLBACK_ICON = "Interface\\Icons\\INV_Misc_PocketWatch_01"
local TOP_N = 5

local function GetLibrary()
    local stub = _G.LibStub
    if type(stub) ~= "table" and type(stub) ~= "function" then return nil end
    local ok, lib = pcall(stub, "LibDataBroker-1.1", true)
    return ok and lib or nil
end

local function FpsColor(fps)
    if fps >= 55 then return "|cff3fb950" end
    if fps >= 30 then return "|cffd29922" end
    return "|cfff0533f"
end

--- Heaviest addons by `field`, written into a small array. Called only when the
--- tooltip opens, so the temporary table is fine.
local function Top(field, n)
    local list = {}
    for _, record in WTM.Processes:Iterate() do
        if record.loaded and (record[field] or 0) > 0 then list[#list + 1] = record end
    end
    table.sort(list, function(a, b) return (a[field] or 0) > (b[field] or 0) end)
    for i = #list, n + 1, -1 do list[i] = nil end
    return list
end

function Broker:BuildText()
    local frame = WTM.FrameTime.current
    local net = WTM.Network.current
    local fps = frame.fps or 0
    local text = ("%s%d|r fps"):format(FpsColor(fps), fps + 0.5)
    local latency = net and net.latencyWorld or 0
    if latency > 0 then text = text .. ("  %d ms"):format(latency) end
    return text
end

function Broker:Update()
    if self.object then self.object.text = self:BuildText() end
end

function Broker:FillTooltip(tooltip)
    local frame, mem, net = WTM.FrameTime.current, WTM.Memory.current, WTM.Network.current
    tooltip:AddLine("WoW Task Manager", 0.3, 0.55, 1)
    tooltip:AddDoubleLine("FPS", ("%.0f  (%.1f ms)"):format(frame.fps or 0, frame.avgMs or 0),
        0.6, 0.64, 0.72, 1, 1, 1)
    tooltip:AddDoubleLine("Latency", ("%d / %d ms"):format(net.latencyHome or 0, net.latencyWorld or 0),
        0.6, 0.64, 0.72, 1, 1, 1)
    tooltip:AddDoubleLine("Lua memory", Fmt.Memory(mem.luaKB or 0), 0.6, 0.64, 0.72, 1, 1, 1)

    if WTM.CPU.available then
        tooltip:AddLine(" ")
        tooltip:AddLine("Top CPU", 0.9, 0.91, 0.94)
        for _, record in ipairs(Top("cpuEma", TOP_N)) do
            tooltip:AddDoubleLine(Fmt.Truncate(record.titleClean or record.name, 28),
                ("%.2f %%"):format(record.cpuEma or 0), 0.6, 0.64, 0.72, 1, 1, 1)
        end
    end

    if not WTM.CPU.available and WTM.Profiler.available then
        tooltip:AddLine(" ")
        tooltip:AddLine("Top time per tick (Blizzard profiler)", 0.9, 0.91, 0.94)
        for _, record in ipairs(WTM.Profiler:GetTop(nil, TOP_N, "recent")) do
            tooltip:AddDoubleLine(Fmt.Truncate(record.titleClean or record.name, 28),
                ("%.2f ms"):format(record.profRecent or 0), 0.6, 0.64, 0.72, 1, 1, 1)
        end
    end

    tooltip:AddLine(" ")
    tooltip:AddLine("Top memory", 0.9, 0.91, 0.94)
    for _, record in ipairs(Top("memKB", TOP_N)) do
        tooltip:AddDoubleLine(Fmt.Truncate(record.titleClean or record.name, 28),
            Fmt.Memory(record.memKB or 0), 0.6, 0.64, 0.72, 1, 1, 1)
    end

    local errors = WTM.Errors:CountVisible()
    if errors > 0 then
        tooltip:AddLine(" ")
        tooltip:AddLine(("%d Lua error%s this session"):format(errors, errors == 1 and "" or "s"),
            0.94, 0.33, 0.25)
    end

    tooltip:AddLine(" ")
    tooltip:AddLine("Click: open window", 0.36, 0.4, 0.46)
    tooltip:AddLine("Right click: settings", 0.36, 0.4, 0.46)
    tooltip:AddLine("Shift click: compact monitor", 0.36, 0.4, 0.46)
end

function Broker:OnEnable()
    local lib = GetLibrary()
    self.available = lib ~= nil
    if not lib then return end

    local object = lib:GetDataObjectByName(OBJECT_NAME)
    if not object then
        object = lib:NewDataObject(OBJECT_NAME, {
            type  = "data source",
            label = "Task Manager",
            text  = "--",
            icon  = WTM.UI.Media.Path("UI/logo_64") or FALLBACK_ICON,
        })
    end
    self.object = object

    object.OnClick = function(_, button)
        if not WTM.UI.MainWindow then return end
        if button == "RightButton" then
            WTM.UI.MainWindow:Open("settings")
        elseif _G.IsShiftKeyDown and _G.IsShiftKeyDown() then
            if WTM.UI.LiveMonitor then WTM.UI.LiveMonitor:Toggle() end
        else
            WTM.UI.MainWindow:Toggle()
        end
    end
    object.OnTooltipShow = function(tooltip)
        local ok, err = pcall(Broker.FillTooltip, Broker, tooltip)
        if not ok then geterrorhandler()(err) end
    end

    -- The shared minimap button, when asked for and LibDBIcon is around.
    local icon = WTM.UI.MinimapButton and WTM.UI.MinimapButton:SharedLibrary()
    if icon and WTM.db.profile.minimap.shown ~= false then
        local settings = WTM.db.profile.minimap.dbicon
        settings.hide = false
        pcall(icon.Register, icon, OBJECT_NAME, object, settings)
    end

    -- Once a second, like the minimap button.
    WTM.Scheduler:Register("broker", function() Broker:Update() end, 1, 1, 0.8, "ui")
    self:Update()
end
