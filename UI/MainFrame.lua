-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: MainFrame.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

--- Creates a standardized main application window for the suite.
--- @param options table Configuration options:
---   - name (string): Global name for the frame.
---   - title (string): Header text.
---   - width (number): Optional width.
---   - height (number): Optional height.
---   - tabNames (table): List of strings for the sidebar.
---   - tabFuncs (table): List of functions to build tab content.
---   - initialTab (number): Optional starting tab index.
function Context:createMainFrame(options)
    local styles = self.styles
    local ux = lib.UX

    -- 1. Main Frame Base
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
    frame:SetBackdropColor(unpack(styles.colors.backgroundDark))
    frame:SetBackdropBorderColor(unpack(styles.colors.surfaceHighlight))

    -- 2. Standard UX Behaviors
    if ux then
        ux:makeMovable(frame)
        ux:makeResizable(frame, 400, 300)
        ux:makeClosableWithEscape(frame)
    end
    tinsert(_G.UISpecialFrames, options.name)

    -- 3. Header Title
    local title = frame:CreateFontString(nil, "OVERLAY", styles.fonts.header)
    title:SetPoint("TOPLEFT", styles.dimensions.titleLeft, styles.dimensions.titleTop)
    title:SetText(options.title or "Ascension Window")
    title:SetTextColor(unpack(styles.colors.gold))

    -- 4. Close Button
    local closeBtn = self:createCloseButton(frame, function() frame:Hide() end)
    closeBtn:SetPoint("TOPRIGHT", -8, -8)

    -- 5. Tabbed Interface (Sidebar + Content Panels)
    local tabbedUI = self:createTabbedInterface(frame, options.tabNames, options.tabFuncs, options.initialTab or 1)
    
    frame.tabbedUI = tabbedUI
    return frame
end
