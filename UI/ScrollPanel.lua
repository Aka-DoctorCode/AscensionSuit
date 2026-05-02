-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: ScrollPanel.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

function Context:createScrollPanel(args)
    if not args or not args.parent then return nil, nil end
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
        if thumb and self.styles.colors.surfaceHighlight then
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
