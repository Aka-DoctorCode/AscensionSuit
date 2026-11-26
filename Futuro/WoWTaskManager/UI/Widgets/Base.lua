--[[--------------------------------------------------------------------------
    WoW Task Manager - UI/Widgets/Base.lua

    The primitives the rest of the UI is built from.  Deliberately NOT built on
    Blizzard templates: BackdropTemplate, UIPanelButtonTemplate and friends all
    carry the 2005 art style with them, and the whole point of this window is
    that it does not look like that.

    A panel here is a plain frame with a flat fill and hairline borders made
    from 1-pixel textures.  That is also what modern desktop dashboards
    actually are - the "rounded panel" look in Grafana or VS Code is mostly
    hairlines, spacing and restraint rather than corner radii.  WoW cannot draw
    a real border radius without shipping corner artwork, so instead of faking
    it badly this uses crisp edges and leans on spacing and elevation.
----------------------------------------------------------------------------]]

local ADDON_NAME, WTM = ...

local Theme = WTM.UI.Theme
local T     = Theme.Get
local M     = Theme.metrics

local UI = WTM.UI

--------------------------------------------------------------------------
-- Fills and borders
--------------------------------------------------------------------------

function UI.Fill(frame, colorKey, alpha, layer)
    local texture = frame:CreateTexture(nil, layer or "BACKGROUND")
    texture:SetAllPoints(frame)
    texture:SetColorTexture(T(colorKey, alpha))
    return texture
end

