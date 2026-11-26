--[[--------------------------------------------------------------------------
    WoW Task Manager - UI/Widgets/ScrollList.lua

    Virtualised list.  Only the rows actually on screen exist as frames, and
    they are recycled as you scroll - with 150 installed addons a naive list
    would create 150 row frames with a dozen font strings each, which is
    exactly the kind of thing this addon is supposed to catch in others.

    The caller supplies:
        createRow(parent)        -> row frame
        updateRow(row, data, i)  -> fill it in
    and then sets :SetData(array).
----------------------------------------------------------------------------]]

local ADDON_NAME, WTM = ...

local UI    = WTM.UI
local Theme = UI.Theme
local T     = Theme.Get
local M     = Theme.metrics

function UI.ScrollList(parent, rowHeight, createRow, updateRow, onRowClick)
    local list = CreateFrame("Frame", nil, parent)
    list.rowHeight = rowHeight or M.rowHeight
    list.rows = {}
    list.data = {}
    list.offset = 0

    local viewport = CreateFrame("Frame", nil, list)
    viewport:SetPoint("TOPLEFT")
    viewport:SetPoint("BOTTOMRIGHT", -UI.GetScrollbarGutter(), 0)
    viewport:SetClipsChildren(true)
    list.viewport = viewport

    ------------------------------------------------------------------
    -- Scrollbar
    ------------------------------------------------------------------
    -- The shared scrollbar (UI/Widgets/Scrollbar.lua): width is a setting, it
    -- drags, it pages on a track click, and it is the same everywhere.
    local bar = UI.CreateScrollbar(list, function(offset) list:SetOffset(offset) end)
    bar:SetPoint("TOPRIGHT")
    bar:SetPoint("BOTTOMRIGHT")
    local thumb = bar.thumb
    list.scrollbar, list.thumb = bar, thumb

    UI.OnScrollbarWidthChanged(function()
        viewport:SetPoint("BOTTOMRIGHT", -UI.GetScrollbarGutter(), 0)
        list:Refresh()
    end)

    ------------------------------------------------------------------
    -- Row pool
    ------------------------------------------------------------------

    local function AcquireRow(index)
        local row = list.rows[index]
        if row then return row end
        row = createRow(viewport)
        row:SetHeight(list.rowHeight)
        row:SetPoint("LEFT", viewport, "LEFT", 0, 0)
        row:SetPoint("RIGHT", viewport, "RIGHT", 0, 0)

        row.zebra = row:CreateTexture(nil, "BACKGROUND")
        row.zebra:SetAllPoints()
        row.zebra:SetColorTexture(T("panelAlt", 0))

        row.highlight = row:CreateTexture(nil, "BACKGROUND", nil, 1)
        row.highlight:SetAllPoints()
        row.highlight:SetColorTexture(T("hover"))
        row.highlight:Hide()

        row:EnableMouse(true)
        row:SetScript("OnEnter", function(self)
            self.highlight:Show()
            if list.onRowEnter and self.data then list.onRowEnter(self, self.data) end
        end)
        row:SetScript("OnLeave", function(self)
            self.highlight:Hide()
            UI.HideTooltip()
            if list.onRowLeave then list.onRowLeave(self) end
        end)
        if onRowClick then
            row:SetScript("OnMouseUp", function(self, button)
                if self.data then onRowClick(self.data, button, self) end
            end)
        end

        list.rows[index] = row
        return row
    end

    ------------------------------------------------------------------
    -- Layout
    ------------------------------------------------------------------

    function list:Refresh()
        local height = viewport:GetHeight()
        if not height or height <= 0 then return end

        local total = #self.data
        local totalHeight = total * self.rowHeight
        local maxOffset = math.max(0, totalHeight - height)
        if self.offset > maxOffset then self.offset = maxOffset end
        if self.offset < 0 then self.offset = 0 end

        local firstIndex = math.floor(self.offset / self.rowHeight) + 1
        local visibleCount = math.ceil(height / self.rowHeight) + 1
        local pixelOffset = self.offset - (firstIndex - 1) * self.rowHeight

        for slot = 1, visibleCount do
            local dataIndex = firstIndex + slot - 1
            local entry = self.data[dataIndex]
            if entry then
                local row = AcquireRow(slot)
                row:SetPoint("TOPLEFT", viewport, "TOPLEFT", 0,
                    -((slot - 1) * self.rowHeight - pixelOffset))
                row.data = entry
                row.dataIndex = dataIndex
                row.zebra:SetColorTexture(T("panelAlt", (dataIndex % 2 == 0) and 0.35 or 0))
                row:Show()
                updateRow(row, entry, dataIndex)
            elseif self.rows[slot] then
                self.rows[slot]:Hide()
                self.rows[slot].data = nil
            end
        end
        for slot = visibleCount + 1, #self.rows do
            self.rows[slot]:Hide()
            self.rows[slot].data = nil
        end

        -- Scrollbar geometry
        bar:Update(height, totalHeight, self.offset)
    end

    function list:SetOffset(offset)
        self.offset = offset
        self:Refresh()
    end

    function list:SetData(data)
        self.data = data or {}
        self:Refresh()
    end

    function list:ScrollToTop() self:SetOffset(0) end

    list:EnableMouseWheel(true)
    list:SetScript("OnMouseWheel", function(self, delta)
        self:SetOffset(self.offset - delta * self.rowHeight * 3)
    end)
    list:SetScript("OnSizeChanged", function(self) self:Refresh() end)

    return list
end
