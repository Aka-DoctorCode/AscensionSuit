-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Tooltip.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local UX = lib.UX or {}
lib.UX = UX

function UX:attachTooltip(frame, title, description)
    if not frame or not description or description == "" then return end
    
    local oldEnter = frame:GetScript("OnEnter")
    local oldLeave = frame:GetScript("OnLeave")

    frame:SetScript("OnEnter", function(self)
        if oldEnter then oldEnter(self) end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(title or "Option Info", 1, 1, 1)
        GameTooltip:AddLine(description, 1, 0.82, 0, true)
        GameTooltip:Show()
    end)
    
    frame:SetScript("OnLeave", function(self)
        if oldLeave then oldLeave(self) end
        GameTooltip_Hide()
    end)
end
