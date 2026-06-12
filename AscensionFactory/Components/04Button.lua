-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Button.lua
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
-- 2. BUTTON FACTORY
-- Objective: Creates a fully interactive, styled standard button element.
-- Integrates explicit textures, a text label, and multiple interaction states (hover, active, disabled).
-- Variables:
-- options (table): Configuration table including width, height, text, and click callbacks.
-- button (table): The allocated Button frame instance.
-- updateAppearance (function): Centralized engine that changes texture colors based on the interaction state.
-------------------------------------------------------------------------------
function Context:createButton(options)
    local styles = self.styles
    local parent = options.parent or UIParent
    local width = options.width or 60
    local height = options.height or 25
    
    -- 2.1 BASE FRAME SETUP
    -- Acquire base "Button" frame from pool. The WoW Button object can receive click and mouseover events.
    local button = self:AcquireElement("Button", parent, {
        width = width,
        height = height
    })

    -- Register the element in global space if a name is specified.
    -- By setting _G[name], the frame is globally accessible via that variable.
    if options.name then
        _G[options.name] = button
    end
    
    -- 2.2 EXPLICIT LAYER TEXTURE CREATION
    -- Create the outer border texture dynamically on background layer -2.
    -- Layer -2 draws underneath Layer -1, allowing it to act as a border if the layer -1 texture is slightly smaller.
    if not button.border then
        -- 2nd arg "BACKGROUND" specifies rendering group. 4th arg -2 specifies sub-layer.
        local border = button:CreateTexture(nil, "BACKGROUND", nil, -2)
        border:SetAllPoints() -- Fill entire button
        button.border = border
    end

    -- Create the inner track texture dynamically on background layer -1
    if not button.track then
        local track = button:CreateTexture(nil, "BACKGROUND", nil, -1)
        track:SetPoint("TOPLEFT", button, "TOPLEFT", 1, -1)
        track:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -1, 1)
        button.track = track
    end

    -- State Color Configuration Registry
    button.trackColors = {
        normal = styles.colors.surfaceLight,
        hover = styles.colors.surfaceHover,
        active = styles.colors.surfaceDark,
        disabled = styles.colors.background
    }
    button.borderColors = {
        normal = styles.colors.surfaceLight,
        hover = styles.colors.primaryHover,
        active = styles.colors.primaryActive,
        disabled = styles.colors.surfaceLight
    }

    -- Centralized Render Processing Engine
    -- This function applies color to textures based on current interaction state.
    -- "stateOverride" allows forcing a specific visual state (like "hover" or "active").
    local function updateAppearance(stateOverride)
        -- IsEnabled() checks if the button is interactable.
        if not button:IsEnabled() then
            button.track:SetColorTexture(unpack(button.trackColors.disabled))
            button.border:SetColorTexture(unpack(button.borderColors.disabled))
            return
        end

        local state = stateOverride or "normal"
        if state == "hover" then
            button.track:SetColorTexture(unpack(button.trackColors.hover))
            button.border:SetColorTexture(unpack(button.borderColors.hover))
        elseif state == "active" then
            button.track:SetColorTexture(unpack(button.trackColors.active))
            button.border:SetColorTexture(unpack(button.borderColors.active))
        else
            button.track:SetColorTexture(unpack(button.trackColors.normal))
            button.border:SetColorTexture(unpack(button.borderColors.normal))
        end
    end
    button.updateAppearance = updateAppearance
    button.updateAppearance()

    -- 2.3 INTERACTIVE SCRIPT HOOKS
    -- Change appearance to hover color when mouse enters
    button:SetScript("OnEnter", function(self)
        if not self:IsEnabled() then return end
        self.updateAppearance("hover")
    end)

    -- Revert appearance when mouse leaves
    button:SetScript("OnLeave", function(self)
        if not self:IsEnabled() then return end
        self.updateAppearance("normal")
    end)

    button:SetScript("OnMouseDown", function(self)
        if not self:IsEnabled() then return end
        self.updateAppearance("active")
    end)

    button:SetScript("OnMouseUp", function(self)
        if not self:IsEnabled() then return end
        self.updateAppearance(self:IsMouseOver() and "hover" or "normal")
    end)

    button:SetScript("OnEnable", function(self)
        self.updateAppearance(self:IsMouseOver() and "hover" or "normal")
    end)

    button:SetScript("OnDisable", function(self)
        self.updateAppearance()
    end)
    
    -- 2.5 TEXT LABEL SETUP
    -- Add a descriptive font string to the center of the button
    local buttonText = self:createLabel({
        parent = button,
        text = options.text or ""
    })
    buttonText:SetPoint("CENTER", button, "CENTER", 0, 0)
    
    buttonText:SetWidth(width - 10)
    buttonText:SetWordWrap(false)
    
    button:SetFontString(buttonText)
    
    -- 2.6 CLICK EVENT REGISTRATION
    -- Setup accepted click inputs (e.g. LeftButtonUp, RightButtonUp) and route to user callback.
    -- RegisterForClicks tells the WoW UI engine which mouse events to capture for this frame.
    button:RegisterForClicks(unpack(options.clickTypes or { "AnyUp" }))

    -- If a custom onClick function was provided, bind it to the "OnClick" script handler.
    if type(options.onClick) == "function" then
        button:SetScript("OnClick", options.onClick)
    end
    
    return button
