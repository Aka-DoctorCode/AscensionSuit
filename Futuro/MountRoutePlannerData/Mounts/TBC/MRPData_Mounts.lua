-- MRPData_Mounts.lua
local _, MRPData = ...

if not MRPData.Internal then return end

---@type { [string]: Dungeon }
local dungeons = {
    ["Shadowfang Keep"] = { x = 44.60, y = 67.67, mapName = "Silverpine Forest", mapID = 1421, instanceId = 33, availableDifficultyIds = { 1 }, expansionLevel = 0 },
    ["Wailing Caverns"] = { x = 47.72, y = 35.02, mapName = "The Barrens", mapID = 1413, instanceId = 43, availableDifficultyIds = { 1 }, expansionLevel = 0 },
    ["Blackfathom Deeps"] = { x = 33.35, y = 93.44, mapName = "Darkshore", mapID = 1439, instanceId = 48, availableDifficultyIds = { 1 }, expansionLevel = 0 },
    ["Uldaman"] = { x = 34.85, y = 85.24, mapName = "Loch Modan", mapID = 1432, instanceId = 70, availableDifficultyIds = { 1 }, expansionLevel = 0 },
    ["Gnomeregan"] = { x = 17.98, y = 38.92, mapName = "Dun Morogh", mapID = 1426, instanceId = 90, availableDifficultyIds = { 1 }, expansionLevel = 0 },
    ["The Temple of Atal'hakkar"] = { x = 77.04, y = 43.91, mapName = "Swamp of Sorrows", mapID = 1435, instanceId = 109, availableDifficultyIds = { 1 }, expansionLevel = 0 },
    ["Zul'Farrak"] = { x = 38.74, y = 19.91, mapName = "Tanaris", mapID = 1446, instanceId = 209, availableDifficultyIds = { 1 }, expansionLevel = 0 },
    ["Lower Blackrock Spire"] = { x = 36.54, y = 25.44, mapName = "Burning Steppes", mapID = 1428, instanceId = 229, availableDifficultyIds = { 1 }, expansionLevel = 0 },
    ["Blackrock Depths"] = { x = 27.55, y = 72.38, mapName = "Searing Gorge", mapID = 1427, instanceId = 230, availableDifficultyIds = { 1 }, expansionLevel = 0 },
    ["Stratholme"] = { x = 43.44, y = 18.32, mapName = "Eastern Plaguelands", mapID = 1423, instanceId = 329, availableDifficultyIds = { 1 }, expansionLevel = 0 },
    ["Maraudon"] = { x = 30.50, y = 54.51, mapName = "Desolace", mapID = 1443, instanceId = 349, availableDifficultyIds = { 1 }, expansionLevel = 0 },
    ["Ragefire Chasm"] = { x = 53.23, y = 48.69, mapName = "Orgrimmar", mapID = 1454, instanceId = 389, availableDifficultyIds = { 1 }, expansionLevel = 0 },
    ["The Black Morass"] = { x = 57.07, y = 63.10, mapName = "Tanaris", mapID = 1446, instanceId = 269, availableDifficultyIds = { 1, 2 }, expansionLevel = 1 },
    ["The Shattered Halls"] = { x = 47.40, y = 52.02, mapName = "Hellfire Peninsula", mapID = 1944, instanceId = 540, availableDifficultyIds = { 1, 2 }, expansionLevel = 1 },
    ["The Blood Furnace"] = { x = 45.87, y = 51.93, mapName = "Hellfire Peninsula", mapID = 1944, instanceId = 542, availableDifficultyIds = { 1, 2 }, expansionLevel = 1 },
    ["Hellfire Ramparts"] = { x = 47.48, y = 53.63, mapName = "Hellfire Peninsula", mapID = 1944, instanceId = 543, availableDifficultyIds = { 1, 2 }, expansionLevel = 1 },
    ["The Steamvault"] = { x = 50.20, y = 33.32, mapName = "Zangarmarsh", mapID = 1946, instanceId = 545, availableDifficultyIds = { 1, 2 }, expansionLevel = 1 },
    ["The Underbog"] = { x = 54.37, y = 34.38, mapName = "Zangarmarsh", mapID = 1946, instanceId = 546, availableDifficultyIds = { 1, 2 }, expansionLevel = 1 },
    ["The Slave Pens"] = { x = 48.93, y = 35.49, mapName = "Zangarmarsh", mapID = 1946, instanceId = 547, availableDifficultyIds = { 1, 2 }, expansionLevel = 1 },
    ["The Arcatraz"] = { x = 74.57, y = 57.62, mapName = "Netherstorm", mapID = 1953, instanceId = 552, availableDifficultyIds = { 1, 2 }, expansionLevel = 1 },
    ["The Botanica"] = { x = 71.83, y = 54.82, mapName = "Netherstorm", mapID = 1953, instanceId = 553, availableDifficultyIds = { 1, 2 }, expansionLevel = 1 },
    ["The Mechanar"] = { x = 70.64, y = 69.82, mapName = "Netherstorm", mapID = 1953, instanceId = 554, availableDifficultyIds = { 1, 2 }, expansionLevel = 1 },
    ["Shadow Labyrinth"] = { x = 39.63, y = 73.78, mapName = "Terokkar Forest", mapID = 1952, instanceId = 555, availableDifficultyIds = { 1, 2 }, expansionLevel = 1 },
    ["Sethekk Halls"] = { x = 45.06, y = 65.62, mapName = "Terokkar Forest", mapID = 1952, instanceId = 556, availableDifficultyIds = { 1, 2 }, expansionLevel = 1 },
    ["Mana-Tombs"] = { x = 39.64, y = 57.45, mapName = "Terokkar Forest", mapID = 1952, instanceId = 557, availableDifficultyIds = { 1, 2 }, expansionLevel = 1 },
    ["Auchenai Crypts"] = { x = 34.19, y = 65.60, mapName = "Terokkar Forest", mapID = 1952, instanceId = 558, availableDifficultyIds = { 1, 2 }, expansionLevel = 1 },
    ["Old Hillsbrad Foothills"] = { x = 55.49, y = 53.29, mapName = "Tanaris", mapID = 1446, instanceId = 560, availableDifficultyIds = { 1, 2 }, expansionLevel = 1 },
    ["Magisters' Terrace"] = { x = 61.52, y = 31.10, mapName = "Isle of Quel'Danas", mapID = 1957, instanceId = 585, availableDifficultyIds = { 1, 2 }, expansionLevel = 1 },
}

