--------------------------------------------------------------------------------
-- Macro Maker - Health Check & Cleaner Module
-- Version: 3.3.0
-- Author: Satyros
--
-- Description:
--   Comprehensive Health Audit for all player macros:
--   1. Detects dead / removed / misspelled spells
--   2. Identifies duplicate macros
--   3. Finds unused macros (not on any action bar)
--   4. Detects optimization candidates to save characters
--   5. Provides 1-click archiving to Library to free up Blizzard slots
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

function MM:CreateHealthCheckPanel()
    local f = CreateFrame("Frame", "MM_HealthCheckPanel", MM.InspectorPanel)
    f:SetPoint("TOPLEFT", MM.InspectorPanel, "TOPLEFT", 0, -56)
    f:SetPoint("BOTTOMRIGHT", MM.InspectorPanel, "BOTTOMRIGHT", 0, 0)
    f:Hide()
    
    f:HookScript("OnShow", function()
        MM:CloseInspectorPanels(f)
        if MM.UpdateInspectorTabHighlight then MM:UpdateInspectorTabHighlight("health") end
        if not f.hasScanned then
            MM:RunMacroHealthAudit()
        end
    end)
    
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 12, -8)
    title:SetText(L["Macro Health Check & Cleaner"] or "Macro Health Check & Cleaner")
    
    -- Scan / Refresh Button
    local btnScan = CreateFrame("Button", nil, f, "BackdropTemplate")
    btnScan:SetPoint("TOPRIGHT", -12, -6)
    btnScan:SetSize(72, 22)
    btnScan:SetText(L["Scan"] or "Scan")
    btnScan:SetNormalFontObject("GameFontNormalSmall")
    btnScan:SetHighlightFontObject("GameFontHighlightSmall")
    MM:StyleButtonToModern(btnScan)
    btnScan:SetScript("OnClick", function()
        MM:RunMacroHealthAudit()
    end)
    btnScan:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Scan All Macros"] or "Scan All Macros", 1, 0.82, 0)
        GameTooltip:AddLine(L["Scans all Account and Character macros for dead spells, duplicates, and unused slots."] or "Scans all Account and Character macros for dead spells, duplicates, and unused slots.", 1, 1, 1, true)
        GameTooltip:Show()
    end)
    btnScan:SetScript("OnLeave", function() GameTooltip:Hide() end)
    
    -- Status summary string
    local lblSummary = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lblSummary:SetPoint("TOPLEFT", 12, -32)
    lblSummary:SetPoint("RIGHT", -12, 0)
    lblSummary:SetJustifyH("LEFT")
    lblSummary:SetText("|cff888888Click 'Scan' to analyze all Account and Character macros.|r")
    f.lblSummary = lblSummary
    
    -- Scrollable Results List
    local scrollFrame = CreateFrame("ScrollFrame", "MM_HealthScrollFrame", f, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 10, -52)
    scrollFrame:SetPoint("BOTTOMRIGHT", -32, 12)
    
    local listContent = CreateFrame("Frame", nil, scrollFrame)
    listContent:SetWidth(294)
    listContent:SetHeight(400)
    scrollFrame:SetScrollChild(listContent)
    f.listContent = listContent
    MM:SkinScrollBar(scrollFrame)
    
    MM.HealthPanel = f
end