end

-------------------------------------------------------------------------------
-- 3. ICON BUTTON FACTORY
-- Objective: Creates a specialized square button with a centered geometric icon.
-- Uses the base button logic but overlays dynamically drawn textures for the icon.
-- Variables:
-- options (table): Inherits button options but forces square dimensions and adds `iconType`.
-- iconType (string): Determines the shape (e.g., "close", "minus", "plus").
-- color (table): RGBA color values for the icon drawing.
-------------------------------------------------------------------------------
function Context:createIconButton(options)
    local size = options.size or 24
    options.width = size
    options.height = size
    options.text = ""

    -- 3.1 BASE BUTTON INHERITANCE
    local button = self:createButton(options)
    local iconType = options.iconType or "close"
    local color = options.iconColor or {1, 1, 1, 1}

    -- 3.2 ICON RENDERING
    if iconType == "minus" then
        local minusLine = self:AcquireElement("Texture", button, { drawLayer = "ARTWORK" })
        minusLine:SetSize(size * 0.5, 3)
        minusLine:SetPoint("CENTER")
        minusLine:SetColorTexture(unpack(color))
    elseif iconType == "plus" then
        local horizontalLine = self:AcquireElement("Texture", button, { drawLayer = "ARTWORK" })
        horizontalLine:SetSize(size * 0.5, 3)
        horizontalLine:SetPoint("CENTER")
        horizontalLine:SetColorTexture(unpack(color))

        local verticalLine = self:AcquireElement("Texture", button, { drawLayer = "ARTWORK" })
        verticalLine:SetSize(3, size * 0.5)
        verticalLine:SetPoint("CENTER")
        verticalLine:SetColorTexture(unpack(color))
    elseif iconType == "minimize" then
        local minimizeLine = self:AcquireElement("Texture", button, { drawLayer = "ARTWORK" })
        minimizeLine:SetSize(size * 0.5, 3)
        minimizeLine:SetPoint("BOTTOM", 0, size * 0.25)
        minimizeLine:SetColorTexture(unpack(color))
    elseif iconType == "maximize" then
        local iconSize = size * 0.5
        local lineThickness = 3
        local topLine = self:AcquireElement("Texture", button, { drawLayer = "ARTWORK" })
        topLine:SetSize(iconSize, lineThickness)
        topLine:SetPoint("TOP", 0, -size * 0.25)
        topLine:SetColorTexture(unpack(color))
        
        local bottomLine = self:AcquireElement("Texture", button, { drawLayer = "ARTWORK" })
        bottomLine:SetSize(iconSize, lineThickness)
        bottomLine:SetPoint("BOTTOM", 0, size * 0.25)
        bottomLine:SetColorTexture(unpack(color))
        
        local leftLine = self:AcquireElement("Texture", button, { drawLayer = "ARTWORK" })
        leftLine:SetSize(lineThickness, iconSize)
        leftLine:SetPoint("LEFT", size * 0.25, 0)
        leftLine:SetColorTexture(unpack(color))
        
        local rightLine = self:AcquireElement("Texture", button, { drawLayer = "ARTWORK" })
        rightLine:SetSize(lineThickness, iconSize)
        rightLine:SetPoint("RIGHT", -size * 0.25, 0)
        rightLine:SetColorTexture(unpack(color))
    elseif iconType == "arrowdown" then
        local arrowTexture = self:AcquireElement("Texture", button, { drawLayer = "ARTWORK" })
        arrowTexture:SetSize(size * 0.75, size * 0.75)
        arrowTexture:SetPoint("CENTER")
        arrowTexture:SetTexture("Interface\\ChatFrame\\ChatFrameExpandArrow")
        arrowTexture:SetDesaturated(true)
        arrowTexture:SetRotation(math.rad(-90))
        arrowTexture:SetVertexColor(unpack(self.styles.colors.white))
    elseif iconType == "close" then
        local diagonalLineOne = self:AcquireElement("Texture", button, { drawLayer = "ARTWORK" })
        diagonalLineOne:SetSize(size * 0.5, 3)
        diagonalLineOne:SetPoint("CENTER")
        diagonalLineOne:SetColorTexture(unpack(color))
        diagonalLineOne:SetRotation(math.rad(45))

        local diagonalLineTwo = self:AcquireElement("Texture", button, { drawLayer = "ARTWORK" })
        diagonalLineTwo:SetSize(3, size * 0.5)
        diagonalLineTwo:SetPoint("CENTER")
        diagonalLineTwo:SetColorTexture(unpack(color))
        diagonalLineTwo:SetRotation(math.rad(45))
        
        local defaultColor = self.styles.colors.red
        local hoverColor = self.styles.colors.redHover
        
        -- Override theme settings directly
        button.trackColors.normal = defaultColor
        button.borderColors.normal = defaultColor
        button.trackColors.hover = hoverColor
        button.borderColors.hover = hoverColor
        
        button.updateAppearance()
    end

    return button
end
