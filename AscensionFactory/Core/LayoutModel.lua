-------------------------------------------------------------------------------
-- Project: AscensionFactory
-- Author: Aka-DoctorCode
-- File: LayoutModel.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- Objective: Initialize the LayoutModel namespace and link it to the global AscensionFactory library.
-- Variables:
-- MAJOR: The namespace identifier for the addon library.
-------------------------------------------------------------------------------
local MAJOR = "AscensionFactory"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end
local Context = lib.Context

-- Acts as a class blueprint to store our LayoutModel functions.
lib.LayoutModel = lib.LayoutModel or {}
-- Setup Lua OOP inheritance. __index to itself means any new table created from this blueprint will automatically have access to all its functions.
lib.LayoutModel.__index = lib.LayoutModel

-------------------------------------------------------------------------------
-- 2. CONSTRUCTOR & CORE ANCHORING
-- Objective: Initializes a new LayoutModel instance to handle UI element positioning automatically.
-- Variables:
-- uiContext: The UI framework context containing styles and element factories.
-- parent: The main WoW UI frame that all layout elements will be attached to.
-------------------------------------------------------------------------------

function lib.LayoutModel:new(uiContext, parent)
    local layoutInstance = {
        uiContext = uiContext or self.uiContext,
        parent = parent,
        -- Tracks the active container frame
        currentParent = parent,
        -- The reference element for vertical stacking
        lastAddedElement = nil,
        -- Horizontal indent for columns
        columnCurrentX = 0,
        -- Forced width state for elements
        currentWidth = nil,
        -- Engine default layout settings
        defaultVerticalGap = 10,
        -- Vertical space for the next element
        nextVerticalGap = nil,
        -- Horizontal indent for the next element
        nextXOffset = nil
    }
    return setmetatable(layoutInstance, lib.LayoutModel)
end

-- Resets the layout engine state. Used to recycle a LayoutModel instead of creating a new one (saves memory).
function lib.LayoutModel:reset(parent)
    self.parent = parent
    self.currentParent = parent
    self.lastAddedElement = nil
    self.columnCurrentX = 0
    self.currentWidth = nil
    self.nextVerticalGap = nil
    self.nextXOffset = nil
    return self
end

-------------------------------------------------------------------------------
-- 3. ANCHOR ENGINE
-- Objective: Dynamically anchor elements to the previously created widget.
-- Variables
-- amount: The vertical space in pixels
-- element: The UI elements being placed on screen
-------------------------------------------------------------------------------

-- Adds vertical space before the next element is placed.
function lib.LayoutModel:addSpace(amount)
    self.nextVerticalGap = amount
end

-- Adds a one-time horizontal indent for the next element placed.
function lib.LayoutModel:addIndent(amount)
    self.nextXOffset = amount
end

-- Anchors a newly created element vertically below the previous one.
function lib.LayoutModel:anchorElement(element)
    -- Prevent nil errors if factory failed
    if type(element) ~= "table" or not element.SetPoint then return end
    
    local xOffset = self.nextXOffset or self.columnCurrentX or 0
    local verticalGap = self.nextVerticalGap or self.defaultVerticalGap
    
    -- Reset overrides so they only affect this one element.
    self.nextXOffset = nil
    self.nextVerticalGap = nil

    -- Clear any factory-default anchors
    element:ClearAllPoints()

    if not self.lastAddedElement then
        -- If no previous element exists, this is the first item in the container.
        -- Anchor it directly to the top-left corner of the container frame.
        element:SetPoint("TOPLEFT", self.currentParent, "TOPLEFT", xOffset, -verticalGap)
    else
        -- Standard vertical stacking below the previous element
        element:SetPoint("TOPLEFT", self.lastAddedElement, "BOTTOMLEFT", xOffset, -verticalGap)
    end

    -- Update tracker for the next element
    self.lastAddedElement = element
end

