-------------------------------------------------------------------------------
-- Project: AscensionFactory
-- Author: Aka-DoctorCode
-- File: FrameworkPool.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- Objective: Initialize the FrameworkPool and link it to the global AscensionFactory library.
-- Variables:
-- MAJOR: The namespace identifier for the addon library.
-------------------------------------------------------------------------------
local MAJOR = "AscensionFactory"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

-------------------------------------------------------------------------------
-- 2. SPECIFIC ELEMENT RESETTERS
-- Objective: Defines cleanup functions for different UI elements before returning them to their respective pools. This prevents memory leaks and visual bugs.
-- Variables:
-- pool: The pool object managing the element.
-- button, statusBar, frame, texture, fontString: The UI element being reset.
-------------------------------------------------------------------------------

-- Cleans up a standard button before returning it to the pool.
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

-- Cleans up a standard status bar before returning it to the pool.
local function ResetStatusBar(pool, statusBar)
    statusBar:Hide()
    statusBar:ClearAllPoints()
    statusBar:SetMinMaxValues(0, 1)
    statusBar:SetValue(0)
    statusBar:SetStatusBarColor(1, 1, 1, 1) -- #FFFFFF
    statusBar:SetScript("OnValueChanged", nil)
end

-- Cleans up a generic panel frame before returning it to the pool.
local function ResetFrame(pool, frame)
    frame:Hide()
    frame:ClearAllPoints()
    frame:SetScript("OnUpdate", nil)
    frame:SetScript("OnEvent", nil)
    frame:UnregisterAllEvents()
    frame.onUpdateCallback = nil
    frame.onEventCallback = nil
end

-- Cleans up a CheckButton.
local function ResetCheckButton(pool, button)
    button:Hide()
    button:ClearAllPoints()
    button:SetChecked(false)
    button:SetScript("OnClick", nil)
    button:SetScript("OnEnter", nil)
    button:SetScript("OnLeave", nil)
    button.onClickCallback = nil
end

-- Cleans up an EditBox.
local function ResetEditBox(pool, editBox)
    editBox:Hide()
    editBox:ClearAllPoints()
    editBox:SetText("")
    editBox:ClearFocus()
    editBox:SetScript("OnTextChanged", nil)
    editBox:SetScript("OnEnterPressed", nil)
    editBox:SetScript("OnEscapePressed", nil)
    editBox.onTextChangedCallback = nil
    editBox.onEnterPressedCallback = nil
    editBox.onEscapePressedCallback = nil
end

-- Cleans up a ScrollFrame.
local function ResetScrollFrame(pool, scrollFrame)
    scrollFrame:Hide()
    scrollFrame:ClearAllPoints()
    scrollFrame:SetScrollChild(nil)
end

-- Cleans up a Slider.
local function ResetSlider(pool, slider)
    slider:Hide()
    slider:ClearAllPoints()
    slider:SetMinMaxValues(0, 1)
    slider:SetValue(0)
    slider:SetScript("OnValueChanged", nil)
    slider.onValueChangedCallback = nil
end

-- Cleans up a Model.
local function ResetModel(pool, model)
    model:Hide()
    model:ClearAllPoints()
    model:ClearModel()
end

-- Cleans up a pooled texture layer.
local function ResetTexture(pool, texture)
    texture:Hide()
    texture:ClearAllPoints()
    texture:SetTexture(nil)
    texture:SetAtlas(nil)
    texture:SetVertexColor(1, 1, 1, 1) -- #FFFFFF
end


-- Cleans up a pooled FontString layer.
local function ResetFontString(pool, fontString)
    fontString:Hide()
    fontString:ClearAllPoints()
    fontString:SetText("")
    fontString:SetTextColor(1, 1, 1, 1) -- #FFFFFF
    fontString:SetAlpha(1.00)
end

-------------------------------------------------------------------------------
-- 2. REGISTRY INITIALIZATION
-- Objective: Lazy-initializes the multi-pool system registry within the framework context to manage UI elements.
-- Variables:
-- parentFrame: The default parent frame for all pooled elements.
-------------------------------------------------------------------------------

-- Lazy-initializes the multi-pool system registry within the framework context.
function Context:InitializeFrameworkPools(parentFrame)
    if self.pools then return end
    
    self.pools = {
        Button = CreateFramePool("Button", parentFrame, nil, ResetButton),
        StatusBar = CreateFramePool("StatusBar", parentFrame, nil, ResetStatusBar),
        Frame = CreateFramePool("Frame", parentFrame, nil, ResetFrame),
        CheckButton = CreateFramePool("CheckButton", parentFrame, nil, ResetCheckButton),
        EditBox = CreateFramePool("EditBox", parentFrame, nil, ResetEditBox),
        ScrollFrame = CreateFramePool("ScrollFrame", parentFrame, nil, ResetScrollFrame),
        Slider = CreateFramePool("Slider", parentFrame, nil, ResetSlider),
        Model = CreateFramePool("Model", parentFrame, nil, ResetModel),
        Texture = CreateTexturePool(parentFrame, "BACKGROUND", 0, nil, ResetTexture),
        FontString = CreateFontStringPool(parentFrame, "ARTWORK", 0, "GameFontNormal", ResetFontString)
    }
end