---@type { [string]: Raid }
local raids = {
    ["Onyxia's Lair"] = { x = 52.15, y = 75.95, mapName = "Dustwallow Marsh", mapID = 1445, instanceId = 249, availableDifficultyIds = { 9 }, expansionLevel = 0, areaId = 2159 },
    ["Zul'Gurub"] = { x = 52.20, y = 17.10, mapName = "Stranglethorn Vale", mapID = 1434, instanceId = 309, availableDifficultyIds = { 148 }, expansionLevel = 0 },
    ["Molten Core"] = { x = 26.22, y = 24.64, mapName = "Burning Steppes", mapID = 1428, instanceId = 409, availableDifficultyIds = { 9 }, expansionLevel = 0 },
    ["Ruins of Ahn'Qiraj"] = { x = 22.31, y = 85.48, mapName = "Silithus", mapID = 1451, instanceId = 509, availableDifficultyIds = { 148 }, expansionLevel = 0, areaId = 3429 },
    ["Temple of Ahn'Qiraj"] = { x = 24.30, y = 87.12, mapName = "Silithus", mapID = 1451, instanceId = 531, availableDifficultyIds = { 9 }, expansionLevel = 0, areaId = 3429 },
    ["Karazhan"] = { x = 46.59, y = 74.11, mapName = "Deadwind Pass", mapID = 1430, instanceId = 532, availableDifficultyIds = { 3 }, expansionLevel = 1, areaId = 3457 },
    ["The Battle for Mount Hyjal"] = { x = 57.06, y = 49.65, mapName = "Tanaris", mapID = 1446, instanceId = 534, availableDifficultyIds = { 4 }, expansionLevel = 1 },
    ["Magtheridon's Lair"] = { x = 47.64, y = 52.01, mapName = "Hellfire Peninsula", mapID = 1944, instanceId = 544, availableDifficultyIds = { 4 }, expansionLevel = 1 },
    ["Serpentshrine Cavern"] = { x = 51.91, y = 32.56, mapName = "Zangarmarsh", mapID = 1946, instanceId = 548, availableDifficultyIds = { 4 }, expansionLevel = 1 },
    ["The Eye"] = { x = 73.88, y = 63.74, mapName = "Netherstorm", mapID = 1953, instanceId = 550, availableDifficultyIds = { 4 }, expansionLevel = 1, areaId = 3845 },
    ["Black Temple"] = { x = 71.03, y = 47.02, mapName = "Shadowmoon Valley", mapID = 1948, instanceId = 564, availableDifficultyIds = { 4 }, expansionLevel = 1 },
    ["Gruul's Lair"] = { x = 69.35, y = 23.54, mapName = "Blade's Edge Mountains", mapID = 1949, instanceId = 565, availableDifficultyIds = { 4 }, expansionLevel = 1 },
    ["Zul'Aman"] = { x = 82.59, y = 64.31, mapName = "Ghostlands", mapID = 1942, instanceId = 568, availableDifficultyIds = { 3 }, expansionLevel = 1, areaId = 3508 },
    ["Sunwell Plateau"] = { x = 44.28, y = 45.87, mapName = "Isle of Quel'Danas", mapID = 1957, instanceId = 580, availableDifficultyIds = { 4 }, expansionLevel = 1 },
}