-------------------------------------------------------------------------------
-- 4. COMPONENT WRAPPERS
-- Objective: Instantiate elements and process them through the Anchor Engine.
-- Variables:
-- elementID: Unique identifier for the UI element.
-- text: Text string displayed by the element.
-- rightOffset: Distance from the right edge to force wrapping
-- elementID: Unique identifier string
-- tooltip: Hover information text
-- width: Button width in pixels
-- height: Button height in pixels
-- onClick: Callback function executed when clicked
-- getter: Function returning current state
-- setter: Function called with the new state when toggled
-------------------------------------------------------------------------------

-- Creates a header element to categorize sections.
function lib.LayoutModel:header(elementID, text)
    if not self.uiContext.createHeader then return nil end

    local headerElement = self.uiContext:createHeader({
        parent = self.currentParent,
        name = elementID,
        text = text
    })
    -- standard visual breathing room unless overridden
    self.nextVerticalGap = self.nextVerticalGap or 15
    self:anchorElement(headerElement)
    return headerElement
end

-- Creates a standard text label.
function lib.LayoutModel:label(elementID, text)
    if not self.uiContext.createLabel then return nil end

    local labelElement = self.uiContext:createLabel({
        parent = self.currentParent,
        name = elementID,
        text = text
    })

    self:anchorElement(labelElement)
    return labelElement
end

-- Creates a multi-line paragraph that wraps text.
function lib.LayoutModel:paragraph(elementID, text, rightOffset)
    if not self.uiContext.createParagraph then return nil end

    local paragraphElement = self.uiContext:createParagraph({
        parent = self.currentParent,
        name = elementID,
        text = text,
        rightOffset = rightOffset
    })

    self:anchorElement(paragraphElement)
    return paragraphElement
end

-- Creates a clickable button.
function lib.LayoutModel:button(elementID, text, tooltip, width, height, onClick)
    if tooltip ~= nil and type(tooltip) ~= "string" then
        onClick, height, width, tooltip = height, width, tooltip, nil
    end

    if not self.uiContext.createButton then return nil end

    local buttonElement = self.uiContext:createButton({
        parent = self.currentParent,
        name = elementID,
        text = text,
        tooltip = tooltip,
        width = width,
        height = height,
        onClick = onClick
    })

    self.nextVerticalGap = self.nextVerticalGap or 0
    self:anchorElement(buttonElement)
    return buttonElement
end

-- Creates a toggle switch.
function lib.LayoutModel:toggle(elementID, getter, setter, width, height, onClick)
    if not self.uiContext.createToggle then return nil end

    local toggleElement = self.uiContext:createToggle({
        parent = self.currentParent,
        name = elementID,
        getter = getter,
        setter = setter,
        width = width,
        height = height,
        onClick = onClick
    })

    self:anchorElement(toggleElement)
    return toggleElement
end

-------------------------------------------------------------------------------
-- 5. SECTION MANAGEMENT
-- Objective: Group elements dynamically using BOTTOM-anchoring for auto-resizing.
-- width: Optional explicit width for the section box.
-- section: The dynamically created Frame serving as the group container.
-------------------------------------------------------------------------------

-- Begins a new layout section with its own backdrop and relative positioning.
function lib.LayoutModel:beginSection(width)
    local section = self.uiContext:AcquireElement("Frame", self.currentParent, {})
    
    -- default indent for sections
    self.nextXOffset = self.nextXOffset or 8
    self:anchorElement(section)

    if width then
        section:SetWidth(width)
    else
        section:SetPoint("RIGHT", self.currentParent, "RIGHT", -8, 0)
    end

    -- Setup Background and Border
    if not section.border then
        local border = section:CreateTexture(nil, "BACKGROUND", nil, -2)
        border:SetAllPoints(section)
        section.border = border
    end

    if self.uiContext.styles.colors.surfaceLight then
        section.border:SetColorTexture(unpack(self.uiContext.styles.colors.surfaceLight))
    end

    if not section.background then
        local background = section:CreateTexture(nil, "BACKGROUND", nil, -1)
        background:SetPoint("TOPLEFT", section, "TOPLEFT", 1, -1)
        background:SetPoint("BOTTOMRIGHT", section, "BOTTOMRIGHT", -1, 1)
        section.background = background
    end

    if self.uiContext.styles.colors.surfaceDark then
        section.background:SetColorTexture(unpack(self.uiContext.styles.colors.surfaceDark))
    end

    -- Context Shift: Next elements will be anchored INSIDE this section
    self.previousParent = self.currentParent
    self.currentParent = section
    -- Reset cursor for the inside of the section
    self.lastAddedElement = nil
