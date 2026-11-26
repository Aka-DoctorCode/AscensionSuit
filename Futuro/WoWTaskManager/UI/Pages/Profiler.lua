--[[--------------------------------------------------------------------------
    WoW Task Manager - UI/Pages/Profiler.lua

    Blizzard's addon profiler, per addon: how long each addon took per profiler
    tick (recent average, session average, per-encounter average, the worst
    tick) and HOW MANY ticks went over 1, 5, 10, 50 and 100 ms.

    Always on and independent of the scriptProfile CVar. The unit is
    milliseconds per tick as the client reports it; the client does not say what
    a tick is, so nothing on this page is called a percentage.
----------------------------------------------------------------------------]]

local ADDON_NAME, WTM = ...

local C     = WTM.C
local UI    = WTM.UI
local Theme = UI.Theme
local T     = Theme.Get
local M     = Theme.metrics
local Fmt   = WTM.Format

local Page = UI.RegisterPage("profiler", {})

local viewData = {}
local REBUILD_EVERY_SEC = 1.5

--------------------------------------------------------------------------
-- Columns
--------------------------------------------------------------------------

local function ms(value) return ("%.2f"):format(value or 0) end

local function countText(value)
    value = value or 0
    return value > 0 and Fmt.Comma(value) or "-"
end

local function msTone(value)
    value = value or 0
    if value >= 5 then return "crit" end
    if value >= 1 then return "warn" end
    if value <= 0 then return "muted" end
    return nil
end

local COLUMNS = {
    { key = "name", title = "Addon", flex = 3, sort = "name",
      value = function(record) return record.titleClean or record.name end,
      tooltip = "Every loaded addon the client's profiler reports on. Blizzard's own modules cannot be queried." },
    { key = "recent", title = "Recent", width = 76, justify = "RIGHT", sort = "recent",
      value = function(record) return ms(record.profRecent) end,
      tone = function(record) return msTone(record.profRecent) end,
      bar = function(record) return (record.profRecent or 0) / 5, msTone(record.profRecent) or "accent" end,
      tooltip = "Average time this addon took per profiler tick over the last 60 ticks, in milliseconds." },
    { key = "session", title = "Session", width = 76, justify = "RIGHT", sort = "session",
      value = function(record) return ms(record.profSession) end,
      tone = function() return "muted" end,
      tooltip = "Average per tick since login or reload. Less twitchy than Recent." },
    { key = "encounter", title = "Boss fight", width = 84, justify = "RIGHT", sort = "encounter",
      value = function(record) return ms(record.profEncounter) end,
      tone = function() return "muted" end,
      tooltip = "Average per tick over the last boss encounter. Compare it with Session to see what fighting costs this addon." },
    { key = "peak", title = "Worst tick", width = 84, justify = "RIGHT", sort = "peak",
      value = function(record) return ms(record.profPeak) end,
      tone = function(record)
          local peak = record.profPeak or 0
          if peak >= 50 then return "crit" end
          if peak >= 10 then return "warn" end
          return "muted"
      end,
      tooltip = "The single longest tick this addon caused since login or reload. A high value with a low average is a hitch, not a steady cost." },
    { key = "over5", title = "> 5 ms", width = 66, justify = "RIGHT", sort = "over5",
      value = function(record) return countText(record.profOver5) end,
      tone = function(record) return (record.profOver5 or 0) > 0 and "warn" or "muted" end,
      tooltip = "Ticks in which this addon alone took more than 5 ms." },
    { key = "over10", title = "> 10 ms", width = 66, justify = "RIGHT", sort = "over10",
      value = function(record) return countText(record.profOver10) end,
      tone = function(record) return (record.profOver10 or 0) > 0 and "warn" or "muted" end,
      tooltip = "Ticks over 10 ms. On a 60 FPS client a tick this long is a dropped frame." },
    { key = "over50", title = "> 50 ms", width = 66, justify = "RIGHT", sort = "over50",
      value = function(record) return countText(record.profOver50) end,
      tone = function(record) return (record.profOver50 or 0) > 0 and "crit" or "muted" end,
      tooltip = "Ticks over 50 ms - a visible stutter. This is the column that points at the addon causing them." },
    { key = "over100", title = "> 100 ms", width = 74, justify = "RIGHT", sort = "over100",
      value = function(record) return countText(record.profOver100) end,
      tone = function(record) return (record.profOver100 or 0) > 0 and "crit" or "muted" end,
      tooltip = "Ticks over 100 ms - a freeze." },
}

