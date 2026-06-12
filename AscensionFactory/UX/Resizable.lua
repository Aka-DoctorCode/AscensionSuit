-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Resizable.lua
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
-- 2. RESIZE LOGIC
-------------------------------------------------------------------------------
--- Configures a frame to be resizable and adds a visual grabber handle at the bottom-right.
function UX:makeResizable(frame, minWidth, minHeight)
    if not frame then return end
    
    -- Configure Resize Properties
    -- SetResizable(true) allows the frame's dimensions to be changed dynamically by the user dragging it.
    frame:SetResizable(true)
    if minWidth and minHeight then
        -- SetResizeBounds args:
        -- 1: minWidth (minimum width)
        -- 2: minHeight (minimum height)
        -- 3: 0 (maxWidth, 0 means no limit)
        -- 4: 0 (maxHeight, 0 means no limit)
        frame:SetResizeBounds(minWidth, minHeight, 0, 0)
    end
    
    -- Create Grabber Handle
    -- CreateFrame args:
    -- 1: "Button" (frame type)
    -- 2: nil (global name)
    -- 3: frame (parent frame)
    local resizeBtn = CreateFrame("Button", nil, frame)
    resizeBtn:SetSize(16, 16) -- Force it to be 16x16 pixels.
    resizeBtn:SetPoint("BOTTOMRIGHT") -- Anchor it exclusively to the absolute bottom-right corner.
    
    -- Assign standard Blizzard chat-frame drag textures to make it look like a resizing grip.
    resizeBtn:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    resizeBtn:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    resizeBtn:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    
    -- Handle Sizing Interaction
    -- SetScript args:
    -- 1: "OnMouseDown" (event script handler name)
    -- 2: function (callback)
    resizeBtn:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            -- StartSizing("BOTTOMRIGHT") tells WoW to stretch the frame by pulling from the bottom-right corner.
            frame:StartSizing("BOTTOMRIGHT")
        end
    end)
    
    -- SetScript args:
    -- 1: "OnMouseUp" (event script handler name)
    -- 2: function (callback)
    resizeBtn:SetScript("OnMouseUp", function(self, button)
        -- Stop moving or stretching the frame.
        frame:StopMovingOrSizing()
    end)
    
    -- Store a reference to the button on the frame so it can be accessed or modified later if needed.
    frame.resizeBtn = resizeBtn
end
