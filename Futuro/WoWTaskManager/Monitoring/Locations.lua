--[[--------------------------------------------------------------------------
    WoW Task Manager - Monitoring/Locations.lua

    WHERE does the game run badly?

    Everything else in this addon answers "when" and "which addon". This answers
    "which place": per zone or instance, and per boss encounter, how many
    frames per second the client managed, how bad its worst frame was, how many
    stutters it had, and how that differs in combat.

    It costs one cheap task per second. Nothing here calls a client API that
    is expensive; it only reads figures the frame-time and network monitors
    already produced. The result is account-wide and persists between sessions,
    so "raids are where it hurts" shows up after a week of play, not after one
    evening.

    Honesty rules, same as the rest of the addon:
      * a place with under a minute of data is shown but never ranked,
      * loading screens and a client with no FPS reading add nothing,
      * simulated spikes (/wtm dev) are never counted.
----------------------------------------------------------------------------]]

local ADDON_NAME, WTM = ...

local C      = WTM.C
local Compat = WTM.Compat

local Locations = WTM:NewModule("Locations")
WTM.Locations = Locations

--- Below this much recorded time a place is listed but not ranked.
Locations.MIN_RANKED_SECONDS = 60

-- A task tick that arrives very late (after a freeze, a loading screen or a
-- suspended client) must not credit that whole gap to whatever zone happens to
-- be current.
local MAX_CREDIT_SECONDS = 5


--------------------------------------------------------------------------
-- Keys
--------------------------------------------------------------------------

--- Label and kind of wherever the player currently is.
---   kind: "instance" for dungeons / raids / battlegrounds / arenas, "world" otherwise.
function Locations:CurrentPlace()
    local s = WTM.Context.state
    if s.instanceType and s.instanceType ~= "none" then
        local label = s.instanceName or s.instanceType
        if s.difficulty and s.difficulty ~= "" then
            label = ("%s (%s)"):format(label, s.difficulty)
        end
        return label, s.instanceType
    end
    return s.zone or "Unknown zone", "world"
end

local function Store()
    local g = WTM.db.global
    -- Present in the defaults; the guards keep an old database from erroring.
    g.locations = g.locations or {}
    g.encounters = g.encounters or {}
    return g.locations, g.encounters
end

local function NewPlace(label, kind)
    return {
        label = label, kind = kind,
        seconds = 0, n = 0, sumFps = 0, minFps = nil, maxMs = 0,
        sumLat = 0, latN = 0,
        nCombat = 0, sumFpsCombat = 0,
        spikes = 0, firstAt = time(), lastAt = time(),
    }
end

--- Drops the least-played entry once the table is over its cap. Never drops
--- `keep`, which is the entry that was just touched.
local function Cap(tbl, limit, keep)
    local count = 0
    for _ in pairs(tbl) do count = count + 1 end
    while count > limit do
        local victimKey, victimSeconds
        for key, entry in pairs(tbl) do
            if entry ~= keep and (not victimSeconds or (entry.seconds or 0) < victimSeconds) then
                victimKey, victimSeconds = key, entry.seconds or 0
            end
        end
        if not victimKey then break end
        tbl[victimKey] = nil
        count = count - 1
    end
end

--------------------------------------------------------------------------
-- Entries
--------------------------------------------------------------------------

function Locations:GetPlace(label, kind, create)
    local places = Store()
    local entry = places[label]
    if not entry and create then
        entry = NewPlace(label, kind)
        places[label] = entry
        Cap(places, WTM.db.profile.locations.maxPlaces, entry)
    end
    return entry
end

local function EncounterKey(id, difficulty)
    return ("%s|%s"):format(tostring(id), tostring(difficulty or ""))
end

function Locations:GetEncounter(id, name, difficulty, instance, create)
    local _, encounters = Store()
    local key = EncounterKey(id, difficulty)
    local entry = encounters[key]
    if not entry and create then
        entry = {
            id = id, name = name or ("Encounter " .. tostring(id)),
            difficulty = difficulty, instance = instance,
            attempts = 0, seconds = 0, n = 0, sumFps = 0, minFps = nil,
            maxMs = 0, spikes = 0, lastAt = time(),
        }
        encounters[key] = entry
        Cap(encounters, WTM.db.profile.locations.maxEncounters, entry)
    end
    return entry
