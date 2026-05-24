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
    local styles = self.styles
    local parent = options.parent
    local startY = options.startY
    local initialIndex = options.initialIndex
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
    -- 2.2 SIDEBAR CONTAINER
    -------------------------------------------------------------------------------
    -- Creates the vertical sidebar container for tab navigation.
    local sidebar = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    sidebar:SetWidth(160)
    sidebar:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, startY)
    sidebar:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", 10, 8)    
    sidebar:SetBackdrop({
        bgFile = styles.textures.background,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    sidebar:SetBackdropColor(unpack(styles.colors.surfaceLight))
    sidebar:SetBackdropBorderColor(unpack(styles.colors.border))

    -------------------------------------------------------------------------------
    -- 2.3 TAB BUTTON FACTORY
    -------------------------------------------------------------------------------
    local layout = self:createLayoutModel(sidebar, -5)
    local function sidebarButton(options)
        local button = CreateFrame("Button", nil, sidebar, "BackdropTemplate")
        button:SetHeight(22)
        button:SetPoint("TOPLEFT", sidebar, "TOPLEFT", 0, layout.y)
        button:SetPoint("TOPRIGHT", sidebar, "TOPRIGHT", 0, layout.y)
        layout.y = layout.y - 26
        button:SetBackdrop({bgFile = styles.textures.flat, edgeSize = 0})
        button:SetBackdropColor(0, 0, 0, 0)

        self:createLabel({
            parent = button,
            text = options.text,
            selfAnchorPoint = "LEFT",
            anchorToPoint = "LEFT",
            xOffset = 10,
            yOffset = 0
        })

        local accent = button:CreateTexture(nil, "OVERLAY")
        accent:SetWidth(8)
        accent:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)
        accent:SetPoint("BOTTOMLEFT", button, "BOTTOMLEFT", 0, 0)
        accent:SetColorTexture(unpack(styles.colors.primary))
        accent:Hide()
        button.accent = accent

        button:SetScript("OnClick", options.onClick)
        button:SetScript("OnEnter", function()
            if activeTab ~= options.index then
                button:SetBackdropColor(unpack(styles.colors.primaryHover))
            end
        end)
        button:SetScript("OnLeave", function()
            if activeTab ~= options.index then
                button:SetBackdropColor(0, 0, 0, 0)
            end
        end)

        return button
    end

    for i, tabName in ipairs(options.tabs) do
        local panel = CreateFrame("Frame", nil, parent, "BackdropTemplate")
        panel:SetPoint("TOPLEFT", sidebar, "TOPRIGHT", 10, 0)
        panel:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -10, 8)
        panel:SetBackdrop({
            bgFile = styles.textures.background
        })
        panel:SetBackdropColor(unpack(styles.colors.panelBackground))
        panel:Hide()
        panels[i] = panel

        local btn = sidebarButton({
            text = tabName,
            index = i,
            onClick = function()
                selectTab(i)
            end
        })
        tabs[i] = btn
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