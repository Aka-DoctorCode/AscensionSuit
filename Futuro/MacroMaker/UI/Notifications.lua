--------------------------------------------------------------------------------
-- Macro Maker - Notifications Module
-- Version: 2.0
-- Author: Satyros
--
-- Description:
--   Floating in-frame notification system replacing print() calls.
--   Supports success, error, and info notifications with auto-fade.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

local NOTIFICATION_COLORS = {
    success = { r = 0.2, g = 1.0, b = 0.3 },
    error   = { r = 1.0, g = 0.3, b = 0.2 },
    info    = { r = 0.4, g = 0.8, b = 1.0 },
    warning = { r = 1.0, g = 0.8, b = 0.2 },
}

local FADE_DURATION = 0.5
local DISPLAY_TIME = 3.0

local notificationPool = {}
local activeNotifications = {}

--- Creates a notification frame from the pool or new.
local function GetNotificationFrame()
    -- Reuse hidden frames
    for _, frame in ipairs(notificationPool) do
        if not frame:IsShown() then
            return frame
        end
    end
    
    -- Create new
    local anchor = MM.MainFrame or UIParent
    local f = CreateFrame("Frame", nil, anchor, "BackdropTemplate")
    f:SetSize(400, 36)
    f:SetFrameStrata("FULLSCREEN_DIALOG")
    f:SetFrameLevel(9000)
    
    f:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 }
    })
    
    local icon = f:CreateTexture(nil, "ARTWORK")
    icon:SetSize(18, 18)
    icon:SetPoint("LEFT", 10, 0)
    f.icon = icon
    
    local text = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    text:SetPoint("LEFT", icon, "RIGHT", 8, 0)
    text:SetPoint("RIGHT", -10, 0)
    text:SetJustifyH("LEFT")
    text:SetWordWrap(false)
    f.text = text
    
    table.insert(notificationPool, f)
    return f
end

--- Re-anchors all active notifications in a stack.
local function ReAnchorNotifications()
    local anchor = MM.MainFrame or UIParent
    local yOffset = -5
    
    for i = #activeNotifications, 1, -1 do
        local n = activeNotifications[i]
        if not n:IsShown() then
            table.remove(activeNotifications, i)
        end
    end
    
    for i, n in ipairs(activeNotifications) do
        n:ClearAllPoints()
        n:SetPoint("TOP", anchor, "TOP", 0, yOffset)
        yOffset = yOffset - 40
    end
end

--- Shows a floating notification.
--- @param text string The message to display.
--- @param nType string "success", "error", "info", or "warning".
function MM:Notify(text, nType)
    nType = nType or "info"
    local color = NOTIFICATION_COLORS[nType] or NOTIFICATION_COLORS.info
    
    -- Always print to chat as fallback (useful when UI is closed)
    if not MM.MainFrame or not MM.MainFrame:IsShown() then
        local prefix = "|cff00ccffMacro Maker|r: "
        print(prefix .. text)
        return
    end
    
    local f = GetNotificationFrame()
    f:SetParent(MM.MainFrame)
    
    -- Style
    f:SetBackdropColor(0, 0, 0, 0.85)
    f:SetBackdropBorderColor(color.r, color.g, color.b, 0.8)
    
    -- Icon
    if nType == "success" then
        f.icon:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
    elseif nType == "error" then
        f.icon:SetTexture("Interface\\RaidFrame\\ReadyCheck-NotReady")
    elseif nType == "warning" then
        f.icon:SetTexture("Interface\\DialogFrame\\UI-Dialog-Icon-AlertNew")
    else
        f.icon:SetTexture("Interface\\common\\help-i")
    end
    
    f.text:SetText(text)
    f.text:SetTextColor(color.r, color.g, color.b)
    
    f:SetAlpha(1)
    f:Show()
    
    table.insert(activeNotifications, f)
    ReAnchorNotifications()
    
    -- Auto-hide after delay
    if f.fadeTimer then
        f.fadeTimer:Cancel()
    end
    
    f.fadeTimer = C_Timer.NewTimer(DISPLAY_TIME, function()
        if UIFrameFadeOut then
            UIFrameFadeOut(f, FADE_DURATION, 1, 0)
            C_Timer.After(FADE_DURATION, function()
                f:Hide()
                ReAnchorNotifications()
            end)
        else
            f:Hide()
            ReAnchorNotifications()
        end
    end)
end
