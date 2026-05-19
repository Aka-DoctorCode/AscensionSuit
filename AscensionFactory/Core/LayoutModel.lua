-------------------------------------------------------------------------------
-- Project: AscensionFactory
-- Author: Aka-DoctorCode
-- File: LayoutModel.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-------------------------------------------------------------------------------
local MAJOR = "AscensionFactory"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

lib.LayoutModel = lib.LayoutModel or {}
lib.LayoutModel.__index = lib.LayoutModel

-------------------------------------------------------------------------------
-- 2. CONSTRUCTOR & RESET
-------------------------------------------------------------------------------
--- Initializes a new LayoutModel instance.
function lib.LayoutModel:new(uiContext, parent, startY)
    local obj = {
        uiContext = uiContext or self.uiContext,
        parent = parent,
        y = startY or -15,
        currentSection = nil,
        sectionStartY = 0,
        sectionStartX = 0,
        columnStartY = nil,
        columnMaxY = nil,
        currentXOffset = nil,
        currentWidth = nil
    }
    return setmetatable(obj, lib.LayoutModel)
end

--- Resets the layout state to a new parent and starting position.
function lib.LayoutModel:reset(parent, startY)
    self.parent = parent
    self.y = startY or -15
    self.currentSection = nil
    self.sectionStartY = 0
    self.sectionStartX = 0
    self.columnStartY = nil
    self.columnMaxY = nil
    self.currentXOffset = nil
    self.currentWidth = nil
    return self
end

-------------------------------------------------------------------------------
-- 3. COORDINATE HELPERS
-------------------------------------------------------------------------------
--- Returns yOffset relative to section when inside one, else content-relative y.
function lib.LayoutModel:effectiveY()
    if self.currentSection then
        return self.y - self.sectionStartY
    end
    return self.y
end

--- Returns xOffset relative to section when inside one, else content-relative x.
function lib.LayoutModel:effectiveX(xOffset)
    if self.currentSection then
        return xOffset - self.sectionStartX
    end
    return xOffset
end

--- Converts section-relative newY back to content-relative and updates internal cursor.
function lib.LayoutModel:applyNewY(newY)
    if self.currentSection then
        self.y = newY + self.sectionStartY
    else
        self.y = newY
    end
end

-------------------------------------------------------------------------------
-- 4. COMPONENT WRAPPERS
-------------------------------------------------------------------------------
function lib.LayoutModel:header(elementID, text)
    local targetParent = self.currentSection or self.parent
    if not self.uiContext.createHeader then return nil end
    local h, newY = self.uiContext:createHeader({
        parent = targetParent,
        text = text,
        yOffset = self:effectiveY(),
        xOffset = self.currentXOffset and self:effectiveX(self.currentXOffset) or nil
    })
    self:applyNewY(newY)
    return h
end

function lib.LayoutModel:label(elementID, text, xOffset, color)
    local targetParent = self.currentSection or self.parent
    if not self.uiContext.createLabel then return nil end
    local l, newY = self.uiContext:createLabel({
        parent = targetParent,
        anchorFrame = self.parent,
        text = text,
        yOffset = self.y,
        xOffset = xOffset or self.currentXOffset,
        color = color
    })
    self.y = newY
    return l
end

function lib.LayoutModel:checkbox(elementID, text, tooltip, getter, setter, xOffset)
    local targetParent = self.currentSection or self.parent
    local rawX = xOffset or self.currentXOffset
    if not self.uiContext.createCheckbox then return nil end
    local cb, newY = self.uiContext:createCheckbox({
        parent = targetParent,
        text = text,
        tooltip = tooltip,
        getter = getter,
        setter = setter,
        yOffset = self:effectiveY(),
        xOffset = rawX and self:effectiveX(rawX) or nil
    })
    self:applyNewY(newY)
    return cb
end

