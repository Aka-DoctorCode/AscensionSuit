-------------------------------------------------------------------------------
-- Project: AscensionFactory
-- Author: Antigravity
-- File: Toggle.lua
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
-- 2. TOGGLE FACTORY
-- Objective: Creates a binary toggle switch component (on/off).
-- Includes a sliding thumb animation and distinct color states.
-- Variables:
-- options (table): Configuration table (getter, setter, onClick callbacks).
-- toggle (table): The created Button element behaving as a toggle.
-- track, border, thumb (tables): Explicit texture layers forming the component visuals.
-- updateAppearance (function): Logic dictating thumb position and color changes.
-------------------------------------------------------------------------------
function Context:createToggle(options)
    local styles = self.styles
    local parent = options.parent or UIParent
    local height = options.height or 24
    local width = options.width or 52
    
    -- Base mechanical interaction layer acquisition.
    -- Pulls a standard "Button" from pool. A button is used because it natively 
    -- captures OnClick, OnEnter, OnLeave mouse events from the WoW engine.
    local toggle = self:AcquireElement("Button", parent, {
        width = width,
        height = height
    })
    
    if options.name then
        _G[options.name] = toggle
    end

    -- Maintain internal toggled state.
    -- If a getter function is provided in options, execute it to determine initial state.
    toggle.isOn = false
    if options.getter then
        toggle.isOn = options.getter()
    end
    
    -- Layer -2: Outer Framing Border Box explicitly created.
    -- "BACKGROUND", nil, -2 draws this texture at the very bottom sub-layer.
    local border = toggle:CreateTexture(nil, "BACKGROUND", nil, -2)
    border:SetPoint("TOPLEFT", toggle, "TOPLEFT", -1, 1)
    border:SetPoint("BOTTOMRIGHT", toggle, "BOTTOMRIGHT", 1, -1)
    toggle.border = border
    
    -- Layer -1: Inner Track Background Surface Layer
    if not toggle.track then
        local track = toggle:CreateTexture(nil, "BACKGROUND", nil, -1)
        track:SetAllPoints()
        toggle.track = track
    end
    
    -- Layer 1: Solid Sliding Thumb Block
    if not toggle.thumb then
        local thumbSize = height - (padding * 2)
        local thumb = toggle:CreateTexture(nil, "ARTWORK")
        thumb:SetSize(thumbSize, thumbSize)
        toggle.thumb = thumb
    end

    -- Centralized visual state manager dictating colors and thumb animation.
    -- Called whenever the mouse interacts with the toggle or its state changes.
    local function updateAppearance(stateOverride)
        toggle.thumb:ClearAllPoints() -- Remove existing anchors before moving it.
        
        -- Animation/position logic: move thumb right if ON, left if OFF.
        if toggle.isOn then
            toggle.thumb:SetPoint("RIGHT", toggle, "RIGHT", -padding, 0)
        else
            toggle.thumb:SetPoint("LEFT", toggle, "LEFT", padding, 0)
        end

        if not toggle:IsEnabled() then
            toggle.track:SetColorTexture(unpack(styles.colors.background))
            toggle.border:SetColorTexture(unpack(styles.colors.surfaceLight))
            toggle.thumb:SetColorTexture(unpack(styles.colors.surfaceHover))
            return
        end

        if not toggle.isOn then
            toggle.track:SetColorTexture(unpack(styles.colors.background))
            toggle.border:SetColorTexture(unpack(styles.colors.surfaceLight))
            toggle.thumb:SetColorTexture(unpack(styles.colors.surfaceHover))
            return
        end

        local state = stateOverride or "normal"
        if state == "hover" then
            toggle.track:SetColorTexture(unpack(styles.colors.surfaceHover))
            toggle.border:SetColorTexture(unpack(styles.colors.primaryHover))
            toggle.thumb:SetColorTexture(unpack(styles.colors.white))
        elseif state == "active" then
            toggle.track:SetColorTexture(unpack(styles.colors.surfaceDark))
            toggle.border:SetColorTexture(unpack(styles.colors.primaryActive))
            toggle.thumb:SetColorTexture(unpack(styles.colors.white))
        else
            toggle.track:SetColorTexture(unpack(styles.colors.surfaceLight))
            toggle.border:SetColorTexture(unpack(styles.colors.surfaceLight))
            toggle.thumb:SetColorTexture(unpack(styles.colors.white))
        end
    end
    
    updateAppearance()
    
    -- Interactive Hover
    toggle:SetScript("OnEnter", function(self)
        if not self:IsEnabled() then return end
        updateAppearance("hover")
    end)
    
    toggle:SetScript("OnLeave", function(self)
        if not self:IsEnabled() then return end
        updateAppearance("normal")
    end)

    toggle:SetScript("OnMouseDown", function(self)
        if not self:IsEnabled() then return end
        updateAppearance("active")
    end)
    
    toggle:SetScript("OnMouseUp", function(self)
        if not self:IsEnabled() then return end
        if self:IsMouseOver() then
            updateAppearance("hover")
        else
            updateAppearance("normal")
        end
    end)

    toggle:SetScript("OnEnable", function(self)
        if self:IsMouseOver() then
            updateAppearance("hover")
        else
            updateAppearance("normal")
        end
    end)
    
    toggle:SetScript("OnDisable", function(self)
        updateAppearance()
    end)
    
    -- Execute toggle state swap on click.
    -- When the button registers a click, flip the boolean `isOn` state.
    toggle:SetScript("OnClick", function(self)
        self.isOn = not self.isOn
        
        if options.setter then
            options.setter(self.isOn)
        end
        
        if self:IsMouseOver() then
            updateAppearance("hover")
        else
            updateAppearance("normal")
        end
        
        if options.onClick then
            options.onClick(self, self.isOn)
        end
    end)
    
    if not toggle.setState then
        toggle.setState = function(self, state)
            self.isOn = not not state
            updateAppearance()
        end
    end

    if options.scripts then
        for scriptName, scriptFunction in pairs(options.scripts) do
            if toggle:HasScript(scriptName) then
                toggle:HookScript(scriptName, scriptFunction)
            else
                toggle:SetScript(scriptName, scriptFunction)
            end
        end
    end
    
    return toggle
end
