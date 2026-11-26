--[[--------------------------------------------------------------------------
    WoW Task Manager - UI/Widgets/Art.lua

    Everything that turns a shipped texture into part of a widget.

    The rule the whole addon follows still holds: every caller works WITHOUT
    the artwork. Each helper here returns nil/false when the file is not
    shipped (or the user switched artwork off with /wtm art off), and the
    caller then builds its flat, file-free version exactly as before.

    All shipped glyphs are white on transparent, so a tint recolours them the
    same way SetColorTexture recolours a flat rectangle.
----------------------------------------------------------------------------]]

local ADDON_NAME, WTM = ...

local UI    = WTM.UI
local Theme = UI.Theme
local Media = UI.Media

local Art = {}
UI.Art = Art

--- Texture path for "Folder/name", or nil.
function Art.Path(name)
    return Media.Path(name)
end

--- True when artwork is shipped and switched on.
function Art.Enabled()
    return Media.Enabled() and Media.Path("UI/dot") ~= nil
end

--------------------------------------------------------------------------
-- Single glyphs
--------------------------------------------------------------------------

--- Points `texture` at a glyph and tints it. Returns true when the glyph was
--- used; on false the caller keeps whatever flat fill it had.
function Art.Glyph(texture, name, r, g, b, a)
    local path = Media.Path(name)
    if not path then return false end
    texture:SetTexture(path)
    texture:SetTexCoord(0, 1, 0, 1)
    texture:SetVertexColor(r or 1, g or 1, b or 1, a or 1)
    return true
end

local TONE_GLYPH = {
    ok   = "Status/status_ok",
    good = "Status/status_ok",
    warn = "Status/status_warn",
    crit = "Status/status_crit",
    info = "Status/status_info",
    muted   = nil,
    accent  = nil,
}

--- A status indicator for a tone. With artwork it is a SHAPE (check, triangle,
--- cross, i) as well as a colour, so it still reads for a colour-blind user;
--- without it, the flat square the caller already had.
---
--- `fallbackSize` is the size of that square. Returns true when a glyph was used.
function Art.ToneGlyph(texture, tone, glyphSize, fallbackSize)
    local name = TONE_GLYPH[tone or ""]
    local r, g, b, a = Theme:Tone(tone or "muted")
    if name and Art.Glyph(texture, name, r, g, b, a) then
        texture:SetSize(glyphSize, glyphSize)
        return true
    end
    texture:SetColorTexture(r, g, b, a)
    if fallbackSize then texture:SetSize(fallbackSize, fallbackSize) end
    return false
end

--- Spike class -> severity glyph.
local SEVERITY_GLYPH = {
    freeze  = "Status/severity_freeze",
    heavy   = "Status/severity_heavy",
    stutter = "Status/severity_stutter",
    minor   = "Status/severity_minor",
}

function Art.SeverityGlyph(texture, kind, r, g, b, a)
    local name = SEVERITY_GLYPH[kind or ""]
    return name and Art.Glyph(texture, name, r, g, b, a) or false
end

--- Timeline marker kind -> glyph (kinds are the keys of WTM.C.MARKERS).
local MARKER_GLYPH = {
    combat     = "Status/marker_combat",
    encounter  = "Status/marker_encounter",
    zone       = "Status/marker_zone",
    loading    = "Status/marker_loading",
    luaerror   = "Status/marker_error",
    errorstorm = "Status/marker_error",
    custom     = "Status/marker_note",
    alert      = "Status/marker_note",
}

--- Name of the marker glyph for a marker kind/severity, or nil to use the tick.
function Art.MarkerGlyphName(kind, severity)
    if severity and SEVERITY_GLYPH[severity] then return SEVERITY_GLYPH[severity] end
    return MARKER_GLYPH[kind or ""]
end

--------------------------------------------------------------------------
-- 9-slice
--------------------------------------------------------------------------
-- Not the client's own texture slicing: that exists on Retail only, and this
-- addon runs on five clients. Nine plain textures with texture coordinates work
-- on all of them.
--
-- The artwork keeps a transparent margin around its shape, so the slices are
-- cut from the SHAPE bounds (Media.BOUNDS), not from the file edge.