function lib.LayoutModel:slider(elementID, text, tooltip, minVal, maxVal, step, getter, setter, width, xOffset)
    if tooltip ~= nil and type(tooltip) ~= "string" then
        xOffset, width, setter, getter, step, maxVal, minVal, tooltip = width, setter, getter, step, maxVal, minVal, tooltip, nil
    end
    local targetParent = self.currentSection or self.parent
    local rawX = xOffset or self.currentXOffset
    if not self.uiContext.createSlider then return nil end
    local s, newY = self.uiContext:createSlider({
        parent = targetParent,
        text = text,
        tooltip = tooltip,
        minVal = minVal,
        maxVal = maxVal,
        step = step,
        getter = getter,
        setter = setter,
        width = width or self.currentWidth,
        yOffset = self:effectiveY(),
        xOffset = rawX and self:effectiveX(rawX) or nil
    })
    self:applyNewY(newY)
    return s
end

function lib.LayoutModel:stepper(elementID, text, tooltip, minVal, maxVal, step, getter, setter, width, xOffset)
    if tooltip ~= nil and type(tooltip) ~= "string" then
        xOffset, width, setter, getter, step, maxVal, minVal, tooltip = width, setter, getter, step, maxVal, minVal, tooltip, nil
    end
    local targetParent = self.currentSection or self.parent
    local rawX = xOffset or self.currentXOffset
    if not self.uiContext.createStepper then return nil end
    local s, newY = self.uiContext:createStepper({
        parent = targetParent,
        text = text,
        tooltip = tooltip,
        minVal = minVal,
        maxVal = maxVal,
        step = step,
        getter = getter,
        setter = setter,
        width = width or self.currentWidth,
        yOffset = self:effectiveY(),
        xOffset = rawX and self:effectiveX(rawX) or nil
    })
    self:applyNewY(newY)
    return s
end

function lib.LayoutModel:colorPicker(elementID, text, tooltip, getter, setter, xOffset, hasAlpha)
    if tooltip ~= nil and type(tooltip) ~= "string" then
        hasAlpha, xOffset, setter, getter, tooltip = xOffset, getter, setter, tooltip, nil
    end
    local targetParent = self.currentSection or self.parent
    local rawX = xOffset or self.currentXOffset
    if not self.uiContext.createColorPicker then return nil end
    local cp, newY = self.uiContext:createColorPicker({
        parent = targetParent,
        text = text,
        tooltip = tooltip,
        getter = getter,
        setter = setter,
        yOffset = self:effectiveY(),
        xOffset = rawX and self:effectiveX(rawX) or nil,
        hasAlpha = hasAlpha
    })
    self:applyNewY(newY)
    return cp
end

function lib.LayoutModel:dropdown(elementID, text, tooltip, options, getter, setter, width, xOffset)
    if tooltip ~= nil and type(tooltip) ~= "string" then
        xOffset, width, setter, getter, options, tooltip = width, setter, getter, options, tooltip, nil
    end
    local targetParent = self.currentSection or self.parent
    local rawX = xOffset or self.currentXOffset
    if not self.uiContext.createDropdown then return nil end
    local dd, newY = self.uiContext:createDropdown({
        parent = targetParent,
        text = text,
        tooltip = tooltip,
        options = options,
        getter = getter,
        setter = setter,
        width = width or self.currentWidth,
        yOffset = self:effectiveY(),
        xOffset = rawX and self:effectiveX(rawX) or nil
    })
    self:applyNewY(newY)
    return dd
end

function lib.LayoutModel:input(elementID, text, tooltip, width, xOffset, onEnterPressed)
    if type(tooltip) ~= "string" then
        onEnterPressed, xOffset, width, tooltip = xOffset, width, tooltip, nil
    end
    local targetParent = self.currentSection or self.parent
    local rawX = xOffset or self.currentXOffset
    if not self.uiContext.createInput then return nil end
    local inp, newY = self.uiContext:createInput({
        parent = targetParent,
        text = text,
        tooltip = tooltip,
        width = width or self.currentWidth,
        xOffset = rawX and self:effectiveX(rawX) or nil,
        yOffset = self:effectiveY(),
        onEnterPressed = onEnterPressed
    })
    self:applyNewY(newY)
    return inp
