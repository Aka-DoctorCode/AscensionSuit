-- MRPData_Mounts.lua
local _, MRPData = ...

if not MRPData.Internal then return end

---@type { [string]: Dungeon }
local dungeons = {
    ["Shadowfang Keep"] = { x = 44.60, y = 67.67, mapName = "Silverpine Forest", mapID = 1421, instanceId = 33, availableDifficultyIds = { 1, 201, 207 }, expansionLevel = 0 },
    ["Wailing Caverns"] = { x = 47.72, y = 35.02, mapName = "The Barrens", mapID = 1413, instanceId = 43, availableDifficultyIds = { 1, 201 }, expansionLevel = 0 },
    ["Blackfathom Deeps"] = { x = 33.35, y = 93.44, mapName = "Darkshore", mapID = 1439, instanceId = 48, availableDifficultyIds = { 1, 201, 198 }, expansionLevel = 0 },
    ["Uldaman"] = { x = 34.85, y = 85.24, mapName = "Loch Modan", mapID = 1432, instanceId = 70, availableDifficultyIds = { 1, 201 }, expansionLevel = 0 },
    ["Gnomeregan"] = { x = 17.98, y = 38.92, mapName = "Dun Morogh", mapID = 1426, instanceId = 90, availableDifficultyIds = { 1, 201, 198 }, expansionLevel = 0 },
    ["The Temple of Atal'hakkar"] = { x = 77.04, y = 43.91, mapName = "Swamp of Sorrows", mapID = 1435, instanceId = 109, availableDifficultyIds = { 1, 201, 215 }, expansionLevel = 0 },
    ["Zul'Farrak"] = { x = 38.74, y = 19.91, mapName = "Tanaris", mapID = 1446, instanceId = 209, availableDifficultyIds = { 1, 201, 207 }, expansionLevel = 0 },
    ["Lower Blackrock Spire"] = { x = 36.54, y = 25.44, mapName = "Burning Steppes", mapID = 1428, instanceId = 229, availableDifficultyIds = { 1, 207 }, expansionLevel = 0 },
    ["Blackrock Depths"] = { x = 27.55, y = 72.38, mapName = "Searing Gorge", mapID = 1427, instanceId = 230, availableDifficultyIds = { 1, 201 }, expansionLevel = 0 },
    ["The Black Morass"] = { x = 57.07, y = 63.10, mapName = "Tanaris", mapID = 1446, instanceId = 269, availableDifficultyIds = { 1, 207 }, expansionLevel = 0 },
    ["Stratholme"] = { x = 43.44, y = 18.32, mapName = "Eastern Plaguelands", mapID = 1423, instanceId = 329, availableDifficultyIds = { 1 }, expansionLevel = 0 },
    ["Maraudon"] = { x = 30.50, y = 54.51, mapName = "Desolace", mapID = 1443, instanceId = 349, availableDifficultyIds = { 1, 201 }, expansionLevel = 0 },
    ["Ragefire Chasm"] = { x = 53.23, y = 48.69, mapName = "Orgrimmar", mapID = 1454, instanceId = 389, availableDifficultyIds = { 1, 201 }, expansionLevel = 0 },
    ["Dire Maul - Capital Gardens"] = { x = 64.85, y = 30.07, mapName = "Feralas", mapID = 1444, instanceId = 429, availableDifficultyIds = { 1, 207 }, expansionLevel = 0 },
}

---@type { [string]: Raid }
local raids = {
    ["Onyxia's Lair"] = { x = 52.15, y = 75.95, mapName = "Dustwallow Marsh", mapID = 1445, instanceId = 249, availableDifficultyIds = { 9 }, expansionLevel = 0, areaId = 2159 },
    ["Zul'Gurub"] = { x = 52.20, y = 17.10, mapName = "Stranglethorn Vale", mapID = 1434, instanceId = 309, availableDifficultyIds = { 148 }, expansionLevel = 0 },
    ["Molten Core"] = { x = 26.22, y = 24.64, mapName = "Burning Steppes", mapID = 1428, instanceId = 409, availableDifficultyIds = { 9 }, expansionLevel = 0 },
    ["Ruins of Ahn'Qiraj"] = { x = 22.31, y = 85.48, mapName = "Silithus", mapID = 1451, instanceId = 509, availableDifficultyIds = { 148 }, expansionLevel = 0, areaId = 3429 },
    ["Temple of Ahn'Qiraj"] = { x = 24.30, y = 87.12, mapName = "Silithus", mapID = 1451, instanceId = 531, availableDifficultyIds = { 9 }, expansionLevel = 0, areaId = 3429 },
}

