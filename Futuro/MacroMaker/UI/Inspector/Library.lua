--------------------------------------------------------------------------------
-- Macro Maker - Library UI
-- Version: 3.0
-- Description: Unified Library for Templates and Snippets.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

--- Toggles the Library panel.
function MM:ToggleLibraryPanel()
    if MM.LibraryPanel and MM.LibraryPanel:IsShown() then
        MM:ShowInspectorTab("overview")
    else
        MM:ShowInspectorTab("library")
    end
end

--- Creates the Library UI.
function MM:CreateLibraryPanel()
    local f = CreateFrame("Frame", "MM_LibraryPanel", MM.InspectorPanel)
    f:SetPoint("TOPLEFT", MM.InspectorPanel, "TOPLEFT", 0, -56)
    f:SetPoint("BOTTOMRIGHT", MM.InspectorPanel, "BOTTOMRIGHT", 0, 0)
    f:Hide()
    
    -- Exclusive Visibility
    f:HookScript("OnShow", function(self)
        if MM.CloseInspectorPanels then MM:CloseInspectorPanels(self) end
        if MM.UpdateInspectorTabHighlight then MM:UpdateInspectorTabHighlight("library") end
        
        -- Default to player's Class category if not set
        if not f.selectedCategory then
             local className, classFilename = UnitClass("player")
             if className then
                 local catName = L["Class"]..": "..className
                 MM.currentClassCat = catName
                 MM.currentClassFilename = classFilename
                 f.selectedCategory = catName
                 if f.categoryLabel then
                     local color = RAID_CLASS_COLORS[classFilename]
                     local hex = "ffffffff"
                     if color then hex = color:GenerateHexColor() end
                     f.categoryLabel:SetText("|c"..hex..catName.."|r")
                 end
             else
                 f.selectedCategory = L["General Utility"]
                 if f.categoryLabel then f.categoryLabel:SetText(L["General Utility"]) end
             end
        end
        MM:RefreshLibraryList()
    end)
    
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 15, -8)
    title:SetText(L["Library"])
    
    MM.LibraryPanel = f

    -- 1. Category Dropdown
    local libDropdown = CreateFrame("DropdownButton", "MM_LibraryDropdown", f, "WowStyle1DropdownTemplate")
    libDropdown:SetPoint("TOP", f, "TOP", 0, -32)
    libDropdown:SetWidth(220)
    
    local lbl = libDropdown:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lbl:SetPoint("LEFT", 10, 0)
    lbl:SetPoint("RIGHT", -25, 0)
    lbl:SetJustifyH("LEFT")
    lbl:SetText(L["General Utility"])
    libDropdown.Label = lbl
    f.categoryLabel = lbl
    
    local allClasses = {
        { tag = "WARRIOR", id = 1 },
        { tag = "PALADIN", id = 2 },
        { tag = "HUNTER", id = 3 },
        { tag = "ROGUE", id = 4 },
        { tag = "PRIEST", id = 5 },
        { tag = "DEATHKNIGHT", id = 6 },
        { tag = "SHAMAN", id = 7 },
        { tag = "MAGE", id = 8 },
        { tag = "WARLOCK", id = 9 },
        { tag = "MONK", id = 10 },
        { tag = "DRUID", id = 11 },
        { tag = "DEMONHUNTER", id = 12 },
        { tag = "EVOKER", id = 13 },
    }
    
    libDropdown:SetupMenu(function(dropdown, rootDescription)
        -- Dynamic Class/Spec Categories for Current Player
        local className, classFilename = UnitClass("player")
        local specIndex = GetSpecialization()
        local specID, specName
        if specIndex then
            specID, specName = GetSpecializationInfo(specIndex)
        end
        
        local color = RAID_CLASS_COLORS[classFilename]
        local hex = "ffffffff"
        if color then hex = color:GenerateHexColor() end
        
        -- 1. Current Character Quick Access
        if className then
            local catName = L["Class"]..": "..className
            MM.currentClassCat = catName
            MM.currentClassFilename = classFilename
            
            local displayText = "|c"..hex..catName.."|r"
            rootDescription:CreateButton(displayText, function()
                f.selectedCategory = catName
                f.selectedClassTag = classFilename
                lbl:SetText(displayText)
                MM:RefreshLibraryList()
            end)
        end
        
        if specName then
            local catName = L["Spec"]..": "..specName
            MM.currentSpecCat = catName
            MM.currentSpecID = specID
            
            local displayText = "|c"..hex..catName.."|r"
            rootDescription:CreateButton(displayText, function()
                f.selectedCategory = catName
                f.selectedClassTag = nil
                lbl:SetText(displayText)
                MM:RefreshLibraryList()
            end)
        end
        
        rootDescription:CreateDivider()
        
        -- 2. Submenu for All 13 Classes
        local classMenu = rootDescription:CreateButton(L["All Classes"] or "All Classes")
        for _, c in ipairs(allClasses) do
            local locName = (LOCALIZED_CLASS_NAMES_MALE and LOCALIZED_CLASS_NAMES_MALE[c.tag]) 
                            or (C_CreatureInfo and C_CreatureInfo.GetClassInfo and C_CreatureInfo.GetClassInfo(c.id) and C_CreatureInfo.GetClassInfo(c.id).className) 
                            or c.tag
            local cColor = RAID_CLASS_COLORS[c.tag]
            local cHex = cColor and cColor:GenerateHexColor() or "ffffffff"
            local fullTitle = "|c"..cHex..locName.."|r"
            
            classMenu:CreateButton(fullTitle, function()
                f.selectedCategory = locName
                f.selectedClassTag = c.tag
                lbl:SetText(fullTitle)
                MM:RefreshLibraryList()
            end)
        end
        
        rootDescription:CreateDivider()
        
        -- 3. Standard Categories
        local cats = {
            L["General Utility"], L["Healer"], L["Tank"], L["DPS"], L["PvP"], L["Commands"]
        }
        for _, cat in ipairs(cats) do
            rootDescription:CreateButton(cat, function()
                f.selectedCategory = cat
                f.selectedClassTag = nil
                lbl:SetText(cat)
                MM:RefreshLibraryList()
            end)
        end
    end)
    
    -- 2. Search Box
    local search = CreateFrame("EditBox", "$parent_Search", f, "InputBoxTemplate")
    search:SetSize(240, 20)
    search:SetPoint("TOP", libDropdown, "BOTTOM", 0, -8)
    search:SetAutoFocus(false)
    search:SetMaxLetters(50)
    
    local searchPlaceholder = search:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    searchPlaceholder:SetPoint("LEFT", 5, 0)
    searchPlaceholder:SetText(L["Search..."])
    search:SetScript("OnEditFocusGained", function() searchPlaceholder:Hide() end)
    search:SetScript("OnEditFocusLost", function()
        if search:GetText() == "" then searchPlaceholder:Show() end
    end)
    search:SetScript("OnTextChanged", function() MM:RefreshLibraryList() end)
    f.searchBox = search
    
    -- 3. Scroll frame for Library list
    local scroll = CreateFrame("ScrollFrame", "$parent_LibScroll", f, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", f, "TOPLEFT", 12, -96)
    scroll:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -28, 10)
    MM:SkinScrollBar(scroll)
    
    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(295, 1)
    scroll:SetScrollChild(content)
    
    f.listContent = content
    f.entryFrames = {}
    f.selectedCategory = L["General Utility"] -- Default
    f.selectedClassTag = nil
