--[[--------------------------------------------------------------------------
    WoW Task Manager - UI/Pages/Locations.lua

    Where the game runs badly: performance by zone / instance, and by boss
    encounter. Data comes from Monitoring/Locations.lua and persists between
    sessions, so the picture gets truer the longer the addon runs.
----------------------------------------------------------------------------]]

local ADDON_NAME, WTM = ...

local C     = WTM.C
local UI    = WTM.UI
local Theme = UI.Theme
local T     = Theme.Get
local M     = Theme.metrics
local Fmt   = WTM.Format

local Page = UI.RegisterPage("locations", {})

local REFRESH_EVERY_SEC = 2

local placeRows, encounterRows = {}, {}

--------------------------------------------------------------------------
-- Columns
--------------------------------------------------------------------------

local function fpsTone(fps)
    if not fps then return "muted" end
    if fps < 30 then return "crit" end
    if fps < 50 then return "warn" end
    return nil
end

local function worstTone(ms)
    if ms >= 250 then return "crit" end
    if ms >= 100 then return "warn" end
    return "muted"
end

local function fpsText(fps) return fps and ("%.0f"):format(fps) or "-" end

local PLACE_COLUMNS = {
    { key = "name", title = "Place", flex = 3, sort = "name",
      value = function(row) return row.name end,
      tone = function(row) return row.ranked and nil or "muted" end,
      tooltip = "Zone or instance (with its difficulty). Places with under a minute of data are shown greyed out and are not ranked." },
    { key = "kind", title = "Type", width = 84,
      value = function(row) return row.kind == "world" and "World" or "Instance" end,
      tone = function() return "muted" end },
    { key = "seconds", title = "Time", width = 84, justify = "RIGHT", sort = "seconds",
      value = function(row) return Fmt.Duration(row.seconds) end,
      tone = function() return "muted" end,
      tooltip = "Time recorded here, across every session." },
    { key = "fps", title = "Avg FPS", width = 80, justify = "RIGHT", sort = "fps",
      value = function(row) return fpsText(row.avgFps) end,
      tone = function(row) return row.ranked and fpsTone(row.avgFps) or "muted" end,
      bar = function(row) return (row.avgFps or 0) / 144, fpsTone(row.avgFps) or "accent" end,
      tooltip = "Mean of the once-a-second FPS readings taken here." },
    { key = "combat", title = "In combat", width = 84, justify = "RIGHT", sort = "combat",
      value = function(row) return fpsText(row.combatFps) end,
      tone = function(row) return row.ranked and fpsTone(row.combatFps) or "muted" end,
      tooltip = "Average FPS while in combat in this place. The gap to Avg FPS is what fighting costs you here." },
    { key = "low", title = "Lowest", width = 70, justify = "RIGHT",
      value = function(row) return fpsText(row.minFps) end,
      tone = function() return "muted" end,
      tooltip = "The lowest once-a-second FPS reading seen here." },
    { key = "worst", title = "Worst frame", width = 92, justify = "RIGHT", sort = "worst",
      value = function(row) return row.maxMs > 0 and Fmt.Ms(row.maxMs) or "-" end,
      tone = function(row) return worstTone(row.maxMs) end,
      tooltip = "The longest single frame recorded here." },
    { key = "latency", title = "Latency", width = 76, justify = "RIGHT", sort = "latency",
      value = function(row) return row.avgLat and ("%.0f ms"):format(row.avgLat) or "-" end,
      tone = function() return "muted" end,
      tooltip = "Average world latency while here." },
    { key = "spikes", title = "Stutters", width = 72, justify = "RIGHT", sort = "spikes",
      value = function(row) return row.spikes > 0 and tostring(row.spikes) or "" end,
      tone = function(row) return row.spikes > 0 and "warn" or nil end,
      pill = true,
      tooltip = "Frame-time spikes detected here (minor and above). Simulated ones are not counted." },
    { key = "perHour", title = "Per hour", width = 76, justify = "RIGHT", sort = "perHour",
      value = function(row) return row.perHour and ("%.1f"):format(row.perHour) or "-" end,
      tone = function() return "muted" end,
      tooltip = "Stutters per hour spent here, which is the fair way to compare a raid with a city." },
}

