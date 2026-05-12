-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: StepButton.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

-- -------------------------------------------------------------------------------
-- 1. INITIALIZATION
-- -------------------------------------------------------------------------------
local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

-- -------------------------------------------------------------------------------
-- 2. STEP BUTTON FACTORY
-- -------------------------------------------------------------------------------
--- Creates a standardized button for incrementing or decrementing values (+/-).
--- @param args table: Configuration (parent, symbol, size, onClick, styles)
function Context:createStepButton(args)
    if not args or not args.parent or not args.symbol or not args.size or not args.onClick then 
        return nil 
    end
    
    local parent = args.parent
    local symbol = args.symbol
    local size = args.size
    local onClick = args.onClick
    local styles = args.styles or self.styles

    -- Base Frame
    local btn = CreateFrame("Button", nil, parent, "BackdropTemplate")
    btn:SetSize(size, size)
    btn:SetBackdrop({
        bgFile   = styles.files.bgFile,
        edgeFile = styles.files.edgeFile,
        edgeSize = 1,
        insets   = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    
    if styles.colors.surfaceLight then
        btn:SetBackdropColor(unpack(styles.colors.surfaceLight))
    end
    if styles.colors.blackDetail then
        btn:SetBackdropBorderColor(unpack(styles.colors.blackDetail))
    end

    -- Visual Symbols (+ or -)
    local iconTextures = {}
    local hLine = btn:CreateTexture(nil, "OVERLAY")
    if styles.textures.bar then hLine:SetTexture(styles.textures.bar) end
    hLine:SetSize(12, 2)
    hLine:SetPoint("CENTER", 0, 0)
    if styles.colors.textLight then hLine:SetVertexColor(unpack(styles.colors.textLight)) end
    table.insert(iconTextures, hLine)

    if symbol == "+" then
        local vLine = btn:CreateTexture(nil, "OVERLAY")
        if styles.textures.bar then vLine:SetTexture(styles.textures.bar) end
        vLine:SetSize(2, 12)
        vLine:SetPoint("CENTER", 0, 0)
        if styles.colors.textLight then vLine:SetVertexColor(unpack(styles.colors.textLight)) end
        table.insert(iconTextures, vLine)
    end

    btn.iconTextures = iconTextures

    -- -------------------------------------------------------------------------------
    -- 3. EVENT HANDLERS
    -- -------------------------------------------------------------------------------
    local function setIconColor(r, g, b)
        for _, tex in ipairs(iconTextures) do
            tex:SetVertexColor(r, g, b, 1)
        end
    end

    btn:SetScript("OnEnter", function(self)
        if styles.colors.primary then self:SetBackdropColor(unpack(styles.colors.primary)) end
        if styles.colors.textLight then self:SetBackdropBorderColor(unpack(styles.colors.textLight)) end
        setIconColor(1, 1, 1)
    end)
    
    btn:SetScript("OnLeave", function(self)
        if styles.colors.surfaceLight then self:SetBackdropColor(unpack(styles.colors.surfaceLight)) end
        if styles.colors.blackDetail then self:SetBackdropBorderColor(unpack(styles.colors.blackDetail)) end
        self._holding = false -- Stop repeat logic on leave
        if styles.colors.textLight then setIconColor(unpack(styles.colors.textLight)) end
    end)
    
    -- Press & Repeat Logic
    btn:SetScript("OnMouseDown", function(self)
        -- Visual Feedback (Pressed oFFset)
        for _, tex in ipairs(self.iconTextures) do
            tex:ClearAllPoints()
            tex:SetPoint("CENTER", 1, -1)
        end
        
        onClick() -- First click
        
        -- Start Repeat Timer
        self._holdId = (self._holdId or 0) + 1
        local currentHold = self._holdId
        self._holding = true
        C_Timer.After(0.4, function()
            local function doRepeat()
                if not self:IsVisible() then self._holding = false end
                if self._holding and self._holdId == currentHold then
                    onClick()
                    C_Timer.After(0.08, doRepeat) -- Repeating rate
                end
            end
            if not self:IsVisible() then self._holding = false end
            if self._holding and self._holdId == currentHold then
                doRepeat()
            end
        end)
    end)
    
    btn:SetScript("OnMouseUp", function(self)
        -- Visual Feedback (Reset oFFset)
        for _, tex in ipairs(self.iconTextures) do
            tex:ClearAllPoints()
            tex:SetPoint("CENTER", 0, 0)
        end
        self._holding = false -- Stop repeat logic
    end)
    
    return btn
end