--- Slices `name` onto `parent`.
---   opts.c       corner size in texture pixels
---   opts.s       corner size on screen (default: opts.c)
---   opts.layer   draw layer (default BACKGROUND), opts.sub its sublevel
---   opts.center  false for an outline-only texture
--- Returns an object with SetColorTexture/SetVertexColor/Show/Hide/SetShown,
--- or nil when the texture is not available.
function Art.NineSlice(parent, name, opts)
    local path = Media.Path(name)
    local bounds = Media.BOUNDS[name]
    if not path or not bounds then return nil end
    opts = opts or {}

    local tw, th, l, t, r, b = bounds[1], bounds[2], bounds[3], bounds[4], bounds[5], bounds[6]
    local c = math.min(opts.c or 8, math.floor((r - l) / 2), math.floor((b - t) / 2))
    if c < 1 then return nil end
    local s = opts.s or c
    local layer, sub = opts.layer or "BACKGROUND", opts.sub or 0

    local pieces = {}
    local function piece(x0, x1, y0, y1)
        local tex = parent:CreateTexture(nil, layer, nil, sub)
        tex:SetTexture(path)
        tex:SetTexCoord(x0 / tw, x1 / tw, y0 / th, y1 / th)
        pieces[#pieces + 1] = tex
        return tex
    end

    local xs = { l, l + c, r - c, r }
    local ys = { t, t + c, b - c, b }

    local tl = piece(xs[1], xs[2], ys[1], ys[2]); tl:SetSize(s, s); tl:SetPoint("TOPLEFT", parent, "TOPLEFT")
    local tr = piece(xs[3], xs[4], ys[1], ys[2]); tr:SetSize(s, s); tr:SetPoint("TOPRIGHT", parent, "TOPRIGHT")
    local bl = piece(xs[1], xs[2], ys[3], ys[4]); bl:SetSize(s, s); bl:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT")
    local br = piece(xs[3], xs[4], ys[3], ys[4]); br:SetSize(s, s); br:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT")

    local top = piece(xs[2], xs[3], ys[1], ys[2])
    top:SetHeight(s)
    top:SetPoint("TOPLEFT", tl, "TOPRIGHT"); top:SetPoint("TOPRIGHT", tr, "TOPLEFT")

    local bottom = piece(xs[2], xs[3], ys[3], ys[4])
    bottom:SetHeight(s)
    bottom:SetPoint("BOTTOMLEFT", bl, "BOTTOMRIGHT"); bottom:SetPoint("BOTTOMRIGHT", br, "BOTTOMLEFT")

    local left = piece(xs[1], xs[2], ys[2], ys[3])
    left:SetWidth(s)
    left:SetPoint("TOPLEFT", tl, "BOTTOMLEFT"); left:SetPoint("BOTTOMLEFT", bl, "TOPLEFT")

    local right = piece(xs[3], xs[4], ys[2], ys[3])
    right:SetWidth(s)
    right:SetPoint("TOPRIGHT", tr, "BOTTOMRIGHT"); right:SetPoint("BOTTOMRIGHT", br, "TOPRIGHT")

    if opts.center ~= false then
        local center = piece(xs[2], xs[3], ys[2], ys[3])
        center:SetPoint("TOPLEFT", tl, "BOTTOMRIGHT"); center:SetPoint("BOTTOMRIGHT", br, "TOPLEFT")
    end

    local slice = { pieces = pieces, isSlice = true }
    function slice:SetColorTexture(cr, cg, cb, ca)
        for i = 1, #self.pieces do self.pieces[i]:SetVertexColor(cr, cg, cb, ca or 1) end
    end
    slice.SetVertexColor = slice.SetColorTexture
    function slice:SetShown(shown)
        for i = 1, #self.pieces do self.pieces[i]:SetShown(shown) end
    end
    function slice:Show() self:SetShown(true) end
    function slice:Hide() self:SetShown(false) end
    return slice
end

--- Hides every texture of a flat panel (fill, hairlines, highlight) so a sliced
--- one can take its place.
local function HideFlat(frame)
    if frame.bg and frame.bg.Hide then frame.bg:Hide() end
    if frame.borders then
        for _, edge in pairs(frame.borders) do
            if type(edge) == "table" and edge.Hide then edge:Hide() end
        end
    end
    if frame.topHighlight then frame.topHighlight:Hide() end
end

--- Gives a panel rounded corners: a sliced fill and a sliced outline replace its
--- flat fill and hairlines. frame.bg keeps working (SetColorTexture) because the
--- slice answers to the same call. Returns true when it was applied.
function Art.Round(frame, fillColor, fillAlpha, borderColor, borderAlpha, withBorder)
    local fill = Art.NineSlice(frame, "UI/card_fill", { c = 10, s = 8 })
    if not fill then return false end
    HideFlat(frame)
    fill:SetColorTexture(Theme.Get(fillColor or "panelBg", fillAlpha))
    frame.bg = fill

    if withBorder ~= false then
        local outline = Art.NineSlice(frame, "UI/card_border",
            { c = 10, s = 8, layer = "BORDER", center = false })
        if outline then
            outline:SetColorTexture(Theme.Get(borderColor or "borderSubtle", borderAlpha))
            frame.outline = outline
        end
    end

    -- The accent bar is a square strip down the left edge; keep it inside the
    -- rounded corners instead of poking out of them.
    if frame.accentBar then
        frame.accentBar:ClearAllPoints()
        frame.accentBar:SetPoint("TOPLEFT", 0, -8)
        frame.accentBar:SetPoint("BOTTOMLEFT", 0, 8)
    end
    frame.rounded = true
    return true
end
