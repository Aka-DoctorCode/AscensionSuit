-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: TabbedInterface.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- Objective: Import the core AscensionFactory library and Context.
-- This ensures the UI elements can be built upon the existing framework.
-- Variables:
-- MAJOR (string): The namespace identifier for the addon library.
-- lib (table): The resolved library instance.
-- Context (table): The object factory table where creation methods are attached.
-------------------------------------------------------------------------------
local MAJOR = "AscensionFactory"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

-------------------------------------------------------------------------------
-- 2. TABBED INTERFACE FACTORY
-- Objective: Creates a complex UI structure with a vertical sidebar for navigation and multiple content panels.
-- Variables:
-- options (table): Configuration table (parent, startY, initialIndex, tabs array).
-- parent (table): The parent frame anchoring the tabbed interface.
-- startY (number): Initial Y offset for positioning the sidebar.
-- initialIndex (number): The tab index to select by default.
-- tabs (table): Array tracking created tab button frames.
-- panels (table): Array tracking created content panel frames.
-- activeTab (number): State variable holding the currently selected tab index.
-------------------------------------------------------------------------------
function Context:createTabbedInterface(options)
    local styles = self.styles
    local parent = options.parent
    local startY = options.startY
    local initialIndex = options.initialIndex
    local tabs = {}
    local panels = {}
    local activeTab = initialIndex

    -------------------------------------------------------------------------------
    -- 2.1. TAB SELECTION LOGIC
    -- Objective: Switches the active view to the specified tab index.
    -- Updates the visual states of the tab buttons (active color, accent) and toggles panel visibility.
    -- Variables:
    -- index (number): The index of the tab being selected.
    -------------------------------------------------------------------------------
    local function selectTab(index)
        activeTab = index
        -- Loop through all tabs to update their visual states (color and accent)
        for tabIndex, tab in ipairs(tabs) do
            if tabIndex == index then
                if styles.colors.primaryActive then tab.background:SetColorTexture(unpack(styles.colors.primaryActive)) end
                tab.accent:Show()
            else
                tab.background:SetColorTexture(0, 0, 0, 0) -- #00000000
                if tab.accent then tab.accent:Hide() end
            end
        end
        -- Loop through all panels to show only the selected one and hide the rest
        -- ipairs iterates over the array sequentially
        for tabIndex, panel in ipairs(panels) do
            if tabIndex == index then
                panel:Show() -- Makes the panel visible
                -- C_Timer.After delays execution slightly to ensure the UI engine has rendered the frame
                C_Timer.After(0.01, function()
                    if panel.updateLayout then panel.updateLayout(panel) end
                end)
            else
                panel:Hide() -- Hides the panel if it's not the selected one
            end
        end
    end

    -------------------------------------------------------------------------------
    -- 2.2 SIDEBAR CONTAINER
    -- Objective: Creates the vertical sidebar container frame for tab navigation.
    -- Variables:
    -- sidebar (table): The allocated frame representing the sidebar container, with textures applied.
    -------------------------------------------------------------------------------
    -- Acquire a "Frame" element from the pool to act as the sidebar container.
    local sidebar = self:AcquireElement("Frame", parent, {})
    sidebar:SetWidth(160) -- Fixed width for the sidebar
    
    -- Anchor sidebar to the left side of the parent window.
    -- Shifts 10 pixels right, and startY pixels down from the top left corner.
    sidebar:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, startY)
    sidebar:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", 10, 8)    
    
    -- Create outer border texture for the sidebar
    if not sidebar.border then
        -- Layer -2 (deepest) for border
        local border = sidebar:CreateTexture(nil, "BACKGROUND", nil, -2)
        border:SetAllPoints(sidebar)
        sidebar.border = border
    end
    sidebar.border:SetColorTexture(unpack(styles.colors.border))

    -- Create inner background texture for the sidebar
    if not sidebar.background then
        local background = sidebar:CreateTexture(nil, "BACKGROUND", nil, -1)
        background:SetPoint("TOPLEFT", sidebar, "TOPLEFT", 1, -1)
        background:SetPoint("BOTTOMRIGHT", sidebar, "BOTTOMRIGHT", -1, 1)
        sidebar.background = background
    end
    sidebar.background:SetColorTexture(unpack(styles.colors.surfaceLight))

    -------------------------------------------------------------------------------
    -- 2.3 TAB BUTTON FACTORY
    -- Objective: Generates the individual tab buttons and corresponding content panels.
    -- Contains an internal helper `sidebarButton` to build and style the interactive buttons.
    -- Variables:
    -- layout (table): A LayoutModel instance to manage the vertical placement of tab buttons.
    -------------------------------------------------------------------------------
    -- createLayoutModel initializes a cursor system for positioning elements sequentially.
    local layout = self:createLayoutModel(sidebar)
    
    -- Helper function to generate an individual tab button
    local function sidebarButton(options)
        -- Acquire a "Button" element, which has built-in mouse interaction events
        local button = self:AcquireElement("Button", sidebar, {})
        button:SetHeight(22)
        
        layout:anchorElement(button, 0, 4)
        button:SetPoint("RIGHT", sidebar, "RIGHT", 0, 0)
        
        if not button.background then
            local background = button:CreateTexture(nil, "BACKGROUND", nil, -1)
            background:SetAllPoints(button)
            button.background = background
        end
        -- Start with a transparent background
        button.background:SetColorTexture(0, 0, 0, 0) -- #00000000

        -- Create a text label attached to the button
        local tabLabel = self:createLabel({
            parent = button,
            text = options.text
        })
        tabLabel:SetPoint("LEFT", button, "LEFT", 10, 0)

        -- Create a colored accent bar on the left edge indicating active selection
        local accent = self:AcquireElement("Texture", button, { drawLayer = "OVERLAY" })
        accent:SetWidth(8)
        accent:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)
        accent:SetPoint("BOTTOMLEFT", button, "BOTTOMLEFT", 0, 0)
        accent:SetColorTexture(unpack(styles.colors.primary))
        accent:Hide()
        button.accent = accent

        -- Register interactive hover and click states.
        -- When the button is clicked, execute the provided callback.
        button:SetScript("OnClick", options.onClick)
        -- OnEnter fires when the mouse moves over the button
        button:SetScript("OnEnter", function()
            if activeTab ~= options.index then
                button.background:SetColorTexture(unpack(styles.colors.primaryHover))
            end
        end)
        -- OnLeave fires when the mouse moves off the button
        button:SetScript("OnLeave", function()
            if activeTab ~= options.index then
                button.background:SetColorTexture(0, 0, 0, 0) -- Revert to transparent
            end
        end)

        return button
    end

    -- Generate panels and buttons for each provided tab. ipairs iterates sequentially.
    for tabIndex, tabName in ipairs(options.tabs) do
        -- Create corresponding content panel. "Frame" is a standard invisible container.
        local panel = self:AcquireElement("Frame", parent, {})
        -- Anchor panel's left side to the sidebar's right side, plus 10 pixels padding.
        panel:SetPoint("TOPLEFT", sidebar, "TOPRIGHT", 10, 0)
        panel:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -10, 8)
        
        if not panel.background then
            local background = panel:CreateTexture(nil, "BACKGROUND", nil, -1)
            background:SetAllPoints(panel)
            panel.background = background
        end
        -- Apply a subtle background color to visually separate panel content
        panel.background:SetColorTexture(unpack(styles.colors.panelBackground))
        panel:Hide() -- Keep hidden by default until selected
        panels[tabIndex] = panel

        local tabButton = sidebarButton({
            text = tabName,
            index = tabIndex,
            onClick = function()
                selectTab(tabIndex)
            end
        })
        tabs[tabIndex] = tabButton
    end

    if initialIndex then
        selectTab(initialIndex)
    end

    return {
        sidebar = sidebar,
        tabs = tabs,
        panels = panels
    }
end