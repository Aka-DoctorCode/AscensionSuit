-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Resizable.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local UX = lib.UX or {}
lib.UX = UX

function UX:makeResizable(frame, minWidth, minHeight)
    if not frame then return end
    frame:SetResizable(true)
    if minWidth and minHeight then
        if frame.SetResizeBounds then
            frame:SetResizeBounds(minWidth, minHeight, 0, 0)
        elseif frame.SetMinResize then
            frame:SetMinResize(minWidth, minHeight)
        end
    end
    
    local resizeBtn = CreateFrame("Button", nil, frame)
    resizeBtn:SetSize(16, 16)
    resizeBtn:SetPoint("BOTTOMRIGHT")
    resizeBtn:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    resizeBtn:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    resizeBtn:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    
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