end

--- Refreshes the Library list based on search/category filters.
function MM:RefreshLibraryList()
    if not MM.LibraryPanel then return end
    local f = MM.LibraryPanel
    
    -- Hide existing
    for _, sf in ipairs(f.entryFrames) do sf:Hide() end
    
    local filter = ""
    if f.searchBox then filter = string.lower(f.searchBox:GetText() or "") end
    
    local category = f.selectedCategory
    
    -- 1. Determine Data Sources
    local templates = {}
    local snippets = {}
    
    -- Fetch Templates
    if f.selectedClassTag and MM.ClassTemplates and MM.ClassTemplates[f.selectedClassTag] then
        templates = MM.ClassTemplates[f.selectedClassTag]
    elseif category == MM.currentClassCat and MM.currentClassFilename then
        templates = MM.ClassTemplates and MM.ClassTemplates[MM.currentClassFilename] or {}
    elseif category == MM.currentSpecCat and MM.currentSpecID then
        templates = MM.SpecTemplates and MM.SpecTemplates[MM.currentSpecID] or {}
    else
        templates = MM.TemplateCategories and MM.TemplateCategories[category] or {}
    end
    
    -- Fetch Snippets (filter by category)
    if MM.SnippetDB then
        for _, s in ipairs(MM.SnippetDB) do
            if s.category == category then
                table.insert(snippets, s)
            end
        end
    end
    
    -- 2. Merge Data Sources
    local mergedList = {}
    for _, t in ipairs(templates) do
        table.insert(mergedList, {type="Template", data=t})
    end
    for _, s in ipairs(snippets) do
        table.insert(mergedList, {type="Snippet", data=s})
    end
    
    local yOffset = 0
    local idx = 0
    
    for _, itemWrapper in ipairs(mergedList) do
        local item = itemWrapper.data
        
        local show = true
        local rawName = item.name or ""
        local rawBody = item.body or item.code or "" -- Compatible with both
        local rawDesc = item.desc or ""

        local locName = (MM.GetLocalizedTemplateName and MM:GetLocalizedTemplateName(rawName)) or rawName
        local locBody = (MM.LocalizeMacroText and MM:LocalizeMacroText(rawBody)) or rawBody
        local locDesc = (MM.GetLocalizedTemplateDesc and MM:GetLocalizedTemplateDesc(rawDesc)) or rawDesc

        -- Text Search (matches English or localized name/body/desc)
        if filter ~= "" then
            local matchName = string.find(string.lower(rawName), filter, 1, true) or string.find(string.lower(locName), filter, 1, true)
            local matchBody = string.find(string.lower(rawBody), filter, 1, true) or string.find(string.lower(locBody), filter, 1, true)
            local matchDesc = string.find(string.lower(rawDesc), filter, 1, true) or string.find(string.lower(locDesc), filter, 1, true)
            if not matchName and not matchBody and not matchDesc then show = false end
        end
        
        if show then
            idx = idx + 1
            local sf = f.entryFrames[idx]
            
            if not sf then
                sf = CreateFrame("Button", nil, f.listContent, "BackdropTemplate")
                sf:SetSize(210, 60)
                sf:SetBackdrop({
                    bgFile = "Interface\\Buttons\\WHITE8x8",
                    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                    tile = false, edgeSize = 10,
                    insets = { left = 3, right = 3, top = 3, bottom = 3 }
                })
                sf:SetBackdropColor(0.1, 0.1, 0.15, 0.8)
                sf:SetBackdropBorderColor(0.3, 0.3, 0.4, 0.6)
                
                sf.name = sf:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
                sf.name:SetPoint("TOPLEFT", 8, -6)
                sf.name:SetPoint("RIGHT", -8, 0)
                sf.name:SetJustifyH("LEFT")
                
                sf.desc = sf:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
                sf.desc:SetPoint("TOPLEFT", sf.name, "BOTTOMLEFT", 0, -2)
                sf.desc:SetPoint("RIGHT", -8, 0)
                sf.desc:SetJustifyH("LEFT")
                sf.desc:SetWordWrap(true)
                sf.desc:SetMaxLines(2)
                
                -- Hover
                sf:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
                
                -- Click to insert
                sf:SetScript("OnClick", function(self)
                    if MM.outputBox and self.code then
                        local existingText = MM.outputBox:GetText()
                        local newText
                        if existingText and existingText ~= "" then
                            newText = existingText .. "\n" .. self.code
                        else
                            newText = self.code
                        end
                        
                        MM.outputBox:SetText(newText)
                        if MM.ParseMacroToBuilder then MM:ParseMacroToBuilder(newText) end
                        
                        if MM.Notify then
                            MM:Notify(format(L["Inserted: %s"], self.itemName), "success")
                        end
                    end
                end)
                
                -- Tooltip
                sf:SetScript("OnEnter", function(self)
                    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                    GameTooltip:SetText(self.itemName, 1, 1, 1)
                    if self.code then
                        GameTooltip:AddLine(self.code, 0.6, 0.8, 1.0, true)
                    end
                    GameTooltip:AddLine(" ")
                    GameTooltip:AddLine(L["Click to insert into macro"], 0.4, 1.0, 0.4)
                    GameTooltip:Show()
                end)
                sf:SetScript("OnLeave", function() GameTooltip:Hide() end)
                
                f.entryFrames[idx] = sf
            end
            
            sf.itemName = locName
            sf.code = locBody
            sf.name:SetText(locName)
            sf.desc:SetText(locDesc or "")
            
            -- Uniform Color for ALL items
            sf:SetBackdropColor(0.1, 0.1, 0.15, 0.8)
            
            sf:ClearAllPoints()
            sf:SetPoint("TOPLEFT", 0, -yOffset)
            sf:SetPoint("RIGHT", -5, 0)
            sf:Show()
            
            yOffset = yOffset + 64
        end
    end
    
    f.listContent:SetHeight(yOffset > 0 and yOffset or 1)
end
