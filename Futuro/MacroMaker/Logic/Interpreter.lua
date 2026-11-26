-- Interpreter.lua
local AddOnName, MM = ...
MM.Interpreter = {}

local L = MM.L or {}

local Tags = {
    ["hearth"] = function()
        local uiMapID = C_Map.GetBestMapForUnit("player")
        if not uiMapID then return "Hearthstone" end
        
        -- Northrend / Legion Dalaran
        if uiMapID == 125 or uiMapID == 627 then return "Dalaran Hearthstone" end
        -- Draenor
        if (uiMapID >= 525 and uiMapID <= 550) or uiMapID == 570 then return "Garrison Hearthstone" end
        -- Shadowlands
        if uiMapID >= 1530 and uiMapID <= 1700 then return "Eternal Traveler's Hearthstone" end
        
        return "Hearthstone"
    end,
    ["mount"] = function()
        if IsFlyableArea() then return "Summon Favorite Mount" end
        return "Summon Favorite Mount"
    end,
    ["pot"] = function(param)
        local isMana = (param and param:lower() == "mana")
        local bestItemID = nil
        local bestItemLevel = -1
        local bestItemName = nil
        
        for b = 0, 4 do
            local numSlots = C_Container.GetContainerNumSlots(b)
            for s = 1, numSlots do
                local itemID = C_Container.GetContainerItemID(b, s)
                if itemID then
                    local _, _, _, itemEquipLoc, _, classID, subClassID = C_Item.GetItemInfoInstant(itemID)
                    -- Consumable (0) / Potion (1)
                    if classID == 0 and subClassID == 1 then
                        local name, _, _, iLvl = C_Item.GetItemInfo(itemID)
                        if name then
                            local lowerName = name:lower()
                            local match = isMana and (lowerName:find("mana") or lowerName:find("aerated")) or (not lowerName:find("mana"))
                            if match and iLvl and iLvl > bestItemLevel then
                                bestItemLevel = iLvl
                                bestItemID = itemID
                                bestItemName = name
                            end
                        end
                    end
                end
            end
        end
        return bestItemName or (isMana and "Potion of Devoured Dreams" or "Invigorating Healing Potion")
    end,
    ["food"] = function()
        local bestItemID = nil
        local bestItemLevel = -1
        local bestItemName = nil
        
        for b = 0, 4 do
            local numSlots = C_Container.GetContainerNumSlots(b)
            for s = 1, numSlots do
                local itemID = C_Container.GetContainerItemID(b, s)
                if itemID then
                    local _, _, _, _, _, classID, subClassID = C_Item.GetItemInfoInstant(itemID)
                    -- Consumable (0) / Food & Drink (5)
                    if classID == 0 and subClassID == 5 then
                        local name, _, _, iLvl = C_Item.GetItemInfo(itemID)
                        if name and iLvl and iLvl > bestItemLevel then
                            bestItemLevel = iLvl
                            bestItemID = itemID
                            bestItemName = name
                        end
                    end
                end
            end
        end
        return bestItemName or "Hearty Food"
    end,
    ["repair"] = function()
        -- Repair Mounts check
        local repairMountIDs = {
            460,  -- Grand Expedition Yak
            280,  -- Traveler's Tundra Mammoth (Alliance)
            284,  -- Traveler's Tundra Mammoth (Horde)
            1039, -- Mighty Caravan Brutosaur
            1509, -- Grizzly Hills Packmaster
        }
        if C_MountJournal and C_MountJournal.GetMountInfoByID then
            for _, mID in ipairs(repairMountIDs) do
                local name, _, _, _, isUsable, _, _, _, _, _, isCollected = C_MountJournal.GetMountInfoByID(mID)
                if isCollected and isUsable and name then
                    return name
                end
            end
        end
        
        -- Portable Repair Items check in Bags
        local repairItemIDs = {
            132514, -- Auto-Hammer
            49040,  -- Jeeves
            144341, -- Reaves Battery
            109599, -- Walter
            34113,  -- Field Repair Bot 110G
        }
        for _, itm in ipairs(repairItemIDs) do
            if C_Item.GetItemCount(itm) > 0 then
                local itemName = C_Item.GetItemInfo(itm)
                if itemName then return itemName end
            end
        end
        
        return "Grand Expedition Yak"
    end,
    ["bandage"] = function()
        local bestItemName = nil
        local bestItemLevel = -1
        for b = 0, 4 do
            local numSlots = C_Container.GetContainerNumSlots(b)
            for s = 1, numSlots do
                local itemID = C_Container.GetContainerItemID(b, s)
                if itemID then
                    local _, _, _, _, _, classID, subClassID = C_Item.GetItemInfoInstant(itemID)
                    -- Consumable (0) / Bandage (7)
                    if classID == 0 and subClassID == 7 then
                        local name, _, _, iLvl = C_Item.GetItemInfo(itemID)
                        if name and iLvl and iLvl > bestItemLevel then
                            bestItemLevel = iLvl
                            bestItemName = name
                        end
                    end
                end
            end
        end
        return bestItemName or "Heavy Silk Bandage"
    end,
}

