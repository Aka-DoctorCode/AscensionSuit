-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Closable.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-------------------------------------------------------------------------------
local MAJOR = "AscensionFactory"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local UX = lib.UX or {}
lib.UX = UX

-------------------------------------------------------------------------------
-- 2. ESCAPE KEY LOGIC
-------------------------------------------------------------------------------
--- Configures a frame to be hidable when the user presses the Escape key.
function UX:makeClosableWithEscape(frame)
    if not frame then return end
    
    local name = frame:GetName()
    if name and UISpecialFrames then
        -- Register with Blizzard's UISpecialFrames if named
        _G[name] = frame
        tinsert(UISpecialFrames, name)
    else
        -- Asegura que al volver a abrir la interfaz, las teclas fluyan correctamente hacia el juego de nuevo
        frame:HookScript("OnShow", function(self)
            self:SetPropagateKeyboardInput(true)
        end)

        frame:SetPropagateKeyboardInput(true)
        frame:SetScript("OnKeyDown", function(self, key)
            if key == "ESCAPE" then
                self:SetPropagateKeyboardInput(false)
                self:Hide()
            else
                self:SetPropagateKeyboardInput(true)
            end
        end)
    end
end
