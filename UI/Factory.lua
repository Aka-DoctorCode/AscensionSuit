-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Factory.lua
-- Version: V13
-------------------------------------------------------------------------------
-- Copyright (c) 2025–2026 Aka-DoctorCode. All Rights Reserved.
--
-- This software and its source code are the exclusive property of the author.
-- No part of this file may be copied, modified, redistributed, or used in
-- derivative works without express written permission.
-------------------------------------------------------------------------------

local MAJOR, MINOR = "AscensionSuit-UI", 2
local lib = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end

-------------------------------------------------------------------------------
-- DEFAULT STYLES
-------------------------------------------------------------------------------

lib.DefaultStyles = {
    colors = {
        primary          = { 0.498, 0.075, 0.925, 1.0 },
        gold             = { 1.000, 0.800, 0.200, 1.0 },
        backgroundDark   = { 0.020, 0.020, 0.031, 0.95 },
        surfaceDark      = { 0.047, 0.039, 0.082, 1.0 },
        surfaceHighlight = { 0.165, 0.141, 0.239, 1.0 },
        blackDetail      = { 0.0, 0.0, 0.0, 1.0 },
        whiteDetail      = { 1.0, 1.0, 1.0, 1.0 },
        textLight        = { 0.886, 0.910, 0.941, 1.0 },
        textDim          = { 0.580, 0.640, 0.720, 1.0 },
        sidebarBg        = { 0.10, 0.10, 0.10, 0.95 },
        sidebarHover     = { 0.20, 0.20, 0.20, 0.5 },
        sidebarAccent    = { 0.00, 0.48, 1.00, 0.95 },
        sidebarActive    = { 0.00, 0.40, 1.00, 0.2 },
    },
    files = {
        bgFile   = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        arrow    = "Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Up",
    },
    dimensions = {
        sidebarWidth       = 160,
        sidebarAccentWidth = 3,
        contentPadding     = 16,
        checkboxSize       = 36,
        checkboxSpacing    = 40,
        sliderWidth        = 160,
        dropdownWidth      = 160,
        dropdownHeight     = 48,
        tabWidth           = 144,
        tabHeight          = 30,
        tabSpacing         = 6,
        editBoxHeight      = 28,
        colorPickerSize    = 24,
        colorPickerSpacing = 32,
        headerSpacing      = 32,
        labelSpacing       = 16,
        sliderSpacing      = 56,
        buttonHeight       = 24,
        backdropEdgeSize   = 8,
    },
    fonts = {
        header = "GameFontNormalHuge",
        label  = "GameFontHighlightLarge",
        desc   = "GameFontHighlightMedium",
    },
    textures = {
        bar   = "Interface\\Buttons\\WHITE8X8",
        spark = "Interface\\CastingBar\\UI-CastingBar-Spark",
    }
}

-------------------------------------------------------------------------------
-- GLOBAL DROPDOWN MANAGEMENT
-------------------------------------------------------------------------------

local activeDropdownList = nil
local function closeActiveDropdown()
    if activeDropdownList and activeDropdownList:IsShown() then
        activeDropdownList:Hide()
    end
    activeDropdownList = nil
    local blocker = _G["AscensionSuitDropdownBlocker"]
    if blocker then blocker:Hide() end
end

local function setTooltip(frame, title, description)
    if not description or description == "" then return end
    local oldEnter = frame:GetScript("OnEnter")
    local oldLeave = frame:GetScript("OnLeave")

    frame:SetScript("OnEnter", function(self)
        if oldEnter then oldEnter(self) end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(title or "Option Info", 1, 1, 1)
        GameTooltip:AddLine(description, 1, 0.82, 0, true)
        GameTooltip:Show()
    end)
    frame:SetScript("OnLeave", function(self)
        if oldLeave then oldLeave(self) end
        GameTooltip_Hide()
    end)
end

-------------------------------------------------------------------------------
-- STEP BUTTON HELPER
-------------------------------------------------------------------------------

