-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: CloseButton.lua
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
-- 2. CLOSE BUTTON FACTORY
-- -------------------------------------------------------------------------------
--- Creates a standardized close button with an 'X' icon and hover states.
function Context:createCloseButton(parent, onClick)
    if not parent then return nil end
    local styles = self.styles
    local colors = styles.colors

    -- Base Frame
    local btn = CreateFrame("Button", nil, parent, "BackdropTemplate")
    btn:SetSize(24, 24)
    btn:SetBackdrop({
        bgFile = styles.files.bgFile,
        edgeFile = styles.files.edgeFile,
        edgeSize = 1,
    })
    
    if colors.surfaceLight then btn:SetBackdropColor(unpack(colors.surfaceLight)) end
    if colors.blackDetail then btn:SetBackdropBorderColor(unpack(colors.blackDetail)) end

    -- Visual 'X' Lines
    local xLine1 = btn:CreateTexture(nil, "OVERLAY")
    if styles.textures.bar then xLine1:SetTexture(styles.textures.bar) end
    xLine1:SetSize(13, 2)
    xLine1:SetPoint("CENTER", 0, 0)
    xLine1:SetRotation(math.rad(45))
    if colors.textLight then xLine1:SetVertexColor(unpack(colors.textLight)) end

    local xLine2 = btn:CreateTexture(nil, "OVERLAY")
    if styles.textures.bar then xLine2:SetTexture(styles.textures.bar) end
    xLine2:SetSize(13, 2)
    xLine2:SetPoint("CENTER", 0, 0)
    xLine2:SetRotation(math.rad(-45))
    if colors.textLight then xLine2:SetVertexColor(unpack(colors.textLight)) end

    -- -------------------------------------------------------------------------------
    -- 3. EVENT HANDLERS
    -- -------------------------------------------------------------------------------
    btn:SetScript("OnClick", function() if onClick then onClick() end end)
    btn:SetScript("OnEnter", function(self)
        self:SetBackdropColor(0.6, 0.1, 0.1, 1) -- Emergency red on hover
        xLine1:SetVertexColor(1, 0.4, 0.4)
        xLine2:SetVertexColor(1, 0.4, 0.4)
    end)
    btn:SetScript("OnLeave", function(self)
        if colors.surfaceLight then self:SetBackdropColor(unpack(colors.surfaceLight)) end
        if colors.textLight then 
            xLine1:SetVertexColor(unpack(colors.textLight))
            xLine2:SetVertexColor(unpack(colors.textLight))
        end
    end)

    return btn
end
