-------------------------------------------------------------------------------
-- Project: AscensionFactory
-- Author: Aka-DoctorCode
-- File: Resizable.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- Objective: Initialize UX namespace and link to global AscensionFactory library.
-- Variables:
-- MAJOR: Namespace identifier for addon library.
-- lib: Global AscensionFactory library object.
-- UX: Namespace table for UX helper functions.
-------------------------------------------------------------------------------
local MAJOR = "AscensionFactory"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local UX = lib.UX or {}
lib.UX = UX

-------------------------------------------------------------------------------
-- 2. RESIZE LOGIC
-- Objective: Configure frame to be resizable and add visual grabber handle at bottom-right.
-- Variables:
-- frame: Frame UI object made resizable.
-- minWidth: Minimum allowable width when resizing.
-- minHeight: Minimum allowable height when resizing.
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
    local resizeBtn = frame.resizeBtn
    if not resizeBtn then
        if frame.uiContext and frame.uiContext.acquireElement then
            resizeBtn = frame.uiContext:acquireElement("Button", frame, { width = 16, height = 16 })
        else
            resizeBtn = CreateFrame("Button", nil, frame)
            resizeBtn:SetSize(16, 16)
        end
        frame.resizeBtn = resizeBtn
    end
    resizeBtn:ClearAllPoints()
    resizeBtn:SetPoint("BOTTOMRIGHT")
    resizeBtn:Show()
    
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

-------------------------------------------------------------------------------
-- 3. EXTENSION & EXPANSION NOTES
-- Objective: Guidelines for custom resize handles, aspect ratio locking, and on-resize relayout callbacks.
--
-- How to expand:
-- 1. Resize Callbacks:
--    Hook `frame:HookScript("OnSizeChanged", function(self, w, h) ... end)` to dynamically recalculate
--    child column widths or scroll area bounds during user resizing.
-- 2. Four-Corner / Edge Handles:
--    Add optional side/corner handles (`"TOPRIGHT"`, `"BOTTOMLEFT"`, `"RIGHT"`, `"BOTTOM"`) by creating
--    additional grabber buttons calling `frame:StartSizing("<Point>")`.
-- 3. Dimension Persistence:
--    Store final `frame:GetSize()` values into `config.width` and `config.height` inside `OnMouseUp`
--    for automatic restoration across reload.
-------------------------------------------------------------------------------
