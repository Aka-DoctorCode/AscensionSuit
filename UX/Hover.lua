-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Hover.lua
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
-- 2. HOVER VISUALS LOGIC
-- -------------------------------------------------------------------------------
--- Hooks a frame to automatically toggle its backdrop color between normal and hover states.
--- Respects the enabled/disabled state of the component if applicable.
function UX:addHoverColor(frame, normalColor, hoverColor)
    if not frame then return end
    
    -- Mouse Over state
    frame:HookScript("OnEnter", function(self)
        if self.IsEnabled and self:IsEnabled() == false then return end
        if type(self.SetBackdropColor) == "function" then
            self:SetBackdropColor(unpack(hoverColor))
        end
    end)
    
    -- Mouse Exit state
    frame:HookScript("OnLeave", function(self)
        if type(self.SetBackdropColor) == "function" then
            self:SetBackdropColor(unpack(normalColor))
        end
    end)
end