local SORT_FIELD = {
    recent = "profRecent", session = "profSession", encounter = "profEncounter", peak = "profPeak",
    over5 = "profOver5", over10 = "profOver10", over50 = "profOver50", over100 = "profOver100",
}

--------------------------------------------------------------------------
-- Build
--------------------------------------------------------------------------

function Page:Build(frame)
    local pad = M.padding
    self.sortKey, self.sortAsc = "recent", false

    ------------------------------------------------------------------
    -- Top row: totals, graph
    ------------------------------------------------------------------
    local top = CreateFrame("Frame", nil, frame)
    top:SetHeight(Theme:ScaleText(124))
    top:SetPoint("TOPLEFT", pad, -pad)
    top:SetPoint("TOPRIGHT", -pad, -pad)
    self.top = top

    self.totals = UI.StatCard(top, "ALL ADDONS TOGETHER", {
        "Recent", "Session", "Worst tick", "Ticks > 5 ms", "Ticks > 50 ms",
    })
    self.totals:SetPoint("TOPLEFT")
    self.totals:SetPoint("BOTTOMLEFT")
    self.totals:SetWidth(250)

    self.app = UI.StatCard(top, "WHOLE APPLICATION", { "Recent", "Worst tick", "Ticks per second" })
    self.app:SetPoint("TOPRIGHT")
    self.app:SetPoint("BOTTOMRIGHT")
    self.app:SetWidth(240)

    self.graph = UI.Graph(top, {
        title = "ALL ADDONS - ms PER TICK",
        valueFormat = function(v) return ("%.2f ms"):format(v) end,
        minRange = 0.5,
    })
    self.graph:SetPoint("TOPLEFT", self.totals, "TOPRIGHT", M.cardGap, 0)
    self.graph:SetPoint("BOTTOMRIGHT", self.app, "BOTTOMLEFT", -M.cardGap, 0)
    self.series = { values = {}, times = {} }

    ------------------------------------------------------------------
    -- Toolbar
    ------------------------------------------------------------------
    local toolbar = CreateFrame("Frame", nil, frame)
    toolbar:SetHeight(28)
    toolbar:SetPoint("TOPLEFT", top, "BOTTOMLEFT", 0, -10)
    toolbar:SetPoint("TOPRIGHT", top, "BOTTOMRIGHT", 0, -10)
    self.toolbar = toolbar

    self.search = UI.SearchBox(toolbar, "Search addons", function(text)
        self.filter = text
        self:Rebuild()
    end)
    self.search:SetPoint("LEFT")
    self.search:SetWidth(220)

    self.hitchOnly = false
    self.hitchButton = UI.Button(toolbar, "Only addons with hitches", function(button)
        self.hitchOnly = not self.hitchOnly
        button:SetSelected(self.hitchOnly)
        self:Rebuild()
    end, { height = 24, icon = false })
    self.hitchButton:SetPoint("LEFT", self.search, "RIGHT", 8, 0)
    self.hitchButton.tooltip = "Hides addons that never had a tick over 10 ms."

    self.summary = UI.Text(toolbar, "small", "textMuted", "RIGHT")
    self.summary:SetPoint("RIGHT")
    self.summary:SetPoint("LEFT", self.hitchButton, "RIGHT", 12, 0)

    ------------------------------------------------------------------
    -- Table
    ------------------------------------------------------------------
    self.table = UI.Table(frame, COLUMNS, {
        defaultSort = "recent",
        emptyMessage = "Nothing reported yet. The first reading arrives within a couple of seconds.",
        emptyArt = "empty_collecting",
        onSort = function(key, ascending)
            self.sortKey, self.sortAsc = key, ascending
            self:Rebuild()
        end,
        onRowClick = function(record)
            if UI.AddonDetail and record then UI.AddonDetail:Open(record) end
        end,
    })

    self.note = UI.Text(frame, "tiny", "textMuted", "LEFT")
    self.note:SetPoint("BOTTOMLEFT", pad, pad)
    self.note:SetPoint("BOTTOMRIGHT", -pad, pad)
    self.note:SetHeight(Theme:ScaleText(26))
    UI.Wrap(self.note, 2)
    self.note:SetText(
        "Figures are milliseconds per profiler tick, as Blizzard's profiler reports them - always on, no reload, no scriptProfile. " ..
        "The client does not say what a tick is, so they are not converted into a percentage of a core. Click a row for the addon's detail.")

    ------------------------------------------------------------------
    -- Unavailable
    ------------------------------------------------------------------
    self.unavailable = UI.EmptyState(frame, "", "empty_unavailable")
    self.unavailable:SetAllPoints(frame)
    self.unavailable:Hide()

    self:LayoutTable()