local ENCOUNTER_COLUMNS = {
    { key = "name", title = "Encounter", flex = 3, sort = "name",
      value = function(row) return row.name end,
      tone = function(row) return row.ranked and nil or "muted" end,
      tooltip = "Boss fight, recorded from its start to its end. Recorded per difficulty." },
    { key = "diff", title = "Difficulty", width = 120,
      value = function(row) return row.detail ~= "" and row.detail or "-" end,
      tone = function() return "muted" end },
    { key = "attempts", title = "Pulls", width = 64, justify = "RIGHT", sort = "attempts",
      value = function(row) return tostring(row.attempts) end,
      tone = function() return "muted" end },
    { key = "seconds", title = "Time", width = 84, justify = "RIGHT", sort = "seconds",
      value = function(row) return Fmt.Duration(row.seconds) end,
      tone = function() return "muted" end },
    { key = "fps", title = "Avg FPS", width = 80, justify = "RIGHT", sort = "fps",
      value = function(row) return fpsText(row.avgFps) end,
      tone = function(row) return row.ranked and fpsTone(row.avgFps) or "muted" end,
      bar = function(row) return (row.avgFps or 0) / 144, fpsTone(row.avgFps) or "accent" end },
    { key = "low", title = "Lowest", width = 70, justify = "RIGHT",
      value = function(row) return fpsText(row.minFps) end,
      tone = function() return "muted" end },
    { key = "worst", title = "Worst frame", width = 92, justify = "RIGHT", sort = "worst",
      value = function(row) return row.maxMs > 0 and Fmt.Ms(row.maxMs) or "-" end,
      tone = function(row) return worstTone(row.maxMs) end },
    { key = "spikes", title = "Stutters", width = 72, justify = "RIGHT", sort = "spikes",
      value = function(row) return row.spikes > 0 and tostring(row.spikes) or "" end,
      tone = function(row) return row.spikes > 0 and "warn" or nil end,
      pill = true },
}

--------------------------------------------------------------------------
-- Build
--------------------------------------------------------------------------

function Page:Build(frame)
    local pad = M.padding
    self.view = "places"
    self.sortKeys = { places = "seconds", encounters = "seconds" }
    self.sortAsc  = { places = false, encounters = false }

    ------------------------------------------------------------------
    -- Top row: summary and how to read it
    ------------------------------------------------------------------
    local top = CreateFrame("Frame", nil, frame)
    top:SetHeight(Theme:ScaleText(112))
    top:SetPoint("TOPLEFT", pad, -pad)
    top:SetPoint("TOPRIGHT", -pad, -pad)
    self.top = top

    self.glance = UI.StatCard(top, "AT A GLANCE", {
        "Tracked", "Slowest place", "Fastest place", "FPS in combat", "FPS out of combat",
    })
    self.glance:SetPoint("TOPLEFT")
    self.glance:SetPoint("BOTTOMLEFT")
    self.glance:SetWidth(380)

    self.note = UI.Card(top, "HOW TO READ THIS", {})
    self.note:SetPoint("TOPLEFT", self.glance, "TOPRIGHT", M.cardGap, 0)
    self.note:SetPoint("BOTTOMRIGHT")
    self.noteText = UI.Text(self.note.content, "small", "textSecondary", "LEFT")
    self.noteText:SetPoint("TOPLEFT")
    self.noteText:SetPoint("RIGHT", self.note.content, "RIGHT")
    UI.Wrap(self.noteText, 6)
    self.noteText:SetText(
        "FPS is sampled once a second wherever you are and kept across sessions, so this fills in with play. " ..
        "A place needs a minute of data before it is ranked. Loading screens add nothing. " ..
        "Compare \"Avg FPS\" with \"In combat\": the gap is what fighting costs in that place.")

    ------------------------------------------------------------------
    -- Tabs + actions
    ------------------------------------------------------------------
    self.tabs = UI.TabStrip(frame, {
        { key = "places",     label = "Zones and instances" },
        { key = "encounters", label = "Encounters" },
    }, function(key) self:SetView(key) end)
    self.tabs:SetPoint("TOPLEFT", top, "BOTTOMLEFT", 0, -10)
    self.tabs:SetWidth(300)

    self.recordButton = UI.Button(frame, "Tracking: on", function()
        local profile = WTM.db.profile.locations
        profile.enabled = not profile.enabled
        self:Refresh(true)
    end, { height = 24, width = 118, style = "small", icon = false })
    self.recordButton:SetPoint("TOPRIGHT", top, "BOTTOMRIGHT", 0, -12)
    self.recordButton.tooltip = "Pauses or resumes collecting this data. Nothing already recorded is lost."

    self.clearButton = UI.Button(frame, "Clear", function(button)
        -- Two clicks, because this deletes data that took weeks to collect.
        if not button.armed then
            button.armed = true
            button:SetText("Click again to clear")
            WTM:ScheduleTimer(function()
                if button.armed then button.armed = false; button:SetText("Clear") end
            end, 4)
            return
        end
        button.armed = false
        button:SetText("Clear")
        WTM.Locations:Clear(self.view)
        self:Refresh(true)
        WTM:Print(self.view == "places" and "Place data cleared." or "Encounter data cleared.")
    end, { height = 24, width = 140, style = "small" })
    self.clearButton:SetPoint("RIGHT", self.recordButton, "LEFT", -6, 0)
    self.clearButton.tooltip = "Deletes the saved data for the tab you are looking at."

    ------------------------------------------------------------------
    -- Tables
    ------------------------------------------------------------------
    self.placeTable = UI.Table(frame, PLACE_COLUMNS, {
        defaultSort = "seconds",
        emptyMessage = "Nothing recorded yet. Play for a minute or two and this fills in.",
        emptyArt = "empty_collecting",
        onSort = function(key, ascending)
            self.sortKeys.places, self.sortAsc.places = key, ascending
            self:Refresh(true)
        end,
    })
    self.encounterTable = UI.Table(frame, ENCOUNTER_COLUMNS, {
        defaultSort = "seconds",
        emptyMessage = "No boss encounter recorded yet. Fights are recorded from their start event to their end.",
        emptyArt = "empty_collecting",
        onSort = function(key, ascending)
            self.sortKeys.encounters, self.sortAsc.encounters = key, ascending
            self:Refresh(true)
        end,
    })
    self.tabs:Select("places")
    self:LayoutTables()