end

-- Finalizes the current section, automatically stretching its height to wrap contents.
function lib.LayoutModel:endSection()
    local section = self.currentParent
    if not section then return end

    -- Dynamic Height: Stretch the section's bottom to wrap around the last added element
    if self.lastAddedElement then
        section:SetPoint("BOTTOM", self.lastAddedElement, "BOTTOM", 0, -10)
    else
        section:SetHeight(20) -- Fallback for an empty section
    end

    -- Context Pop: Return to the parent layout flow
    self.currentParent = self.previousParent
    self.lastAddedElement = section
end

-------------------------------------------------------------------------------
-- 6. COLUMN MANAGEMENT
-- Objective: Use invisible containers to auto-calculate the tallest column.
-- Variables:
-- xOffset: The horizontal coordinate indent for the current column.
-- width: The total width allocated for the current column.
-- contentFrame: The master container frame whose height is updated.
-- bottomPadding: Extra space to add at the bottom of the content frame.
-------------------------------------------------------------------------------

-- Begins a columnar layout, allowing side-by-side elements.
function lib.LayoutModel:beginColumn(xOffset, width)
    -- If this is the start of a column row, create a transparent container
    if not self.columnContainer then
        self.columnContainer = self.uiContext:AcquireElement("Frame", self.currentParent, {})
        -- We temporarily disable nextXOffset/nextVerticalGap for this structural frame
        local oldX, oldY = self.nextXOffset, self.nextVerticalGap
        self.nextXOffset, self.nextVerticalGap = 0, 0
        self:anchorElement(self.columnContainer)
        self.nextXOffset, self.nextVerticalGap = oldX, oldY

        self.columnContainer:SetPoint("RIGHT", self.currentParent, "RIGHT", 0, 0)

        self.previousParentCol = self.currentParent
        self.currentParent = self.columnContainer
    end

    -- Reset vertical anchor for the new column
    self.lastAddedElement = nil
    self.columnCurrentX = xOffset or 0
    self.currentWidth = width
end

-- Marks the end of a column and updates the tallest column tracker.
function lib.LayoutModel:endColumn()
    -- Track the absolute lowest point reached by any column in this row
    if self.lastAddedElement then
        if not self.tallestColumnBottom or self.lastAddedElement:GetBottom() < self.tallestColumnBottom:GetBottom() then
            self.tallestColumnBottom = self.lastAddedElement
        end
    end
end

-- Finalizes the column layout and updates the parent container's height.
function lib.LayoutModel:columnsFinalize(contentFrame, bottomPadding)
    if self.columnContainer then
        -- Snap the container's bottom to the tallest column automatically
        if self.tallestColumnBottom then
            self.columnContainer:SetPoint("BOTTOM", self.tallestColumnBottom, "BOTTOM", 0, -(bottomPadding or 0))
        else
            self.columnContainer:SetHeight(10)
        end

        -- Restore original context
        self.currentParent = self.previousParentCol
        self.lastAddedElement = self.columnContainer

        -- State cleanup
        self.columnContainer = nil
        self.tallestColumnBottom = nil
        self.columnCurrentX = 0
        self.currentWidth = nil
    end

    -- Optionally finalize the master content frame if provided
    if contentFrame and self.lastAddedElement then
        contentFrame:SetPoint("BOTTOM", self.lastAddedElement, "BOTTOM", 0, -(bottomPadding or 20))
    end
end

-------------------------------------------------------------------------------
-- 7. CONTEXT EXTENSION
-- Objective: Attach the LayoutModel class to the UI Context factory, so developers can create a LayoutModel directly from the context.
-- Variables:
-- parent (table): The main frame to attach the layout model to.
-------------------------------------------------------------------------------

if Context then
    -- Creates a specialized layout model within the context.
    function Context:createLayoutModel(parent)
        if lib.LayoutModel then
            return lib.LayoutModel:new(self, parent)
        end
    end
end
