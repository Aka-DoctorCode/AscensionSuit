-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: FrameworkPools.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionFactory"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

-------------------------------------------------------------------------------
-- 1. SPECIFIC ELEMENT RESETTERS
-------------------------------------------------------------------------------

--- Cleans up a standard button before returning it to the pool.
local function ResetButton(pool, button)
    button:Hide()
    button:ClearAllPoints()
    button:SetScript("OnClick", nil)
    button:SetScript("OnEnter", nil)
    button:SetScript("OnLeave", nil)
    button:SetEnabled(true)
    
    local fontString = button:GetFontString()
    if fontString then
        fontString:SetAlpha(1.00)
    end
    
    local normalTexture = button:GetNormalTexture()
    if normalTexture then
        normalTexture:SetDesaturated(false)
    end
    
    button.onClickCallback = nil
end

--- Cleans up a standard status bar before returning it to the pool.
local function ResetStatusBar(pool, statusBar)
    statusBar:Hide()
    statusBar:ClearAllPoints()
    statusBar:SetMinMaxValues(0, 1)
    statusBar:SetValue(0)
    statusBar:SetStatusBarColor(1, 1, 1, 1) -- #FFFFFF
    statusBar:SetScript("OnValueChanged", nil)
end

--- Cleans up a generic panel frame before returning it to the pool.
local function ResetFrame(pool, frame)
    frame:Hide()
    frame:ClearAllPoints()
    frame:SetScript("OnUpdate", nil)
    frame:SetScript("OnEvent", nil)
    frame:UnregisterAllEvents()
end

--- Cleans up a pooled texture layer.
local function ResetTexture(pool, texture)
    texture:Hide()
    texture:ClearAllPoints()
    texture:SetTexture(nil)
    texture:SetAtlas(nil)
    texture:SetVertexColor(1, 1, 1, 1) -- #FFFFFF
end


--- Cleans up a pooled FontString layer.
local function ResetFontString(pool, fontString)
    fontString:Hide()
    fontString:ClearAllPoints()
    fontString:SetText("")
    fontString:SetTextColor(1, 1, 1, 1) -- #FFFFFF
    fontString:SetAlpha(1.00)
end

-------------------------------------------------------------------------------
-- 2. REGISTRY INITIALIZATION
-------------------------------------------------------------------------------

--- Lazy-initializes the multi-pool system registry within the framework context.
function Context:InitializeFrameworkPools(parentFrame)
    if self.pools then return end
    
    self.pools = {
        -- CreateFramePool args:
        -- 1: "Button" (frame type)
        -- 2: parentFrame (default parent frame)
        -- 3: nil (template, none)
        -- 4: ResetButton (reset function called on release)
        Button = CreateFramePool("Button", parentFrame, nil, ResetButton),
        
        -- CreateFramePool args:
        -- 1: "StatusBar" (frame type)
        -- 2: parentFrame (parent)
        -- 3: nil (template)
        -- 4: ResetStatusBar (reset function)
        StatusBar = CreateFramePool("StatusBar", parentFrame, nil, ResetStatusBar),
        
        -- CreateFramePool args:
        -- 1: "Frame" (frame type)
        -- 2: parentFrame (parent)
        -- 3: nil (template)
        -- 4: ResetFrame (reset function)
        Frame = CreateFramePool("Frame", parentFrame, nil, ResetFrame),
        
        -- Graphic Region Pools (Render layers attached to frames, not independent widgets)
        
        -- CreateTexturePool args:
        -- 1: parentFrame (parent)
        -- 2: "BACKGROUND" (draw layer)
        -- 3: 0 (sub-layer priority)
        -- 4: nil (texture template)
        -- 5: ResetTexture (reset function)
        Texture = CreateTexturePool(parentFrame, "BACKGROUND", 0, nil, ResetTexture),
        
        -- CreateFontStringPool args:
        -- 1: parentFrame (parent)
        -- 2: "ARTWORK" (draw layer)
        -- 3: 0 (sub-layer priority)
        -- 4: "GameFontNormal" (font template)
        -- 5: ResetFontString (reset function)
        FontString = CreateFontStringPool(parentFrame, "ARTWORK", 0, "GameFontNormal", ResetFontString)
    }
end

-------------------------------------------------------------------------------
-- 3. UNIFIED ACQUISITION GATEWAY
-------------------------------------------------------------------------------