end

--------------------------------------------------------------------------
-- Sampling
--------------------------------------------------------------------------

local function Credit(entry, fps, frameMaxMs, delta, latency, inCombat)
    entry.seconds = entry.seconds + delta
    entry.n       = entry.n + 1
    entry.sumFps  = entry.sumFps + fps
    if not entry.minFps or fps < entry.minFps then entry.minFps = fps end
    if frameMaxMs > (entry.maxMs or 0) then entry.maxMs = frameMaxMs end
    entry.lastAt = time()

    if latency and latency > 0 and entry.sumLat ~= nil then
        entry.sumLat = entry.sumLat + latency
        entry.latN   = (entry.latN or 0) + 1
    end
    if inCombat and entry.nCombat ~= nil then
        entry.nCombat = entry.nCombat + 1
        entry.sumFpsCombat = entry.sumFpsCombat + fps
    end
end

function Locations:Sample(delta)
    if not WTM.db.profile.locations.enabled then return end

    local state = WTM.Context.state
    if state.loading then return end

    local current = WTM.FrameTime.current
    local fps = current.fps
    if not fps or fps <= 0 then return end

    if not delta or delta <= 0 then return end
    if delta > MAX_CREDIT_SECONDS then delta = MAX_CREDIT_SECONDS end

    local label, kind = self:CurrentPlace()
    local place = self:GetPlace(label, kind, true)
    local latency = WTM.Network and WTM.Network.current and WTM.Network.current.latencyWorld
    local inCombat = state.combat

    Credit(place, fps, current.maxMs or 0, delta, latency, inCombat)

    if state.encounterId then
        local encounter = self:GetEncounter(state.encounterId, state.encounter,
            state.difficulty, state.instanceName, true)
        Credit(encounter, fps, current.maxMs or 0, delta, nil, false)
    end
end

--------------------------------------------------------------------------
-- Events and messages
--------------------------------------------------------------------------

function Locations:OnEncounterStart(_, encounterId, encounterName)
    if not WTM.db.profile.locations.enabled or not encounterId then return end
    local state = WTM.Context.state
    local entry = self:GetEncounter(encounterId, encounterName, state.difficulty,
        state.instanceName, true)
    entry.attempts = entry.attempts + 1
    entry.name = encounterName or entry.name
    entry.lastAt = time()
end

function Locations:OnSpike(_, spike)
    if not WTM.db.profile.locations.enabled then return end
    if type(spike) ~= "table" or spike.simulated then return end

    local label, kind = self:CurrentPlace()
    local place = self:GetPlace(label, kind, true)
    place.spikes = place.spikes + 1

    local state = WTM.Context.state
    if state.encounterId then
        local encounter = self:GetEncounter(state.encounterId, state.encounter,
            state.difficulty, state.instanceName, true)
        encounter.spikes = encounter.spikes + 1
    end
end

--------------------------------------------------------------------------
-- Views
--------------------------------------------------------------------------

local function Average(sum, n)
    if not n or n <= 0 then return nil end
    return sum / n
end

