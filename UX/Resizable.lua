-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Resizable.lua
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
-- 2. RESIZE LOGIC
-- -------------------------------------------------------------------------------
--- Configures a frame to be resizable and adds a visual grabber handle at the bottom-right.
--- Handles API compatibility across different WoW versions (SetResizeBounds vs SetMinResize).
function UX:makeResizable(frame, minWidth, minHeight)
    if not frame then return end
    
    -- Configure Resize Properties
    frame:SetResizable(true)
    if minWidth and minHeight then
        if frame.SetResizeBounds then
            -- Modern 10.0+ API
            frame:SetResizeBounds(minWidth, minHeight, 0, 0)
        elseif frame.SetMinResize then
            -- Legacy API
            frame:SetMinResize(minWidth, minHeight)
        end
    end
    
    -- Create Grabber Handle
    local resizeBtn = CreateFrame("Button", nil, frame)
    resizeBtn:SetSize(16, 16)
    resizeBtn:SetPoint("BOTTOMRIGHT")
    resizeBtn:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    resizeBtn:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    resizeBtn:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    
    -- Handle Sizing Interaction
    resizeBtn:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            frame:StartSizing("BOTTOMRIGHT")
        end
    end)
    
    resizeBtn:SetScript("OnMouseUp", function(self, button)
        frame:StopMovingOrSizing()
    end)
    
    frame.resizeBtn = resizeBtn
end
