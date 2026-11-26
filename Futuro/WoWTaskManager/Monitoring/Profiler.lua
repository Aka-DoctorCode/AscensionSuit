--[[--------------------------------------------------------------------------
    WoW Task Manager - Monitoring/Profiler.lua

    Blizzard's own addon profiler (C_AddOnProfiler), as a data source.

    Why this exists next to Monitoring/CPU.lua
      * CPU.lua needs the scriptProfile CVar, which means a reload and a client
        that profiles every addon all the time. This is always on and needs
        neither.
      * It answers a different question. CPU.lua says "what share of a core did
        addon X use". This says what the CLIENT counted per profiler tick:
        the average, the worst tick, and HOW MANY ticks went over 1, 5, 10, 50
        and 100 ms - that last one is the number that points at hitches.
      * It also has a per-encounter average and "who was heaviest in the most
        recent tick", which is what a spike snapshot wants.

    Units
      Everything here is milliseconds per profiler tick, exactly as the client
      reports it. What a "tick" is the client does not document, so these
      figures are NEVER turned into a percentage of a core, and the UI labels
      them "ms/tick" and says where they come from.

    Cost
      Reads only. A handful of metric reads per loaded addon every couple of
      seconds, all inside one pcall; it is not one of the expensive calls
      (UpdateAddOnMemoryUsage / UpdateAddOnCPUUsage) that low-impact mode
      holds back.
----------------------------------------------------------------------------]]

local ADDON_NAME, WTM = ...

local C      = WTM.C
local Compat = WTM.Compat
local api    = Compat.api
local M      = Compat.ProfilerMetric

local Profiler = WTM:NewModule("Profiler")
WTM.Profiler = Profiler

Profiler.available = false
Profiler.reason = nil

Profiler.current = {
    overallRecent  = 0,    -- all user addons together, ms per tick, last 60 ticks
    overallSession = 0,
    overallPeak    = 0,
    overallOver5   = 0,    -- ticks over 5 ms, all addons together
    overallOver50  = 0,
    appRecent      = 0,    -- the whole application, not only the UI
    appPeak        = 0,
    ticksPerSecond = nil,
    sampledAt      = 0,
}

-- A ring for the graph on the profiler page.
Profiler.history = nil

local HISTORY_SIZE = 300

-- With nothing on screen the figures are read this rarely.
local HIDDEN_GAP_SEC = 10

--------------------------------------------------------------------------
-- Reading
--------------------------------------------------------------------------

local function ReadAddon(record)
    local get, name = api.ProfilerAddOnMetric, record.name
    record.profRecent    = get(name, M.Recent) or 0
    record.profSession   = get(name, M.Session) or 0
    record.profEncounter = get(name, M.Encounter) or 0
    record.profPeak      = get(name, M.Peak) or 0
    record.profOver1     = get(name, M.Over1) or 0
    record.profOver5     = get(name, M.Over5) or 0
    record.profOver10    = get(name, M.Over10) or 0
    record.profOver50    = get(name, M.Over50) or 0
    record.profOver100   = get(name, M.Over100) or 0
end

--- Reads every loaded addon. Blizzard's own modules cannot be queried; one
--- addon that errors is skipped rather than costing the others their reading.
local function SampleAll()
    local list = WTM.Processes.list
    for i = 1, #list do
        local record = list[i]
        if record.loaded and record.name:sub(1, 9) ~= "Blizzard_" then
            pcall(ReadAddon, record)
        end
    end

    local cur = Profiler.current
    if api.ProfilerOverallMetric then
        local get = api.ProfilerOverallMetric
        cur.overallRecent  = get(M.Recent) or 0
        cur.overallSession = get(M.Session) or 0
        cur.overallPeak    = get(M.Peak) or 0
        cur.overallOver5   = get(M.Over5) or 0
        cur.overallOver50  = get(M.Over50) or 0
    end
    if api.ProfilerApplicationMetric then
        local get = api.ProfilerApplicationMetric
        cur.appRecent = get(M.Recent) or 0
        cur.appPeak   = get(M.Peak) or 0
    end