--- Fills `out` (array) with one reusable row table per entry, derived figures
--- included. `kind` is "places" or "encounters". Rows are reused between calls
--- so a page that refreshes does not generate garbage.
function Locations:BuildView(kind, out, sortKey, ascending)
    local places, encounters = Store()
    local source = kind == "encounters" and encounters or places
    local count = 0

    for _, entry in pairs(source) do
        count = count + 1
        local row = out[count]
        if not row then row = {}; out[count] = row end

        row.entry     = entry
        row.name      = kind == "encounters" and entry.name or entry.label
        row.kind      = entry.kind
        row.detail    = kind == "encounters" and (entry.difficulty or "") or entry.kind
        row.instance  = entry.instance
        row.seconds   = entry.seconds or 0
        row.attempts  = entry.attempts or 0
        row.avgFps    = Average(entry.sumFps, entry.n)
        row.minFps    = entry.minFps
        row.combatFps = Average(entry.sumFpsCombat or 0, entry.nCombat)
        row.avgLat    = Average(entry.sumLat or 0, entry.latN)
        row.maxMs     = entry.maxMs or 0
        row.spikes    = entry.spikes or 0
        row.perHour   = row.seconds >= 60 and (row.spikes / (row.seconds / 3600)) or nil
        row.lastAt    = entry.lastAt or 0
        row.ranked    = row.seconds >= Locations.MIN_RANKED_SECONDS
    end
    for i = #out, count + 1, -1 do out[i] = nil end

    local keys = {
        name = function(r) return (r.name or ""):lower() end,
        seconds = function(r) return r.seconds end,
        fps = function(r) return r.avgFps or math.huge end,
        combat = function(r) return r.combatFps or math.huge end,
        worst = function(r) return r.maxMs end,
        spikes = function(r) return r.spikes end,
        perHour = function(r) return r.perHour or -1 end,
        latency = function(r) return r.avgLat or -1 end,
        attempts = function(r) return r.attempts end,
        recent = function(r) return r.lastAt end,
    }
    local get = keys[sortKey or "seconds"] or keys.seconds
    table.sort(out, function(a, b)
        local x, y = get(a), get(b)
        if x == y then return (a.name or "") < (b.name or "") end
        if ascending then return x < y end
        return x > y
    end)
    return out
end

--- The ranked place with the lowest average FPS (worst) and the highest (best).
--- Returns worst, best, rankedCount. Places under the minimum are ignored.
function Locations:Extremes()
    local places = Store()
    local worst, best, ranked = nil, nil, 0
    for _, entry in pairs(places) do
        if (entry.seconds or 0) >= Locations.MIN_RANKED_SECONDS and entry.n > 0 then
            ranked = ranked + 1
            local avg = entry.sumFps / entry.n
            if not worst or avg < worst.avg then worst = { entry = entry, avg = avg } end
            if not best or avg > best.avg then best = { entry = entry, avg = avg } end
        end
    end
    return worst, best, ranked
end

--- Combat vs not, across every place: the single most useful split. Returns
--- combatFps, calmFps (either may be nil when there is no data yet).
function Locations:CombatSplit()
    local places = Store()
    local sumCombat, nCombat, sumAll, nAll = 0, 0, 0, 0
    for _, entry in pairs(places) do
        sumCombat = sumCombat + (entry.sumFpsCombat or 0)
        nCombat   = nCombat + (entry.nCombat or 0)
        sumAll    = sumAll + (entry.sumFps or 0)
        nAll      = nAll + (entry.n or 0)
    end
    local nCalm = nAll - nCombat
    local calm = nCalm > 0 and (sumAll - sumCombat) / nCalm or nil
    return Average(sumCombat, nCombat), calm
end

function Locations:Count()
    local places, encounters = Store()
    local p, e = 0, 0
    for _ in pairs(places) do p = p + 1 end
    for _ in pairs(encounters) do e = e + 1 end
    return p, e
end

function Locations:Clear(kind)
    local places, encounters = Store()
    if kind ~= "encounters" then for k in pairs(places) do places[k] = nil end end
    if kind ~= "places" then for k in pairs(encounters) do encounters[k] = nil end end
    WTM:SendMessage("WTM_LOCATIONS_CLEARED", kind)
end

--------------------------------------------------------------------------
-- Lifecycle
--------------------------------------------------------------------------

function Locations:OnEnable()
    WTM.Scheduler:Register("locations", function(delta) Locations:Sample(delta) end,
        1.0, 1.0, 0.35, "sampler")
    self:RegisterEvent("ENCOUNTER_START", "OnEncounterStart")
    self:RegisterMessage("WTM_SPIKE", "OnSpike")
end

function Locations:OnDisable()
    self:UnregisterAllEvents()
end