end

function Page:LayoutTables()
    local pad = M.padding
    for _, tbl in ipairs({ self.placeTable, self.encounterTable }) do
        tbl:ClearAllPoints()
        tbl:SetPoint("TOPLEFT", self.tabs, "BOTTOMLEFT", 0, -8)
        tbl:SetPoint("BOTTOMRIGHT", self.frame, "BOTTOMRIGHT", -pad, pad)
        tbl.LayoutHeader()
    end
end

function Page:OnLayout() if self.placeTable then self:LayoutTables() end end
function Page:OnShow() self:Refresh(true) end

function Page:SetView(key)
    self.view = key
    if self.placeTable then
        self.placeTable:SetShown(key == "places")
        self.encounterTable:SetShown(key == "encounters")
        self:Refresh(true)
    end
end

--------------------------------------------------------------------------
-- Refresh
--------------------------------------------------------------------------

function Page:Refresh(force)
    if not self.placeTable then return end
    local now = GetTime()
    if not force and self.lastRefresh and (now - self.lastRefresh) < REFRESH_EVERY_SEC then return end
    self.lastRefresh = now

    local Locations = WTM.Locations
    local tracking = WTM.db.profile.locations.enabled
    self.recordButton:SetText(tracking and "Tracking: on" or "Tracking: off")
    self.recordButton:SetSelected(tracking)

    local places, encounters = Locations:Count()
    local worst, best = Locations:Extremes()
    local combat, calm = Locations:CombatSplit()

    local glance = self.glance
    glance:Set("Tracked", ("%d place%s, %d encounter%s"):format(
        places, places == 1 and "" or "s", encounters, encounters == 1 and "" or "s"))
    if worst then
        glance:Set("Slowest place", ("%s  %.0f fps"):format(Fmt.Truncate(worst.entry.label, 26), worst.avg), fpsTone(worst.avg))
    else
        glance:Set("Slowest place", "needs a minute of data", "muted")
    end
    if best then
        glance:Set("Fastest place", ("%s  %.0f fps"):format(Fmt.Truncate(best.entry.label, 26), best.avg))
    else
        glance:Set("Fastest place", "needs a minute of data", "muted")
    end
    glance:Set("FPS in combat", combat and ("%.0f"):format(combat) or "-", combat and fpsTone(combat) or "muted")
    glance:Set("FPS out of combat", calm and ("%.0f"):format(calm) or "-")

    if self.view == "places" then
        Locations:BuildView("places", placeRows, self.sortKeys.places, self.sortAsc.places)
        self.placeTable:SetData(placeRows)
        self.placeTable:SetEmpty(#placeRows == 0)
    else
        Locations:BuildView("encounters", encounterRows, self.sortKeys.encounters, self.sortAsc.encounters)
        self.encounterTable:SetData(encounterRows)
        self.encounterTable:SetEmpty(#encounterRows == 0)
    end
end