--- One-pixel hairline on any combination of edges.
--- edges is a string containing any of "TLBR" - "TB" gives top and bottom only.
function UI.Border(frame, edges, colorKey, alpha, inset)
    edges = edges or "TLBR"
    inset = inset or 0
    local out = {}
    local r, g, b, a = T(colorKey or "borderSubtle", alpha)

    local function edge(point1, point2, horizontal)
        local texture = frame:CreateTexture(nil, "BORDER")
        texture:SetColorTexture(r, g, b, a)
        if horizontal then
            texture:SetHeight(M.borderSize)
            texture:SetPoint(point1, frame, point1, inset, 0)
            texture:SetPoint(point2, frame, point2, -inset, 0)
        else
            texture:SetWidth(M.borderSize)
            texture:SetPoint(point1, frame, point1, 0, -inset)
            texture:SetPoint(point2, frame, point2, 0, inset)
        end
        out[#out + 1] = texture
        return texture
    end

    if edges:find("T") then out.top    = edge("TOPLEFT", "TOPRIGHT", true) end
    if edges:find("B") then out.bottom = edge("BOTTOMLEFT", "BOTTOMRIGHT", true) end
    if edges:find("L") then out.left   = edge("TOPLEFT", "BOTTOMLEFT", false) end
    if edges:find("R") then out.right  = edge("TOPRIGHT", "BOTTOMRIGHT", false) end
    return out
end

--------------------------------------------------------------------------
-- Animation
--------------------------------------------------------------------------
-- One driver frame for every animation in the addon, not one OnUpdate per
-- animated widget - the performance rule this whole UI is built around
-- applies to motion exactly as it applies to graphs. Turning "Reduce motion"
-- on, or measured overhead running above budget, skips the tween and jumps
-- straight to the end state, so nothing here can be the reason a frame drops.
local animDriver = CreateFrame("Frame")
local animActive = {}
animDriver:Hide()

local function AnimationsAllowed()
    if WTM.db and WTM.db.profile.ui.reduceMotion then return false end
    local overhead = WTM.Overhead and WTM.Overhead.current
    if overhead and overhead.totalMsPerSec then
        local budget = (WTM.db and WTM.db.profile.sampling.overheadBudgetMs)
            or WTM.C.OVERHEAD_BUDGET_MS_PER_SEC
        if overhead.totalMsPerSec >= budget then return false end
    end
    return true
end

animDriver:SetScript("OnUpdate", function(self, elapsed)
    local n = #animActive
    for i = n, 1, -1 do
        local anim = animActive[i]
        anim.t = anim.t + elapsed
        local fraction = math.min(1, anim.t / anim.duration)
        anim.onUpdate(fraction)
        if fraction >= 1 then
            table.remove(animActive, i)
            if anim.onComplete then anim.onComplete() end
        end
    end
    if #animActive == 0 then self:Hide() end
end)

--- Runs `onUpdate(fraction)` from 0 to 1 over `duration` seconds, then calls
--- `onComplete` once. If motion is off (by setting or by measured overhead),
--- `onUpdate(1)` and `onComplete` run immediately instead - every caller's end
--- state is reached either way, only the path there differs.
function UI.Animate(duration, onUpdate, onComplete)
    if not AnimationsAllowed() then
        onUpdate(1)
        if onComplete then onComplete() end
        return
    end
    animActive[#animActive + 1] = { t = 0, duration = duration, onUpdate = onUpdate, onComplete = onComplete }
    animDriver:Show()
end

--- The one alert animation the brief allows: a single pulse, never a loop.
--- Used where a number just got worse and the reader's eye is elsewhere -
--- a badge count going up, a status dot changing tone - not as decoration.
--- `region` is expected to be a texture dedicated to the pulse (an overlay
--- created for exactly this, starting hidden) rather than a widget's normal
--- background - the animation owns this texture's colour and visibility for
--- its half second, and hides it again when done.
function UI.PulseOnce(region, tone)
    if not region.SetColorTexture then return end
    local r, g, b = Theme:Tone(tone or "warn")
    region:Show()
    UI.Animate(0.5, function(fraction)
        -- Out and back: 0 -> 1 -> 0, so the pulse reads as one flash rather
        -- than a fade the reader might mistake for the region appearing.
        local phase = fraction < 0.5 and (fraction * 2) or (2 - fraction * 2)
        region:SetColorTexture(r, g, b, phase * 0.9)
    end, function()
        region:Hide()
    end)
end

--- A panel: flat fill, hairline border, and a barely-there highlight along the
--- top edge that gives it the sense of being lit from above.  That one-pixel
--- highlight is what stops a flat dark rectangle from reading as a hole.
---
--- `opts.accent`, when given a tone name, adds a 2px bar down the left edge.
--- This is the addon's one lever for "this card matters more/differently
--- than that one" without a second background colour or a border that
--- competes with every other border on the page.
function UI.Panel(parent, opts)
    opts = opts or {}
    local frame = CreateFrame("Frame", nil, parent)
    frame.bg = UI.Fill(frame, opts.color or "panelBg", opts.alpha)
    if opts.border ~= false then
        frame.borders = UI.Border(frame, opts.edges, opts.borderColor or "borderSubtle", M.outlineAlpha)
    end
    if opts.highlight ~= false then
        local highlight = frame:CreateTexture(nil, "ARTWORK")
        highlight:SetHeight(1)
        highlight:SetPoint("TOPLEFT", 1, -1)
        highlight:SetPoint("TOPRIGHT", -1, -1)
        highlight:SetColorTexture(1, 1, 1, 0.025)
        frame.topHighlight = highlight
    end

    frame.accentBar = frame:CreateTexture(nil, "ARTWORK", nil, 1)
    frame.accentBar:SetWidth(2)
    frame.accentBar:SetPoint("TOPLEFT", 0, 0)
    frame.accentBar:SetPoint("BOTTOMLEFT", 0, 0)
    frame.accentBar:Hide()

    --- Shows or hides the left-edge accent bar. `nil` hides it; any tone name
    --- (as used everywhere else - "ok"/"warn"/"crit"/"accent"/...) shows it in
    --- that colour. A severity-coded card says what it is before its text is
    --- even read, the way a coloured folder tab does on a real desk.
    function frame:SetAccent(tone)
        if tone then
            self.accentBar:SetColorTexture(Theme:Tone(tone, 0.9))
            self.accentBar:Show()
        else
            self.accentBar:Hide()
        end
    end

    if opts.accent then frame:SetAccent(opts.accent) end

    -- Rounded corners from the shipped artwork, when asked for and available.
    if opts.rounded and UI.Art then
        UI.Art.Round(frame, opts.color, opts.alpha, opts.borderColor, M.outlineAlpha, opts.border ~= false)
    end
    return frame
end

--- A card is a panel with a title and a generous content inset - the unit the
--- dashboard is built from.
function UI.Card(parent, title, opts)
    opts = opts or {}
    if opts.rounded == nil then opts.rounded = true end
    local card = UI.Panel(parent, opts)

    if title then
        card.titleText = card:CreateFontString(nil, "OVERLAY")
        Theme:SetFont(card.titleText, "heading", "textSecondary")
        card.titleText:SetPoint("TOPLEFT", M.padding, -M.paddingSmall - 2)
        -- Bounded by the card, not only anchored to its left edge. A title
        -- longer than the card is common at the minimum window size, and
        -- without a right anchor it drew straight out of the card.
        card.titleText:SetPoint("RIGHT", card, "RIGHT", -M.padding, 0)
        card.titleText:SetJustifyH("LEFT")
        card.titleFull = title
        card.titleText:SetText(UI.FitText(card.titleText, title))

        -- The title is fitted to the width it has right now, and a card is
        -- built before the grid has sized it. Fitted to that near-zero width
        -- it became "..." and stayed that way. Fit it again whenever the card
        -- actually gets a different width.
        card:HookScript("OnSizeChanged", function(self, width)
            if width == self.titleFitWidth then return end
            self.titleFitWidth = width
            self.titleText:SetText(UI.FitText(self.titleText, self.titleFull or ""))
        end)
    end

    local topInset = title and (M.paddingSmall + 22) or M.paddingSmall
    card.content = CreateFrame("Frame", nil, card)
    card.content:SetPoint("TOPLEFT", M.padding, -topInset)
    card.content:SetPoint("BOTTOMRIGHT", -M.padding, M.paddingSmall)

    -- What the title and padding cost vertically, so a page sizing a card
    -- around a known number of rows can add it instead of guessing. The System
    -- page guessed, and adding one row left the last two clipped.
    card.chromeHeight = topInset + M.paddingSmall

    --- Sizes the card so `contentHeight` pixels of content fit inside it.
    function card:SetContentHeight(contentHeight)
        self:SetHeight(contentHeight + self.chromeHeight)
    end

    function card:SetTitle(text)
        if self.titleText then
            self.titleFull = text
            self.titleText:SetText(UI.FitText(self.titleText, text or ""))
        end
    end
    return card
end

--------------------------------------------------------------------------
-- Text
--------------------------------------------------------------------------

--- Creates a font string.
---
--- Single line and non-wrapping by DEFAULT. WoW font strings wrap and grow
--- downwards on their own, so a label that turns out longer than expected
--- silently pushes itself over whatever is beneath it - which is exactly how a
--- dashboard ends up with text running through its own graphs. Anything that
--- genuinely needs to flow asks for it with `wrap = true`.
-- A height written beside a font string was always worked out for 100% text:
-- "30" means two lines of body text. At a larger text size those lines are
-- taller, so the same number clips the last one. Every explicit height on a
-- font string made by UI.Text therefore means "at 100%" and is scaled by the
-- text size - one rule here instead of a multiplier at each of the call sites.
-- (Only installed when the size is not 100%, so the default path is untouched.)
local baseSetHeight
local function ScaledSetHeight(fontString, height)
    fontString.baseHeight = height
    local ratio = fontString.textRatio
    -- Wrapped text needs more lines as well as taller ones (Theme:ScaleWrapped),
    -- and the line count is a whole number: 2 lines at +17% is 3, not 2.34.
    if fontString.wrapGrowth then ratio = fontString.wrapGrowth end
    return baseSetHeight(fontString, math.ceil(height * ratio))
end

function UI.Text(parent, style, colorKey, justify, wrap)
    local fs = parent:CreateFontString(nil, "OVERLAY")
    Theme:SetFont(fs, style or "body", colorKey or "textPrimary")
    if Theme.textScale ~= 1 then
        baseSetHeight = baseSetHeight or fs.SetHeight
        fs.textRatio = Theme:FontRatio(style or "body")
        -- For code that already has a final pixel height (the grid, once it
        -- has placed a cell) and must not have it scaled a second time.
        fs.SetExactHeight = baseSetHeight
        fs.SetHeight = ScaledSetHeight
    end
    fs:SetJustifyH(justify or "LEFT")
    if wrap then
        UI.Wrap(fs)
    else
        fs:SetWordWrap(false)
        -- Clip rather than wrap when the text outgrows its box.
        if fs.SetMaxLines then pcall(fs.SetMaxLines, fs, 1) end
    end
    return fs
end

--- Lets a font string flow over several lines after the fact.
---
--- The line count is CAPPED by default, and that default is not zero. A
--- wrapping font string with no height grows downwards on its own, so a notice
--- that turns out two lines longer than the layout expected pushes itself
--- straight through whatever sits beneath it - which is how this addon ended up
--- with explanatory text running over its own graphs on a real client.
---
--- Pass an explicit count for text that is genuinely meant to be longer, or 0
--- for deliberately unbounded (a scrolling body, where growing downwards is the
--- point).
function UI.Wrap(fontString, maxLines)
    fontString:SetWordWrap(true)
    maxLines = maxLines or 4
    -- At a larger text size the same sentence wraps onto more lines. Capping
    -- it at the 100% count would cut the end off every note, so the cap (and
    -- the height, which was usually written down before this call) follow.
    local ratio = fontString.textRatio
    if ratio and ratio ~= 1 then
        fontString.wrapGrowth = Theme:WrapGrowth(maxLines, ratio)
        if maxLines > 0 then maxLines = math.ceil(maxLines * ratio) end
        if fontString.baseHeight then fontString:SetHeight(fontString.baseHeight) end
    end
    if fontString.SetMaxLines then
        pcall(fontString.SetMaxLines, fontString, maxLines)
    end
    return fontString
end

--- Shortens `text` until it fits the width `fontString` has been given, ending
--- in an ellipsis when anything was dropped.
---
--- WoW clips an over-long non-wrapping font string at its right edge, mid-glyph
--- and with no indication that anything is missing. An ellipsis at least says
--- so. Where the width cannot be worked out, the text is returned untouched -
--- guessing a width would be worse than leaving it alone.
function UI.FitText(fontString, text)
    text = tostring(text or "")
    if text == "" then return text end

    local width = fontString:GetWidth()
    if not width or width <= 0 then return text end

    fontString:SetText(text)
    if fontString:GetStringWidth() <= width then return text end

    -- Binary search on length: a linear trim is O(n) SetText calls on exactly
    -- the strings that are already the longest.
    local lo, hi, best = 1, #text, nil
    while lo <= hi do
        local mid = math.floor((lo + hi) / 2)
        local candidate = text:sub(1, mid) .. "..."
        fontString:SetText(candidate)
        if fontString:GetStringWidth() <= width then
            best = candidate
            lo = mid + 1
        else
            hi = mid - 1
        end
    end

    -- Nothing fit, not even one character and an ellipsis. This used to return
    -- the empty string, and an empty string is the one answer that is never
    -- useful: the label simply vanishes, and the reader has no way to know one
    -- was ever there. It happened nine times in a single sweep of the pages.
    --
    -- Show the ellipsis instead. It overflows a box this narrow, and that is
    -- the right trade: a box six pixels wide is a layout that has already gone
    -- wrong, and three dots say "there is text here, ask for it" where nothing
    -- says nothing. Every caller that trims also carries the full text in a
    -- tooltip.
    best = best or "..."

    fontString:SetText(best)
    return best
end

--- Picks the longest of several phrasings that fits whole, longest first.
---
--- Truncating is the wrong tool when there is a shorter way to say the same
--- thing. The processes toolbar is the case that prompted this: six filter
--- buttons left its summary 55 pixels, and "176 of 220 loaded - 4000 frames
--- scanned, 91 attributed" was trimmed to "176 of ...", which tells the reader
--- strictly less than "176/220" would have in the same space.
---
--- Falls back to trimming the SHORTEST candidate, so the box is still filled
--- with something rather than left blank.
function UI.FitBest(fontString, ...)
    local candidates = { ... }
    local width = fontString:GetWidth()
    if not width or width <= 0 then
        local first = candidates[1] or ""
        fontString:SetText(first)
        return first
    end

    for i = 1, #candidates do
        local candidate = tostring(candidates[i] or "")
        if candidate ~= "" then
            fontString:SetText(candidate)
            if fontString:GetStringWidth() <= width then return candidate end
        end
    end
    return UI.FitText(fontString, candidates[#candidates] or "")
end

--- A label above a value, the shape used everywhere a number is shown.
function UI.LabeledValue(parent, label, valueStyle)
    local group = CreateFrame("Frame", nil, parent)
    group.label = UI.Text(group, "small", "textMuted")
    group.label:SetPoint("TOPLEFT")
    group.label:SetText(label)

    group.value = UI.Text(group, valueStyle or "metric", "textPrimary")
    group.value:SetPoint("TOPLEFT", group.label, "BOTTOMLEFT", 0, -2)

    group.unit = UI.Text(group, "small", "textMuted")
    group.unit:SetPoint("BOTTOMLEFT", group.value, "BOTTOMRIGHT", 3, 2)

    group:SetHeight(Theme:ScaleText(46))

    function group:Set(value, unit, colorKey)
        self.value:SetText(value)
        if unit then self.unit:SetText(unit) end
        if colorKey then self.value:SetTextColor(T(colorKey)) end
    end
    return group
end

--------------------------------------------------------------------------
-- Buttons
--------------------------------------------------------------------------
-- Flat, borderless until hovered.  No bevels, no gradients, no Blizzard art.

local function StyleButtonState(button)
    if button.disabled then
        button.bg:SetColorTexture(T("panelAlt", 0.4))
        button.text:SetTextColor(T("textMuted"))
    elseif button.isPrimary then
        button.bg:SetColorTexture(T(button.hovered and "accent" or "accentDim"))
        button.text:SetTextColor(1, 1, 1)
        if button.outline then button.outline:SetColorTexture(T("accent", 0)) end
    elseif button.selected then
        button.bg:SetColorTexture(T("accentSoft"))
        button.text:SetTextColor(T("accent"))
        if button.outline then button.outline:SetColorTexture(T("accentDim", 0.7)) end
    else
        button.bg:SetColorTexture(T(button.hovered and "elevated" or "panelAlt", 1))
        button.text:SetTextColor(T(button.hovered and "textPrimary" or "textSecondary"))
        if button.outline then
            button.outline:SetColorTexture(T(button.hovered and "borderStrong" or "borderSubtle", M.outlineAlpha))
        end
    end
    -- The glyph follows the label colour, so disabled/hovered/selected all read.
    if button.icon then button.icon:SetVertexColor(button.text:GetTextColor()) end
end

-- Which buttons carry a glyph. Keyed by label so the pages that create them
-- stay untouched; pass opts.icon = "name" to choose one, or false for none.
local BUTTON_ICONS = {
    ["Copy all"] = "copy", ["Copy report"] = "copy", ["Copy stack"] = "copy",
    ["Open selectable copy"] = "copy",
    ["Clear"] = "trash", ["Clear its history"] = "trash", ["Delete session"] = "trash",
    ["Reset counters"] = "refresh", ["Reset this session's counters"] = "refresh",
    ["Reset the client's CPU counters"] = "refresh", ["Reset the dashboard layout"] = "refresh",
    ["Reload UI"] = "refresh",
    ["Flag for diagnostics"] = "pin", ["Hide from graphs"] = "eye_off",
    ["Show unloaded"] = "eye",
}
UI.BUTTON_ICONS = BUTTON_ICONS

function UI.Button(parent, text, onClick, opts)
    opts = opts or {}
    local button = CreateFrame("Button", nil, parent)
    button:SetHeight(opts.height or 26)

    -- Rounded fill and outline from the artwork when it ships; otherwise the
    -- flat fill and square hairline this has always been.
    local sliced = UI.Art and UI.Art.NineSlice(button, "UI/button_normal", { c = 7, s = 6 })
    if sliced then
        button.bg = sliced
        button.outline = UI.Art.NineSlice(button, "UI/button_border",
            { c = 7, s = 6, layer = "BORDER", center = false })
        if button.outline then
            button.outline:SetColorTexture(T(opts.primary and "accentDim" or "borderSubtle", M.outlineAlpha))
        end
    else
        button.bg = button:CreateTexture(nil, "BACKGROUND")
        button.bg:SetAllPoints()
    end

    button.text = UI.Text(button, opts.style or "body", "textSecondary", "CENTER")
    -- Anchored to both edges, so the label has the button's width to fit in
    -- whatever the button is later sized to, and an over-long one is trimmed
    -- with an ellipsis (the tooltip title carries the full text).
    button.text:SetPoint("LEFT", 4, 0)
    button.text:SetPoint("RIGHT", -4, 0)

    -- An optional glyph before the label (opts.icon = a Status/ glyph name).
    local iconName = opts.icon
    if iconName == nil then iconName = BUTTON_ICONS[text] end
    local iconPath = iconName and UI.Art and UI.Art.Path("Status/" .. iconName)
    if iconPath then
        button.icon = button:CreateTexture(nil, "OVERLAY")
        button.icon:SetSize(14, 14)
        button.icon:SetTexture(iconPath)
        button.icon:SetPoint("LEFT", 8, 0)
        button.text:SetPoint("LEFT", 26, 0)
    end
    button.label = text
    button.text:SetText(text)
    function button:FitLabel()
        self.text:SetText(UI.FitText(self.text, self.label))
    end
    button:SetScript("OnSizeChanged", function(self) self:FitLabel() end)

    button.isPrimary = opts.primary
    if not sliced then
        UI.Border(button, "TLBR", opts.primary and "accentDim" or "borderSubtle", M.outlineAlpha)
    end

    if not opts.width then
        button:SetWidth(math.max(opts.minWidth or 64,
            button.text:GetStringWidth() + 24 + (button.icon and 18 or 0)))
    else
        -- An explicit width was chosen for text at 100%.
        button:SetWidth(Theme:ScaleText(opts.width))
    end

    button:SetScript("OnEnter", function(self)
        self.hovered = true
        StyleButtonState(self)
        if self.tooltip then UI.ShowTooltip(self, self.tooltipTitle or text, self.tooltip) end
    end)
    button:SetScript("OnLeave", function(self)
        self.hovered = false
        StyleButtonState(self)
        UI.HideTooltip()
    end)
    button:SetScript("OnClick", function(self, ...)
        if self.disabled then return end
        if onClick then onClick(self, ...) end
    end)

    function button:SetEnabledState(enabled, reason)
        self.disabled = not enabled
        self.tooltip = reason
        StyleButtonState(self)
    end
    function button:SetSelected(selected)
        self.selected = selected
        StyleButtonState(self)
    end
    function button:SetText(newText)
        self.label = newText
        self.text:SetText(newText)
        self:FitLabel()
    end

    StyleButtonState(button)
    return button
end

--- Small pill used for statuses and badges.
function UI.Badge(parent, text, tone)
    local badge = CreateFrame("Frame", nil, parent)
    badge:SetHeight(16)
    badge.bg = badge:CreateTexture(nil, "BACKGROUND")
    badge.bg:SetAllPoints()
    badge.text = UI.Text(badge, "tiny", "textPrimary", "CENTER")
    badge.text:SetPoint("CENTER")

    function badge:Set(newText, newTone)
        self.text:SetText(newText or "")
        local r, g, b = Theme:Tone(newTone or "muted")
        self.bg:SetColorTexture(r, g, b, 0.14)
        self.text:SetTextColor(r, g, b)
        self:SetWidth(math.max(28, self.text:GetStringWidth() + 14))
    end
    badge:Set(text, tone)
    return badge
end

--------------------------------------------------------------------------
-- Bars
--------------------------------------------------------------------------

--- Thin horizontal fill bar, used in table cells to make magnitudes scannable
--- without reading every number.
function UI.MiniBar(parent, height)
    local bar = CreateFrame("Frame", nil, parent)
    bar:SetHeight(height or 3)
    bar.track = bar:CreateTexture(nil, "BACKGROUND")
    bar.track:SetAllPoints()
    bar.track:SetColorTexture(T("borderSubtle", 0.6))

    bar.fill = bar:CreateTexture(nil, "ARTWORK")
    bar.fill:SetPoint("TOPLEFT")
    bar.fill:SetPoint("BOTTOMLEFT")
    bar.fill:SetWidth(1)

    function bar:SetValue(fraction, tone)
        fraction = math.max(0, math.min(1, fraction or 0))
        local width = self:GetWidth() or 0
        if width <= 0 then width = 100 end
        self.fill:SetWidth(math.max(1, width * fraction))
        self.fill:SetColorTexture(Theme:Tone(tone or "accent", 0.9))
        self.fill:SetShown(fraction > 0)
    end
    return bar
end

--- A separator line with optional label, for grouping inside a page.
function UI.Divider(parent, label)
    local divider = CreateFrame("Frame", nil, parent)
    divider:SetHeight(label and 20 or 1)

    local line = divider:CreateTexture(nil, "ARTWORK")
    line:SetHeight(1)
    line:SetColorTexture(T("borderSubtle"))

    if label then
        divider.text = UI.Text(divider, "small", "textMuted")
        divider.text:SetPoint("LEFT")
        divider.text:SetText(label)
        line:SetPoint("LEFT", divider.text, "RIGHT", 8, 0)
        line:SetPoint("RIGHT")
    else
        line:SetPoint("LEFT")
        line:SetPoint("RIGHT")
        -- A hairline that fades out at both ends, when the artwork ships.
        local fade = UI.Art and UI.Art.Path("UI/divider_fade")
        if fade then
            line:SetHeight(4)
            line:SetTexture(fade)
            line:SetVertexColor(T("borderStrong"))
        end
    end
    divider.line = line
    return divider
end

--------------------------------------------------------------------------
-- Search box
--------------------------------------------------------------------------

function UI.SearchBox(parent, placeholder, onChanged)
    local frame = UI.Panel(parent, { color = "panelAlt", rounded = true })
    frame:SetHeight(24)

    -- A magnifier before the text, when the artwork ships.
    local searchGlyph = UI.Art and UI.Art.Path("Status/search")
    local inset = 8
    if searchGlyph then
        local glyph = frame:CreateTexture(nil, "OVERLAY")
        glyph:SetSize(12, 12)
        glyph:SetTexture(searchGlyph)
        glyph:SetVertexColor(T("textMuted"))
        glyph:SetPoint("LEFT", 8, 0)
        inset = 26
    end

    local edit = CreateFrame("EditBox", nil, frame)
    edit:SetPoint("TOPLEFT", inset, 0)
    edit:SetPoint("BOTTOMRIGHT", -22, 0)
    edit:SetAutoFocus(false)
    Theme:SetFont(edit, "body", "textPrimary")
    edit:SetTextColor(Theme.Get("textPrimary"))

    local hint = UI.Text(frame, "body", "textMuted")
    hint:SetPoint("LEFT", inset, 0)
    hint:SetText(placeholder or "Search")

    local clear = UI.Button(frame, "x", function()
        edit:SetText("")
        edit:ClearFocus()
    end, { width = 16, height = 16, style = "small" })
    clear:SetPoint("RIGHT", -4, 0)
    clear:Hide()

    edit:SetScript("OnTextChanged", function(self)
        local text = self:GetText()
        hint:SetShown(text == "")
        clear:SetShown(text ~= "")
        if onChanged then onChanged(text) end
    end)
    edit:SetScript("OnEscapePressed", function(self) self:SetText("") self:ClearFocus() end)
    edit:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)

    frame.edit = edit
    function frame:GetText() return edit:GetText() end
    function frame:SetText(t) edit:SetText(t or "") end
    return frame
end

--------------------------------------------------------------------------
-- Tab strip
--------------------------------------------------------------------------
-- Underline-style tabs; the active one gets a 2px accent rule rather than a
-- raised chrome tab.

function UI.TabStrip(parent, items, onSelect)
    local strip = CreateFrame("Frame", nil, parent)
    strip:SetHeight(30)
    strip.buttons = {}
    strip.selected = nil

    local x = 0
    for i, item in ipairs(items) do
        local tab = CreateFrame("Button", nil, strip)
        tab:SetHeight(30)
        tab.text = UI.Text(tab, "body", "textSecondary", "CENTER")
        tab.text:SetPoint("CENTER", 0, 1)
        tab.text:SetText(item.label or item)
        tab:SetWidth(tab.text:GetStringWidth() + 26)
        tab:SetPoint("BOTTOMLEFT", x, 0)
        x = x + tab:GetWidth()

        tab.rule = tab:CreateTexture(nil, "ARTWORK")
        tab.rule:SetHeight(2)
        tab.rule:SetPoint("BOTTOMLEFT", 6, 0)
        tab.rule:SetPoint("BOTTOMRIGHT", -6, 0)
        tab.rule:SetColorTexture(T("accent"))
        -- The rounded 3 px bar from the artwork, sitting on the baseline.
        local underline = UI.Art and UI.Art.Path("UI/tab_underline")
        if underline then
            tab.rule:SetTexture(underline)
            tab.rule:SetVertexColor(T("accent"))
            tab.rule:SetHeight(8)
            tab.rule:ClearAllPoints()
            tab.rule:SetPoint("BOTTOMLEFT", 2, -2)
            tab.rule:SetPoint("BOTTOMRIGHT", -2, -2)
        end
        tab.rule:Hide()

        tab.key = item.key or item
        tab:SetScript("OnEnter", function(self)
            if strip.selected ~= self then self.text:SetTextColor(T("textPrimary")) end
        end)
        tab:SetScript("OnLeave", function(self)
            if strip.selected ~= self then self.text:SetTextColor(T("textSecondary")) end
        end)
        tab:SetScript("OnClick", function(self) strip:Select(self.key) end)

        strip.buttons[i] = tab
    end

    local baseline = strip:CreateTexture(nil, "BACKGROUND")
    baseline:SetHeight(1)
    baseline:SetPoint("BOTTOMLEFT")
    baseline:SetPoint("BOTTOMRIGHT")
    baseline:SetColorTexture(T("borderSubtle"))

    function strip:Select(key)
        for _, tab in ipairs(self.buttons) do
            local active = tab.key == key
            tab.rule:SetShown(active)
            tab.text:SetTextColor(T(active and "textPrimary" or "textSecondary"))
            if active then self.selected = tab end
        end
        self.selectedKey = key
        if onSelect then onSelect(key) end
    end

    return strip
end

--------------------------------------------------------------------------
-- Empty / unavailable states
--------------------------------------------------------------------------
-- Used wherever a capability is missing.  The feature stays visible and
-- explains itself instead of silently disappearing, which is the whole point
-- of being honest about what the sandbox allows.

function UI.NoticePanel(parent, title, message, actionLabel, onAction, tone)
    local panel = UI.Panel(parent, { color = "panelAlt" })

    local accent = panel:CreateTexture(nil, "ARTWORK")
    accent:SetWidth(2)
    accent:SetPoint("TOPLEFT")
    accent:SetPoint("BOTTOMLEFT")
    accent:SetColorTexture(Theme:Tone(tone or "warn"))

    panel.title = UI.Text(panel, "heading", "textPrimary")
    panel.title:SetPoint("TOPLEFT", 14, -10)
    panel.title:SetText(title)

    panel.message = UI.Text(panel, "small", "textSecondary")
    panel.message:SetPoint("TOPLEFT", panel.title, "BOTTOMLEFT", 0, -5)
    panel.message:SetPoint("RIGHT", panel, "RIGHT", -14, 0)
    panel.message:SetJustifyH("LEFT")
    panel.message:SetText(message or "")
    UI.Wrap(panel.message)

    local height = 44 + (panel.message:GetStringHeight() or 12)

    if actionLabel and onAction then
        panel.action = UI.Button(panel, actionLabel, onAction, { primary = true, height = 22 })
        panel.action:SetPoint("TOPLEFT", panel.message, "BOTTOMLEFT", 0, -8)
        height = height + 30
    end

    panel:SetHeight(height)

    function panel:SetMessage(text)
        self.message:SetText(text or "")
        self:SetHeight(44 + (self.message:GetStringHeight() or 12) + (self.action and 30 or 0))
    end
    return panel
end

--- Centered placeholder for a table or graph that has nothing to show yet.
function UI.EmptyState(parent, message, art)
    local frame = CreateFrame("Frame", nil, parent)
    frame.text = UI.Text(frame, "body", "textMuted", "CENTER")
    -- These messages are whole paragraphs explaining why a panel is empty, and
    -- an explanation is the last thing that should be cut in half. Bounded to
    -- the panel and wrapped.
    UI.Wrap(frame.text, 8)
    frame.text:SetText(message or "No data yet")
    function frame:SetMessage(text) self.text:SetText(text) end

    -- An optional illustration (Media/Empty/<art>) above the message. It is
    -- only drawn when the panel is tall enough to hold it with the text; in a
    -- short panel the message alone is shown, exactly as before.
    frame.art = frame:CreateTexture(nil, "ARTWORK")
    frame.art:SetSize(128, 64)
    frame.art:Hide()

    function frame:LayoutArt()
        local roomy = self.artPath and (self:GetHeight() or 0) >= 150
        self.text:ClearAllPoints()
        if roomy then
            self.art:ClearAllPoints()
            self.art:SetPoint("BOTTOM", self, "CENTER", 0, 4)
            self.text:SetPoint("TOP", self, "CENTER", 0, -8)
        else
            self.text:SetPoint("CENTER")
        end
        self.text:SetPoint("LEFT", self, "LEFT", 24, 0)
        self.text:SetPoint("RIGHT", self, "RIGHT", -24, 0)
        self.art:SetShown(roomy and true or false)
    end

    function frame:SetArt(name)
        local path = name and UI.Media and UI.Media.Path("Empty/" .. name)
        self.artPath = path
        if path then
            self.art:SetTexture(path)
            self.art:SetVertexColor(Theme.Get("textMuted"))
        end
        self:LayoutArt()
    end

    frame:SetScript("OnSizeChanged", function(self) self:LayoutArt() end)
    frame:SetArt(art)
    return frame
end

--------------------------------------------------------------------------
-- Context menu
--------------------------------------------------------------------------

--- A small right-click menu.
---
--- Deliberately built from ordinary frames rather than from the client's
--- UIDropDownMenu: that API differs across the four supported clients, carries
--- a well-known taint history, and would have to be feature-detected anyway.
--- A list of buttons in a panel has none of those problems.
---
--- One menu exists for the whole addon and is reused. It is never shown while
--- another is open.
local contextMenu

local function BuildContextMenu()
    if contextMenu then return contextMenu end

    local menu = CreateFrame("Frame", "WTMContextMenu", UIParent)
    menu:SetFrameStrata("FULLSCREEN_DIALOG")
    menu:SetClampedToScreen(true)
    menu:EnableMouse(true)
    menu:Hide()
    UI.Fill(menu, "elevated", 0.98)
    UI.Border(menu, "TLBR", "borderStrong")

    menu.items = {}
    menu.ROW_HEIGHT = 22
    menu.WIDTH = 190

    -- Clicking anywhere else closes it. A frame behind the menu, not a global
    -- mouse hook: no other addon's clicks are intercepted.
    menu.blocker = CreateFrame("Button", nil, UIParent)
    menu.blocker:SetAllPoints(UIParent)
    menu.blocker:SetFrameStrata("FULLSCREEN")
    menu.blocker:RegisterForClicks("AnyUp")
    menu.blocker:SetScript("OnClick", function() UI.HideContextMenu() end)
    menu.blocker:Hide()

    contextMenu = menu
    return menu
end

--- `entries` is a list of { label, onClick, disabled, reason, tooltip } or
--- { separator = true }. Anchors below `owner`, or at the cursor when there is
--- no sensible frame to hang it from.
function UI.ShowContextMenu(owner, entries, title)
    local menu = BuildContextMenu()
    UI.HideContextMenu()

    local y = 6
    if title then
        menu.title = menu.title or UI.Text(menu, "tiny", "textMuted", "LEFT")
        menu.title:SetPoint("TOPLEFT", 10, -6)
        menu.title:SetPoint("TOPRIGHT", -10, -6)
        menu.title:SetText(UI.FitText(menu.title, title))
        menu.title:Show()
        y = y + 16
    elseif menu.title then
        menu.title:Hide()
    end

    for index, entry in ipairs(entries) do
        local item = menu.items[index]
        if not item then
            item = CreateFrame("Button", nil, menu)
            item:SetHeight(menu.ROW_HEIGHT)
            item.text = UI.Text(item, "small", "textSecondary", "LEFT")
            item.text:SetPoint("LEFT", 10, 0)
            item.text:SetPoint("RIGHT", -10, 0)
            item.highlight = item:CreateTexture(nil, "BACKGROUND")
            item.highlight:SetAllPoints()
            item.highlight:SetColorTexture(Theme.Get("hover", 0.8))
            item.highlight:Hide()
            item:SetScript("OnEnter", function(self)
                if not self.disabled then self.highlight:Show() end
                if self.tooltip then
                    UI.ShowTooltip(self, self.text:GetText(), self.tooltip)
                end
            end)
            item:SetScript("OnLeave", function(self)
                self.highlight:Hide()
                UI.HideTooltip()
            end)
            item:SetScript("OnClick", function(self)
                if self.disabled then return end
                UI.HideContextMenu()
                if self.onClick then self.onClick() end
            end)
            menu.items[index] = item
        end

        item:ClearAllPoints()
        item:SetPoint("TOPLEFT", 0, -y)
        item:SetPoint("TOPRIGHT", 0, -y)
        item.onClick = entry.onClick
        item.disabled = entry.disabled and true or false
        item.tooltip = entry.disabled and (entry.reason or entry.tooltip) or entry.tooltip
        item.text:SetText(UI.FitText(item.text, entry.label or ""))
        -- Written out rather than as `disabled and Theme.Get(a) or Theme.Get(b)`.
        -- In Lua 5.1 an and/or expression yields exactly ONE value, so that
        -- form hands SetTextColor a red channel and two nils, and the client
        -- throws the moment the menu opens. Third time this class has bitten
        -- this file; it is only ever safe when the and/or picks the NAME
        -- inside the call, never when it picks between two calls.
        if entry.disabled then
            item.text:SetTextColor(Theme.Get("textMuted"))
        else
            item.text:SetTextColor(Theme.Get("textSecondary"))
        end
        item:Show()
        y = y + menu.ROW_HEIGHT
    end

    for i = #entries + 1, #menu.items do menu.items[i]:Hide() end

    menu:SetSize(menu.WIDTH, y + 6)
    menu:ClearAllPoints()
    if owner then
        menu:SetPoint("TOPLEFT", owner, "BOTTOMLEFT", 0, -2)
    else
        menu:SetPoint("CENTER")
    end
    menu.blocker:Show()
    menu:Show()
    -- Above the blocker, which is what makes the menu itself clickable.
    menu:SetFrameStrata("FULLSCREEN_DIALOG")
    return menu
end

function UI.HideContextMenu()
    if not contextMenu then return end
    contextMenu:Hide()
    contextMenu.blocker:Hide()
end

function UI.IsContextMenuShown()
    return contextMenu and contextMenu:IsShown() or false
end

--------------------------------------------------------------------------
-- Copy box
--------------------------------------------------------------------------

--- Shows text in a selectable edit box.
---
--- WoW gives addons no clipboard access at all - there is no SetClipboard and
--- no way to read one. The only thing an addon can do is put text somewhere the
--- player can select it and press Ctrl-C themselves, which is what this is. It
--- is labelled as such rather than pretending to have copied anything.
local copyBox

function UI.ShowCopyBox(text, title)
    if not copyBox then
        local frame = CreateFrame("Frame", "WTMCopyBox", UIParent)
        frame:SetSize(520, 300)
        frame:SetPoint("CENTER")
        frame:SetFrameStrata("DIALOG")
        frame:EnableMouse(true)
        UI.Fill(frame, "windowBg", 0.98)
        UI.Border(frame, "TLBR", "accentDim")

        local header = CreateFrame("Frame", nil, frame)
        header:SetHeight(32)
        header:SetPoint("TOPLEFT")
        header:SetPoint("TOPRIGHT")
        UI.Fill(header, "topbarBg")
        UI.MakeMovable(frame, header)

        frame.title = UI.Text(header, "title", "textPrimary", "LEFT")
        frame.title:SetPoint("LEFT", M.padding, 0)
        frame.title:SetPoint("RIGHT", header, "RIGHT", -70, 0)

        frame.close = UI.Button(header, "close", function() copyBox:Hide() end,
            { height = 20, style = "tiny", minWidth = 52 })
        frame.close:SetPoint("RIGHT", -8, 0)

        frame.hint = UI.Text(frame, "tiny", "textMuted", "LEFT")
        frame.hint:SetPoint("BOTTOMLEFT", M.padding, 10)
        frame.hint:SetPoint("RIGHT", frame, "RIGHT", -M.padding, 0)
        -- Two lines, wrapped. It was one unwrapped line 520 px wide in a
        -- 488 px box, so the last few words ran off the edge.
        frame.hint:SetHeight(26)
        UI.Wrap(frame.hint, 2)
        frame.hint:SetText("Select the text and press Ctrl-C. No addon can write to your clipboard, so this is as far as WoW allows.")

        local scroll = CreateFrame("ScrollFrame", "WTMCopyBoxScroll", frame)
        scroll:SetPoint("TOPLEFT", M.padding, -(32 + M.paddingSmall))
        scroll:SetPoint("BOTTOMRIGHT", -M.padding, 30)

        local edit = CreateFrame("EditBox", nil, scroll)
        edit:SetMultiLine(true)
        edit:SetAutoFocus(false)
        edit:SetWidth(480)
        edit:SetFontObject("ChatFontNormal")
        edit:SetScript("OnEscapePressed", function() copyBox:Hide() end)
        scroll:SetScrollChild(edit)
        frame.edit = edit

        -- A scrollbar for long text (a full report is far taller than this
        -- box). The text is kept clear of its gutter.
        local function FitToGutter()
            edit:SetWidth(520 - 2 * M.padding - UI.GetScrollbarGutter())
        end
        FitToGutter()
        UI.AttachScrollbar(scroll, edit, frame)
        scroll.onGutterChanged = FitToGutter

        copyBox = frame
    end

    copyBox.title:SetText(UI.FitText(copyBox.title, title or "Copy"))
    copyBox.edit:SetText(text or "")
    copyBox.edit:HighlightText()
    copyBox:Show()
    copyBox.edit:SetFocus()
    return copyBox
end

function UI.HideCopyBox()
    if copyBox then copyBox:Hide() end
end

--------------------------------------------------------------------------
-- Import box: a place to paste a long string
--------------------------------------------------------------------------

local importBox

--- A dialog with a big editable field. `onAccept(text)` runs on Import with
--- whatever was pasted (not trimmed or checked: the caller validates it).
function UI.ShowImportBox(title, hint, onAccept)
    if not importBox then
        local frame = CreateFrame("Frame", "WTMImportBox", UIParent)
        frame:SetSize(520, 320)
        frame:SetPoint("CENTER")
        frame:SetFrameStrata("DIALOG")
        frame:EnableMouse(true)
        UI.Fill(frame, "windowBg", 0.98)
        UI.Border(frame, "TLBR", "accentDim")

        local header = CreateFrame("Frame", nil, frame)
        header:SetHeight(32)
        header:SetPoint("TOPLEFT")
        header:SetPoint("TOPRIGHT")
        UI.Fill(header, "topbarBg")
        UI.MakeMovable(frame, header)

        frame.title = UI.Text(header, "title", "textPrimary", "LEFT")
        frame.title:SetPoint("LEFT", M.padding, 0)
        frame.title:SetPoint("RIGHT", header, "RIGHT", -M.padding, 0)

        frame.hint = UI.Text(frame, "tiny", "textMuted", "LEFT")
        frame.hint:SetPoint("BOTTOMLEFT", M.padding, 46)
        frame.hint:SetPoint("RIGHT", frame, "RIGHT", -M.padding, 0)
        frame.hint:SetHeight(26)
        UI.Wrap(frame.hint, 2)

        local field = CreateFrame("Frame", nil, frame)
        field:SetPoint("TOPLEFT", M.padding, -(32 + M.paddingSmall))
        field:SetPoint("BOTTOMRIGHT", -M.padding, 76)
        UI.Fill(field, "panelAlt")
        UI.Border(field, "TLBR", "borderStrong")

        local scroll = CreateFrame("ScrollFrame", nil, field)
        scroll:SetPoint("TOPLEFT", 6, -6)
        scroll:SetPoint("BOTTOMRIGHT", -6, 6)
        local edit = CreateFrame("EditBox", nil, scroll)
        edit:SetMultiLine(true)
        edit:SetAutoFocus(false)
        edit:SetMaxLetters(0)
        edit:SetFontObject("ChatFontNormal")
        edit:SetWidth(520 - 2 * M.padding - 12 - UI.GetScrollbarGutter())
        edit:SetScript("OnEscapePressed", function() frame:Hide() end)
        scroll:SetScrollChild(edit)
        frame.edit = edit
        UI.AttachScrollbar(scroll, edit, field)
        scroll.onGutterChanged = function()
            edit:SetWidth(520 - 2 * M.padding - 12 - UI.GetScrollbarGutter())
        end

        frame.accept = UI.Button(frame, "Import", function()
            local callback = frame.onAccept
            local text = edit:GetText() or ""
            if callback then callback(text) end
        end, { height = 24, width = 100, primary = true, icon = false })
        frame.accept:SetPoint("BOTTOMRIGHT", -M.padding, 12)
        frame.cancel = UI.Button(frame, "Cancel", function() frame:Hide() end,
            { height = 24, width = 100, icon = false })
        frame.cancel:SetPoint("RIGHT", frame.accept, "LEFT", -6, 0)

        frame.status = UI.Text(frame, "small", "textSecondary", "LEFT")
        frame.status:SetPoint("BOTTOMLEFT", M.padding, 16)
        frame.status:SetPoint("RIGHT", frame.cancel, "LEFT", -10, 0)

        frame:Hide()
        importBox = frame
    end

    importBox.title:SetText(UI.FitText(importBox.title, title or "Import"))
    importBox.hint:SetText(hint or "")
    importBox.status:SetText("")
    importBox.onAccept = onAccept
    importBox.edit:SetText("")
    importBox:Show()
    importBox.edit:SetFocus()
    return importBox
end

--- Shows the result of an import inside the box (green) or why it failed (red).
function UI.SetImportStatus(text, ok)
    if not importBox then return end
    importBox.status:SetText(text or "")
    importBox.status:SetTextColor(Theme:Tone(ok and "ok" or "crit"))
end

function UI.HideImportBox()
    if importBox then importBox:Hide() end
end

--------------------------------------------------------------------------
-- Prompt: one line of text from the user
--------------------------------------------------------------------------

local promptFrame

--- A small dialog with one text field. `onAccept(text)` runs on Save or Enter
--- with the trimmed text; it is not called for an empty one.
function UI.Prompt(title, default, onAccept, hint)
    if not promptFrame then
        local frame = CreateFrame("Frame", "WTMPrompt", UIParent)
        frame:SetSize(380, 136)
        frame:SetPoint("CENTER", 0, 80)
        frame:SetFrameStrata("DIALOG")
        frame:EnableMouse(true)
        UI.Fill(frame, "windowBg", 0.98)
        UI.Border(frame, "TLBR", "accentDim")

        local header = CreateFrame("Frame", nil, frame)
        header:SetHeight(30)
        header:SetPoint("TOPLEFT")
        header:SetPoint("TOPRIGHT")
        UI.Fill(header, "topbarBg")
        UI.MakeMovable(frame, header)

        frame.title = UI.Text(header, "title", "textPrimary", "LEFT")
        frame.title:SetPoint("LEFT", M.padding, 0)
        frame.title:SetPoint("RIGHT", header, "RIGHT", -M.padding, 0)

        local field = CreateFrame("Frame", nil, frame)
        field:SetHeight(26)
        field:SetPoint("TOPLEFT", M.padding, -42)
        field:SetPoint("TOPRIGHT", -M.padding, -42)
        UI.Fill(field, "panelAlt")
        UI.Border(field, "TLBR", "borderStrong")

        local edit = CreateFrame("EditBox", nil, field)
        edit:SetPoint("TOPLEFT", 8, 0)
        edit:SetPoint("BOTTOMRIGHT", -8, 0)
        edit:SetAutoFocus(false)
        edit:SetMaxLetters(32)
        Theme:SetFont(edit, "body", "textPrimary")
        edit:SetTextColor(T("textPrimary"))
        frame.edit = edit

        frame.hint = UI.Text(frame, "tiny", "textMuted", "LEFT")
        frame.hint:SetPoint("TOPLEFT", field, "BOTTOMLEFT", 0, -6)
        frame.hint:SetPoint("RIGHT", frame, "RIGHT", -M.padding, 0)

        local function Accept()
            local text = (edit:GetText() or ""):gsub("^%s+", ""):gsub("%s+$", "")
            if text == "" then return end
            local callback = frame.onAccept
            frame:Hide()
            if callback then callback(text) end
        end
        frame.Accept = Accept

        frame.save = UI.Button(frame, "Save", Accept, { height = 24, width = 90, primary = true, icon = false })
        frame.save:SetPoint("BOTTOMRIGHT", -M.padding, 12)
        frame.cancel = UI.Button(frame, "Cancel", function() frame:Hide() end,
            { height = 24, width = 90, icon = false })
        frame.cancel:SetPoint("RIGHT", frame.save, "LEFT", -6, 0)

        edit:SetScript("OnEnterPressed", Accept)
        edit:SetScript("OnEscapePressed", function() frame:Hide() end)
        frame:Hide()
        promptFrame = frame
    end

    promptFrame.title:SetText(UI.FitText(promptFrame.title, title or "Name"))
    promptFrame.hint:SetText(hint or "")
    promptFrame.onAccept = onAccept
    promptFrame.edit:SetText(default or "")
    promptFrame:Show()
    promptFrame.edit:SetFocus()
    promptFrame.edit:HighlightText()
    return promptFrame
end

function UI.HidePrompt()
    if promptFrame then promptFrame:Hide() end
end

--------------------------------------------------------------------------
-- Misc helpers
--------------------------------------------------------------------------

--- Makes a frame draggable by `handle`, clamped to the screen.
--- Dismisses every transient piece of UI: menus, dialogs, tooltips, overlays.
---
--- These are deliberately NOT children of the main window. A context menu has
--- to be able to extend past the window's edge and a copy box has to survive
--- the window being dragged, so both hang off UIParent - which also means
--- hiding the window does not hide them, and switching page does not either.
--- They stayed on screen, over the game world, until something happened to
--- close them by hand.
---
--- Anything that changes what the user is looking at calls this.
function UI.DismissTransient()
    UI.HideContextMenu()
    UI.HideCopyBox()
    UI.HidePrompt()
    UI.HideImportBox()
    -- Tooltip.lua loads after this file, so this is resolved at call time.
    if UI.HideTooltip then UI.HideTooltip() end
    -- The detail overlays belong to the row that opened them, and that row is
    -- on the page being left.
    if UI.AddonDetail and UI.AddonDetail.Close then UI.AddonDetail:Close() end
    if UI.ErrorDetail and UI.ErrorDetail.Close then UI.ErrorDetail:Close() end
end

function UI.MakeMovable(frame, handle, onStop)
    frame:SetMovable(true)
    frame:SetClampedToScreen(true)
    handle:EnableMouse(true)
    handle:RegisterForDrag("LeftButton")
    handle:SetScript("OnDragStart", function() frame:StartMoving() end)
    handle:SetScript("OnDragStop", function()
        frame:StopMovingOrSizing()
        if onStop then onStop() end
    end)
end

--- Adds a bottom-right resize grip drawn from plain textures.
--- `onStop` fires when the drag ends, `onUpdate` continuously while dragging.
--- Laying out only on release leaves every child at its old size for the whole
--- drag, which is what makes labels collide while a window is being resized.
function UI.MakeResizable(frame, minWidth, minHeight, onStop, onUpdate)
    frame:SetResizable(true)
    -- The setter was renamed in Retail 10.0; older clients only have the pair
    -- form.  Try both, quietly.
    if frame.SetResizeBounds then
        pcall(frame.SetResizeBounds, frame, minWidth, minHeight)
    elseif frame.SetMinResize then
        pcall(frame.SetMinResize, frame, minWidth, minHeight)
    end

    local grip = CreateFrame("Button", nil, frame)
    grip:SetSize(14, 14)
    grip:SetPoint("BOTTOMRIGHT", -2, 2)
    for i = 1, 3 do
        local line = grip:CreateTexture(nil, "OVERLAY")
        line:SetSize(9 - (i - 1) * 3, 1)
        line:SetPoint("BOTTOMRIGHT", 0, (i - 1) * 3 + 1)
        line:SetColorTexture(T("textMuted", 0.5))
    end

    local resizing
    grip:SetScript("OnMouseDown", function()
        if frame.StartSizing then frame:StartSizing("BOTTOMRIGHT") end
        resizing = true
    end)
    grip:SetScript("OnMouseUp", function()
        frame:StopMovingOrSizing()
        resizing = false
        if onStop then onStop() end
    end)
    if onUpdate then
        grip:SetScript("OnUpdate", function()
            if resizing then onUpdate() end
        end)
    end
    return grip
end

function UI.Anchor(frame, parent, point, relativePoint, x, y)
    frame:ClearAllPoints()
    frame:SetPoint(point, parent, relativePoint or point, x or 0, y or 0)
    return frame
end
