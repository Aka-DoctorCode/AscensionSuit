-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: LayoutModel.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

lib.LayoutModel = {}
lib.LayoutModel.__index = lib.LayoutModel

function lib.LayoutModel:new(ctx, parent, startY)
    local obj = {
        ctx = ctx or self.ctx,
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

-- Returns yOffset relative to section when inside one, else content-relative y
function lib.LayoutModel:effectiveY()
    if self.currentSection then
        return self.y - self.sectionStartY
    end
    return self.y
end

-- Returns xOffset relative to section when inside one, else content-relative x
function lib.LayoutModel:effectiveX(xOffset)
    if self.currentSection then
        return xOffset - self.sectionStartX
    end
    return xOffset
end

-- Converts section-relative newY back to content-relative and updates self.y
function lib.LayoutModel:applyNewY(newY)
    if self.currentSection then
        self.y = newY + self.sectionStartY
    else
        self.y = newY
    end
end

function lib.LayoutModel:header(elementID, text)
    local targetParent = self.currentSection or self.parent
    local h, newY = self.ctx:createHeader({
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
    local l, newY = self.ctx:createLabel({
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
    local cb, newY = self.ctx:createCheckbox({
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
    local s, newY = self.ctx:createSlider({
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
    local s, newY = self.ctx:createStepper({
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
    local cp, newY = self.ctx:createColorPicker({
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
    local dd, newY = self.ctx:createDropdown({
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
    local inp, newY = self.ctx:createInput({
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
    local btn, newY = self.ctx:createButton({
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
        bgFile = self.ctx.styles.files.bgFile,
        edgeFile = self.ctx.styles.files.edgeFile,
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })

    if self.ctx.styles.colors.surfaceDark then section:SetBackdropColor(unpack(self.ctx.styles.colors.surfaceDark)) end
    if self.ctx.styles.colors.surfaceHighlight then section:SetBackdropBorderColor(unpack(self.ctx.styles.colors.surfaceHighlight)) end
    self.currentSection = section
    self.y = self.y - 4
end

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

function lib.LayoutModel:beginColumn(xOffset, width)
    if not self.columnStartY then
        self.columnStartY = self.y
        self.columnMaxY = self.y
    end
    self.y = self.columnStartY
    self.currentXOffset = xOffset
    self.currentWidth = width
end

function lib.LayoutModel:endColumn()
    if self.y < self.columnMaxY then
        self.columnMaxY = self.y
    end
end

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
