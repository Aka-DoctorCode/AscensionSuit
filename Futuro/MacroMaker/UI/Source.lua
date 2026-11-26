--------------------------------------------------------------------------------
-- Macro Maker - Source Module
-- Version: 1.0
-- Author: Satyros
--
-- Description:
--   Manages the "Action Source" panel (Left Column).
--   Provides a searchable list of Spells, Items, Mounts, Pets, and Toys.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

--------------------------------------------------------------------------------
-- Panel Creation
--------------------------------------------------------------------------------

--- Creates the Source Column UI, including category dropdown and search list.
function MM:CreateSourceColumn(parent)
    local panel = CreateFrame("Frame", "$parent_Source", parent, "BackdropTemplate")
    local PANEL_BACKDROP = {
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 10,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    }
    panel:SetBackdrop(PANEL_BACKDROP)
    panel:SetBackdropColor(0.06, 0.06, 0.08, 0.7)
    panel:SetBackdropBorderColor(0.18, 0.18, 0.2, 0.8)

    panel:SetPoint("TOPLEFT", MM.ManagerPanel, "TOPRIGHT", 10, 0)
    panel:SetPoint("BOTTOMLEFT", MM.ManagerPanel, "BOTTOMRIGHT", 10, 0)
    panel:SetWidth(200)
    
    MM.SourcePanel = panel
    
    local lblTitle = panel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    lblTitle:SetPoint("TOP", 0, -10)
    lblTitle:SetText(L["Action Source"])
    
    -- 1. Source Category Dropdown
    local sourceDropdown = CreateFrame("DropdownButton", "MM_SourceDropdown", panel, "WowStyle1DropdownTemplate")
    sourceDropdown:SetPoint("TOP", 0, -30) 
    sourceDropdown:SetWidth(170)
    
    local className = UnitClass("player")
    -- Custom Label overlay for visibility
    local lbl = sourceDropdown:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lbl:SetPoint("LEFT", 10, 0)
    lbl:SetPoint("RIGHT", -25, 0)
    lbl:SetJustifyH("LEFT")
    lbl:SetWordWrap(false)
    lbl:SetText((className or "Class") .. " " .. L["Spells"]) 
    sourceDropdown.Label = lbl
    
    MM.selectedSourceType = "player" 
    MM.SourceDropdown = sourceDropdown
    
    -- Category Helper Map
    local sourceLabels = {
        player = (className or "Class") .. " " .. L["Spells"],
        general = L["General Spells"],
        pet = L["Class Pet Spells"],
        equipment = L["Equipped Items"],
        bags = L["Bag Items"],
        mounts = L["Mounts"],
        battlepets = L["Companion Pets"],
        toys = L["Toys"],
        smarttags = L["Smart Dynamic Tags"] or "Smart Dynamic Tags"
    }
    
    -- Dropdown Menu Definitions
    sourceDropdown:SetupMenu(function(dropdown, rootDescription)
        rootDescription:CreateButton(sourceLabels.player, function()
            MM.selectedSourceType = "player"
            if dropdown.Label then dropdown.Label:SetText(sourceLabels.player) end
            MM:UpdateSourceList()
        end)
        
        rootDescription:CreateButton(sourceLabels.general, function()
            MM.selectedSourceType = "general"
            if dropdown.Label then dropdown.Label:SetText(sourceLabels.general) end
            MM:UpdateSourceList()
        end)
        
        rootDescription:CreateButton(sourceLabels.pet, function()
            MM.selectedSourceType = "pet"
            if dropdown.Label then dropdown.Label:SetText(sourceLabels.pet) end
            MM:UpdateSourceList()
        end)
        
        rootDescription:CreateButton(sourceLabels.equipment, function()
            MM.selectedSourceType = "equipment"
            if dropdown.Label then dropdown.Label:SetText(sourceLabels.equipment) end
            MM:UpdateSourceList()
        end)
        
        rootDescription:CreateButton(sourceLabels.bags, function()
            MM.selectedSourceType = "bags"
            if dropdown.Label then dropdown.Label:SetText(sourceLabels.bags) end
            MM:UpdateSourceList()
        end)
        
        rootDescription:CreateButton(sourceLabels.mounts, function()
            MM.selectedSourceType = "mounts"
            if dropdown.Label then dropdown.Label:SetText(sourceLabels.mounts) end
            MM:UpdateSourceList()
        end)
        
        rootDescription:CreateButton(sourceLabels.battlepets, function()
            MM.selectedSourceType = "battlepets"
            if dropdown.Label then dropdown.Label:SetText(sourceLabels.battlepets) end
            MM:UpdateSourceList()
        end)
        
        rootDescription:CreateButton(sourceLabels.toys, function()
            MM.selectedSourceType = "toys"
            if dropdown.Label then dropdown.Label:SetText(sourceLabels.toys) end
            MM:UpdateSourceList()
        end)

        rootDescription:CreateButton(sourceLabels.smarttags, function()
            MM.selectedSourceType = "smarttags"
            if dropdown.Label then dropdown.Label:SetText(sourceLabels.smarttags) end
            MM:UpdateSourceList()
        end)
    end)
    
    -- 2. Search Box
    local searchBox = CreateFrame("EditBox", "$parent_Search", panel, "InputBoxTemplate")
    searchBox:SetSize(170, 20)
    searchBox:SetPoint("TOP", 0, -60) 
    searchBox:SetAutoFocus(false)
    searchBox:SetFontObject("ChatFontNormal")
    searchBox:SetTextInsets(0, 0, 0, 0)
    
    local searchLabel = searchBox:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    searchLabel:SetPoint("LEFT", 4, 0)
    searchLabel:SetText(L["Search..."])
    
    local clearSearchBtn = CreateFrame("Button", nil, searchBox, "UIPanelCloseButton")
    clearSearchBtn:SetSize(16, 16)
    clearSearchBtn:SetPoint("RIGHT", 2, 0)
    clearSearchBtn:Hide()
    clearSearchBtn:SetScript("OnClick", function()
        searchBox:SetText("")
        searchBox:SetFocus()
    end)
    
    searchBox:HookScript("OnEditFocusGained", function() searchLabel:Hide() end)
    searchBox:HookScript("OnEditFocusLost", function(self) if self:GetText() == "" then searchLabel:Show() end end)
    searchBox:HookScript("OnTextChanged", function(self)
        local txt = self:GetText()
        if txt and txt ~= "" then clearSearchBtn:Show() else clearSearchBtn:Hide() end
        MM:UpdateSourceList()
    end)
    
    MM.sourceSearch = searchBox
    
    -- 3. Scrollable Content List
    local scrollFrame = CreateFrame("ScrollFrame", "$parent_SourceScroll", panel, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 10, -90)
    scrollFrame:SetPoint("BOTTOMRIGHT", -30, 10)
    
    MM:SkinScrollBar(scrollFrame)
    
    local scrollChild = CreateFrame("Frame")
    scrollChild:SetSize(160, 1)
    scrollFrame:SetScrollChild(scrollChild)
    panel.sourceContent = scrollChild
    
    MM.sourceButtons = {}
    

    
    

    
    MM:UpdateSourceList()
