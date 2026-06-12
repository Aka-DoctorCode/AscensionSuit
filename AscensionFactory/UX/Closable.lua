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
        -- Register with Blizzard's UISpecialFrames if named.
        -- UISpecialFrames is a global table built into WoW. Frames added here automatically close when Escape is pressed.
        _G[name] = frame
        -- tinsert is a standard Lua function that adds an item to an array.
        tinsert(UISpecialFrames, name)
    else
        -- Ensure that when reopening the interface, keyboard inputs flow correctly to the game world.
        -- HookScript adds a function to run whenever the "OnShow" event triggers, without overwriting existing scripts.
        -- HookScript args:
        -- 1: "OnShow" (event script handler name)
        -- 2: function (callback when shown)
        frame:HookScript("OnShow", function(self)
            -- SetPropagateKeyboardInput args:
            -- 1: true (allow keyboard input to pass through to game)
            self:SetPropagateKeyboardInput(true)
        end)

        frame:SetPropagateKeyboardInput(true)
        
        -- SetScript args:
        -- 1: "OnKeyDown" (event script handler name)
        -- 2: function (callback when key is pressed)
        frame:SetScript("OnKeyDown", function(self, key)
            if key == "ESCAPE" then
                -- Consume the Escape key (propagate=false) so the main game menu doesn't also pop up.
                self:SetPropagateKeyboardInput(false)
                self:Hide() -- Close the frame
            else
                -- Pass other keys through to the game natively.
                self:SetPropagateKeyboardInput(true)
            end
        end)
    end
end
