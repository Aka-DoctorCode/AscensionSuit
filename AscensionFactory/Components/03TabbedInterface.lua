-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: TabbedInterface.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-------------------------------------------------------------------------------
local MAJOR = "AscensionFactory"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

-------------------------------------------------------------------------------
-- 2. TABBED INTERFACE FACTORY
-------------------------------------------------------------------------------
-- Creates a complex UI structure with a vertical sidebar for navigation and multiple content panels.
function Context:createTabbedInterface(options)
    local parent = options.parent
    local startY = options.startY
    local initialIndex = options.initialIndex
    
    assert(initialIndex, "createTabbedInterface: initialIndex is required!")

    local styles = self.styles
    local tabs = {}
    local panels = {}
    local activeTab = initialIndex

    -------------------------------------------------------------------------------
    -- 2.1. TAB SELECTION LOGIC
    -------------------------------------------------------------------------------
    --- Switches the active view to the specified tab index.
    local function selectTab(index)
        activeTab = index
        -- Update Tab Buttons Visual State
        for i, tab in ipairs(tabs) do
            if i == index then
                if styles.colors.primaryActive then tab:SetBackdropColor(unpack(styles.colors.primaryActive)) end
                tab.accent:Show()
            else
                tab:SetBackdropColor(0, 0, 0, 0)
                if tab.accent then tab.accent:Hide() end
            end
        end
        -- Toggle Panel Visibility
        for i, panel in ipairs(panels) do
            if i == index then
                panel:Show()
                C_Timer.After(0.01, function()
                    if panel.updateLayout then panel.updateLayout(panel) end
                end)
            else
                panel:Hide()
            end
        end
    end

    -------------------------------------------------------------------------------
    -- 4 SIDEBAR CONTAINER
    -------------------------------------------------------------------------------
    local sidebar = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    sidebar:SetWidth(160)
    -- Locate below the header and take the rest of vertical space
    sidebar:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, startY)
    sidebar:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", 10, 8)
    
    sidebar:SetBackdrop({
        bgFile = styles.textures.background,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    sidebar:SetBackdropColor(unpack(styles.colors.surfaceDark))
    sidebar:SetBackdropBorderColor(unpack(styles.colors.surfaceLight))

    -------------------------------------------------------------------------------
    -- 5. TAB BUTTON FACTORY
    -------------------------------------------------------------------------------
    --- Helper to create individual navigation buttons in the sidebar.
    local lastTab = nil
    local function createTabButton(text, index)
        local button = CreateFrame("Button", nil, sidebar, "BackdropTemplate")
        button:SetHeight(32)
        button:SetPoint("LEFT", sidebar, "LEFT", 4, 0)
        button:SetPoint("RIGHT", sidebar, "RIGHT", -4, 0)
        
        if lastTab then
            button:SetPoint("TOP", lastTab, "BOTTOM", 0, -2)
        else
            button:SetPoint("TOP", sidebar, "TOP", 0, -10)
        end
        lastTab = button

        button:SetBackdrop({ bgFile = styles.textures.background })
        button:SetBackdropColor(0, 0, 0, 0)
        
        -- Text Label
        local label = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        label:SetPoint("LEFT", 12, 0)
        label:SetText(text)
        label:SetTextColor(unpack(styles.colors.white))
        
        -- Active Accent Line
        button.accent = button:CreateTexture(nil, "OVERLAY")
        button.accent:SetWidth(4)
        button.accent:SetPoint("TOPLEFT")
        button.accent:SetPoint("BOTTOMLEFT")
        button.accent:SetColorTexture(unpack(styles.colors.primary))
        button.accent:Hide()
        
        -- Hover State
        local highlight = button:CreateTexture(nil, "HIGHLIGHT")
        highlight:SetAllPoints(button)
        if styles.colors.primaryHover then
            highlight:SetColorTexture(unpack(styles.colors.primaryHover))
        else
            highlight:SetColorTexture(1, 1, 1, 0.1)
        end
        
        button:SetScript("OnClick", function()
            selectTab(index)
        end)
        
        table.insert(tabs, button)
        return button
    end
end