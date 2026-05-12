-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: MainFrame.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-- -------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- -------------------------------------------------------------------------------
local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

-- -------------------------------------------------------------------------------
-- 2. MAIN FRAME FACTORY
-- -------------------------------------------------------------------------------
--- Creates the primary application window with a sidebar and content area.
function Context:createMainFrame(options)
    local styles = self.styles
    local ux = lib.UX

    -- Main Frame Base
    local frame = CreateFrame("Frame", options.name, _G.UIParent, "BackdropTemplate")
    frame:SetSize(options.width or 850, options.height or 500)
    frame:SetPoint("CENTER")
    frame:SetFrameStrata("DIALOG")
    
    frame:SetBackdrop({
        bgFile = styles.files.bgFile,
        edgeFile = styles.files.edgeFile,
        edgeSize = styles.dimensions.backdropEdgeSize or 1,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    frame:SetBackdropColor(unpack(styles.colors.mainBackground))
    frame:SetBackdropBorderColor(unpack(styles.colors.sidebarAccent))

    -- Standard UX Behaviors (Movable, Resizable, Closable)
    if ux then
        ux:makeMovable(frame)
        ux:makeResizable(frame, 400, 300)
        ux:makeClosableWithEscape(frame)
    end
    tinsert(_G.UISpecialFrames, options.name)

    -- Header Title
    local title = frame:CreateFontString(nil, "OVERLAY", styles.fonts.header)
    title:SetPoint("TOPLEFT", styles.dimensions.titleLeft, styles.dimensions.titleTop)
    title:SetText(options.title or "Ascension Window")
    title:SetTextColor(unpack(styles.colors.gold))

    -- Close Button Integration
    local closeBtn = self:createCloseButton(frame, function() frame:Hide() end)
    closeBtn:SetPoint("TOPRIGHT", -8, -8)

    -- Tabbed Interface (Sidebar + Content Panels)
    local tabbedUI = self:createTabbedInterface(frame, options.tabNames, options.tabFuncs, options.initialTab or 1)
    
    frame.tabbedUI = tabbedUI
    return frame
end