function MM.Interpreter:Init()
    local frame = CreateFrame("Frame")
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")
    frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
    frame:RegisterEvent("PLAYER_REGEN_ENABLED")
    frame:RegisterEvent("BAG_UPDATE_DELAYED")
    
    local timer = nil
    frame:SetScript("OnEvent", function(self, event)
        if InCombatLockdown() then return end
        if timer then timer:Cancel() end
        timer = C_Timer.NewTimer(0.8, function()
            if not InCombatLockdown() then
                MM.Interpreter:UpdateMacros()
            end
        end)
    end)
    
    MM.Interpreter:UpdateMacros()
end

function MM.Interpreter:UpdateMacros()
    if InCombatLockdown() then return end
    
    local numAccount, numChar = GetNumMacros()
    numAccount = numAccount or 0
    numChar = numChar or 0
    
    -- Check Account Macros (1 to numAccount)
    for i = 1, numAccount do
        self:ProcessMacro(i)
    end
    
    -- Check Character Macros (121 to 120 + numChar)
    for i = 121, 120 + numChar do
        self:ProcessMacro(i)
    end
end

function MM.Interpreter:ProcessMacro(index)
    local name, icon, body = GetMacroInfo(index)
    if not body then return end
    
    -- Match tag and optional parameter: #MacroMaker:tag or #MacroMaker:tag[Param]
    local tag, param = body:match("#MacroMaker:(%w+)%[?([^%]]*)%]?")
    if not tag then return end

    local newBody = nil
    
    if tag == "delete" and param and param ~= "" then
        local command = string.format("/run for b=0,4 do for s=1,C_Container.GetContainerNumSlots(b) do local l=C_Container.GetContainerItemLink(b,s) if l and l:find('%s') then C_Container.PickupContainerItem(b,s) DeleteCursorItem() end end end", param)
        local tagLine = "#MacroMaker:delete[" .. param .. "]"
        local startPos, endPos = body:find(tagLine, 1, true)
        if startPos then
            local head = body:sub(1, endPos)
            newBody = head .. "\n" .. command
        end
    elseif Tags[tag] then
        local spellOrItem = Tags[tag](param)
        local tagLine = (param and param ~= "") and ("#MacroMaker:" .. tag .. "[" .. param .. "]") or ("#MacroMaker:" .. tag)
        local startPos, endPos = body:find(tagLine, 1, true)
        if not startPos then
            tagLine = "#MacroMaker:" .. tag
            startPos, endPos = body:find(tagLine, 1, true)
        end
        if startPos then
            local head = body:sub(1, endPos)
            newBody = head .. "\n" .. "/use " .. spellOrItem
        end
    end

    if newBody and newBody ~= body then
        EditMacro(index, name, icon, newBody)
    end
end
