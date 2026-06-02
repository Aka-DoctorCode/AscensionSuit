-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: TabbedInterface.lua
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
-- 2. TABBED INTERFACE FACTORY
-- -------------------------------------------------------------------------------
--- Creates a complex UI structure with a vertical sidebar for navigation and multiple content panels.
function Context:createTabbedInterface(parent, tabNames, buildFuncs, initialIndex)
    local tabs = {}
    local panels = {}
    local activeTab = initialIndex or 1
    local styles = self.styles

    -- Sidebar Visual Separator
    local sidebarSeparator = parent:CreateTexture(nil, "ARTWORK")
    sidebarSeparator:SetWidth(1)
    sidebarSeparator:SetPoint("TOPLEFT", styles.dimensions.sidebarWidth, -45)
    sidebarSeparator:SetPoint("BOTTOMLEFT", styles.dimensions.sidebarWidth, 75)
    if styles.colors.surfaceLight then
        sidebarSeparator:SetColorTexture(unpack(styles.colors.surfaceLight))
    end

    -- -------------------------------------------------------------------------------
    -- 3. TAB SELECTION LOGIC
    -- -------------------------------------------------------------------------------
    --- Switches the active view to the specified tab index.
    local function selectTab(index)
        activeTab = index
        -- Update Tab Buttons Visual State
        for i, tab in ipairs(tabs) do
            if i == index then
                if styles.colors.sidebarActive then tab:SetBackdropColor(unpack(styles.colors.sidebarActive)) end
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

    -- -------------------------------------------------------------------------------
    -- 4. TAB BUTTON FACTORY
    -- -------------------------------------------------------------------------------
    --- Helper to create individual navigation buttons in the sidebar.
    local function createTabButton(label, idx)
        local btn = CreateFrame("Button", nil, parent, "BackdropTemplate")
        local xOffset = (styles.dimensions.sidebarWidth - styles.dimensions.tabWidth) / 2
        local yOffset = -56 - ((idx - 1) * (styles.dimensions.tabHeight + styles.dimensions.tabSpacing))

        btn:SetSize(styles.dimensions.tabWidth, styles.dimensions.tabHeight)
        btn:SetPoint("TOPLEFT", xOffset, yOffset)

        -- Vertical Selection Accent
        local accent = btn:CreateTexture(nil, "OVERLAY")
        accent:SetWidth(styles.dimensions.sidebarAccentWidth)
        accent:SetPoint("TOPLEFT", -xOffset, 0)
        accent:SetPoint("BOTTOMLEFT", -xOffset, 0)
        if styles.colors.primary then accent:SetColorTexture(unpack(styles.colors.primary)) end
        accent:Hide()
        btn.accent = accent

        btn:SetBackdrop({
            bgFile = styles.files.bgFile,
            edgeFile = styles.files.edgeFile,
            edgeSize = 1,
            insets = { left = 1, right = 1, top = 1, bottom = 1 }
        })
        btn:SetBackdropColor(0, 0, 0, 0)
        btn:SetBackdropBorderColor(0, 0, 0, 0)

        local text = btn:CreateFontString(nil, "OVERLAY", styles.fonts.label)
        text:SetPoint("LEFT", 15, 0)
        text:SetText(label)

        -- Interaction Scripts
        btn:SetScript("OnClick", function() selectTab(idx) end)
        btn:SetScript("OnEnter", function()
            if activeTab ~= idx and styles.colors.sidebarHover then 
                btn:SetBackdropColor(unpack(styles.colors.sidebarHover)) 
            end
        end)
        btn:SetScript("OnLeave", function()
            if activeTab ~= idx then btn:SetBackdropColor(0, 0, 0, 0) end
        end)

        table.insert(tabs, btn)
        return btn
    end

    -- Initialize Tabs and Panels
    for i, name in ipairs(tabNames) do
        createTabButton(name, i)
        local panel = CreateFrame("Frame", nil, parent)
        panel:SetPoint("TOPLEFT", sidebarSeparator, "TOPRIGHT", 0, 0)
        panel:SetPoint("BOTTOMRIGHT", -10, 15)
        panel:Hide()

        -- Wrap content in a scrollable panel
        local scrollFrame, content = self:createScrollPanel({ parent = panel })
        panel.scrollFrame = scrollFrame
        panel.content = content
        panel.updateLayout = buildFuncs[i]

        table.insert(panels, panel)
    end

    -- Show initial state
    selectTab(activeTab)

    return {
        panels = panels,
        selectTab = selectTab,
        getActiveTab = function() return activeTab end
    }
end