---@type { [string]: WorldBoss }
local worldBosses = {
}

---@type { [string]: OpenWorld }
local openWorld = {
    ["They Grow Up So Fast"] = { x = 49.80, y = 9.80, mapName = "Winterspring", mapID = 1452, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 10618, sourceType = "Quest", note = "Winterspring Frostsaber daily quest chain.", conditions = { "alliance_only" } },
    ["Onyxien the Onyx Netherwing Drake"] = { x = 65.90, y = 86.50, mapName = "Shadowmoon Valley", mapID = 1948, questID = 0, expansionLevel = 1, mechanic = "interact", sourceType = "Quest", note = "Netherwing Drake questline reward — reach Exalted with Netherwing." },
    ["Suraku the Azure Netherwing Drake"] = { x = 65.90, y = 86.50, mapName = "Shadowmoon Valley", mapID = 1948, questID = 0, expansionLevel = 1, mechanic = "interact", sourceType = "Quest" },
    ["Jorus the Cobalt Netherwing Drake"] = { x = 65.90, y = 86.50, mapName = "Shadowmoon Valley", mapID = 1948, questID = 0, expansionLevel = 1, mechanic = "interact", sourceType = "Quest" },
    ["Malfas the Purple Netherwing Drake"] = { x = 65.90, y = 86.50, mapName = "Shadowmoon Valley", mapID = 1948, questID = 0, expansionLevel = 1, mechanic = "interact", sourceType = "Quest" },
    ["Zoya the Veridian Netherwing Drake"] = { x = 65.90, y = 86.50, mapName = "Shadowmoon Valley", mapID = 1948, questID = 0, expansionLevel = 1, mechanic = "interact", sourceType = "Quest" },
    ["Voranaku the Violet Netherwing Drake"] = { x = 65.90, y = 86.50, mapName = "Shadowmoon Valley", mapID = 1948, questID = 0, expansionLevel = 1, mechanic = "interact", sourceType = "Quest" },
    ["Katie Hunter"] = { x = 84, y = 65.50, mapName = "Elwynn Forest", mapID = 1429, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 384, sourceType = "Vendor", note = "Horse Breeder", conditions = { "alliance_only" } },
    ["Brunn Flamebeard"] = { x = 37.40, y = 56, mapName = "Shadowmoon Valley", mapID = 1948, questID = 0, expansionLevel = 1, mechanic = "interact", npcID = 20510, sourceType = "Vendor", note = "Gryphon Master", conditions = { "alliance_only" } },
    ["Lieutenant Karter"] = { x = 71.90, y = 55.60, mapName = "Stormwind City", mapID = 1453, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 12783, sourceType = "Vendor", note = "Alliance PvP mount vendor. Marks of Honor come from rated PvP wins, the first random battleground/arena win of the day, or as drops from older PvP content.", conditions = { "alliance_only" } },
    ["Ogunaro Wolfrunner"] = { x = 69.30, y = 12.50, mapName = "Orgrimmar", mapID = 1454, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 3362, sourceType = "Vendor", note = "Wolf Breeder", conditions = { "horde_only" } },
    ["Dama Wildmane"] = { x = 29.20, y = 29.40, mapName = "Shadowmoon Valley", mapID = 1948, questID = 0, expansionLevel = 1, mechanic = "interact", npcID = 20494, sourceType = "Vendor", note = "Wind Rider vendor", conditions = { "horde_only" } },
    ["Raider Bork"] = { x = 40.60, y = 69.50, mapName = "Orgrimmar", mapID = 1454, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 12796, sourceType = "Vendor", note = "Horde PvP mount vendor. Marks of Honor come from rated PvP wins, the first random battleground/arena win of the day, or as drops from older PvP content.", conditions = { "horde_only" } },
    ["Milli Featherwhistle"] = { x = 56.20, y = 46.60, mapName = "Dun Morogh", mapID = 1426, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 7955, sourceType = "Vendor", note = "Mechanostrider vendor", conditions = { "alliance_only" } },
    ["Veron Amberstill"] = { x = 70.50, y = 48.90, mapName = "Dun Morogh", mapID = 1426, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 1261, sourceType = "Vendor", note = "Ram Breeder", conditions = { "alliance_only" } },
    ["Lelanai"] = { x = 42.60, y = 32.80, mapName = "Darnassus", mapID = 1457, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 4730, sourceType = "Vendor", note = "Saber Handler", conditions = { "alliance_only" } },
    ["Zjolnir"] = { x = 55.20, y = 75.40, mapName = "Durotar", mapID = 1411, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 7952, sourceType = "Vendor", note = "Raptor Handler", conditions = { "horde_only" } },
    ["Zachariah Post"] = { x = 61.80, y = 51.80, mapName = "Tirisfal Glades", mapID = 1420, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 4731, sourceType = "Vendor", note = "Skeletal Horse vendor", conditions = { "horde_only" } },
    ["Harb Clawhoof"] = { x = 47.60, y = 58, mapName = "Mulgore", mapID = 1412, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 3685, sourceType = "Vendor", note = "Kodo vendor", conditions = { "horde_only" } },
    ["Winaestra"] = { x = 61, y = 54.70, mapName = "Eversong Woods", mapID = 1941, questID = 0, expansionLevel = 1, mechanic = "interact", npcID = 16264, sourceType = "Vendor", note = "Hawkstrider vendor", conditions = { "horde_only" } },
    ["Torallius the Pack Handler"] = { x = 81.40, y = 51.80, mapName = "The Exodar", mapID = 1947, questID = 0, expansionLevel = 1, mechanic = "interact", npcID = 17584, sourceType = "Vendor", note = "Elekk vendor", conditions = { "alliance_only" } },
    ["Jorek Ironside"] = { x = 62.60, y = 59.40, mapName = "Alterac Mountains", mapID = 1416, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 13219, sourceType = "Vendor", note = "Alterac Valley vendor (Horde)", conditions = { "horde_only" } },
    ["Thanthaldis Snowgleam"] = { x = 40.20, y = 80.90, mapName = "Alterac Mountains", mapID = 1416, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 13217, sourceType = "Vendor", note = "Alterac Valley vendor (Alliance)", conditions = { "alliance_only" } },
    ["Drake Dealer Hurlunk"] = { x = 65, y = 86, mapName = "Shadowmoon Valley", mapID = 1948, questID = 0, expansionLevel = 1, mechanic = "interact", npcID = 23489, sourceType = "Vendor", note = "Netherwing Drake vendor", conditions = { "rep_1015_7" } },
    ["Coreiel (Horde)"] = { x = 41.60, y = 44.40, mapName = "Nagrand", mapID = 1951, questID = 0, expansionLevel = 1, mechanic = "interact", npcID = 21474, sourceType = "Vendor", note = "Halaa talbuk vendor" },
    ["Aldraan (Alliance)"] = { x = 42.80, y = 42.50, mapName = "Nagrand", mapID = 1951, questID = 0, expansionLevel = 1, mechanic = "interact", npcID = 21485, sourceType = "Vendor", conditions = { "alliance_only" } },
    ["Provisioner Nasela"] = { x = 53.50, y = 36.90, mapName = "Nagrand", mapID = 1951, questID = 0, expansionLevel = 1, mechanic = "interact", npcID = 20241, sourceType = "Vendor" },
    ["Trader Narasu"] = { x = 54.50, y = 75.10, mapName = "Nagrand", mapID = 1951, questID = 0, expansionLevel = 1, mechanic = "interact", npcID = 20240, sourceType = "Vendor" },
    ["Grella"] = { x = 64.20, y = 66.20, mapName = "Terokkar Forest", mapID = 1952, questID = 0, expansionLevel = 1, mechanic = "interact", npcID = 23367, sourceType = "Vendor" },
    ["Fedryen Swiftspear"] = { x = 79.20, y = 63.80, mapName = "Zangarmarsh", mapID = 1946, questID = 0, expansionLevel = 1, mechanic = "interact", npcID = 17904, sourceType = "Vendor" },
    ["Unger Statforth"] = { x = 8, y = 55, mapName = "Wetlands", mapID = 1437, questID = 0, expansionLevel = 0, mechanic = "interact", npcID = 1460, sourceType = "Vendor", note = "Horse Breeder" },
    ["Landro Longshot"] = { x = 32.69, y = 81.17, mapName = "Stranglethorn Vale", mapID = 1434, questID = 0, expansionLevel = 1, mechanic = "interact", npcID = 17249, sourceType = "Vendor", note = "TCG loot code redemption NPC in Booty Bay" },
    ["Noblegarden Merchant"] = { x = 52.20, y = 41.60, mapName = "Durotar", mapID = 1411, questID = 0, expansionLevel = 1, mechanic = "interact", npcID = 32837, sourceType = "Vendor", note = "Available during Noblegarden event.", conditions = { "event_noblegarden" } },
    ["Doomwalker"] = { x = 63, y = 50, mapName = "Tanaris", mapID = 1446, questID = 0, expansionLevel = 1, mechanic = "kill", npcID = 17711, note = "World boss near Caverns of Time. Spawns during WoW Anniversary.", conditions = { "event_anniversary" } },
    ["Keg-Shaped Treasure Chest"] = { x = 47.70, y = 60, mapName = "Searing Gorge", mapID = 1427, questID = 0, expansionLevel = 1, mechanic = "click", note = "Brewfest daily reward from Coren Direbrew in Blackrock Depths.", conditions = { "event_brewfest" } },
    ["Coren Direbrew"] = { x = 47.70, y = 60, mapName = "Searing Gorge", mapID = 1427, questID = 0, expansionLevel = 1, mechanic = "kill", npcID = 23872, note = "Brewfest holiday boss in Blackrock Depths.", conditions = { "event_brewfest" } },
    ["Loot-Filled Pumpkin"] = { x = 84.80, y = 31.50, mapName = "Tirisfal Glades", mapID = 1420, questID = 0, expansionLevel = 1, mechanic = "click", note = "Hallow's End daily reward from Headless Horseman in Scarlet Monastery.", conditions = { "event_hallows" } },
    ["Historian Ma'di"] = { x = 63.50, y = 49.80, mapName = "Tanaris", mapID = 1446, questID = 0, expansionLevel = 1, mechanic = "interact", npcID = 158061, sourceType = "Vendor", note = "Anniversary vendor near Caverns of Time.", conditions = { "event_anniversary" } },
}

MRPData.dungeons = dungeons
MRPData.raids = raids
MRPData.worldBosses = worldBosses
MRPData.openWorld = openWorld
