--[[--------------------------------------------------------------------------
    WoW Task Manager - UI/Widgets/Scrollbar.lua

    ONE scrollbar for everything that scrolls: the page canvases, the sidebar,
    the virtual lists and tables, the settings page, the copy box.

    What it does
      * a track and a draggable thumb, sized to how much of the content is
        visible; click the track to page up/down, drag the thumb, or use the
        mouse wheel as before,
      * its width is a setting (Settings > Interface > Scrollbar width), and
        changing it re-lays-out every scrolling area immediately,
      * optionally shown even when nothing needs scrolling ("always show").

    Every scrolling area reserves a gutter for it, so the bar never covers
    content. The gutter is always reserved, whether or not the bar is visible
    at that moment: a bar that appears and disappears would otherwise resize
    the content every time the amount of it crossed the window height.
----------------------------------------------------------------------------]]

local ADDON_NAME, WTM = ...

local UI    = WTM.UI
local Theme = UI.Theme
local T     = Theme.Get

local DEFAULT_WIDTH, MIN_WIDTH, MAX_WIDTH = 10, 4, 24
local GUTTER_PAD = 3           -- space between content and bar
local MIN_THUMB = 28
local PAGE_FRACTION = 0.9      -- a track click moves by this much of a page

UI.SCROLLBAR_MIN_WIDTH, UI.SCROLLBAR_MAX_WIDTH = MIN_WIDTH, MAX_WIDTH

local bars = {}
local widthListeners = {}

local function Clamp(v, lo, hi) return math.max(lo, math.min(hi, v)) end

--------------------------------------------------------------------------
-- Settings
--------------------------------------------------------------------------

local function UiProfile()
    local db = WTM.db
    return db and db.profile and db.profile.ui or nil
end

--- The configured scrollbar width in pixels.
function UI.GetScrollbarWidth()
    local profile = UiProfile()
    local width = profile and tonumber(profile.scrollbarWidth) or DEFAULT_WIDTH
    return Clamp(math.floor(width + 0.5), MIN_WIDTH, MAX_WIDTH)
end

--- Width reserved at the right of a scrolling area: the bar plus a little air.
function UI.GetScrollbarGutter()
    return UI.GetScrollbarWidth() + GUTTER_PAD
end

function UI.ScrollbarsAlwaysShown()
    local profile = UiProfile()
    return profile and profile.scrollbarAlways == true or false
end

