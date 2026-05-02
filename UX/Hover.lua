-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Hover.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local UX = lib.UX or {}
lib.UX = UX

function UX:addHoverColor(frame, normalColor, hoverColor)
    if not frame then return end
    
    frame:HookScript("OnEnter", function(self)
        if self.IsEnabled and self:IsEnabled() == false then return end
        if type(self.SetBackdropColor) == "function" then
            self:SetBackdropColor(unpack(hoverColor))
        end
    end)
    
    frame:HookScript("OnLeave", function(self)
        if type(self.SetBackdropColor) == "function" then
            self:SetBackdropColor(unpack(normalColor))
        end
    end)
end
