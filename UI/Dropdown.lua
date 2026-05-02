-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: Dropdown.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local MAJOR = "AscensionSuit-UI"
local lib = LibStub:GetLibrary(MAJOR)
if not lib then return end

local Context = lib.Context
if not Context then return end

local activeDropdownList = nil

function lib:closeAllDropdowns()
    if activeDropdownList and activeDropdownList:IsShown() then
        activeDropdownList:Hide()
    end
    activeDropdownList = nil
    local blocker = _G["AscensionSuitDropdownBlocker"]
    if blocker then blocker:Hide() end
end

function Context:createDropdown(args)
    if not args or not args.parent then return nil, 0 end

    local parent = args.parent
    local text = args.text
    local options = args.options or {}
    local getter = args.getter
    local setter = args.setter
    local width = args.width
    local yOffset = args.yOffset or 0
    local xOffset = args.xOffset
    local tooltip = args.tooltip

    local actualX = xOffset or self.styles.dimensions.contentPadding or 16
    local dropWidth = width or self.styles.dimensions.dropdownWidth or 140
    local dropHeight = self.styles.dimensions.dropdownHeight or 44

    local frame = CreateFrame("Frame", nil, parent)
    frame:SetSize(dropWidth, dropHeight - 20)
    frame:SetPoint("TOPLEFT", actualX, yOffset - 4)

    local dropdown = CreateFrame("Button", nil, frame, "BackdropTemplate")
    dropdown:SetSize(dropWidth, 24)
    dropdown:SetPoint("TOPLEFT", 0, 0)
    dropdown:SetBackdrop({
        bgFile = self.styles.files.bgFile,
        edgeFile = self.styles.files.edgeFile,
        edgeSize = 8,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })

    if self.styles.colors.surfaceHighlight then dropdown:SetBackdropColor(unpack(self.styles.colors.surfaceHighlight)) end
    if self.styles.colors.blackDetail then dropdown:SetBackdropBorderColor(unpack(self.styles.colors.blackDetail)) end

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

    if getter then
        dropdownText:SetText(getLabel(getter()))
    end

    local arrow = dropdown:CreateTexture(nil, "OVERLAY")
    arrow:SetSize(20, 20)
    arrow:SetPoint("RIGHT", -5, 0)
    if self.styles.files.arrow then arrow:SetTexture(self.styles.files.arrow) end
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
    if self.styles.colors.surfaceDark then list:SetBackdropColor(unpack(self.styles.colors.surfaceDark)) end
    if self.styles.colors.surfaceHighlight then list:SetBackdropBorderColor(unpack(self.styles.colors.surfaceHighlight)) end

    dropdown:SetScript("OnClick", function()
        if not _G["AscensionSuitDropdownBlocker"] then
            local blocker = CreateFrame("Button", "AscensionSuitDropdownBlocker", _G.UIParent)
            blocker:SetAllPoints()
            blocker:SetFrameStrata("FULLSCREEN_DIALOG")
            blocker:SetFrameLevel(100)
            blocker:Hide()
            blocker:SetScript("OnClick", function() lib:closeAllDropdowns() end)
        end

        if list:IsShown() then
            lib:closeAllDropdowns()
        else
            lib:closeAllDropdowns()

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

    local localStyles = self.styles
    for i, opt in ipairs(options) do
        local btn = CreateFrame("Button", nil, btnContainer, "BackdropTemplate")
        btn:SetSize(dropWidth - 10, itemH)
        btn:SetPoint("TOPLEFT", 5, -5 - ((i - 1) * itemH))
        if localStyles.files.bgFile then btn:SetBackdrop({ bgFile = localStyles.files.bgFile }) end
        if localStyles.colors.surfaceDark then btn:SetBackdropColor(unpack(localStyles.colors.surfaceDark)) end

        local btnText = btn:CreateFontString(nil, "OVERLAY", localStyles.fonts.label)
        btnText:SetPoint("LEFT", 5, 0)
        btnText:SetText(opt.label)

        btn:SetScript("OnEnter", function(self)
            if localStyles.colors.surfaceHighlight then self:SetBackdropColor(unpack(localStyles.colors.surfaceHighlight)) end
        end)
        btn:SetScript("OnLeave", function(self)
            if localStyles.colors.surfaceDark then self:SetBackdropColor(unpack(localStyles.colors.surfaceDark)) end
        end)
        btn:SetScript("OnClick", function()
            if setter then setter(opt.value) end
            dropdownText:SetText(opt.label)
            lib:closeAllDropdowns()
        end)
    end

    if tooltip and lib.UX and lib.UX.attachTooltip then
        lib.UX:attachTooltip(dropdown, text, tooltip)
    end

    return frame, yOffset - 44
end
