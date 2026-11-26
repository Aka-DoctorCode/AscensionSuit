--------------------------------------------------------------------------------
-- Macro Maker - Visual Diff Viewer Module
-- Version: 3.4.0
-- Author: Satyros
--
-- Description:
--   Visual side-by-side / line-by-line diff comparison between:
--   1. Currently edited macro vs. original loaded state (revert / undo helper)
--   2. Currently edited macro vs. Library or Warband Vault templates
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

local function SplitLines(str)
    local lines = {}
    if not str or str == "" then return lines end
    for line in str:gmatch("([^\r\n]*)") do
        if line ~= "" or #lines == 0 then
            table.insert(lines, line)
        end
    end
    -- Remove trailing empty match produced by gmatch pattern if any
    if #lines > 1 and lines[#lines] == "" then
        table.remove(lines, #lines)
    end
    return lines
end

local function ComputeDiff(linesA, linesB)
    local n, m = #linesA, #linesB
    local dp = {}
    for i = 0, n do
        dp[i] = {}
        for j = 0, m do dp[i][j] = 0 end
    end
    for i = 1, n do
        for j = 1, m do
            if linesA[i] == linesB[j] then
                dp[i][j] = dp[i-1][j-1] + 1
            else
                dp[i][j] = math.max(dp[i-1][j], dp[i][j-1])
            end
        end
    end
    
    local diff = {}
    local i, j = n, m
    while i > 0 or j > 0 do
        if i > 0 and j > 0 and linesA[i] == linesB[j] then
            table.insert(diff, 1, { type = "same", text = linesA[i] })
            i = i - 1
            j = j - 1
        elseif j > 0 and (i == 0 or dp[i][j-1] >= dp[i-1][j]) then
            table.insert(diff, 1, { type = "add", text = linesB[j] })
            j = j - 1
        elseif i > 0 and (j == 0 or dp[i][j-1] < dp[i-1][j]) then
            table.insert(diff, 1, { type = "del", text = linesA[i] })
            i = i - 1
        end
    end
    return diff
end

function MM:CreateDiffViewerPanel()
    if MM.DiffPanel then return MM.DiffPanel end

    local f = CreateFrame("Frame", "MM_DiffViewerPanel", MM.InspectorPanel)
    f:SetPoint("TOPLEFT", MM.InspectorPanel, "TOPLEFT", 0, -56)
    f:SetPoint("BOTTOMRIGHT", MM.InspectorPanel, "BOTTOMRIGHT", 0, 0)
    f:Hide()

    f:HookScript("OnShow", function()
        MM:CloseInspectorPanels(f)
        if MM.UpdateInspectorTabHighlight then MM:UpdateInspectorTabHighlight("diff") end
        f:RefreshDiff()
    end)

    MM.DiffPanel = f

    -- Title
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 12, -8)
    title:SetText(L["Visual Diff Viewer"] or "Visual Diff Viewer")

    -- Comparison Baseline Dropdown
    local lblCompare = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblCompare:SetPoint("TOPLEFT", 12, -28)
    lblCompare:SetText(L["Compare Current With:"] or "Compare Current With:")

    local sourceDropdown = CreateFrame("DropdownButton", "MM_DiffSourceDropdown", f, "WowStyle1DropdownTemplate")
    sourceDropdown:SetPoint("TOPLEFT", 12, -46)
    sourceDropdown:SetWidth(230)

    local btnRefresh = CreateFrame("Button", nil, f, "BackdropTemplate")
    btnRefresh:SetPoint("TOPRIGHT", -12, -46)
    btnRefresh:SetSize(80, 22)
    btnRefresh:SetText(L["Refresh"] or "Refresh")
    btnRefresh:SetNormalFontObject("GameFontNormalSmall")
    btnRefresh:SetHighlightFontObject("GameFontHighlightSmall")
    MM:StyleButtonToModern(btnRefresh)
    btnRefresh:SetScript("OnClick", function() f:RefreshDiff() end)

    -- Diff Stats Summary String
    local lblStats = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblStats:SetPoint("TOPLEFT", 12, -76)
    lblStats:SetPoint("RIGHT", -12, 0)
    lblStats:SetJustifyH("LEFT")
    lblStats:SetText("|cff888888Diff: Ready|r")
    f.lblStats = lblStats

    -- Scrollable Diff View
    local scrollFrame = CreateFrame("ScrollFrame", "MM_DiffScrollFrame", f, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 10, -96)
    scrollFrame:SetPoint("BOTTOMRIGHT", -32, 42)

    local listContent = CreateFrame("Frame", nil, scrollFrame)
    listContent:SetWidth(294)
    listContent:SetHeight(300)
    scrollFrame:SetScrollChild(listContent)
    f.listContent = listContent
    f.diffRows = {}

    if MM.SkinScrollBar then MM:SkinScrollBar(scrollFrame) end

    -- Bottom Actions: Revert Baseline
    local btnRevert = CreateFrame("Button", nil, f, "BackdropTemplate")
    btnRevert:SetPoint("BOTTOMLEFT", 12, 10)
    btnRevert:SetSize(150, 24)
    btnRevert:SetText(L["Revert to Baseline"] or "Revert to Baseline")
    btnRevert:SetNormalFontObject("GameFontNormalSmall")
    btnRevert:SetHighlightFontObject("GameFontHighlightSmall")
    MM:StyleButtonToModern(btnRevert)

    local btnCopy = CreateFrame("Button", nil, f, "BackdropTemplate")
    btnCopy:SetPoint("BOTTOMRIGHT", -12, 10)
    btnCopy:SetSize(150, 24)
    btnCopy:SetText(L["Save Diff Snapshot"] or "Save Diff Snapshot")
    btnCopy:SetNormalFontObject("GameFontNormalSmall")
    btnCopy:SetHighlightFontObject("GameFontHighlightSmall")
    MM:StyleButtonToModern(btnCopy)

    -- Baseline Data storage
    local currentBaseline = "original"
    local baselineCustomText = ""

    local function GetBaselineText()
        if currentBaseline == "original" then
            return MM.originalMacroBody or ""
        elseif currentBaseline:find("^lib:") then
            local idx = tonumber(currentBaseline:sub(5))
            if idx and MM.db and MM.db.library and MM.db.library[idx] then
                return MM.db.library[idx].body or ""
            end
        elseif currentBaseline:find("^warband:") then
            local idx = tonumber(currentBaseline:sub(9))
            if idx and MacroMaker_GlobalDB and MacroMaker_GlobalDB.warbandMacros and MacroMaker_GlobalDB.warbandMacros[idx] then
                return MacroMaker_GlobalDB.warbandMacros[idx].body or ""
            end
        elseif currentBaseline == "custom" then
            return baselineCustomText
        end
        return MM.originalMacroBody or ""
    end

    -- Setup Dropdown
    sourceDropdown:SetupMenu(function(dropdown, rootDescription)
        rootDescription:SetTag("MM_DIFF_SOURCE")
        rootDescription:CreateRadio(L["Original (Loaded Version)"] or "Original (Loaded Version)", function() return currentBaseline == "original" end, function()
            currentBaseline = "original"
            sourceDropdown:SetText(L["Original (Loaded Version)"] or "Original (Loaded Version)")
            f:RefreshDiff()
        end)

        -- Library Submenu
        local libSubmenu = rootDescription:CreateButton(L["From Library..."] or "From Library...")
        if MM.db and MM.db.library and #MM.db.library > 0 then
            for idx, m in ipairs(MM.db.library) do
                libSubmenu:CreateButton(m.name or ("Macro " .. idx), function()
                    currentBaseline = "lib:" .. idx
                    sourceDropdown:SetText(m.name)
                    f:RefreshDiff()
                end)
            end
        else
            libSubmenu:CreateTitle(L["(Library Empty)"] or "(Library Empty)")
        end

        -- Warband Submenu
        local warSubmenu = rootDescription:CreateButton(L["From Warband Vault..."] or "From Warband Vault...")
        if MacroMaker_GlobalDB and MacroMaker_GlobalDB.warbandMacros and #MacroMaker_GlobalDB.warbandMacros > 0 then
            for idx, m in ipairs(MacroMaker_GlobalDB.warbandMacros) do
                warSubmenu:CreateButton(m.name or ("Warband " .. idx), function()
                    currentBaseline = "warband:" .. idx
                    sourceDropdown:SetText(m.name)
                    f:RefreshDiff()
                end)
            end
        else
            warSubmenu:CreateTitle(L["(Warband Vault Empty)"] or "(Warband Vault Empty)")
        end
    end)
    sourceDropdown:SetText(L["Original (Loaded Version)"] or "Original (Loaded Version)")

    -- Render Diff Rows
    function f:RefreshDiff()
        local baseText = GetBaselineText()
        local currentText = (MM.outputBox and MM.outputBox:GetText()) or ""

        local linesA = SplitLines(baseText)
        local linesB = SplitLines(currentText)

        local diff = ComputeDiff(linesA, linesB)

        -- Hide old rows
        for _, r in pairs(f.diffRows) do r:Hide() end

        local yOffset = 0
        local adds = 0
        local dels = 0

        for idx, item in ipairs(diff) do
            local row = f.diffRows[idx]
            if not row then
                row = CreateFrame("Frame", nil, listContent, "BackdropTemplate")
                row:SetSize(286, 20)
                row:SetBackdrop({
                    bgFile = "Interface\\Buttons\\WHITE8x8",
                    edgeFile = nil,
                    tile = false,
                    insets = { left = 0, right = 0, top = 0, bottom = 0 }
                })

                local prefix = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
                prefix:SetPoint("LEFT", 4, 0)
                prefix:SetWidth(16)
                row.prefix = prefix

                local text = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
                text:SetPoint("LEFT", prefix, "RIGHT", 2, 0)
                text:SetPoint("RIGHT", -4, 0)
                text:SetJustifyH("LEFT")
                text:SetWordWrap(false)
                row.text = text

                f.diffRows[idx] = row
            end

            row:SetPoint("TOPLEFT", 2, -yOffset)

            if item.type == "add" then
                adds = adds + 1
                row:SetBackdropColor(0, 0.4, 0, 0.3)
                row.prefix:SetText("+")
                row.prefix:SetTextColor(0.2, 1.0, 0.2)
                row.text:SetText(item.text)
                row.text:SetTextColor(0.4, 1.0, 0.4)
            elseif item.type == "del" then
                dels = dels + 1
                row:SetBackdropColor(0.4, 0, 0, 0.3)
                row.prefix:SetText("-")
                row.prefix:SetTextColor(1.0, 0.3, 0.3)
                row.text:SetText(item.text)
                row.text:SetTextColor(1.0, 0.5, 0.5)
            else
                row:SetBackdropColor(0, 0, 0, 0)
                row.prefix:SetText(" ")
                row.prefix:SetTextColor(0.5, 0.5, 0.5)
                row.text:SetText(item.text)
                row.text:SetTextColor(0.85, 0.85, 0.85)
            end

            row:Show()
            yOffset = yOffset + 22
        end

        listContent:SetHeight(yOffset > 0 and yOffset or 1)

        if adds == 0 and dels == 0 then
            lblStats:SetText("|cff00ff00" .. (L["Identical: No differences detected."] or "Identical: No differences detected.") .. "|r")
        else
            lblStats:SetText(string.format("|cff00ff00+%d additions|r, |cffff4444-%d deletions|r", adds, dels))
        end
    end

    -- Revert Baseline Handler
    btnRevert:SetScript("OnClick", function()
        local baseText = GetBaselineText()
        if MM.outputBox then
            MM.outputBox:SetText(baseText)
        end
        if MM.ParseMacroToBuilder then
            MM:ParseMacroToBuilder(baseText)
        end
        if MM.ShowStatus then MM:ShowStatus(L["Reverted macro to baseline"] or "Reverted macro to baseline", false) end
        if MM.PlaySoundCue then MM:PlaySoundCue("copy") end
        f:RefreshDiff()
    end)

    -- Save Snapshot Handler (snapshots current as baseline)
    btnCopy:SetScript("OnClick", function()
        MM.originalMacroBody = (MM.outputBox and MM.outputBox:GetText()) or ""
        currentBaseline = "original"
        sourceDropdown:SetText(L["Original (Loaded Version)"] or "Original (Loaded Version)")
        f:RefreshDiff()
        if MM.ShowStatus then MM:ShowStatus(L["Diff baseline updated to current"] or "Diff baseline updated to current", false) end
        if MM.PlaySoundCue then MM:PlaySoundCue("save") end
    end)

    return f
end