end

function Profiler:Sample()
    if not self.available then return end

    -- Nothing on screen: far less often.
    local last = self.current.sampledAt
    if last > 0 and not WTM.Scheduler:IsBursting()
       and WTM.Scheduler:HeavyGate(last, HIDDEN_GAP_SEC, false) then
        return
    end

    local t0 = Compat.Now()
    if not pcall(SampleAll) then return end

    local cur = self.current
    cur.sampledAt = GetTime()
    cur.sampleCostMs = Compat.Now() - t0
    if self.history then self.history:Push(cur.overallRecent) end
    WTM:SendMessage("WTM_PROFILER_SAMPLED")
end

--------------------------------------------------------------------------
-- Queries
--------------------------------------------------------------------------

local FIELDS = {
    recent = "profRecent", session = "profSession", encounter = "profEncounter",
    peak = "profPeak", over1 = "profOver1", over5 = "profOver5", over10 = "profOver10",
    over50 = "profOver50", over100 = "profOver100",
}
Profiler.FIELDS = FIELDS

--- Addons ranked by one measurement ("recent", "peak", "over10", ...), into
--- `out`. Only addons with a value above zero are listed.
function Profiler:GetTop(out, limit, key)
    out = WTM.Scratch(out)
    if not self.available then return out end
    local field = FIELDS[key or "recent"] or "profRecent"
    local list = WTM.Processes.list
    for i = 1, #list do
        local record = list[i]
        if record.loaded and (record[field] or 0) > 0 then out[#out + 1] = record end
    end
    table.sort(out, function(a, b) return (a[field] or 0) > (b[field] or 0) end)
    if limit then for i = #out, limit + 1, -1 do out[i] = nil end end
    return out
end

--- Who was heaviest in the most recent profiler tick, straight from the client
--- (one call, no per-addon loop). Meant for the moment a spike is recorded.
--- Returns an array of { name, ms } or nil.
function Profiler:TopLastTick(count)
    if not (self.available and api.ProfilerTopK) then return nil end
    local ok, results = pcall(api.ProfilerTopK, M.Last, count or 5)
    if not ok or type(results) ~= "table" then return nil end
    local out = {}
    for i = 1, #results do
        local r = results[i]
        if type(r) == "table" and r.addOnName and (r.metricValue or 0) > 0 then
            out[#out + 1] = { name = r.addOnName, ms = r.metricValue }
        end
    end
    return out
end

--------------------------------------------------------------------------
-- Lifecycle
--------------------------------------------------------------------------

function Profiler:OnInitialize()
    self.history = WTM.RingBuffer.New(HISTORY_SIZE)
    self.available = WTM.Caps:Has("addonProfiler")
        and WTM.db.profile.profiler.enabled ~= false
    if not WTM.Caps:Has("addonProfiler") then
        self.reason = "This client has no C_AddOnProfiler."
    elseif WTM.db.profile.profiler.enabled == false then
        self.reason = "Switched off in Settings."
    end
end

function Profiler:OnEnable()
    if not self.available then return end
    local ticks = api.ProfilerTicksPerSecond and select(2, pcall(api.ProfilerTicksPerSecond))
    if type(ticks) == "number" then self.current.ticksPerSecond = ticks end

    WTM.Scheduler:Register("profiler", function() Profiler:Sample() end,
        2.0, 1.0, 0.55, "sampler")
    self:RegisterMessage("WTM_RESET_RUNTIME", "Reset")
    self:Sample()
end

function Profiler:Reset()
    local list = WTM.Processes.list
    for i = 1, #list do
        local record = list[i]
        for _, field in pairs(FIELDS) do record[field] = nil end
    end
    self.current.sampledAt = 0
    if self.history then self.history:Reset() end
end