-------------------------------------------------------------------------------
-- 3. UNIFIED ACQUISITION GATEWAY
-- Objective: Dynamically acquires a recycled or brand-new UI element of the specified type, and configures it.
-- Variables:
-- elementType: String identifier for the WoW UI object instance ("Button", "StatusBar", etc).
-- parent: The parent frame mapping containment hierarchies.
-- options: Structural layout and initialization configurations.
-------------------------------------------------------------------------------

-- Dynamically acquires a recycled or brand-new UI element of the specified type.
function Context:AcquireElement(elementType, parent, options)
    if not self.pools then
        self:InitializeFrameworkPools(parent or UIParent)
    end
    
    local pool = self.pools[elementType]
    if not pool then return end
    
    -- Acquire element from the respective type-safe hotel.
    local element, isNew = pool:Acquire()
    
    -- Dynamically enforce parenthood update if needed.
    if element.SetParent and parent and element:GetParent() ~= parent then
        element:SetParent(parent)
    end
    
    -- 1. Type-Specific Initialization (Only executed upon fresh memory instantiation)
    if isNew then
        if elementType == "StatusBar" then
            local background = element:CreateTexture(nil, "BACKGROUND")
            background:SetAllPoints()
            local bgColor = options.bgColor or lib.DefaultStyles.colors.white
            background:SetColorTexture(unpack(bgColor))
            element.background = background
            local fill = element:CreateStatusBarTexture()
            local fillColor = options.fillColor or options.color or lib.DefaultStyles.colors.background
            fill:SetColorTexture(unpack(fillColor))
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
        local bgColor = options.bgColor or lib.DefaultStyles.colors.white
        if element.background then
            element.background:SetColorTexture(unpack(bgColor))
        end
        local fillColor = options.fillColor or options.color or lib.DefaultStyles.colors.background
        element:GetStatusBarTexture():SetColorTexture(unpack(fillColor))
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
    elseif elementType == "Frame" then
        if options.onUpdate then
            element.onUpdateCallback = options.onUpdate
            element:SetScript("OnUpdate", function(self, ...)
                if self.onUpdateCallback then
                    self.onUpdateCallback(self, ...)
                end
            end)
        end
        if options.onEvent then
            element.onEventCallback = options.onEvent
            element:SetScript("OnEvent", function(self, ...)
                if self.onEventCallback then
                    self.onEventCallback(self, ...)
                end
            end)
        end
    elseif elementType == "CheckButton" then
        if options.checked ~= nil then
            element:SetChecked(options.checked)
        end
        if options.onClick then
            element.onClickCallback = options.onClick
            element:SetScript("OnClick", function(self, ...)
                if self.onClickCallback then
                    self.onClickCallback(self, ...)
                end
            end)
        end
        if options.text then
            local textString = element.Text or _G[element:GetName().."Text"]
            if textString and textString.SetText then
                textString:SetText(options.text)
            end
        end
    elseif elementType == "EditBox" then
        if options.text then
            element:SetText(options.text)
        end
        if options.onTextChanged then
            element.onTextChangedCallback = options.onTextChanged
            element:SetScript("OnTextChanged", function(self, ...)
                if self.onTextChangedCallback then
                    self.onTextChangedCallback(self, ...)
                end
            end)
        end
        if options.onEnterPressed then
            element.onEnterPressedCallback = options.onEnterPressed
            element:SetScript("OnEnterPressed", function(self, ...)
                if self.onEnterPressedCallback then
                    self.onEnterPressedCallback(self, ...)
                end
            end)
        end
        if options.onEscapePressed then
            element.onEscapePressedCallback = options.onEscapePressed
            element:SetScript("OnEscapePressed", function(self, ...)
                if self.onEscapePressedCallback then
                    self.onEscapePressedCallback(self, ...)
                end
            end)
        end
    elseif elementType == "ScrollFrame" then
        if options.scrollChild then
            element:SetScrollChild(options.scrollChild)
        end
    elseif elementType == "Slider" then
        if options.minVal and options.maxVal then
            element:SetMinMaxValues(options.minVal, options.maxVal)
        end
        if options.value then
            element:SetValue(options.value)
        end
        if options.valueStep then
            element:SetValueStep(options.valueStep)
        end
        if options.onValueChanged then
            element.onValueChangedCallback = options.onValueChanged
            element:SetScript("OnValueChanged", function(self, ...)
                if self.onValueChangedCallback then
                    self.onValueChangedCallback(self, ...)
                end
            end)
        end
    elseif elementType == "Model" then
        if options.modelPath then
            element:SetModel(options.modelPath)
        elseif options.modelFileID then
            element:SetModelFileID(options.modelFileID)
        end
    end
    
    element:Show()
    return element
end

-------------------------------------------------------------------------------
-- 4. UNIFIED RELEASE GATEWAY
-- Objective: Releases active elements back into their respective pools for future reuse.
-- Variables:
-- elementType: String identifier of the pool.
-- element: The specific UI frame or layer to return.
-------------------------------------------------------------------------------

-- Instantly releases a single active element back to its type-safe pool.
function Context:ReleaseElement(elementType, element)
    if self.pools and self.pools[elementType] then
        self.pools[elementType]:Release(element)
    end
end

-- Instantly releases all managed resources back into their active pools.
-- Call this during global frame hides, tab changes, or component cleanups.
function Context:ReleaseAllElements()
    if not self.pools then return end
    for _, pool in pairs(self.pools) do
        pool:ReleaseAll()
    end
end