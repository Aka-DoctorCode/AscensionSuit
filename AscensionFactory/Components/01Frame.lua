-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: MainFrame.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- Objective: Import the core AscensionFactory library and Context. This ensures the UI elements can be built upon the existing framework.
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
-- 2. FRAME FACTORY
-- Objective: Provide a factory method to create the main application window.
-- It configures position, size, explicit texture borders, backgrounds, and dragging logic.
-- Variables:
-- options (table): Layout parameters like width, height, anchor, strata, and global name.
-- styles (table): The theme colors and textures used for rendering.
-- ux (table): User experience helpers for window interactions (moving, closing).
-- frame (table): The newly allocated UI frame element.
-------------------------------------------------------------------------------
--- Creates the primary application window.
function Context:createMainFrame(options)
    -- Load visual styles and user experience utilities from context
    local styles = self.styles
    local ux = lib.UX
    
    -- Request a new base 'Frame' element from the FrameworkPool.
    -- "Frame": The type of UI object being requested (a standard container window).
    -- _G.UIParent: The global WoW UI parent, meaning this frame attaches directly to the main screen.
    local frame = self:AcquireElement("Frame", _G.UIParent,
    {
        anchorPoint = options.anchor or "CENTER",
        width = options.width,
        height = options.height
    })

    -- Register frame in the global namespace if a name was provided.
    -- _G is the global variable table in Lua. By setting _G[name], we make the frame accessible anywhere.
    assert(options.name, "options.name required for frame")
    _G[options.name] = frame

    -- Apply explicit sizing (width and height in pixels).
    frame:SetSize(options.width or 860, options.height or 500)
    -- Anchor the frame to the screen. "CENTER" puts it right in the middle.
    frame:SetPoint(options.anchor or "CENTER")
    -- Ensure the frame appears on top of standard UI layers.
    -- "DIALOG" strata renders this window above normal gameplay UI elements.
    frame:SetFrameStrata(options.strata or "DIALOG")
    -- Create and color the outer border texture.
    if not frame.border then
        -- CreateTexture args:
        -- 1: nil (anonymous, prevents global variable creation to save memory)
        -- 2: "BACKGROUND" (draw layer group)
        -- 3: nil (no inherited XML template, keeps texture blank/custom)
        -- 4: -2 (sub-layer priority, draws below higher numbers)
        local border = frame:CreateTexture(nil, "BACKGROUND", nil, -2)
        -- SetAllPoints makes the texture stretch to fill the exact size of its parent frame.
        border:SetAllPoints(frame)
        frame.border = border
    end
    -- unpack() takes the color array {R, G, B, A} and expands it into 4 separate arguments for SetColorTexture.
    frame.border:SetColorTexture(unpack(styles.colors.border))
    -- Create and color the inner background texture.
    if not frame.background then
        -- CreateTexture args:
        -- 1: nil (anonymous, no global variable)
        -- 2: "BACKGROUND" (draw layer group)
        -- 3: nil (no template)
        -- 4: -1 (sub-layer priority, draws on top of -2 border)
        local background = frame:CreateTexture(nil, "BACKGROUND", nil, -1)
        -- SetPoint args (TOPLEFT):
        -- 1: "TOPLEFT" (this texture's anchor point)
        -- 2: frame (the target frame to attach to)
        -- 3: "TOPLEFT" (the target frame's anchor point)
        -- 4: 2 (x offset: move 2px right)
        -- 5: -2 (y offset: move 2px down)
        background:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -2)
        
        -- SetPoint args (BOTTOMRIGHT):
        -- 1: "BOTTOMRIGHT" (this texture's anchor point)
        -- 2: frame (the target frame to attach to)
        -- 3: "BOTTOMRIGHT" (the target frame's anchor point)
        -- 4: -2 (x offset: move 2px left)
        -- 5: 2 (y offset: move 2px up)
        background:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
        frame.background = background
    end
    -- unpack() takes the color array {R, G, B, A} and expands it into 4 separate arguments for SetColorTexture.
    frame.background:SetColorTexture(unpack(styles.colors.background))
    -- Attach dragging and closing behaviors if UX module is available
    if ux then
        ux:makeMovable(frame)
        ux:makeClosableWithEscape(frame)
    end
    -- Return the fully constructed frame object
    return frame
end