end

--------------------------------------------------------------------------------
-- List Management
--------------------------------------------------------------------------------

--- Refreshes the source list based on selected category and search filter.
function MM:UpdateSourceList()
    local list = MM.SourcePanel.sourceContent
    local filter = MM.sourceSearch:GetText():lower()
    local category = MM.selectedSourceType
    
    for _, btn in pairs(MM.sourceButtons) do btn:Hide() end
    
    local items = {}
    local seen = {} 
    
    -- === 1. Spells (Player/General) ===
    if category == "player" or category == "general" then
        local bookType = Enum.SpellBookSpellBank.Player
        
        if C_SpellBook and C_SpellBook.GetNumSpellBookSkillLines then
             local numLines = C_SpellBook.GetNumSpellBookSkillLines()
             
             for lineIndex = 1, numLines do
                 local info = C_SpellBook.GetSpellBookSkillLineInfo(lineIndex)
                 local shouldInclude = false
                 
                 if category == "general" then
                     if lineIndex == 1 then shouldInclude = true end
                 elseif category == "player" then
                     if lineIndex > 1 then shouldInclude = true end
                 end
                 
                 if shouldInclude and info then
                     local offset = info.itemIndexOffset
                     local count = info.numSpellBookItems
                     
                     for i = offset + 1, offset + count do
                         local name = C_SpellBook.GetSpellBookItemName(i, bookType)
                         local texture = C_SpellBook.GetSpellBookItemTexture(i, bookType)
                         local spellInfo = C_SpellBook.GetSpellBookItemInfo(i, bookType)
                         
                         -- Logic to handle both Normal Spells and Flyouts
                         local isFlyout = (spellInfo and spellInfo.itemType == Enum.SpellBookItemType.Flyout)
                         
                         if isFlyout then
                              -- Handle Flyout Expansion
                              local flyoutID = spellInfo.actionID
                              local _, _, numSlots, isKnown = GetFlyoutInfo(flyoutID)
                              if isKnown and numSlots > 0 then
                                  for k = 1, numSlots do
                                      local fSpellID, _, isKnownSlot = GetFlyoutSlotInfo(flyoutID, k)
                                      if isKnownSlot then
                                          local fName = C_Spell.GetSpellName(fSpellID)
                                          local fIcon = C_Spell.GetSpellTexture(fSpellID)
                                          
                                          if fName and not seen[fName] then
                                              seen[fName] = true
                                              if filter == "" or fName:lower():find(filter, 1, true) then
                                                   table.insert(items, {
                                                       name = fName,
                                                       icon = fIcon,
                                                       type = "spell",
                                                       id = fSpellID, -- Use SpellID for flyout children, API methods usually accept it or we wrap it
                                                       spellID = fSpellID, -- Specific field for tooltip
                                                       isFlyoutChild = true -- Marker if needed
                                                   })
                                              end
                                          end
                                      end
                                  end
                              end
                         elseif name and spellInfo and not spellInfo.isPassive and not spellInfo.isOffSpec then
                             if not seen[name] then
                                 seen[name] = true
                                 if filter == "" or name:lower():find(filter, 1, true) then
                                     table.insert(items, { 
                                         name = name, 
                                         icon = texture, 
                                         type = "spell", 
                                         id = i, 
                                         bookType = bookType, 
                                         spellID = spellInfo.spellID 
                                     })
                                 end
                             end
                         end
                     end
                 end
             end
             
        else
             -- Legacy API Fallback
             local numSpells = 0
             if GetNumSpellBookItems then numSpells = GetNumSpellBookItems() else numSpells = 200 end
             
             for i = 1, numSpells do
                 local name = GetSpellBookItemName(i, "player")
                 local texture = GetSpellBookItemTexture(i, "player")
                 local isPassive = IsPassiveSpell(i, "player")
                 
                 if name and not isPassive then
                     if not seen[name] then
                         seen[name] = true
                         if filter == "" or name:lower():find(filter, 1, true) then
                             table.insert(items, { name = name, icon = texture, type = "spell", id = i, bookType = bookType })
                         end
                     end
                 end
             end
        end
        
    -- === 2. Class Pets ===
    elseif category == "pet" then
        local hasPet = false
        if C_SpellBook and C_SpellBook.HasPetSpells then hasPet = C_SpellBook.HasPetSpells() elseif HasPetSpells then hasPet = HasPetSpells() end
        
        if hasPet then
             for i = 1, 100 do
                 local name, texture, isPassive
                 if C_SpellBook and C_SpellBook.GetSpellBookItemName then
                     name = C_SpellBook.GetSpellBookItemName(i, Enum.SpellBookSpellBank.Pet)
                     texture = C_SpellBook.GetSpellBookItemTexture(i, Enum.SpellBookSpellBank.Pet)
                     local info = C_SpellBook.GetSpellBookItemInfo(i, Enum.SpellBookSpellBank.Pet)
                     isPassive = info and info.isPassive
                     if info then spellID = info.spellID end
                 else
                     if GetSpellBookItemName then
                         name = GetSpellBookItemName(i, "pet")
                         texture = GetSpellBookItemTexture(i, "pet")
                         isPassive = IsPassiveSpell(i, "pet")
                         local _, sID = GetSpellBookItemInfo(i, "pet")
                         spellID = sID
                     end
                 end
                 if not name then break end
                 if not isPassive then
                    -- Manual ID Lookup for Pet Commands
                    local petCommandIDs = {
                        ["Attack"] = 883,
                        ["Follow"] = 982,
                        ["Move To"] = 905,
                        ["Stay"] = 301,
                        ["Assist"] = 982, -- Placeholder? No, Assist is likely a toggle or a specific ID. Using GetSpellInfo to be safe? 
                        ["Defensive"] = 982, -- Incorrect. 
                        -- Actually, let's use C_Spell.GetSpellInfo for dynamic lookup if ID is missing.
                    }
                    if not spellID and C_Spell and C_Spell.GetSpellInfo then
                         local info = C_Spell.GetSpellInfo(name)
                         if info then spellID = info.spellID end
                    end

                    if filter == "" or name:lower():find(filter, 1, true) then
                        table.insert(items, { name = name, icon = texture, type = "spell_pet", id = i, spellID = spellID })
                    end
                 end
             end
        end

    -- === 3. Equipped Items ===
    elseif category == "equipment" then
        for i = 0, 19 do
            local itemID = GetInventoryItemID("player", i)
            if itemID then
                local name = C_Item.GetItemInfo(itemID)
                local texture = GetInventoryItemTexture("player", i)
                local spellName = GetItemSpell(itemID)
                if spellName then
                    if filter == "" or (name and name:lower():find(filter, 1, true)) then
                        table.insert(items, { name = name, icon = texture, type = "item", id = itemID, slot = i })
                    end
                end
            end
        end

    -- === 4. Bag Items ===
    elseif category == "bags" then
        for bag = 0, 4 do
             local slots = C_Container.GetContainerNumSlots(bag)
             for slot = 1, slots do
                 local info = C_Container.GetContainerItemInfo(bag, slot)
                 if info and info.itemID then
                     local spellName = GetItemSpell(info.itemID)
                     if spellName then
                         local name = C_Item.GetItemInfo(info.itemID)
                         if filter == "" or (name and name:lower():find(filter, 1, true)) then
                             table.insert(items, { name = name, icon = info.iconFileID, type = "item", id = info.itemID })
                         end
                     end
                 end
             end
        end

    -- === 5. Mounts ===
    elseif category == "mounts" then
        if C_MountJournal then
            local mountIDs = C_MountJournal.GetMountIDs()
            for _, mountID in ipairs(mountIDs) do
                local name, spellID, icon, _, _, _, _, isFactionSpecific, faction, shouldHideOnChar, isCollected = C_MountJournal.GetMountInfoByID(mountID)
                if isCollected and name then
                     if filter == "" or name:lower():find(filter, 1, true) then
                         table.insert(items, { name = name, icon = icon, type = "mount", id = mountID, spellID = spellID })
                     end
                end
            end
        end

    -- === 6. Battle Pets (Companions) ===
    elseif category == "battlepets" then
        if C_PetJournal then
            C_PetJournal.ClearSearchFilter() 
            local count = C_PetJournal.GetNumPets()
            for i = 1, count do
                local petID, speciesID, owned, customName, _, _, _, name, icon = C_PetJournal.GetPetInfoByIndex(i)
                if owned then
                    local displayName = customName or name
                    if filter == "" or (displayName and displayName:lower():find(filter, 1, true)) then
                         table.insert(items, { name = displayName, icon = icon, type = "battlepet", id = petID })
                    end
                end
            end
        end

    -- === 7. Toys ===
    elseif category == "toys" then
        if C_ToyBox then
             -- Reset filters to ensure full list
             C_ToyBox.SetFilterString("")
             if C_ToyBox.SetCollectedShown then C_ToyBox.SetCollectedShown(true) end
             if C_ToyBox.SetUncollectedShown then C_ToyBox.SetUncollectedShown(true) end
             
             local numToys = C_ToyBox.GetNumFilteredToys and C_ToyBox.GetNumFilteredToys() or 0
             -- print("MM DEBUG TOYS: NumFiltered="..numToys)
             
             for i = 1, numToys do 
                 local itemID = C_ToyBox.GetToyFromIndex(i)
                 -- if i < 5 then print("MM Toy["..i.."]: ID="..(itemID or "nil")) end
                 if itemID and itemID ~= -1 then 
                     if PlayerHasToy(itemID) then
                          local _, name, icon = C_ToyBox.GetToyInfo(itemID)
                          if name then
                              if filter == "" or name:lower():find(filter, 1, true) then
                                  table.insert(items, { name = name, icon = icon, type = "toy", id = itemID })
                              end
                          end
                      end
                  end
              end
         end

    -- === 8. Smart Dynamic Tags ===
    elseif category == "smarttags" then
        local smartList = {
            {
                name = "#MacroMaker:hearth",
                displayName = L["Smart Hearthstone"] or "Smart Hearthstone",
                icon = 134414,
                type = "smarttag",
                tipTitle = L["Smart Hearthstone"] or "Smart Hearthstone",
                tipDesc = L["Automatically casts Garrison, Dalaran, Traveler, or regular Hearthstone depending on zone."] or "Automatically casts Garrison, Dalaran, Traveler, or regular Hearthstone depending on zone."
            },
            {
                name = "#MacroMaker:pot",
                displayName = L["Best Healing Potion"] or "Best Healing Potion",
                icon = 136066,
                type = "smarttag",
                tipTitle = L["Best Healing Potion"] or "Best Healing Potion",
                tipDesc = L["Automatically uses the highest item-level healing potion in your bags."] or "Automatically uses the highest item-level healing potion in your bags."
            },
            {
                name = "#MacroMaker:pot[mana]",
                displayName = L["Best Mana Potion"] or "Best Mana Potion",
                icon = 136067,
                type = "smarttag",
                tipTitle = L["Best Mana Potion"] or "Best Mana Potion",
                tipDesc = L["Automatically uses the highest item-level mana potion in your bags."] or "Automatically uses the highest item-level mana potion in your bags."
            },
            {
                name = "#MacroMaker:food",
                displayName = L["Best Food & Drink"] or "Best Food & Drink",
                icon = 134062,
                type = "smarttag",
                tipTitle = L["Best Food & Drink"] or "Best Food & Drink",
                tipDesc = L["Automatically uses the highest item-level food or drink in your bags."] or "Automatically uses the highest item-level food or drink in your bags."
            },
            {
                name = "#MacroMaker:repair",
                displayName = L["Smart Repair"] or "Smart Repair",
                icon = 133888,
                type = "smarttag",
                tipTitle = L["Smart Repair"] or "Smart Repair",
                tipDesc = L["Summons your available vendor/repair mount or portable repair bot from bags."] or "Summons your available vendor/repair mount or portable repair bot from bags."
            },
            {
                name = "#MacroMaker:bandage",
                displayName = L["Best Bandage"] or "Best Bandage",
                icon = 133682,
                type = "smarttag",
                tipTitle = L["Best Bandage"] or "Best Bandage",
                tipDesc = L["Automatically uses the highest item-level bandage in your bags."] or "Nutzt automatisch die beste Stoffbinde in deinen Taschen."
            },
            {
                name = "#MacroMaker:mount",
                displayName = L["Smart Favorite Mount"] or "Smart Favorite Mount",
                icon = 413588,
                type = "smarttag",
                tipTitle = L["Smart Favorite Mount"] or "Smart Favorite Mount",
                tipDesc = L["Summons your favorite mount or suitable area mount."] or "Ruft dein Favoriten-Reittier passend zum Gebiet auf."
            },
        }
        for _, st in ipairs(smartList) do
            if filter == "" or st.name:lower():find(filter, 1, true) or st.displayName:lower():find(filter, 1, true) then
                table.insert(items, st)
            end
        end
    end
    
    table.sort(items, function(a, b) return (a.name or "") < (b.name or "") end)
    
    -- Render List
    local yOffset = 0
    for i, data in ipairs(items) do
        local btn = MM.sourceButtons[i]
        if not btn then
            btn = CreateFrame("Button", nil, list, "BackdropTemplate")
            btn:SetSize(140, 30)
            
            -- Icon
            local icon = btn:CreateTexture(nil, "ARTWORK")
            icon:SetSize(24, 24)
            icon:SetPoint("LEFT", 4, 0)
            btn.icon = icon
            
            -- Text
            local text = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            text:SetPoint("LEFT", icon, "RIGHT", 5, 0)
            text:SetPoint("RIGHT", -5, 0)
            text:SetJustifyH("LEFT")
            text:SetWordWrap(false)
            btn.text = text
            
            btn:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
            
            -- Drag Scripts
            -- Logic for "Picking" an item (either via Drag or Click).
            -- We establish a custom MM.DragContext to ensure the data dropped in the Builder
            -- matches exactly what was clicked in the Source, bypassing World of Warcraft's
            -- sometimes ambiguous cursor data (e.g. Journal Indices vs Spell IDs).
            local function PickupSourceItem(self)
                local d = self.data
                MM.DragContext = d
                
                if d.type == "spell" then
                     if d.isFlyoutChild then
                         if C_Spell and C_Spell.PickupSpell then C_Spell.PickupSpell(d.id) else PickupSpellBookItem(d.id, "spell") end
                     else
                         if C_SpellBook and C_SpellBook.PickupSpellBookItem then C_SpellBook.PickupSpellBookItem(d.id, d.bookType)
                         else PickupSpellBookItem(d.id, "player") end
                     end
                elseif d.type == "spell_pet" then
                     -- Always use Book Item to ensure valid cursor visual. Identity handled by DragContext.
                     if C_SpellBook and C_SpellBook.PickupSpellBookItem then C_SpellBook.PickupSpellBookItem(d.id, Enum.SpellBookSpellBank.Pet)
                     else PickupSpellBookItem(d.id, "pet") end
                elseif d.type == "item" or d.type == "toy" then
                     PickupItem(d.id)
                elseif d.type == "mount" then
                     -- Use SpellID for robust pickup (avoids Journal index mismatches)
                     if d.spellID then 
                         if C_Spell and C_Spell.PickupSpell then C_Spell.PickupSpell(d.spellID) 
                         else PickupSpell(d.spellID) end
                     end
                elseif d.type == "battlepet" then
                     if C_PetJournal then C_PetJournal.PickupPet(d.id) end
                end
            end

            btn:RegisterForDrag("LeftButton")
            btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
            btn:SetScript("OnDragStart", PickupSourceItem)
            btn:SetScript("OnClick", function(self, button)
                if button == "RightButton" then
                    local data = self.data
                    if not data then return end
                    
                    if MenuUtil and MenuUtil.CreateContextMenu then
                        MenuUtil.CreateContextMenu(self, function(owner, rootDescription)
                            rootDescription:CreateTitle(data.name or "Action")
                            rootDescription:CreateButton(L["Insert into: Standard (Nomod)"] or "Insert into: Standard (Nomod)", function()
                                MM:AssignActionToModifier("nomod", data)
                            end)
                            rootDescription:CreateButton(L["Insert into: Shift"] or "Insert into: Shift", function()
                                MM:AssignActionToModifier("shift", data)
                            end)
                            rootDescription:CreateButton(L["Insert into: Ctrl"] or "Insert into: Ctrl", function()
                                MM:AssignActionToModifier("ctrl", data)
                            end)
                            rootDescription:CreateButton(L["Insert into: Alt"] or "Insert into: Alt", function()
                                MM:AssignActionToModifier("alt", data)
                            end)
                            rootDescription:CreateDivider()
                            rootDescription:CreateButton(L["Add to Cast Sequence"] or "Add to Cast Sequence", function()
                                MM:AddActionToSequence(data)
                            end)
                            rootDescription:CreateButton(L["Link in Chat"] or "Link in Chat", function()
                                local link = nil
                                if data.type == "spell" or data.type == "spell_pet" then
                                    if data.spellID and C_Spell and C_Spell.GetSpellLink then
                                        link = C_Spell.GetSpellLink(data.spellID)
                                    elseif data.name and C_Spell and C_Spell.GetSpellLink then
                                        link = C_Spell.GetSpellLink(data.name)
                                    end
                                elseif (data.type == "item" or data.type == "toy" or data.type == "equipment") and C_Item then
                                    _, link = C_Item.GetItemInfo(data.id)
                                end
                                if link and ChatEdit_InsertLink then
                                    ChatEdit_InsertLink(link)
                                end
                            end)
                        end)
                    end
                else
                    PickupSourceItem(self)
                end
            end)
            
            btn:SetScript("OnDragStop", function()
                 -- Handle "Invisible Cursor" Edge Case:
                 -- Some Pet Spells (e.g. Felstorm) pick up successfully but render no cursor icon (GetCursorInfo returns nil).
                 -- This normally causes immediate context clearing. We detect this state and extend the
                 -- context lifetime to 20 seconds to allow the user to complete the "Drop" action despite the visual glitch.
                 if MM.DragContext and not GetCursorInfo() then
                     MM.DragContext.invisible = true
                     C_Timer.After(20, function() MM.DragContext = nil end)
                 else
                     -- Standard Drop: Clear context shortly after release to prevent stale data.
                     C_Timer.After(1, function() MM.DragContext = nil end)
                 end
            end)
            
            -- Tooltip
            btn:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                local d = self.data
                if d.type == "spell" or d.type == "spell_pet" then
                     if d.spellID then GameTooltip:SetSpellByID(d.spellID)
                     else GameTooltip:SetText(d.name) end
                elseif d.type == "item" or d.type == "toy" then
                     GameTooltip:SetItemByID(d.id)
                elseif d.type == "mount" then
                     if d.spellID then GameTooltip:SetSpellByID(d.spellID) else GameTooltip:SetText(d.name) end
                elseif d.type == "battlepet" then
                     GameTooltip:SetText(d.name)
                elseif d.type == "smarttag" then
                     GameTooltip:SetText(d.tipTitle or d.name, 1, 0.82, 0)
                     GameTooltip:AddLine(d.name, 0.4, 0.8, 1)
                     GameTooltip:AddLine(" ", 1, 1, 1)
                     GameTooltip:AddLine(d.tipDesc or "", 1, 1, 1, true)
                     GameTooltip:AddLine(L["Drag to assign, or Right-Click for options."] or "Drag to assign, or Right-Click for options.", 0.6, 0.6, 0.6, true)
                end
                GameTooltip:Show()
            end)
            btn:SetScript("OnLeave", GameTooltip_Hide)
            
            MM.sourceButtons[i] = btn
        end
        
        btn.data = data
        btn.text:SetText(data.displayName or data.name)
        btn.icon:SetTexture(data.icon)
        btn:SetPoint("TOPLEFT", 10, -yOffset)
        btn:Show()
        
        yOffset = yOffset + 32
    end
    
    list:SetHeight(yOffset > 0 and yOffset or 1)
end