--- `fn()` runs after the scrollbar width changes, so a widget that sized
--- itself around the gutter can do it again.
function UI.OnScrollbarWidthChanged(fn)
    widthListeners[#widthListeners + 1] = fn
end

function UI.SetScrollbarWidth(width)
    local profile = UiProfile()
    if not profile then return end
    profile.scrollbarWidth = Clamp(math.floor((tonumber(width) or DEFAULT_WIDTH) + 0.5), MIN_WIDTH, MAX_WIDTH)
    for i = 1, #bars do bars[i]:ApplyWidth() end
    for i = 1, #widthListeners do
        local ok, err = pcall(widthListeners[i])
        if not ok then geterrorhandler()(err) end
    end
    -- Pages that lay themselves out from the width they were given do it again.
    if UI.MainWindow and UI.MainWindow.LayoutAllPages then
        pcall(UI.MainWindow.LayoutAllPages, UI.MainWindow)
    end
end

function UI.SetScrollbarsAlwaysShown(always)
    local profile = UiProfile()
    if not profile then return end
    profile.scrollbarAlways = always and true or false
    for i = 1, #bars do bars[i]:Redraw() end
end

--------------------------------------------------------------------------
-- The bar
--------------------------------------------------------------------------

local function CursorY()
    local _, y = GetCursorPosition()
    return y / UIParent:GetEffectiveScale()
end

--- Creates a vertical scrollbar. The caller anchors it (TOPRIGHT/BOTTOMRIGHT
--- of whatever it scrolls) and feeds it with :Update(visible, total, offset);
--- `onScroll(offset)` is called when the user moves it.
function UI.CreateScrollbar(parent, onScroll)
    local bar = CreateFrame("Frame", nil, parent)
    bar:SetWidth(UI.GetScrollbarWidth())
    bar:EnableMouse(true)
    bar.onScroll = onScroll
    bar.state = { visible = 0, total = 0, offset = 0 }

    -- Track: rounded from the artwork when it ships, flat otherwise.
    bar.track = UI.Art and UI.Art.NineSlice(bar, "UI/scrollbar_track", { c = 2, s = 3 })
    if not bar.track then
        bar.track = bar:CreateTexture(nil, "BACKGROUND")
        bar.track:SetAllPoints()
    end
    bar.track:SetColorTexture(T("panelAlt", 0.7))

    local thumb = CreateFrame("Frame", nil, bar)
    thumb:SetWidth(bar:GetWidth())
    thumb:EnableMouse(true)
    thumb.tex = UI.Art and UI.Art.NineSlice(thumb, "UI/scrollbar_thumb", { c = 3, s = 3, layer = "ARTWORK" })
    if not thumb.tex then
        thumb.tex = thumb:CreateTexture(nil, "ARTWORK")
        thumb.tex:SetAllPoints()
    end
    bar.thumb = thumb

    local function Paint()
        if bar.dragging then
            thumb.tex:SetColorTexture(T("accent"))
        elseif bar.hovered then
            thumb.tex:SetColorTexture(T("textSecondary", 0.9))
        else
            thumb.tex:SetColorTexture(T("textMuted", 0.75))
        end
    end
    Paint()

    local dragStartY, dragStartOffset

    thumb:SetScript("OnEnter", function() bar.hovered = true; Paint() end)
    thumb:SetScript("OnLeave", function() bar.hovered = false; Paint() end)
    thumb:SetScript("OnMouseDown", function()
        bar.dragging = true
        dragStartY, dragStartOffset = CursorY(), bar.state.offset
        Paint()
    end)
    thumb:SetScript("OnMouseUp", function() bar.dragging = false; Paint() end)
    thumb:SetScript("OnUpdate", function()
        if not bar.dragging then return end
        local s = bar.state
        local maxOffset = s.total - s.visible
        local travel = (bar:GetHeight() or 0) - (thumb:GetHeight() or 0)
        if maxOffset <= 0 or travel <= 0 then return end
        local offset = dragStartOffset + (dragStartY - CursorY()) / travel * maxOffset
        if bar.onScroll then bar.onScroll(Clamp(offset, 0, maxOffset)) end
    end)

    -- Clicking the track pages toward the click.
    bar:SetScript("OnMouseDown", function()
        local s = bar.state
        if s.total <= s.visible or not thumb:IsShown() then return end
        local scale = thumb:GetEffectiveScale() / UIParent:GetEffectiveScale()
        local top, bottom = (thumb:GetTop() or 0) * scale, (thumb:GetBottom() or 0) * scale
        local y = CursorY()
        local page = s.visible * PAGE_FRACTION
        local maxOffset = s.total - s.visible
        if y > top then
            if bar.onScroll then bar.onScroll(Clamp(s.offset - page, 0, maxOffset)) end
        elseif y < bottom then
            if bar.onScroll then bar.onScroll(Clamp(s.offset + page, 0, maxOffset)) end
        end
    end)

    --- Re-reads the width setting.
    function bar:ApplyWidth()
        local width = UI.GetScrollbarWidth()
        self:SetWidth(width)
        thumb:SetWidth(width)
    end

    --- Lays the thumb out from the last figures it was given.
    function bar:Redraw()
        local s = self.state
        local maxOffset = math.max(0, s.total - s.visible)
        local scrollable = maxOffset > 1 and s.visible > 0

        if not scrollable then
            thumb:Hide()
            -- Nothing to scroll: gone, unless the user asked for it to stay.
            self:SetShown(UI.ScrollbarsAlwaysShown())
            return
        end

        self:Show()
        thumb:Show()
        local trackHeight = self:GetHeight() or 0
        if trackHeight <= 0 then return end
        local thumbHeight = Clamp(trackHeight * s.visible / s.total, MIN_THUMB, trackHeight)
        local travel = trackHeight - thumbHeight
        local progress = Clamp(s.offset / maxOffset, 0, 1)
        thumb:SetHeight(thumbHeight)
        thumb:ClearAllPoints()
        thumb:SetPoint("TOP", self, "TOP", 0, -travel * progress)
    end

    --- visible and total are heights of the window and of the content; offset
    --- is how far the content is scrolled.
    function bar:Update(visible, total, offset)
        local s = self.state
        s.visible, s.total, s.offset = visible or 0, total or 0, offset or 0
        self:Redraw()
    end

    bars[#bars + 1] = bar
    return bar
end

--------------------------------------------------------------------------
-- Attaching one to a ScrollFrame
--------------------------------------------------------------------------

--- Gives a ScrollFrame (and its scroll child) a scrollbar along its right edge.
--- Adds to the ScrollFrame:
---     scroll:UpdateScrollbar()   refresh after the content changed size
---     scroll:GetContentWidth()   usable width, i.e. minus the gutter
--- `host` is the frame the bar is parented to (default: the scroll's parent).
function UI.AttachScrollbar(scroll, canvas, host)
    local bar = UI.CreateScrollbar(host or scroll:GetParent() or scroll, function(offset)
        scroll:SetVerticalScroll(offset)
        -- OnVerticalScroll does not fire for every client's SetVerticalScroll.
        scroll:UpdateScrollbar()
    end)
    bar:SetPoint("TOPRIGHT", scroll, "TOPRIGHT", 0, 0)
    bar:SetPoint("BOTTOMRIGHT", scroll, "BOTTOMRIGHT", 0, 0)
    bar:SetFrameLevel((scroll:GetFrameLevel() or 1) + 6)
    scroll.scrollbar = bar

    -- The wheel works over the bar too, not only over the content.
    bar:EnableMouseWheel(true)
    bar:SetScript("OnMouseWheel", function(_, delta)
        local handler = scroll:GetScript("OnMouseWheel")
        if handler then handler(scroll, delta) end
    end)

    function scroll:UpdateScrollbar()
        bar:Update(self:GetHeight() or 0, canvas:GetHeight() or 0, self:GetVerticalScroll() or 0)
    end

    function scroll:GetContentWidth()
        return math.max(1, (self:GetWidth() or 0) - UI.GetScrollbarGutter())
    end

    -- These two are set nowhere else, so hooking is safe: the content growing
    -- or shrinking, and the user (or a page) scrolling.
    scroll:HookScript("OnScrollRangeChanged", function(self) self:UpdateScrollbar() end)
    scroll:HookScript("OnVerticalScroll", function(self) self:UpdateScrollbar() end)

    UI.OnScrollbarWidthChanged(function()
        if scroll.SyncWidth then scroll:SyncWidth() end
        if scroll.onGutterChanged then scroll.onGutterChanged(scroll) end
        scroll:UpdateScrollbar()
    end)

    scroll:UpdateScrollbar()
    return bar
end
