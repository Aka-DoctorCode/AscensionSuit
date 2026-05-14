-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: MainFrame.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-------------------------------------------------------------------------------
local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

-------------------------------------------------------------------------------
-- 2. FRAME FACTORY
-------------------------------------------------------------------------------
--- Creates the primary application window.
function Context:createMainFrame(options)
    local styles = self.styles
    local ux = lib.UX
    
    -- Main Frame
    local frame = CreateFrame("Frame", options.name, _G.UIParent, "BackdropTemplate")
    frame:SetSize(options.width or 850, options.height or 500)
    frame:SetPoint(options.anchor or "CENTER")
    frame:SetFrameStrata(options.strata or "DIALOG")

    frame:SetBackdrop({
        bgFile = styles.files.bgFile,
        edgeFile = styles.files.edgeFile,
        edgeSize = 3,
        insets = { left = 2, right = 2, top = 3, bottom = 3 }
    })
    frame:SetBackdropColor(unpack(styles.colors.mainBackground))
    frame:SetBackdropBorderColor(unpack(styles.colors.sidebarAccent))

    -- Header Title

    if ux then
        ux:makeMovable(frame)
        ux:makeClosableWithEscape(frame)
    end

    return frame
end