---@type { [string]: WorldBoss }
local worldBosses = {
}

---@type { [string]: OpenWorld }
local openWorld = {
    ["They Grow Up So Fast"] = { x = 49.80, y = 9.80, mapName = "Winterspring", mapID = 1452, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 10618, sourceType = "Quest", note = "Winterspring Frostsaber daily quest chain.", conditions = { "alliance_only" } },
    ["Katie Hunter"] = { x = 84, y = 65.50, mapName = "Elwynn Forest", mapID = 1429, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 384, sourceType = "Vendor", note = "Horse Breeder", conditions = { "alliance_only" } },
    ["Lieutenant Karter"] = { x = 71.90, y = 55.60, mapName = "Stormwind City", mapID = 1453, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 12783, sourceType = "Vendor", note = "Alliance PvP mount vendor. Marks of Honor come from rated PvP wins, the first random battleground/arena win of the day, or as drops from older PvP content.", conditions = { "alliance_only" } },
    ["Ogunaro Wolfrunner"] = { x = 69.30, y = 12.50, mapName = "Orgrimmar", mapID = 1454, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 3362, sourceType = "Vendor", note = "Wolf Breeder", conditions = { "horde_only" } },
    ["Raider Bork"] = { x = 40.60, y = 69.50, mapName = "Orgrimmar", mapID = 1454, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 12796, sourceType = "Vendor", note = "Horde PvP mount vendor. Marks of Honor come from rated PvP wins, the first random battleground/arena win of the day, or as drops from older PvP content.", conditions = { "horde_only" } },
    ["Milli Featherwhistle"] = { x = 56.20, y = 46.60, mapName = "Dun Morogh", mapID = 1426, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 7955, sourceType = "Vendor", note = "Mechanostrider vendor", conditions = { "alliance_only" } },
    ["Veron Amberstill"] = { x = 70.50, y = 48.90, mapName = "Dun Morogh", mapID = 1426, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 1261, sourceType = "Vendor", note = "Ram Breeder", conditions = { "alliance_only" } },
    ["Lelanai"] = { x = 42.60, y = 32.80, mapName = "Darnassus", mapID = 1457, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 4730, sourceType = "Vendor", note = "Saber Handler", conditions = { "alliance_only" } },
    ["Zjolnir"] = { x = 55.20, y = 75.40, mapName = "Durotar", mapID = 1411, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 7952, sourceType = "Vendor", note = "Raptor Handler", conditions = { "horde_only" } },
    ["Zachariah Post"] = { x = 61.80, y = 51.80, mapName = "Tirisfal Glades", mapID = 1420, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 4731, sourceType = "Vendor", note = "Skeletal Horse vendor", conditions = { "horde_only" } },
    ["Harb Clawhoof"] = { x = 47.60, y = 58, mapName = "Mulgore", mapID = 1412, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 3685, sourceType = "Vendor", note = "Kodo vendor", conditions = { "horde_only" } },
    ["Jorek Ironside"] = { x = 62.60, y = 59.40, mapName = "Alterac Mountains", mapID = 1416, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 13219, sourceType = "Vendor", note = "Alterac Valley vendor (Horde)", conditions = { "horde_only" } },
    ["Thanthaldis Snowgleam"] = { x = 40.20, y = 80.90, mapName = "Alterac Mountains", mapID = 1416, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 13217, sourceType = "Vendor", note = "Alterac Valley vendor (Alliance)", conditions = { "alliance_only" } },
    ["Unger Statforth"] = { x = 8, y = 55, mapName = "Wetlands", mapID = 1437, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 1460, sourceType = "Vendor", note = "Horse Breeder" },
}

MRPData.dungeons = dungeons
MRPData.raids = raids
MRPData.worldBosses = worldBosses
MRPData.openWorld = openWorld
