-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: ContextMenu.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-- -------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- -------------------------------------------------------------------------------
local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local UX = lib.UX or {}
lib.UX = UX

-- -------------------------------------------------------------------------------
-- 2. PUBLIC API
-- -------------------------------------------------------------------------------
--- Displays a context menu at the current cursor position.
function UX:showContextMenu(parent, options, config)
    local menuOptions = {}
    
    -- 1. Add custom options
    if options then
        for _, opt in ipairs(options) do table.insert(menuOptions, opt) end
    end
    
    -- 2. Add standard options if config is provided
    if config then
        if #menuOptions > 0 then table.insert(menuOptions, { text = "---", func = nil }) end
        
        table.insert(menuOptions, {
            text = config.locked and "Unlock Position" or "Lock Position",
            func = function() 
                config.locked = not config.locked
                if parent.SetMovable then parent:SetMovable(not config.locked) end
            end
        })
        
        table.insert(menuOptions, {
            text = "Reset Position",
            func = function()
                config.point = "CENTER"
                config.relativePoint = "CENTER"
                config.x = 0
                config.y = 0
                parent:ClearAllPoints()
                parent:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
            end
        })
    end
    
    local menu = self:createContextMenu(parent, menuOptions)
    local x, y = GetCursorPosition()
    local scale = UIParent:GetEffectiveScale()
    menu:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x/scale + 5, y/scale - 5)
    menu:Show()
    
    -- Close on click outside
    if self.registerClickOutside then
        self:registerClickOutside(menu, function() menu:Hide() end)
    end
    
    return menu
end

-- -------------------------------------------------------------------------------
-- 3. INTERNAL HELPERS
-- -------------------------------------------------------------------------------
--- Internal helper to create the actual menu frame and populate its buttons.
function UX:createContextMenu(parent, options)
    local menu = CreateFrame("Frame", nil, parent or UIParent, "BackdropTemplate")
    menu:SetClampedToScreen(true)
    local Context = lib.Context
    local styles = Context and Context.styles or lib.DefaultStyles
    
    local itemHeight = 22
    local totalHeight = 0
    local maxWidth = 120
    
    -- Calculate dimensions
    for _, opt in ipairs(options) do
        if opt.text == "---" then
            totalHeight = totalHeight + 10
        else
            totalHeight = totalHeight + itemHeight
        end
    end
    
    menu:SetSize(maxWidth + 10, totalHeight + 10)
    menu:SetFrameStrata("TOOLTIP")
    
    -- Styling
    menu:SetBackdrop({
        bgFile = styles.files.bgFile,
        edgeFile = styles.files.edgeFile,
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    menu:SetBackdropColor(unpack(styles.colors.mainBackground))
    menu:SetBackdropBorderColor(unpack(styles.colors.surfaceLight))
    
    -- Populate items
    local currentY = -5
    for i, opt in ipairs(options) do
        if opt.text == "---" then
            local line = menu:CreateTexture(nil, "ARTWORK")
            line:SetHeight(1)
            line:SetPoint("TOPLEFT", 5, currentY - 5)
            line:SetPoint("TOPRIGHT", -5, currentY - 5)
            line:SetColorTexture(unpack(styles.colors.surfaceLight))
            currentY = currentY - 10
        else
            local btn = CreateFrame("Button", nil, menu)
            btn:SetSize(maxWidth, itemHeight)
            btn:SetPoint("TOP", 0, currentY)
            
            local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            text:SetPoint("LEFT", 5, 0)
            text:SetText(opt.text)
            text:SetTextColor(unpack(styles.colors.textLight))
            
            -- Interaction Scripts
            btn:SetScript("OnEnter", function(self)
                self.bg = self.bg or self:CreateTexture(nil, "BACKGROUND")
                self.bg:SetAllPoints()
                self.bg:SetColorTexture(unpack(styles.colors.surfaceLight))
                self.bg:Show()
            end)
            btn:SetScript("OnLeave", function(self)
                if self.bg then self.bg:Hide() end
            end)
            
            btn:SetScript("OnClick", function()
                menu:Hide()
                if opt.func then opt.func() end
            end)
            currentY = currentY - itemHeight
        end
    end
    
    return menu
end

-- -------------------------------------------------------------------------------
-- 4. MENU ITEM FACTORIES
-- -------------------------------------------------------------------------------
--- Adds a Lock/Unlock button to an options table.
function UX:addLockButton(options, parent, config)
    table.insert(options, {
        text = config.locked and "Unlock Position" or "Lock Position",
        func = function() 
            config.locked = not config.locked
            if parent.SetMovable then parent:SetMovable(not config.locked) end
        end
    })
end

--- Adds a Reset Position button to an options table.
function UX:addResetPositionButton(options, parent, config)
    table.insert(options, {
        text = "Reset Position",
        func = function()
            config.point = "CENTER"
            config.relativePoint = "CENTER"
            config.x = 0
            config.y = 0
            parent:ClearAllPoints()
            parent:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
        end
    })
end

--- Adds an Options button to an options table.
function UX:addOptionsButton(options, onClick)
    table.insert(options, {
        text = "Options",
        func = onClick
    })
end
