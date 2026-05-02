-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: ClickOutside.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local UX = lib.UX or {}
lib.UX = UX

function UX:registerClickOutside(frame, callback)
    if not frame then return end
    if not _G["AscensionSuitClickOutsideBlocker"] then
        local blocker = CreateFrame("Button", "AscensionSuitClickOutsideBlocker", UIParent)
        blocker:SetAllPoints()
        blocker:SetFrameStrata("FULLSCREEN_DIALOG")
        blocker:SetFrameLevel(90)
        blocker:Hide()
        blocker:SetScript("OnClick", function(self)
            self:Hide()
            if self.callback then self.callback() end
        end)
    end
    
    local blocker = _G["AscensionSuitClickOutsideBlocker"]
    
    frame:HookScript("OnShow", function()
        blocker:SetFrameLevel(frame:GetFrameLevel() - 1)
        blocker.callback = callback
        blocker:Show()
    end)
    
    frame:HookScript("OnHide", function()
        if blocker:IsShown() and blocker.callback == callback then
            blocker:Hide()
        end
    end)
end