--- Dynamically acquires a recycled or brand-new UI element of the specified type.
-- @param elementType String value: "Button", "StatusBar", "Frame", "Texture", or "FontString".
-- @param parent The parent frame mapping containment hierarchies.
-- @param options Structural layout and initialization configurations.
-- @return element The configured UI element.
function Context:AcquireElement(elementType, parent, options)
    if not self.pools then
        self:InitializeFrameworkPools(parent or UIParent)
    end
    
    local pool = self.pools[elementType]
    if not pool then return end
    
    -- Acquire element from the respective type-safe hotel.
    -- element: The WoW UI object instance.
    -- isNew: Boolean indicating if this is a brand new object (true) or recycled (false).
    local element, isNew = pool:Acquire()
    
    -- Dynamically enforce parenthood update if needed.
    -- GetParent() returns the current parent frame.
    if element.SetParent and parent and element:GetParent() ~= parent then
        element:SetParent(parent)
    end
    
    -- 1. Type-Specific Initialization (Only executed upon fresh memory instantiation)
    if isNew then
        if elementType == "StatusBar" then
            -- Set up neutral dark channel track once
            -- CreateTexture args:
            -- 1: nil (name)
            -- 2: "BACKGROUND" (draw layer)
            local background = element:CreateTexture(nil, "BACKGROUND")
            background:SetAllPoints()
            -- SetColorTexture args:
            -- 1: 0.02 (Red)
            -- 2: 0.02 (Green)
            -- 3: 0.03 (Blue)
            -- 4: 0.50 (Alpha)
            background:SetColorTexture(0.02, 0.02, 0.03, 0.50) -- #050508
            element.background = background
            
            local fill = element:CreateStatusBarTexture()
            -- SetColorTexture args:
            -- 1: 0.30 (Red)
            -- 2: 0.00 (Green)
            -- 3: 0.40 (Blue)
            -- 4: 1.00 (Alpha)
            fill:SetColorTexture(0.30, 0.00, 0.40, 1.00) -- #4D0066
            element:SetStatusBarTexture(fill)
        end
    end
    
    -- 2. Generic Layout Configuration
    if options.width and options.height then
        element:SetSize(options.width, options.height)
    end
    
    if options.anchorPoint then
        element:ClearAllPoints()
        -- SetPoint args:
        -- 1: options.anchorPoint (this element's anchor point)
        -- 2: options.relativeTo or parent or UIParent (target frame)
        -- 3: options.relativePoint or options.anchorPoint (target's anchor point)
        -- 4: options.xOffset or 0 (X offset)
        -- 5: options.yOffset or 0 (Y offset)
        element:SetPoint(
            options.anchorPoint,
            options.relativeTo or parent or UIParent,
            options.relativePoint or options.anchorPoint,
            options.xOffset or 0,
            options.yOffset or 0
        )
    end
    
    -- 3. Dynamic Configuration Applications
    if elementType == "Button" then
        if options.text then
            element:GetFontString():SetText(options.text)
        end
        if options.onClick then
            element.onClickCallback = options.onClick
            element:SetScript("OnClick", function(self, ...)
                if self.onClickCallback then
                    self.onClickCallback(self, ...)
                end
            end)
        end
    elseif elementType == "StatusBar" then
        if options.minVal and options.maxVal then
            element:SetMinMaxValues(options.minVal, options.maxVal)
        end
        if options.value then
            element:SetValue(options.value)
        end
        if options.color then
            element:GetStatusBarTexture():SetColorTexture(unpack(options.color))
        end
    elseif elementType == "Texture" then
        if options.texturePath then
            element:SetTexture(options.texturePath)
        elseif options.atlasName then
            element:SetAtlas(options.atlasName)
        elseif options.color then
            element:SetColorTexture(unpack(options.color))
        end
        if options.drawLayer then
            element:SetDrawLayer(options.drawLayer)
        end
    elseif elementType == "FontString" then
        if options.text then
            element:SetText(options.text)
        end
        if options.color then
            element:SetTextColor(unpack(options.color))
        end
    end
    
    element:Show()
    return element
end

-------------------------------------------------------------------------------
-- 4. UNIFIED RELEASE GATEWAY
-------------------------------------------------------------------------------

--- Instantly releases a single active element back to its type-safe pool.
-- @param elementType String identifier of the pool.
-- @param element The specific UI frame or layer to return.
function Context:ReleaseElement(elementType, element)
    if self.pools and self.pools[elementType] then
        self.pools[elementType]:Release(element)
    end
end

--- Instantly releases all managed resources back into their active pools.
-- Call this during global frame hides, tab changes, or component cleanups.
function Context:ReleaseAllElements()
    if not self.pools then return end
    for _, pool in pairs(self.pools) do
        pool:ReleaseAll()
    end
end