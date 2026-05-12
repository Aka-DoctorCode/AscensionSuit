-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Tooltip.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-- -------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- -------------------------------------------------------------------------------
local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local UX = lib.UX or {}
lib.UX = UX

-- -------------------------------------------------------------------------------
-- 2. TOOLTIP FACTORY
-- -------------------------------------------------------------------------------
--- Internal helper to retrieve or create the persistent custom tooltip singleton.
--- Configures a premium look with deep dark background and large typography.
local function getCustomTooltip()
    if lib.customTooltip then return lib.customTooltip end

    local f = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
    f:SetClampedToScreen(true)
    f:SetFrameStrata("TOOLTIP")
    f:Hide()

    -- Premium look: Deep dark background with no transparency
    f:SetBackdrop({
        bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets   = { left = 3, right = 3, top = 3, bottom = 3 }
    })
    f:SetBackdropColor(0.02, 0.02, 0.03, 1.0) -- 100% Alpha
    f:SetBackdropBorderColor(0.4, 0.4, 0.5, 1.0)

    -- Larger Title
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 12, -12)
    title:SetJustifyH("LEFT")
    f.title = title

    -- Larger Description
    local desc = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
    desc:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
    desc:SetWidth(280)
    desc:SetJustifyH("LEFT")
    desc:SetSpacing(3)
    f.desc = desc

    lib.customTooltip = f
    return f
end

-- -------------------------------------------------------------------------------
-- 3. PUBLIC API
-- -------------------------------------------------------------------------------
--- Attaches a custom stylized tooltip to a frame.
--- Automatically handles OnEnter and OnLeave script hooks.
function UX:attachTooltip(frame, title, description)
    if not frame or not description or description == "" then return end
    
    local tooltip = getCustomTooltip()
    local oldEnter = frame:GetScript("OnEnter")
    local oldLeave = frame:GetScript("OnLeave")

    -- Mouse Over Hook
    frame:SetScript("OnEnter", function(self)
        if oldEnter then oldEnter(self) end
        
        tooltip.title:SetText(title or "Option Info")
        tooltip.desc:SetText(description)
        
        -- Adjust height dynamically based on content length
        local contentHeight = tooltip.title:GetHeight() + tooltip.desc:GetHeight() + 32
        tooltip:SetSize(304, contentHeight)
        
        tooltip:ClearAllPoints()
        tooltip:SetPoint("BOTTOMLEFT", self, "TOPRIGHT", 10, 0)
        tooltip:Show()
    end)
    
    -- Mouse Exit Hook
    frame:SetScript("OnLeave", function(self)
        if oldLeave then oldLeave(self) end
        tooltip:Hide()
    end)
end