local function createStepButton(parent, symbol, size, onClick, styles)
    local btn = CreateFrame("Button", nil, parent, "BackdropTemplate")
    btn:SetSize(size, size)
    btn:SetBackdrop({
        bgFile   = styles.files.bgFile,
        edgeFile = styles.files.edgeFile,
        edgeSize = 1,
        insets   = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    btn:SetBackdropColor(unpack(styles.colors.surfaceHighlight))
    btn:SetBackdropBorderColor(unpack(styles.colors.blackDetail))

    local iconTextures = {}
    local hLine = btn:CreateTexture(nil, "OVERLAY")
    hLine:SetTexture(styles.textures.bar)
    hLine:SetSize(12, 2)
    hLine:SetPoint("CENTER", 0, 0)
    hLine:SetVertexColor(unpack(styles.colors.textLight))
    table.insert(iconTextures, hLine)

    if symbol == "+" then
        local vLine = btn:CreateTexture(nil, "OVERLAY")
        vLine:SetTexture(styles.textures.bar)
        vLine:SetSize(2, 12)
        vLine:SetPoint("CENTER", 0, 0)
        vLine:SetVertexColor(unpack(styles.colors.textLight))
        table.insert(iconTextures, vLine)
    end

    btn.iconTextures = iconTextures

    local function setIconColor(r, g, b)
        for _, tex in ipairs(iconTextures) do
            tex:SetVertexColor(r, g, b, 1)
        end
    end

    btn:SetScript("OnEnter", function(self)
        self:SetBackdropColor(unpack(styles.colors.primary))
        self:SetBackdropBorderColor(unpack(styles.colors.textLight))
        setIconColor(1, 1, 1)
    end)
    btn:SetScript("OnLeave", function(self)
        self:SetBackdropColor(unpack(styles.colors.surfaceHighlight))
        self:SetBackdropBorderColor(unpack(styles.colors.blackDetail))
        self._holding = false
        setIconColor(unpack(styles.colors.textLight))
    end)
    btn:SetScript("OnMouseDown", function(self)
        for _, tex in ipairs(self.iconTextures) do
            tex:ClearAllPoints()
            tex:SetPoint("CENTER", 1, -1)
        end
        onClick()
        self._holdId = (self._holdId or 0) + 1
        local currentHold = self._holdId
        self._holding = true
        C_Timer.After(0.4, function()
            local function doRepeat()
                if not self:IsVisible() then self._holding = false end
                if self._holding and self._holdId == currentHold then
                    onClick()
                    C_Timer.After(0.08, doRepeat)
                end
            end
            if not self:IsVisible() then self._holding = false end
            if self._holding and self._holdId == currentHold then
                doRepeat()
            end
        end)
    end)
    btn:SetScript("OnMouseUp", function(self)
        for _, tex in ipairs(self.iconTextures) do
            tex:ClearAllPoints()
            tex:SetPoint("CENTER", 0, 0)
        end
        self._holding = false
    end)
    return btn
end

-------------------------------------------------------------------------------
-- CONTEXT CLASS
-------------------------------------------------------------------------------

local Context = {}
Context.__index = Context

function lib:CreateContext(addonStyles)
    local styles = {}
    for k, v in pairs(lib.DefaultStyles) do
        styles[k] = addonStyles and addonStyles[k] or v
    end

    local ctx = setmetatable({
        styles = styles,
        layoutModel = nil
    }, Context)

    ctx.layoutModel = lib.LayoutModel:new(ctx)
    return ctx
end

-------------------------------------------------------------------------------
-- FACTORY METHODS
-------------------------------------------------------------------------------

function Context:createHeader(args)
    local parent, text, yOffset = args.parent, args.text, args.yOffset
    local color = args.color or self.styles.colors.gold
    local leftPadding = self.styles.dimensions.contentPadding or 16
    local header = parent:CreateFontString(nil, "OVERLAY", self.styles.fonts.header)
    header:SetPoint("TOPLEFT", leftPadding, yOffset)
    header:SetText(text)
    header:SetTextColor(unpack(color))
    local headerHeight = header:GetStringHeight()
    local nextY = yOffset - headerHeight - 8
    return header, nextY
end

function Context:createLabel(args)
    local parent, text, yOffset, xOffset = args.parent, args.text, args.yOffset, args.xOffset
    local anchorFrame = args.anchorFrame
    local color = args.color or self.styles.colors.textLight
    local labelSpacing = self.styles.dimensions.labelSpacing or 16
    local actualX = xOffset or self.styles.dimensions.contentPadding or 16

    local label = parent:CreateFontString(nil, "OVERLAY", self.styles.fonts.label)
    label:SetPoint("TOPLEFT", anchorFrame or parent, "TOPLEFT", actualX, yOffset)
    label:SetText(text)
    label:SetTextColor(unpack(color))

    return label, yOffset - labelSpacing
end

function Context:createCheckbox(args)
    local parent, text, tooltip = args.parent, args.text, args.tooltip
    local getter, setter, yOffset, xOffset = args.getter, args.setter, args.yOffset, args.xOffset

    local checkboxSize = self.styles.dimensions.checkboxSize or 24
    local checkboxSpacing = self.styles.dimensions.checkboxSpacing or 24
    local labelColor = self.styles.colors.textLight

    local checkbox = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    checkbox:SetSize(checkboxSize, checkboxSize)
    local actualX = xOffset or self.styles.dimensions.contentPadding or 16
    checkbox:SetPoint("TOPLEFT", parent, "TOPLEFT", actualX, yOffset or -16)

    local label = checkbox.Text
    label:SetFontObject(self.styles.fonts.label)
    label:SetPoint("LEFT", checkbox, "RIGHT", 8, 0)
    label:SetText(text or "")
    label:SetTextColor(unpack(labelColor))

    if getter then checkbox:SetChecked(getter()) end
    checkbox:SetScript("OnClick", function(self)
        if setter then setter(self:GetChecked()) end
    end)

    if tooltip then
        checkbox:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(text or "", 1, 1, 1)
            GameTooltip:AddLine(tooltip, 1, 0.82, 0, true)
            GameTooltip:Show()
        end)
        checkbox:SetScript("OnLeave", GameTooltip_Hide)
    end

    return checkbox, yOffset - checkboxSpacing
end

function Context:createSlider(args)
    local parent, text, minVal, maxVal = args.parent, args.text, args.minVal or 0, args.maxVal or 100
    local step, getter, setter, tooltip = args.step or 1, args.getter, args.setter, args.tooltip
    local width, yOffset, xOffset = args.width or self.styles.dimensions.sliderWidth, args.yOffset, args.xOffset

    local actualX = xOffset or self.styles.dimensions.contentPadding or 16
    local sliderName = "AscensionSuitSlider_" .. tostring(math.random(1000000, 9999999))
    local slider = CreateFrame("Slider", sliderName, parent, "OptionsSliderTemplate")
    slider:SetPoint("TOPLEFT", actualX, yOffset - 16)
    slider:SetWidth(width)
    slider:SetMinMaxValues(minVal, maxVal)
    slider:SetValueStep(step)
    slider:SetObeyStepOnDrag(true)

    local val = getter() or minVal

    slider.text = slider:CreateFontString(nil, "OVERLAY", self.styles.fonts.label)
    slider.text:SetPoint("BOTTOMLEFT", slider, "TOPLEFT", 0, 4)
    slider.text:SetText(text)
    slider.text:SetTextColor(unpack(self.styles.colors.textDim))

    local lowText = _G[sliderName .. "Low"]
    if lowText then
        lowText:SetFontObject(self.styles.fonts.label)
        lowText:SetText(minVal)
        lowText:SetTextColor(unpack(self.styles.colors.textDim))
    end

    local highText = _G[sliderName .. "High"]
    if highText then
        highText:SetFontObject(self.styles.fonts.label)
        highText:SetText(maxVal)
        highText:SetTextColor(unpack(self.styles.colors.textDim))
    end

    slider:SetValue(val)

    local function updateValue(inputValue)
        local numericValue = tonumber(inputValue)
        if numericValue then
            local finalVal = math.max(minVal, math.min(maxVal, numericValue))
            slider:SetValue(finalVal)
            setter(finalVal)
        end
    end

    local btnSize = self.styles.dimensions.editBoxHeight or 28
    local controlsFrame = CreateFrame("Frame", nil, parent)
    controlsFrame:SetPoint("TOPLEFT", slider, "BOTTOMLEFT", 0, -8)
    controlsFrame:SetPoint("TOPRIGHT", slider, "BOTTOMRIGHT", 0, -8)
    controlsFrame:SetHeight(btnSize + 10)

    local editBox = CreateFrame("EditBox", nil, controlsFrame, "InputBoxTemplate")
    editBox:SetSize(btnSize + 20, btnSize + 20)
    editBox:SetPoint("CENTER", controlsFrame, "CENTER", 0, 0)
    editBox:SetAutoFocus(false)
    editBox:SetJustifyH("CENTER")
    editBox:SetFontObject(self.styles.fonts.label)
    editBox:SetText(tostring(math.floor(val * 100) / 100))

    editBox:SetScript("OnEnterPressed", function(self)
        updateValue(self:GetText())
        self:ClearFocus()
    end)

    local btnMinus = createStepButton(controlsFrame, "-", btnSize, function() updateValue(slider:GetValue() - step) end,
        self.styles)
    btnMinus:SetPoint("RIGHT", editBox, "LEFT", -12, 0)

    local btnPlus = createStepButton(controlsFrame, "+", btnSize, function() updateValue(slider:GetValue() + step) end,
        self.styles)
    btnPlus:SetPoint("LEFT", editBox, "RIGHT", 12, 0)

    slider:SetScript("OnValueChanged", function(_, value)
        editBox:SetText(tostring(math.floor(value * 100) / 100))
    end)

    slider:SetScript("OnMouseUp", function(self)
        setter(self:GetValue())
    end)

    if tooltip then setTooltip(slider, text, tooltip) end

    local nextY = yOffset - (slider:GetHeight() + 4 + controlsFrame:GetHeight() + 36)
    return slider, nextY
end

function Context:createStepper(args)
    local parent, text, minVal, maxVal = args.parent, args.text, args.minVal or 0, args.maxVal or 100
    local step, getter, setter, tooltip = args.step or 1, args.getter, args.setter, args.tooltip
    local width, yOffset, xOffset = args.width or 120, args.yOffset, args.xOffset

    local actualX = xOffset or self.styles.dimensions.contentPadding or 16
    local val = getter() or minVal

    local labelString = parent:CreateFontString(nil, "OVERLAY", self.styles.fonts.label)
    labelString:SetPoint("TOPLEFT", actualX, yOffset)
    labelString:SetText(text)
    labelString:SetTextColor(unpack(self.styles.colors.textDim))

    local function updateValue(editBox, inputValue)
        local numericValue = tonumber(inputValue)
        if numericValue then
            numericValue = math.max(minVal, math.min(maxVal, numericValue))
            editBox:SetText(tostring(math.floor(numericValue * 100) / 100))
            setter(numericValue)
        else
            editBox:SetText(tostring(math.floor(getter() * 100) / 100))
        end
    end

    local btnSize = self.styles.dimensions.editBoxHeight or 28
    local controlsFrame = CreateFrame("Frame", nil, parent)
    controlsFrame:SetPoint("TOPLEFT", labelString, "BOTTOMLEFT", 0, -8)
    controlsFrame:SetSize(width, btnSize)

    local editBox = CreateFrame("EditBox", nil, controlsFrame, "InputBoxTemplate")
    editBox:SetSize(btnSize + 20, btnSize + 10)
    editBox:SetPoint("CENTER", controlsFrame, "CENTER", 0, 0)
    editBox:SetAutoFocus(false)
    editBox:SetJustifyH("CENTER")
    editBox:SetFontObject(self.styles.fonts.label)
    editBox:SetText(tostring(math.floor(val * 100) / 100))

    editBox:SetScript("OnEnterPressed", function(self)
        updateValue(self, self:GetText())
        self:ClearFocus()
    end)

    local btnMinus = createStepButton(controlsFrame, "-", btnSize, function() updateValue(editBox, getter() - step) end,
        self.styles)
    btnMinus:SetPoint("RIGHT", editBox, "LEFT", -8, 0)

    local btnPlus = createStepButton(controlsFrame, "+", btnSize, function() updateValue(editBox, getter() + step) end,
        self.styles)
    btnPlus:SetPoint("LEFT", editBox, "RIGHT", 8, 0)

    if tooltip then setTooltip(controlsFrame, text, tooltip) end

    local totalDescent = (labelString:GetHeight() or 14) + 8 + btnSize + 16
    return controlsFrame, yOffset - totalDescent
end

function Context:createColorPicker(args)
    local parent, text, getter, setter = args.parent, args.text, args.getter, args.setter
    local yOffset, xOffset, hasAlpha, tooltip = args.yOffset, args.xOffset, args.hasAlpha, args.tooltip

    local basePadding = xOffset or self.styles.dimensions.contentPadding or 16
    local actualX = basePadding - 4
    local pickerSize = self.styles.dimensions.colorPickerSize or 20
    local pickerSpacing = self.styles.dimensions.colorPickerSpacing or 24

    local button = CreateFrame("Button", nil, parent)
    button:SetSize(pickerSize, pickerSize)
    button:SetPoint("TOPLEFT", actualX, yOffset)

    local texture = button:CreateTexture(nil, "OVERLAY")
    texture:SetAllPoints()
    texture:SetColorTexture(getter())
    button.tex = texture

    local background = button:CreateTexture(nil, "BACKGROUND")
    background:SetPoint("TOPLEFT", -1, 1)
    background:SetPoint("BOTTOMRIGHT", 1, -1)
    background:SetColorTexture(1, 1, 1, 1)

    local label = button:CreateFontString(nil, "OVERLAY", self.styles.fonts.label)
    label:SetPoint("LEFT", button, "RIGHT", 10, 0)
    label:SetText(text)

    local function colorCallback(restore)
        local colorPicker = _G["ColorPickerFrame"]
        local r, g, b, a
        if type(restore) == "table" then
            r, g, b, a = unpack(restore)
        else
            if colorPicker and colorPicker.GetColorRGB then
                r, g, b = colorPicker:GetColorRGB()
            end
            a = (colorPicker and colorPicker.GetColorAlpha and colorPicker:GetColorAlpha()) or
                (colorPicker and colorPicker.GetColorOpacity and 1 - colorPicker:GetColorOpacity()) or 1
        end
        local finalAlpha = a or 1
        setter(r or 1, g or 1, b or 1, finalAlpha)
        button.tex:SetColorTexture(r or 1, g or 1, b or 1, finalAlpha)
    end

    button:SetScript("OnClick", function()
        local colorPicker = _G["ColorPickerFrame"]
        local r, g, b, a = getter()
        local currentAlpha = a or 1
        local info = {
            swatchFunc = function() colorCallback() end,
            opacityFunc = function() colorCallback() end,
            cancelFunc = function() colorCallback({ r or 1, g or 1, b or 1, currentAlpha }) end,
            hasOpacity = hasAlpha,
            opacity = currentAlpha,
            r = r or 1,
            g = g or 1,
            b = b or 1
        }

        if colorPicker and colorPicker.SetupColorPickerAndShow then
            colorPicker:SetupColorPickerAndShow(info)
        elseif colorPicker then
            colorPicker.func = info.swatchFunc
            colorPicker.opacityFunc = info.opacityFunc
            colorPicker.cancelFunc = info.cancelFunc
            colorPicker.hasOpacity = info.hasOpacity
            colorPicker.opacity = info.opacity
            if colorPicker.SetColorRGB then colorPicker:SetColorRGB(info.r, info.g, info.b) end
            colorPicker:Show()
        end
    end)

    if tooltip then setTooltip(button, text, tooltip) end

    return button, yOffset - pickerSpacing
end

function Context:createDropdown(args)
    local parent, text, options = args.parent, args.text, args.options
    local getter, setter, width, yOffset, xOffset, tooltip = args.getter, args.setter, args.width, args.yOffset, args.xOffset, args.tooltip

    local actualX = xOffset or self.styles.dimensions.contentPadding or 16
    local dropWidth = width or self.styles.dimensions.dropdownWidth or 140
    local dropHeight = self.styles.dimensions.dropdownHeight or 44

    local frame = CreateFrame("Frame", nil, parent)
    frame:SetSize(dropWidth, dropHeight)
    frame:SetPoint("TOPLEFT", actualX, yOffset)

    local label = frame:CreateFontString(nil, "OVERLAY", self.styles.fonts.label)
    label:SetPoint("TOPLEFT", 0, 0)
    label:SetText(text)
    label:SetTextColor(unpack(self.styles.colors.textLight))

    local dropdown = CreateFrame("Button", nil, frame, "BackdropTemplate")
    dropdown:SetSize(dropWidth, 24)
    dropdown:SetPoint("BOTTOMLEFT", 0, 0)
    dropdown:SetBackdrop({
        bgFile = self.styles.files.bgFile,
        edgeFile = self.styles.files.edgeFile,
        edgeSize = 8,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    dropdown:SetBackdropColor(unpack(self.styles.colors.surfaceHighlight))
    dropdown:SetBackdropBorderColor(unpack(self.styles.colors.blackDetail))

    local dropdownText = dropdown:CreateFontString(nil, "OVERLAY", self.styles.fonts.label)
    dropdownText:SetPoint("LEFT", 10, 0)
    dropdownText:SetPoint("RIGHT", -20, 0)
    dropdownText:SetJustifyH("LEFT")

    local function getLabel(val)
        for _, opt in ipairs(options) do
            if opt.value == val then return opt.label end
        end
        return tostring(val)
    end
    dropdownText:SetText(getLabel(getter()))

    local arrow = dropdown:CreateTexture(nil, "OVERLAY")
    arrow:SetSize(20, 20)
    arrow:SetPoint("RIGHT", -5, 0)
    arrow:SetTexture(self.styles.files.arrow)
    arrow:SetDesaturated(true)

    local list = CreateFrame("Frame", nil, _G.UIParent, "BackdropTemplate")
    list:SetPoint("TOPLEFT", dropdown, "BOTTOMLEFT", 0, -2)
    list:SetWidth(dropWidth)
    list:Hide()
    list:SetBackdrop({
        bgFile = self.styles.files.bgFile,
        edgeFile = self.styles.files.edgeFile,
        edgeSize = 8,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
    list:SetBackdropColor(unpack(self.styles.colors.surfaceDark))
    list:SetBackdropBorderColor(unpack(self.styles.colors.surfaceHighlight))

    dropdown:SetScript("OnClick", function()
        if not _G["AscensionSuitDropdownBlocker"] then
            local blocker = CreateFrame("Button", "AscensionSuitDropdownBlocker", _G.UIParent)
            blocker:SetAllPoints()
            blocker:SetFrameStrata("FULLSCREEN_DIALOG")
            blocker:SetFrameLevel(100)
            blocker:Hide()
            blocker:SetScript("OnClick", closeActiveDropdown)
        end

        if list:IsShown() then
            closeActiveDropdown()
        else
            closeActiveDropdown()
            
            local blocker = _G["AscensionSuitDropdownBlocker"]
            blocker:SetFrameStrata("FULLSCREEN_DIALOG")
            blocker:SetFrameLevel(100)
            blocker:Show()
            
            list:SetFrameStrata("TOOLTIP")
            list:SetFrameLevel(200)
            list:ClearAllPoints()
            list:SetPoint("TOPLEFT", dropdown, "BOTTOMLEFT", 0, -2)
            list:Show()
            
            activeDropdownList = list
        end
    end)

    local itemH = 20
    local maxListH = 200
    local totalH = #options * itemH + 10
    list:SetHeight(math.min(totalH, maxListH))
    list:SetClipsChildren(true)

    local btnContainer = CreateFrame("Frame", nil, list)
    btnContainer:SetSize(dropWidth, totalH)
    btnContainer:SetPoint("TOPLEFT", 0, 0)

    if totalH > maxListH then
        list:EnableMouseWheel(true)
        local scrollY = 0
        local maxScrollY = totalH - maxListH
        list:SetScript("OnMouseWheel", function(_, delta)
            scrollY = math.max(0, math.min(maxScrollY, scrollY - delta * itemH))
            btnContainer:SetPoint("TOPLEFT", 0, scrollY)
        end)
    end

    for i, opt in ipairs(options) do
        local btn = CreateFrame("Button", nil, btnContainer, "BackdropTemplate")
        btn:SetSize(dropWidth - 10, itemH)
        btn:SetPoint("TOPLEFT", 5, -5 - ((i - 1) * itemH))
        btn:SetBackdrop({ bgFile = self.styles.files.bgFile })
        btn:SetBackdropColor(unpack(self.styles.colors.surfaceDark))

        local btnText = btn:CreateFontString(nil, "OVERLAY", self.styles.fonts.label)
        btnText:SetPoint("LEFT", 5, 0)
        btnText:SetText(opt.label)

        local localStyles = self.styles
        btn:SetScript("OnEnter", function(self) self:SetBackdropColor(unpack(localStyles.colors.surfaceHighlight)) end)
        btn:SetScript("OnLeave", function(self) self:SetBackdropColor(unpack(localStyles.colors.surfaceDark)) end)
        btn:SetScript("OnClick", function()
            setter(opt.value)
            dropdownText:SetText(opt.label)
            closeActiveDropdown()
        end)
    end

    if tooltip then setTooltip(dropdown, text, tooltip) end

    return frame, yOffset - (dropHeight + 16)
end

function Context:createScrollPanel(args)
    local parent = args.parent
    local scrollName = "AscensionSuitScrollPanel_" .. tostring(math.random(1000000, 9999999))
    local scrollFrame = CreateFrame("ScrollFrame", scrollName, parent, "UIPanelScrollFrameTemplate")

    scrollFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, 0)
    scrollFrame:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -15, 0)

    local content = CreateFrame("Frame", nil, scrollFrame)
    local initialWidth = scrollFrame:GetWidth()
    if initialWidth == 0 then initialWidth = 600 end
    content:SetSize(initialWidth, 1)

    scrollFrame:SetScrollChild(content)
    scrollFrame:EnableMouseWheel(true)
    scrollFrame.ScrollBar = _G[scrollName .. "ScrollBar"]

    scrollFrame:SetScript("OnSizeChanged", function(self, width)
        if content and width and width > 0 then content:SetWidth(width) end
    end)

    scrollFrame:SetScript("OnMouseWheel", function(self, delta)
        local bar = self.ScrollBar
        if not bar then return end
        local minVal, maxVal = bar:GetMinMaxValues()
        local currentVal = bar:GetValue()
        local newVal = currentVal - delta * 50
        if newVal < minVal then newVal = minVal end
        if newVal > maxVal then newVal = maxVal end
        bar:SetValue(newVal)
    end)

    local scrollBar = scrollFrame.ScrollBar
    if scrollBar then
        if scrollBar.ScrollUpButton then scrollBar.ScrollUpButton:SetAlpha(0.7) end
        if scrollBar.ScrollDownButton then scrollBar.ScrollDownButton:SetAlpha(0.7) end

        local thumb = scrollBar:GetThumbTexture()
        if thumb then
            local r, g, b = unpack(self.styles.colors.surfaceHighlight)
            thumb:SetVertexColor(r, g, b, 0.8)
        end

        local regions = { scrollBar:GetRegions() }
        for _, region in ipairs(regions) do
            if region:IsObjectType("Texture") and region ~= thumb then
                region:SetAlpha(0)
            end
        end
    end

    return scrollFrame, content
end

function Context:createInput(args)
    local parent, text, tooltip = args.parent, args.text, args.tooltip
    local onEnterPressed, width, yOffset, xOffset = args.onEnterPressed, args.width, args.yOffset, args.xOffset

    local actualX = xOffset or self.styles.dimensions.contentPadding or 16
    local actualWidth = width or 200

    local frame = CreateFrame("Frame", nil, parent)
    frame:SetSize(actualWidth, 40)
    frame:SetPoint("TOPLEFT", actualX, yOffset)

    local label = frame:CreateFontString(nil, "OVERLAY", self.styles.fonts.label)
    label:SetPoint("TOPLEFT", 0, 0)
    label:SetText(text)
    label:SetTextColor(unpack(self.styles.colors.textLight))

    local editBox = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
    editBox:SetSize(actualWidth, 20)
    editBox:SetPoint("BOTTOMLEFT", 6, 0)
    editBox:SetAutoFocus(false)
    editBox:SetFontObject(self.styles.fonts.label)

    editBox:SetScript("OnEnterPressed", function(self)
        if onEnterPressed then onEnterPressed(self:GetText()) end
        self:ClearFocus()
    end)

    if tooltip then setTooltip(frame, text, tooltip) end

    return frame, yOffset - 50
end

function Context:createButton(args)
    local parent, text, onClick, tooltip = args.parent, args.text, args.onClick, args.tooltip
    local width, height, yOffset, xOffset = args.width, args.height, args.yOffset, args.xOffset

    local actualX = xOffset or self.styles.dimensions.contentPadding or 16
    local actualWidth = width or 120
    local actualHeight = height or 28

    local btn = CreateFrame("Button", nil, parent, "BackdropTemplate")
    btn:SetSize(actualWidth, actualHeight)
    btn:SetPoint("TOPLEFT", actualX, yOffset)
    btn:SetFrameLevel(parent:GetFrameLevel() + 10)

    btn:SetBackdrop({
        bgFile = self.styles.files.bgFile,
        edgeFile = self.styles.files.edgeFile,
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    btn:SetBackdropColor(unpack(self.styles.colors.surfaceHighlight))
    btn:SetBackdropBorderColor(unpack(self.styles.colors.blackDetail))

    local btnText = btn:CreateFontString(nil, "OVERLAY", self.styles.fonts.label)
    btnText:SetPoint("CENTER", 0, 0)
    btnText:SetText(text)
    btnText:SetTextColor(unpack(self.styles.colors.textLight))
    btn.text = btnText

    local styles = self.styles
    btn:SetScript("OnEnter", function(self)
        self:SetBackdropColor(unpack(styles.colors.primary))
        self:SetBackdropBorderColor(unpack(styles.colors.textLight))
    end)

    btn:SetScript("OnLeave", function(self)
        self:SetBackdropColor(unpack(styles.colors.surfaceHighlight))
        self:SetBackdropBorderColor(unpack(styles.colors.blackDetail))
    end)

    btn:SetScript("OnMouseDown", function(self) self.text:SetPoint("CENTER", 1, -1) end)
    btn:SetScript("OnMouseUp", function(self) self.text:SetPoint("CENTER", 0, 0) end)
    btn:SetScript("OnClick", function() if onClick then onClick() end end)

    if tooltip then setTooltip(btn, text, tooltip) end

    return btn, yOffset - (actualHeight + 10)
end

function Context:createCloseButton(parent, onClick)
    local styles = self.styles
    local colors = styles.colors

    local btn = CreateFrame("Button", nil, parent, "BackdropTemplate")
    btn:SetSize(24, 24)
    btn:SetBackdrop({
        bgFile = styles.files.bgFile,
        edgeFile = styles.files.edgeFile,
        edgeSize = 1,
    })
    btn:SetBackdropColor(unpack(colors.surfaceHighlight))
    btn:SetBackdropBorderColor(unpack(colors.blackDetail))

    local xLine1 = btn:CreateTexture(nil, "OVERLAY")
    xLine1:SetTexture(styles.textures.bar)
    xLine1:SetSize(13, 2)
    xLine1:SetPoint("CENTER", 0, 0)
    xLine1:SetRotation(math.rad(45))
    xLine1:SetVertexColor(unpack(colors.textLight))

    local xLine2 = btn:CreateTexture(nil, "OVERLAY")
    xLine2:SetTexture(styles.textures.bar)
    xLine2:SetSize(13, 2)
    xLine2:SetPoint("CENTER", 0, 0)
    xLine2:SetRotation(math.rad(-45))
    xLine2:SetVertexColor(unpack(colors.textLight))

    btn:SetScript("OnClick", function() if onClick then onClick() end end)
    btn:SetScript("OnEnter", function(self)
        self:SetBackdropColor(0.6, 0.1, 0.1, 1)
        xLine1:SetVertexColor(1, 0.4, 0.4)
        xLine2:SetVertexColor(1, 0.4, 0.4)
    end)
    btn:SetScript("OnLeave", function(self)
        self:SetBackdropColor(unpack(colors.surfaceHighlight))
        xLine1:SetVertexColor(unpack(colors.textLight))
        xLine2:SetVertexColor(unpack(colors.textLight))
    end)

    return btn
end

function Context:createTabbedInterface(parent, tabNames, buildFuncs, initialIndex)
    local tabs = {}
    local panels = {}
    local activeTab = initialIndex or 1
    local styles = self.styles

    local sidebarSeparator = parent:CreateTexture(nil, "ARTWORK")
    sidebarSeparator:SetWidth(1)
    sidebarSeparator:SetPoint("TOPLEFT", styles.dimensions.sidebarWidth, -45)
    sidebarSeparator:SetPoint("BOTTOMLEFT", styles.dimensions.sidebarWidth, 75)
    sidebarSeparator:SetColorTexture(unpack(styles.colors.surfaceHighlight))

    local function selectTab(index)
        activeTab = index
        for i, tab in ipairs(tabs) do
            if i == index then
                tab:SetBackdropColor(unpack(styles.colors.sidebarActive))
                tab.accent:Show()
            else
                tab:SetBackdropColor(0, 0, 0, 0)
                if tab.accent then tab.accent:Hide() end
            end
        end
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

    local function createTabButton(label, idx)
        local btn = CreateFrame("Button", nil, parent, "BackdropTemplate")
        local xOffset = (styles.dimensions.sidebarWidth - styles.dimensions.tabWidth) / 2
        local yOffset = -56 - ((idx - 1) * (styles.dimensions.tabHeight + styles.dimensions.tabSpacing))

        btn:SetSize(styles.dimensions.tabWidth, styles.dimensions.tabHeight)
        btn:SetPoint("TOPLEFT", xOffset, yOffset)

        local accent = btn:CreateTexture(nil, "OVERLAY")
        accent:SetWidth(styles.dimensions.sidebarAccentWidth)
        accent:SetPoint("TOPLEFT", -xOffset, 0)
        accent:SetPoint("BOTTOMLEFT", -xOffset, 0)
        accent:SetColorTexture(unpack(styles.colors.primary))
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

        btn:SetScript("OnClick", function() selectTab(idx) end)
        btn:SetScript("OnEnter", function()
            if activeTab ~= idx then btn:SetBackdropColor(unpack(styles.colors.sidebarHover)) end
        end)
        btn:SetScript("OnLeave", function()
            if activeTab ~= idx then btn:SetBackdropColor(0, 0, 0, 0) end
        end)

        table.insert(tabs, btn)
        return btn
    end

    for i, name in ipairs(tabNames) do
        createTabButton(name, i)
        local panel = CreateFrame("Frame", nil, parent)
        panel:SetPoint("TOPLEFT", sidebarSeparator, "TOPRIGHT", 0, 0)
        panel:SetPoint("BOTTOMRIGHT", -10, 15)
        panel:Hide()

        local scrollFrame, content = self:createScrollPanel({ parent = panel })
        panel.scrollFrame = scrollFrame
        panel.content = content
        panel.updateLayout = buildFuncs[i]

        table.insert(panels, panel)
    end

    selectTab(activeTab)

    return {
        panels = panels,
        selectTab = selectTab,
        getActiveTab = function() return activeTab end
    }
end

-------------------------------------------------------------------------------
-- LAYOUT MODEL
-------------------------------------------------------------------------------

lib.LayoutModel = {}
lib.LayoutModel.__index = lib.LayoutModel

function lib.LayoutModel:new(parent, startY)
    -- If called from class with ctx instead of parent (as in CreateContext)
    local ctx = self.ctx
    local actualParent = parent
    if not ctx and type(parent) == "table" and parent.styles then
        ctx = parent
        actualParent = nil
    end

    local obj = { ctx = ctx, parent = actualParent, y = startY or -15, currentSection = nil, sectionStartY = 0 }
    return setmetatable(obj, lib.LayoutModel)
end

function lib.LayoutModel:reset(parent, startY)
    self.parent = parent
    self.y = startY or -15
    self.currentSection = nil
    return self
end

function lib.LayoutModel:header(elementID, text)
    local h, newY = self.ctx:createHeader({ parent = self.parent, text = text, yOffset = self.y })
    self.y = newY
    return h
end

function lib.LayoutModel:label(elementID, text, xOffset, color)
    local targetParent = self.currentSection or self.parent
    local l, newY = self.ctx:createLabel({
        parent = targetParent,
        anchorFrame = self.parent,
        text = text,
        yOffset = self.y,
        xOffset = xOffset,
        color = color
    })
    self.y = newY
    return l
end

function lib.LayoutModel:checkbox(elementID, text, tooltip, getter, setter, xOffset)
    local cb, newY = self.ctx:createCheckbox({
        parent = self.parent,
        text = text,
        tooltip = tooltip,
        getter = getter,
        setter = setter,
        yOffset = self.y,
        xOffset = xOffset
    })
    self.y = newY
    return cb
end

function lib.LayoutModel:slider(elementID, text, tooltip, minVal, maxVal, step, getter, setter, width, xOffset)
    if tooltip ~= nil and type(tooltip) ~= "string" then
        xOffset, width, setter, getter, step, maxVal, minVal, tooltip = width, setter, getter, step, maxVal, minVal, tooltip, nil
    end
    local s, newY = self.ctx:createSlider({
        parent = self.parent,
        text = text,
        tooltip = tooltip,
        minVal = minVal,
        maxVal = maxVal,
        step = step,
        getter = getter,
        setter = setter,
        width = width,
        yOffset = self.y,
        xOffset = xOffset
    })
    self.y = newY
    return s
end

function lib.LayoutModel:stepper(elementID, text, tooltip, minVal, maxVal, step, getter, setter, width, xOffset)
    if tooltip ~= nil and type(tooltip) ~= "string" then
        xOffset, width, setter, getter, step, maxVal, minVal, tooltip = width, setter, getter, step, maxVal, minVal, tooltip, nil
    end
    local s, newY = self.ctx:createStepper({
        parent = self.parent,
        text = text,
        tooltip = tooltip,
        minVal = minVal,
        maxVal = maxVal,
        step = step,
        getter = getter,
        setter = setter,
        width = width,
        yOffset = self.y,
        xOffset = xOffset
    })
    self.y = newY
    return s
end

function lib.LayoutModel:colorPicker(elementID, text, tooltip, getter, setter, xOffset, hasAlpha)
    if tooltip ~= nil and type(tooltip) ~= "string" then
        hasAlpha, xOffset, setter, getter, tooltip = xOffset, getter, setter, tooltip, nil
    end
    local cp, newY = self.ctx:createColorPicker({
        parent = self.parent,
        text = text,
        tooltip = tooltip,
        getter = getter,
        setter = setter,
        yOffset = self.y,
        xOffset = xOffset,
        hasAlpha = hasAlpha
    })
    self.y = newY
    return cp
end

function lib.LayoutModel:dropdown(elementID, text, tooltip, options, getter, setter, width, xOffset)
    if tooltip ~= nil and type(tooltip) ~= "string" then
        xOffset, width, setter, getter, options, tooltip = width, setter, getter, options, tooltip, nil
    end
    local dd, newY = self.ctx:createDropdown({
        parent = self.parent,
        text = text,
        tooltip = tooltip,
        options = options,
        getter = getter,
        setter = setter,
        width = width,
        yOffset = self.y,
        xOffset = xOffset
    })
    self.y = newY
    return dd
end

function lib.LayoutModel:input(elementID, text, tooltip, width, xOffset, onEnterPressed)
    if type(tooltip) ~= "string" then
        onEnterPressed, xOffset, width, tooltip = xOffset, width, tooltip, nil
    end
    local inp, newY = self.ctx:createInput({
        parent = self.parent,
        text = text,
        tooltip = tooltip,
        width = width,
        xOffset = xOffset,
        yOffset = self.y,
        onEnterPressed = onEnterPressed
    })
    self.y = newY
    return inp
end

function lib.LayoutModel:button(elementID, text, tooltip, width, height, xOffset, onClick)
    if tooltip ~= nil and type(tooltip) ~= "string" then
        onClick, xOffset, height, width, tooltip = xOffset, height, width, tooltip, nil
    end
    local btn, newY = self.ctx:createButton({
        parent = self.parent,
        text = text,
        tooltip = tooltip,
        width = width,
        height = height,
        xOffset = xOffset,
        yOffset = self.y,
        onClick = onClick
    })
    self.y = newY
    return btn
end

function lib.LayoutModel:beginSection(xOffset, width)
    local section = CreateFrame("Frame", nil, self.parent, "BackdropTemplate")
    local actualX = xOffset or 8
    self.sectionStartY = self.y + 4
    section:SetPoint("TOPLEFT", self.parent, "TOPLEFT", actualX, self.sectionStartY)

    if width then
        section:SetWidth(width)
    else
        section:SetPoint("RIGHT", self.parent, "RIGHT", -8, 0)
    end

    section:SetBackdrop({
        bgFile = self.ctx.styles.files.bgFile,
        edgeFile = self.ctx.styles.files.edgeFile,
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    section:SetBackdropColor(unpack(self.ctx.styles.colors.surfaceDark))
    section:SetBackdropBorderColor(unpack(self.ctx.styles.colors.surfaceHighlight))
    self.currentSection = section
    self.y = self.y - 4
end

function lib.LayoutModel:endSection()
    if self.currentSection then
        self.y = self.y + 8
        local totalHeight = self.sectionStartY - self.y
        self.currentSection:SetHeight(totalHeight)
        self.currentSection = nil
        self.y = self.y - 16
    end
end
