--------------------------------------------------------------------------------
-- Macro Maker - Announce & Whisper Studio Module
-- Version: 3.4.0
-- Author: Satyros
--
-- Description:
--   Interactive Studio for generating chat announcements, target whispers,
--   combat alerts, raid markers, and emotes with 1-click macro insertion.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

function MM:CreateAnnouncePanel()
    if MM.AnnouncePanel then return MM.AnnouncePanel end

    local f = CreateFrame("Frame", "MM_AnnouncePanel", MM.InspectorPanel)
    f:SetPoint("TOPLEFT", MM.InspectorPanel, "TOPLEFT", 0, -56)
    f:SetPoint("BOTTOMRIGHT", MM.InspectorPanel, "BOTTOMRIGHT", 0, 0)
    f:Hide()

    f:HookScript("OnShow", function()
        MM:CloseInspectorPanels(f)
        if MM.UpdateInspectorTabHighlight then MM:UpdateInspectorTabHighlight("announce") end
    end)

    MM.AnnouncePanel = f

    -- Title
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 12, -8)
    title:SetText(L["Announce & Whisper Studio"] or "Announce & Whisper Studio")

    local subtitle = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    subtitle:SetPoint("TOPLEFT", 12, -26)
    subtitle:SetPoint("RIGHT", -12, 0)
    subtitle:SetJustifyH("LEFT")
    subtitle:SetText("|cff888888" .. (L["Create chat calls, whispers, and raid alerts."] or "Create chat calls, whispers, and raid alerts.") .. "|r")

    -- Presets Dropdown
    local lblPreset = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblPreset:SetPoint("TOPLEFT", 12, -48)
    lblPreset:SetText(L["Quick Presets:"] or "Quick Presets:")

    local presetDropdown = CreateFrame("DropdownButton", "MM_AnnouncePresetDropdown", f, "WowStyle1DropdownTemplate")
    presetDropdown:SetPoint("TOPLEFT", 12, -66)
    presetDropdown:SetWidth(316)

    -- Channel Dropdown
    local lblChannel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblChannel:SetPoint("TOPLEFT", 12, -100)
    lblChannel:SetText(L["Channel:"] or "Channel:")

    local channelDropdown = CreateFrame("DropdownButton", "MM_AnnounceChannelDropdown", f, "WowStyle1DropdownTemplate")
    channelDropdown:SetPoint("TOPLEFT", 12, -118)
    channelDropdown:SetWidth(150)

    -- Whisper Target Input
    local lblWhisper = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblWhisper:SetPoint("TOPLEFT", 172, -100)
    lblWhisper:SetText(L["Whisper Target:"] or "Whisper Target:")

    local targetInput = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
    targetInput:SetPoint("TOPLEFT", 176, -118)
    targetInput:SetSize(152, 24)
    targetInput:SetAutoFocus(false)
    targetInput:SetText("%t")

    -- Message Input
    local lblMsg = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblMsg:SetPoint("TOPLEFT", 12, -150)
    lblMsg:SetText(L["Message Text:"] or "Message Text:")

    local msgInput = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
    msgInput:SetPoint("TOPLEFT", 16, -168)
    msgInput:SetSize(308, 26)
    msgInput:SetAutoFocus(false)
    msgInput:SetText("Interrupted %t with %s!")

    -- Interactive Placeholders / Chips
    local lblChips = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblChips:SetPoint("TOPLEFT", 12, -200)
    lblChips:SetText(L["Click to Insert Tags:"] or "Click to Insert Tags:")

    local function InsertTag(tag)
        local cur = msgInput:GetText() or ""
        msgInput:SetText(cur .. " " .. tag)
        msgInput:SetCursorPosition(string.len(msgInput:GetText()))
        msgInput:SetFocus()
        if f.UpdatePreview then f:UpdatePreview() end
    end

    local chips = {
        { label = "%t (Target)", tag = "%t" },
        { label = "%s (Spell)", tag = "%s" },
        { label = "%f (Focus)", tag = "%f" },
    }

    local startX = 12
    for _, c in ipairs(chips) do
        local btn = CreateFrame("Button", nil, f, "BackdropTemplate")
        btn:SetPoint("TOPLEFT", startX, -218)
        btn:SetSize(96, 20)
        btn:SetText(c.label)
        btn:SetNormalFontObject("GameFontHighlightSmall")
        MM:StyleButtonToModern(btn)
        btn:SetScript("OnClick", function() InsertTag(c.tag) end)
        startX = startX + 102
    end

    -- Raid Marker Chips
    local lblMarkers = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblMarkers:SetPoint("TOPLEFT", 12, -244)
    lblMarkers:SetText(L["Raid Markers:"] or "Raid Markers:")

    local markers = {
        { tag = "{rt1}", icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_1", name = "Star" },
        { tag = "{rt2}", icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_2", name = "Circle" },
        { tag = "{rt3}", icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_3", name = "Diamond" },
        { tag = "{rt4}", icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_4", name = "Triangle" },
        { tag = "{rt5}", icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_5", name = "Moon" },
        { tag = "{rt6}", icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_6", name = "Square" },
        { tag = "{rt7}", icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_7", name = "Cross" },
        { tag = "{rt8}", icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_8", name = "Skull" },
    }

    local mX = 12
    for _, m in ipairs(markers) do
        local mBtn = CreateFrame("Button", nil, f)
        mBtn:SetPoint("TOPLEFT", mX, -262)
        mBtn:SetSize(22, 22)
        local tex = mBtn:CreateTexture(nil, "ARTWORK")
        tex:SetAllPoints()
        tex:SetTexture(m.icon)
        mBtn:SetScript("OnClick", function() InsertTag(m.tag) end)
        mBtn:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_TOP")
            GameTooltip:SetText(m.name .. " (" .. m.tag .. ")", 1, 0.82, 0)
            GameTooltip:Show()
        end)
        mBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
        mX = mX + 38
    end

    -- Condition Options
    local chkGroupOnly = CreateFrame("CheckButton", nil, f, "UICheckButtonTemplate")
    chkGroupOnly:SetPoint("TOPLEFT", 10, -290)
    chkGroupOnly:SetSize(24, 24)
    chkGroupOnly.text = chkGroupOnly:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    chkGroupOnly.text:SetPoint("LEFT", chkGroupOnly, "RIGHT", 4, 0)
    chkGroupOnly.text:SetText(L["Only in Group (skip when solo)"] or "Only in Group (skip when solo)")

    local chkCombatOnly = CreateFrame("CheckButton", nil, f, "UICheckButtonTemplate")
    chkCombatOnly:SetPoint("TOPLEFT", 10, -316)
    chkCombatOnly:SetSize(24, 24)
    chkCombatOnly.text = chkCombatOnly:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    chkCombatOnly.text:SetPoint("LEFT", chkCombatOnly, "RIGHT", 4, 0)
    chkCombatOnly.text:SetText(L["Only in Combat"] or "Only in Combat")

    -- Preview Box
    local lblPreview = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    lblPreview:SetPoint("TOPLEFT", 12, -346)
    lblPreview:SetText(L["Generated Macro Line:"] or "Generated Macro Line:")

    local previewBox = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
    previewBox:SetPoint("TOPLEFT", 16, -364)
    previewBox:SetSize(308, 28)
    previewBox:SetAutoFocus(false)

    -- Action Buttons: Insert and Test
    local btnInsert = CreateFrame("Button", nil, f, "BackdropTemplate")
    btnInsert:SetPoint("TOPLEFT", 12, -402)
    btnInsert:SetSize(150, 26)
    btnInsert:SetText(L["Insert into Macro"] or "Insert into Macro")
    btnInsert:SetNormalFontObject("GameFontNormal")
    btnInsert:SetHighlightFontObject("GameFontHighlight")
    MM:StyleButtonToModern(btnInsert)

    local btnTest = CreateFrame("Button", nil, f, "BackdropTemplate")
    btnTest:SetPoint("TOPRIGHT", -12, -402)
    btnTest:SetSize(150, 26)
    btnTest:SetText(L["Test Preview (Local)"] or "Test Preview (Local)")
    btnTest:SetNormalFontObject("GameFontNormalSmall")
    btnTest:SetHighlightFontObject("GameFontHighlightSmall")
    MM:StyleButtonToModern(btnTest)

    -- State & Generator Logic
    local selectedChannel = "party"
    local channelList = {
        { id = "say", label = "/say (" .. (L["Say"] or "Say") .. ")" },
        { id = "yell", label = "/yell (" .. (L["Yell"] or "Yell") .. ")" },
        { id = "party", label = "/party (" .. (L["Party"] or "Party") .. ")" },
        { id = "raid", label = "/raid (" .. (L["Raid"] or "Raid") .. ")" },
        { id = "instance", label = "/instance (" .. (L["Instance"] or "Instance") .. ")" },
        { id = "whisper", label = "/whisper (" .. (L["Whisper"] or "Whisper") .. ")" },
        { id = "emote", label = "/emote (" .. (L["Emote"] or "Emote") .. ")" },
    }

    local function GenerateLine()
        local msg = msgInput:GetText() or ""
        local chan = selectedChannel
        local target = targetInput:GetText() or "%t"
        local isGroup = chkGroupOnly:GetChecked()
        local isCombat = chkCombatOnly:GetChecked()

        if chan == "whisper" then
            if target == "" then target = "%t" end
            if isGroup then
                return string.format("/run if IsInGroup() then SendChatMessage(\"%s\", \"WHISPER\", nil, UnitName(\"target\")) end", msg:gsub('"', '\\"'))
            else
                return "/whisper " .. target .. " " .. msg
            end
        elseif chan == "emote" then
            return "/e " .. msg
        else
            local slashCmd = "/" .. chan
            if isGroup then
                local chatType = chan:upper()
                if chatType == "INSTANCE" then chatType = "INSTANCE_CHAT" end
                return string.format("/run if IsInGroup() then SendChatMessage(\"%s\", \"%s\") end", msg:gsub('"', '\\"'), chatType)
            elseif isCombat then
                local chatType = chan:upper()
                if chatType == "INSTANCE" then chatType = "INSTANCE_CHAT" end
                return string.format("/run if UnitAffectingCombat(\"player\") then SendChatMessage(\"%s\", \"%s\") end", msg:gsub('"', '\\"'), chatType)
            else
                return slashCmd .. " " .. msg
            end
        end
    end

    function f:UpdatePreview()
        local line = GenerateLine()
        previewBox:SetText(line)
        targetInput:SetEnabled(selectedChannel == "whisper")
        if selectedChannel == "whisper" then
            lblWhisper:SetTextColor(1, 1, 1)
        else
            lblWhisper:SetTextColor(0.5, 0.5, 0.5)
        end
    end

    -- Hook changes
    msgInput:SetScript("OnTextChanged", function() f:UpdatePreview() end)
    targetInput:SetScript("OnTextChanged", function() f:UpdatePreview() end)
    chkGroupOnly:SetScript("OnClick", function() f:UpdatePreview() end)
    chkCombatOnly:SetScript("OnClick", function() f:UpdatePreview() end)

    -- Setup Channel Dropdown
    channelDropdown:SetupMenu(function(dropdown, rootDescription)
        rootDescription:SetTag("MM_ANNOUNCE_CHANNEL")
        for _, c in ipairs(channelList) do
            rootDescription:CreateRadio(c.label, function() return selectedChannel == c.id end, function()
                selectedChannel = c.id
                channelDropdown:SetText(c.label)
                f:UpdatePreview()
            end)
        end
    end)
    channelDropdown:SetText(channelList[3].label) -- Default /party

    -- Setup Presets Dropdown
    local presets = {
        { name = L["Interrupt Alert"] or "Interrupt Alert", chan = "party", msg = "Interrupted %t with %s!", group = true },
        { name = L["Combat Resurrect"] or "Combat Resurrect", chan = "raid", msg = "Combat Resurrecting %t! {rt1}", group = true },
        { name = L["Defensive Whisper"] or "Defensive Whisper", chan = "whisper", msg = "Cast %s on you! Stay alive!", group = false },
        { name = L["Taunt Alert"] or "Taunt Alert", chan = "say", msg = "Taunted %t! {rt8}", group = false },
        { name = L["Crowd Control (CC)"] or "Crowd Control (CC)", chan = "party", msg = "CC (%s) on %t - {rt8} DO NOT BREAK!", group = true },
        { name = L["Healthstone / Potion"] or "Healthstone / Potion", chan = "say", msg = "Used Healthstone! [HP Low]", group = false },
        { name = L["Pull Countdown (5s)"] or "Pull Countdown (5s)", chan = "party", msg = "Pulling %t in 5 seconds!", group = true },
    }

    presetDropdown:SetupMenu(function(dropdown, rootDescription)
        rootDescription:SetTag("MM_ANNOUNCE_PRESETS")
        for _, p in ipairs(presets) do
            rootDescription:CreateButton(p.name, function()
                selectedChannel = p.chan
                for _, c in ipairs(channelList) do
                    if c.id == p.chan then channelDropdown:SetText(c.label) break end
                end
                msgInput:SetText(p.msg)
                chkGroupOnly:SetChecked(p.group)
                f:UpdatePreview()
            end)
        end
    end)
    presetDropdown:SetText(L["Select a preset..."] or "Select a preset...")

    -- Insert Handler
    btnInsert:SetScript("OnClick", function()
        local line = GenerateLine()
        if not line or line == "" then return end

        local currentCode = (MM.outputBox and MM.outputBox:GetText()) or ""
        if currentCode == "" then
            MM.outputBox:SetText(line)
        else
            if currentCode:sub(-1) == "\n" then
                MM.outputBox:SetText(currentCode .. line)
            else
                MM.outputBox:SetText(currentCode .. "\n" .. line)
            end
        end

        if MM.ShowStatus then MM:ShowStatus(L["Announcement added to macro"] or "Announcement added to macro", false) end
        if MM.PlaySoundCue then MM:PlaySoundCue("save") end
        if MM.UpdateCharCount then MM:UpdateCharCount(#MM.outputBox:GetText()) end
        if MM.UpdateLivePreview then MM:UpdateLivePreview() end
    end)

    -- Test Preview Handler
    btnTest:SetScript("OnClick", function()
        local msg = msgInput:GetText() or ""
        local targetName = UnitName("target") or (L["Target"] or "Target")
        local spellName = (MM.nameInput and MM.nameInput:GetText()) or (L["Spell"] or "Spell")
        local focusName = UnitName("focus") or (L["Focus"] or "Focus")

        local simulated = msg:gsub("%%t", targetName):gsub("%%s", spellName):gsub("%%f", focusName)
        print("|cffffd100[Macro Maker Preview]:|r |cffffffff" .. simulated .. "|r")
    end)

    f:UpdatePreview()
    return f
end