--- Runs a full audit over all Account (1-120) and Character (121-150) macros.
function MM:RunMacroHealthAudit()
    local f = MM.HealthPanel
    if not f then return end
    f.hasScanned = true
    
    local global, perChar = GetNumMacros()
    local issues = {}
    local seenBodies = {}
    
    -- Pre-calculate action bar cache once for O(1) lookups during health audit
    local barCache = MM.BuildActionBarCache and MM:BuildActionBarCache() or nil
    
    local function AuditMacro(id, scope)
        local name, icon, body = GetMacroInfo(id)
        if not name or not body or body == "" then return end
        
        local trimmedBody = strtrim(body)
        
        -- 1. Check for Duplicates
        if seenBodies[trimmedBody] then
            table.insert(issues, {
                type = "duplicate",
                id = id,
                name = name,
                scope = scope,
                title = L["Duplicate Macros (1)"] or "Duplicate Macro",
                desc = string.format("Exact copy of '%s'", seenBodies[trimmedBody]),
                body = body,
            })
        else
            seenBodies[trimmedBody] = name
        end
        
        -- 2. Check for Dead / Unknown Spells
        if MM.Validator then
            for line in body:gmatch("[^\r\n]+") do
                local clean = line:match("^%s*(.-)%s*$")
                if clean and (clean:find("^/cast%s+") or clean:find("^/use%s+")) then
                    local spellCandidate = clean:match("^/%w+%s+(.+)")
                    if spellCandidate then
                        local rawName = spellCandidate:gsub("%[.-%]", ""):match("^%s*(.-)%s*$")
                        for subSpell in rawName:gmatch("[^;]+") do
                            subSpell = subSpell:match("^%s*(.-)%s*$")
                            if subSpell and subSpell ~= "" and not tonumber(subSpell) then
                                if not subSpell:find("^item:") and not subSpell:find("^macro:") and subSpell ~= "13" and subSpell ~= "14" and subSpell ~= "6" then
                                    local exists = MM.Validator:ValidateSpellName(subSpell)
                                    if not exists then
                                        table.insert(issues, {
                                            type = "dead_spell",
                                            id = id,
                                            name = name,
                                            scope = scope,
                                            title = L["Dead / Unknown Spells (1)"] or "Dead Spell",
                                            desc = string.format("Unknown spell '%s'", subSpell),
                                            body = body,
                                        })
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        
        -- 3. Check for Unused Macros (Not on any active action bar)
        if MM.GetMacroActionBarUsage then
            local usage = MM:GetMacroActionBarUsage(name, id, barCache)
            if usage.count == 0 then
                table.insert(issues, {
                    type = "unused",
                    id = id,
                    name = name,
                    scope = scope,
                    title = L["Unused Macros (1)"] or "Unused Macro",
                    desc = L["Not on any Action Bar"] or "Not on any Action Bar",
                    body = body,
                })
            end
        end
        
        -- 4. Check for Optimization Potential (> 15 chars savings)
        if MM.Optimizer then
            local origLen, optLen, savedChars = MM.Optimizer:GetSavings(body)
            if savedChars >= 15 then
                table.insert(issues, {
                    type = "optimize",
                    id = id,
                    name = name,
                    scope = scope,
                    title = L["Optimization Candidates (1)"] or "Can Optimize",
                    desc = string.format("Can save %d characters", savedChars),
                    body = body,
                })
            end
        end
    end
    
    -- Scan Account macros (1 to global)
    for i = 1, global do
        AuditMacro(i, "Account")
    end
    
    -- Scan Character macros (121 to 120 + perChar)
    for i = 121, 120 + perChar do
        AuditMacro(i, "Character")
    end
    
    -- Update UI
    if f.lblSummary then
        if #issues == 0 then
            f.lblSummary:SetText("|cff00ff00" .. (L["No issues found! All macros are healthy."] or "No issues found! All macros are healthy.") .. "|r")
        else
            f.lblSummary:SetText(string.format("|cffffcc00" .. (L["Audit Complete: %d issues found."] or "Audit Complete: %d issues found.") .. "|r", #issues))
        end
    end
    
    -- Render items
    local list = f.listContent
    if not list.cards then list.cards = {} end
    for _, card in ipairs(list.cards) do card:Hide() end
    
    local yOffset = 0
    local cardWidth = 286
    for idx, issue in ipairs(issues) do
        local card = list.cards[idx]
        if not card then
            card = CreateFrame("Frame", nil, list, "BackdropTemplate")
            card:SetSize(cardWidth, 48)
            card:SetBackdrop({
                bgFile = "Interface\\Buttons\\WHITE8x8",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                tile = false, tileSize = 16, edgeSize = 8,
                insets = { left = 2, right = 2, top = 2, bottom = 2 }
            })
            card:SetBackdropColor(0.06, 0.06, 0.08, 0.92)
            card:SetBackdropBorderColor(0.20, 0.20, 0.24, 0.85)
            
            local iconTex = card:CreateTexture(nil, "ARTWORK")
            iconTex:SetSize(30, 30)
            iconTex:SetPoint("LEFT", 6, 0)
            card.iconTex = iconTex
            
            -- Action Button (Load, Archive, Optimize)
            local btnAct = CreateFrame("Button", nil, card, "BackdropTemplate")
            btnAct:SetSize(68, 22)
            btnAct:SetPoint("RIGHT", -6, 0)
            btnAct:SetNormalFontObject("GameFontNormalSmall")
            btnAct:SetHighlightFontObject("GameFontHighlightSmall")
            MM:StyleButtonToModern(btnAct)
            card.btnAct = btnAct
            
            -- Top Line: Macro Name + Scope (Bounded cleanly before btnAct)
            local txtTitle = card:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            txtTitle:SetPoint("TOPLEFT", iconTex, "TOPRIGHT", 6, -3)
            txtTitle:SetPoint("RIGHT", btnAct, "LEFT", -6, 0)
            txtTitle:SetJustifyH("LEFT")
            txtTitle:SetWordWrap(false)
            card.txtTitle = txtTitle
            
            -- Bottom Line: Issue Badge + Description (Bounded cleanly before btnAct)
            local txtDesc = card:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
            txtDesc:SetPoint("BOTTOMLEFT", iconTex, "BOTTOMRIGHT", 6, 3)
            txtDesc:SetPoint("RIGHT", btnAct, "LEFT", -6, 0)
            txtDesc:SetJustifyH("LEFT")
            txtDesc:SetWordWrap(false)
            card.txtDesc = txtDesc
            
            -- Card Hover Tooltip & Visuals
            card:EnableMouse(true)
            card:HookScript("OnEnter", function(self)
                self:SetBackdropBorderColor(0.85, 0.65, 0.2, 1)
                self:SetBackdropColor(0.12, 0.13, 0.17, 0.95)
                if self.issueData then
                    local d = self.issueData
                    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                    GameTooltip:SetText(d.name or "Macro", 1, 0.82, 0)
                    GameTooltip:AddLine(d.typeColor .. d.typeBadge .. "|r " .. d.desc, 1, 1, 1, true)
                    GameTooltip:AddLine(string.format(L["Scope: %s"] or "Scope: %s", d.scope), 0.7, 0.7, 0.7)
                    if d.body and d.body ~= "" then
                        GameTooltip:AddLine(" ", 1, 1, 1)
                        GameTooltip:AddLine(d.body:sub(1, 160), 0.5, 0.8, 1, false)
                    end
                    GameTooltip:Show()
                end
            end)
            card:HookScript("OnLeave", function(self)
                self:SetBackdropBorderColor(0.20, 0.20, 0.24, 0.85)
                self:SetBackdropColor(0.06, 0.06, 0.08, 0.92)
                GameTooltip:Hide()
            end)
            
            list.cards[idx] = card
        end
        
        card:SetPoint("TOPLEFT", 2, -yOffset)
        card:SetWidth(cardWidth)
        
        local mName, mIcon = GetMacroInfo(issue.id)
        card.iconTex:SetTexture(mIcon or 134400)
        
        -- Color-code issue type & short badge
        local typeColor = "|cffff3333"
        local typeBadge = "[" .. (L["Dead Spell"] or "Dead Spell") .. "]"
        if issue.type == "optimize" then
            typeColor = "|cff00ccff"
            typeBadge = "[" .. (L["Optimize"] or "Optimize") .. "]"
        elseif issue.type == "unused" then
            typeColor = "|cffffaa00"
            typeBadge = "[" .. (L["Unused"] or "Unused") .. "]"
        elseif issue.type == "duplicate" then
            typeColor = "|cffff6600"
            typeBadge = "[" .. (L["Duplicate"] or "Duplicate") .. "]"
        end
        
        card.issueData = {
            name = issue.name,
            desc = issue.desc,
            scope = issue.scope,
            body = issue.body,
            typeColor = typeColor,
            typeBadge = typeBadge,
        }
        
        local scopeLabel = (issue.scope == "Account" and (L["Account"] or "Account") or (L["Character"] or "Character"))
        card.txtTitle:SetText("|cffffffff" .. issue.name .. "|r |cff777777(" .. scopeLabel .. ")|r")
        card.txtDesc:SetText(typeColor .. typeBadge .. "|r |cffaaaaaa" .. issue.desc .. "|r")
        
        if issue.type == "unused" then
            card.btnAct:SetText(L["Archive"] or "Archive")
            card.btnAct:SetScript("OnClick", function()
                -- Move to Library and Delete Macro from client
                if not MM.db.library then MM.db.library = {} end
                table.insert(MM.db.library, {
                    name = issue.name,
                    icon = mIcon or 134400,
                    body = issue.body,
                    date = date("%Y-%m-%d"),
                })
                DeleteMacro(issue.id)
                if MM.Notify then MM:Notify(string.format(L["Moved '%s' to library and freed macro slot."] or "Moved '%s' to library.", issue.name), "success") end
                MM:RunMacroHealthAudit()
                if MM.UpdateMacroList then MM:UpdateMacroList() end
            end)
        elseif issue.type == "optimize" then
            card.btnAct:SetText(L["Optimize"] or "Optimize")
            card.btnAct:SetScript("OnClick", function()
                local optBody = MM.Optimizer:OptimizeBody(issue.body)
                EditMacro(issue.id, issue.name, mIcon, optBody)
                if MM.Notify then MM:Notify("Macro optimized!", "success") end
                MM:RunMacroHealthAudit()
                if MM.UpdateMacroList then MM:UpdateMacroList() end
            end)
        else
            card.btnAct:SetText(L["Load"] or "Load")
            card.btnAct:SetScript("OnClick", function()
                MM:LoadMacro(issue.id)
                if MM.Notify then MM:Notify("Loaded into Builder", "info") end
            end)
        end
        
        card:Show()
        yOffset = yOffset + 52
    end
    
    list:SetHeight(yOffset > 0 and yOffset or 1)
end