end

function Page:LayoutTable()
    local pad = M.padding
    self.table:ClearAllPoints()
    self.table:SetPoint("TOPLEFT", self.toolbar, "BOTTOMLEFT", 0, -8)
    self.table:SetPoint("BOTTOMRIGHT", self.frame, "BOTTOMRIGHT", -pad, pad + Theme:ScaleText(30))
    self.table.LayoutHeader()
end

function Page:OnLayout() if self.table then self:LayoutTable() end end
function Page:OnShow() self:Rebuild(true); self:Refresh() end

--------------------------------------------------------------------------
-- Data
--------------------------------------------------------------------------

local function Matches(record, filter)
    if not filter or filter == "" then return true end
    filter = filter:lower()
    return ((record.titleClean or ""):lower():find(filter, 1, true) ~= nil)
        or (record.name:lower():find(filter, 1, true) ~= nil)
end

function Page:Rebuild(force)
    if not self.table then return end
    local now = GetTime()
    if not force and self.lastRebuild and (now - self.lastRebuild) < REBUILD_EVERY_SEC then
        self.table:Refresh()
        return
    end
    self.lastRebuild = now

    for i = #viewData, 1, -1 do viewData[i] = nil end
    local list = WTM.Processes.list
    for i = 1, #list do
        local record = list[i]
        if record.loaded and record.profRecent ~= nil and Matches(record, self.filter)
           and (not self.hitchOnly or (record.profOver10 or 0) > 0) then
            viewData[#viewData + 1] = record
        end
    end

    local field = SORT_FIELD[self.sortKey]
    local ascending = self.sortAsc
    table.sort(viewData, function(a, b)
        if field then
            local x, y = a[field] or 0, b[field] or 0
            if x ~= y then
                if ascending then return x < y end
                return x > y
            end
        end
        local nameA, nameB = (a.titleClean or a.name):lower(), (b.titleClean or b.name):lower()
        if field == nil and ascending then return nameA > nameB end
        return nameA < nameB
    end)

    self.table:SetData(viewData)
    self.table:SetEmpty(#viewData == 0)
end

function Page:Refresh()
    if not self.table then return end
    local profiler = WTM.Profiler

    local ok = profiler.available
    self.unavailable:SetShown(not ok)
    if not ok then
        self.unavailable:SetMessage(("Blizzard's addon profiler is not available here.\n\n%s")
            :format(profiler.reason or WTM.C.TXT_UNAVAILABLE_CLIENT))
        return
    end

    local cur = profiler.current
    self.totals:Set("Recent", ms(cur.overallRecent) .. " ms")
    self.totals:Set("Session", ms(cur.overallSession) .. " ms")
    self.totals:Set("Worst tick", ms(cur.overallPeak) .. " ms", cur.overallPeak >= 50 and "crit" or (cur.overallPeak >= 10 and "warn" or nil))
    self.totals:Set("Ticks > 5 ms", Fmt.Comma(cur.overallOver5 or 0), (cur.overallOver5 or 0) > 0 and "warn" or "muted")
    self.totals:Set("Ticks > 50 ms", Fmt.Comma(cur.overallOver50 or 0), (cur.overallOver50 or 0) > 0 and "crit" or "muted")

    self.app:Set("Recent", ms(cur.appRecent) .. " ms")
    self.app:Set("Worst tick", ms(cur.appPeak) .. " ms")
    self.app:Set("Ticks per second", cur.ticksPerSecond and Fmt.Comma(cur.ticksPerSecond) or "-", "muted")

    self:Rebuild()

    self.summary:SetText(UI.FitText(self.summary, ("%d addons reported  -  last reading %s")
        :format(#viewData, cur.sampledAt > 0 and Fmt.Ago(GetTime() - cur.sampledAt) or "never")))

    if UI.MainWindow:ShouldRedrawGraphs() and UI.MainWindow:TakeGraphSlot(1, 1) then
        local history = profiler.history
        local values, times = self.series.values, self.series.times
        local count = history and math.min(history.count or 0, 240) or 0
        for i = #values, count + 1, -1 do values[i] = nil; times[i] = nil end
        local now = GetTime()
        local interval = 2
        for i = 1, count do
            values[i] = history:Get((history.count or count) - count + i) or 0
            times[i] = now - (count - i) * interval
        end
        self.graph:SetSeries(1, values, times, { label = "ms per tick", colorIndex = 3 })
        self.graph:SetTimeRange(now - math.max(1, count - 1) * interval, now)
        self.graph.dirty = true
        self.graph:Draw()
    end
end
