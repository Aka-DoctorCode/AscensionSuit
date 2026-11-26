--[[
	Pixel-perfect scaling and snapping for UI elements.
	Uses a 768px reference height; scales and rounds values so they align to whole pixels.
]]

local ADDON_NAME, ns = ...
local NephUI = ns.Addon

if not NephUI then
	error("NephUI not found! PixelPerfect.lua must load after Main.lua")
end

local math_min, math_max, math_floor = math.min, math.max, math.floor
local str_format = string.format
local GetPhysicalScreenSize = GetPhysicalScreenSize

-- Reference height used for scale calculation (WoW's traditional UI reference)
local REFERENCE_HEIGHT = 768

-- Clamp bounds for "best" scale (prevents tiny or huge UI)
local SCALE_FLOOR = 0.4
local SCALE_CEIL = 1.15

-- Eyefinity: effective width by physical width threshold (high-res multi-monitor)
local EYEFINITY_THRESHOLDS = {
	{ 9840, 3280 }, { 7680, 2560 }, { 5760, 1920 }, { 5040, 1680 },
	{ 4320, 1440 }, { 4080, 1360 }, { 3840, 1224 },
}

local function effectiveWidthEyefinity(physW, physH, enabled)
	if not enabled or physW < 3840 then return nil end
	if physW >= 4800 and physW < 5760 and physH == 900 then return 1600 end
	for _, row in ipairs(EYEFINITY_THRESHOLDS) do
		local limit, width = row[1], row[2]
		if physW >= limit then return width end
	end
	return nil
end

-- Ultrawide: effective width for common 21:9 / ultrawide resolutions
local function effectiveWidthUltrawide(physW, physH, enabled)
	if not enabled or physW < 2560 then return nil end
	if physW >= 3440 and (physH == 1440 or physH == 1600) then return 2560 end
	if physW >= 2560 and (physH == 1080 or physH == 1200) then return 1920 end
	return nil
end

function NephUI:RefreshGlobalFX()
	local g = _G
	g.GlobalFXDialogModelScene:Hide()
	g.GlobalFXDialogModelScene:Show()
	g.GlobalFXMediumModelScene:Hide()
	g.GlobalFXMediumModelScene:Show()
	g.GlobalFXBackgroundModelScene:Hide()
	g.GlobalFXBackgroundModelScene:Show()
end

function NephUI:IsEyefinity(width, height)
	local enabled = (self.db and self.db.profile and self.db.profile.general and self.db.profile.general.eyefinity)
	return effectiveWidthEyefinity(width, height, enabled)
end

function NephUI:IsUltrawide(width, height)
	local enabled = (self.db and self.db.profile and self.db.profile.general and self.db.profile.general.ultrawide)
	return effectiveWidthUltrawide(width, height, enabled)
end

-- Recompute pixel-snap multiplier from current reference scale (no UIScale divisor in this addon)
function NephUI:UIMult()
	self.mult = self.perfect
end

-- Scale value clamped to a safe range for general use
function NephUI:PixelBestSize()
	local p = self.perfect
	if not p then return 1 end
	return math_max(SCALE_FLOOR, math_min(SCALE_CEIL, p))
end

-- Apply display / resolution change: update physical size, resolution string, and reference scale
function NephUI:PixelScaleChanged(event)
	if event == "UI_SCALE_CHANGED" then
		local pw, ph = GetPhysicalScreenSize()
		self.physicalWidth, self.physicalHeight = pw, ph
		self.resolution = str_format("%dx%d", pw, ph)
		self.perfect = REFERENCE_HEIGHT / ph
	end
	self:UIMult()
	if self.ActionBars and self.ActionBars.RefreshAll then
		self.ActionBars:RefreshAll()
	end
end

-- Snap a value to the pixel grid so it doesn't blur (same scaling/snapping behavior, different implementation)
function NephUI:Scale(x)
	local m = self.mult
	if m == 1 or x == 0 then
		return x
	end
	local step = (m > 1) and m or (-m)
	local remainder = x % (x < 0 and step or (-step))
	return x - remainder
end

-- Scale a border thickness and round to whole pixels; non-negative (0 = hide border)
function NephUI:ScaleBorder(borderSize)
	local raw = borderSize or 1
	raw = math_floor(raw + 0.5)
	if raw < 0 then raw = 0 end
	local out = self:Scale(raw)
	out = math_floor(out + 0.5)
	if out < 0 then out = 0 end
	return out
end