end

function lib.LayoutModel:button(elementID, text, tooltip, width, height, xOffset, onClick)
    if tooltip ~= nil and type(tooltip) ~= "string" then
        onClick, xOffset, height, width, tooltip = xOffset, height, width, tooltip, nil
    end
    local targetParent = self.currentSection or self.parent
    local rawX = xOffset or self.currentXOffset
    if not self.uiContext.createButton then return nil end
    local btn, newY = self.uiContext:createButton({
        parent = targetParent,
        text = text,
        tooltip = tooltip,
        width = width or self.currentWidth,
        height = height,
        xOffset = rawX and self:effectiveX(rawX) or nil,
        yOffset = self:effectiveY(),
        onClick = onClick
    })
    self:applyNewY(newY)
    return btn
end

-------------------------------------------------------------------------------

-- 5. SECTION MANAGEMENT
-------------------------------------------------------------------------------
--- Begins a new layout section with its own backdrop and relative positioning.
function lib.LayoutModel:beginSection(xOffset, width)
    local section = CreateFrame("Frame", nil, self.parent, "BackdropTemplate")
    local actualX = xOffset or self.currentXOffset or 8
    local actualWidth = width or self.currentWidth
    self.sectionStartY = self.y + 4
    self.sectionStartX = actualX
    section:SetPoint("TOPLEFT", self.parent, "TOPLEFT", actualX, self.sectionStartY)

    if actualWidth then
        section:SetWidth(actualWidth)
    else
        section:SetPoint("RIGHT", self.parent, "RIGHT", -8, 0)
    end

    section:SetBackdrop({
        bgFile = self.uiContext.styles.files.bgFile,
        edgeFile = self.uiContext.styles.files.edgeFile,
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })

    if self.uiContext.styles.colors.surfaceDark then section:SetBackdropColor(unpack(self.uiContext.styles.colors.surfaceDark)) end
    if self.uiContext.styles.colors.surfaceLight then section:SetBackdropBorderColor(unpack(self.uiContext.styles.colors.surfaceLight)) end
    self.currentSection = section
    self.y = self.y - 4
end

--- Finalizes the current section, calculating its total height based on elements added.
function lib.LayoutModel:endSection()
    if self.currentSection then
        self.y = self.y + 8
        local totalHeight = self.sectionStartY - self.y
        self.currentSection:SetHeight(totalHeight)
        self.currentSection = nil
        self.sectionStartY = 0
        self.sectionStartX = 0
        self.y = self.y - 16
    end
end

-------------------------------------------------------------------------------
-- 6. COLUMN MANAGEMENT
-------------------------------------------------------------------------------

--- Begins a columnar layout, allowing side-by-side elements.
function lib.LayoutModel:beginColumn(xOffset, width)
    if not self.columnStartY then
        self.columnStartY = self.y
        self.columnMaxY = self.y
    end
    self.y = self.columnStartY
    self.currentXOffset = xOffset
    self.currentWidth = width
end

--- Marks the end of a column and updates the maximum height reached.
function lib.LayoutModel:endColumn()
    if self.y < self.columnMaxY then
        self.columnMaxY = self.y
    end
end

--- Finalizes the column layout and updates the parent container's height.
function lib.LayoutModel:columnsFinalize(contentFrame, bottomPadding)
    self.y = self.columnMaxY
    self.columnStartY = nil
    self.columnMaxY = nil
    self.currentXOffset = nil
    self.currentWidth = nil

    if contentFrame then
        local finalHeight = math.abs(self.y) + (bottomPadding or 20)
        contentFrame:SetHeight(finalHeight)
    end
end

-------------------------------------------------------------------------------
-- 7. CONTEXT EXTENSION
-------------------------------------------------------------------------------

local Context = lib.Context
if Context then
    --- Creates a specialized layout model within the context.
    function Context:createLayoutModel(parent, startY)
        if lib.LayoutModel then
            return lib.LayoutModel:new(self, parent, startY)
        end
    end
end
