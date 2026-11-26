-- MRPData_Steps.lua
local _, MRPData = ...

if not MRPData.Internal then return end

---@type Step[]
local steps = {
  {
    id = 1,
    mounts = {
      {
        id = 6,
        name = "Brown Horse",
        icon = 132261,
        itemId = 875,
        spellId = 458,
        source = {
          mapId = 0,
          uiMapIds = {
            1437
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Unger Statforth"
          },
          note = "Horse Breeder",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 9,
        name = "Black Stallion",
        icon = 132261,
        itemId = 2411,
        spellId = 470,
        source = {
          mapId = 0,
          uiMapIds = {
            1437
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Unger Statforth"
          },
          note = "Horse Breeder",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Unger Statforth",
      npcID = 1460
    },
    expansion = 0
  },
  {
    id = 2,
    mounts = {
      {
        id = 11,
        name = "Pinto",
        icon = 132261,
        itemId = 903,
        spellId = 472,
        source = {
          mapId = 0,
          uiMapIds = {
            1429
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Katie Hunter"
          },
          note = "Horse Breeder",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 18,
        name = "Chestnut Mare",
        icon = 132261,
        itemId = 5655,
        spellId = 6648,
        source = {
          mapId = 0,
          uiMapIds = {
            1429
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Katie Hunter"
          },
          note = "Horse Breeder",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 91,
        name = "Swift Palomino",
        icon = 132261,
        itemId = 18776,
        spellId = 23227,
        source = {
          mapId = 0,
          uiMapIds = {
            1429
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Katie Hunter"
          },
          note = "Horse Breeder",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 92,
        name = "Swift White Steed",
        icon = 132261,
        itemId = 18778,
        spellId = 23228,
        source = {
          mapId = 0,
          uiMapIds = {
            1429
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Katie Hunter"
          },
          note = "Horse Breeder",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 93,
        name = "Swift Brown Steed",
        icon = 132261,
        itemId = 18777,
        spellId = 23229,
        source = {
          mapId = 0,
          uiMapIds = {
            1429
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Katie Hunter"
          },
          note = "Horse Breeder",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Katie Hunter",
      npcID = 384
    },
    expansion = 0
  },
  {
    id = 3,
    mounts = {
      {
        id = 14,
        name = "Timber Wolf",
        icon = 132224,
        itemId = 1043,
        spellId = 580,
        source = {
          mapId = 0,
          uiMapIds = {
            1454
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Ogunaro Wolfrunner"
          },
          note = "Wolf Breeder",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 19,
        name = "Dire Wolf",
        icon = 132266,
        itemId = 5665,
        spellId = 6653,
        source = {
          mapId = 0,
          uiMapIds = {
            1454
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Ogunaro Wolfrunner"
          },
          note = "Wolf Breeder",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 20,
        name = "Brown Wolf",
        icon = 132224,
        itemId = 5668,
        spellId = 6654,
        source = {
          mapId = 0,
          uiMapIds = {
            1454
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Ogunaro Wolfrunner"
          },
          note = "Wolf Breeder",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 104,
        name = "Swift Brown Wolf",
        icon = 132224,
        itemId = 18796,
        spellId = 23250,
        source = {
          mapId = 0,
          uiMapIds = {
            1454
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Ogunaro Wolfrunner"
          },
          note = "Wolf Breeder",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 105,
        name = "Swift Timber Wolf",
        icon = 132266,
        itemId = 18797,
        spellId = 23251,
        source = {
          mapId = 0,
          uiMapIds = {
            1454
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Ogunaro Wolfrunner"
          },
          note = "Wolf Breeder",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 106,
        name = "Swift Gray Wolf",
        icon = 132266,
        itemId = 18798,
        spellId = 23252,
        source = {
          mapId = 0,
          uiMapIds = {
            1454
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Ogunaro Wolfrunner"
          },
          note = "Wolf Breeder",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Ogunaro Wolfrunner",
      npcID = 3362
    },
    expansion = 0
  },
  {
    id = 4,
    mounts = {
      {
        id = 21,
        name = "Gray Ram",
        icon = 132248,
        itemId = 5864,
        spellId = 6777,
        source = {
          mapId = 0,
          uiMapIds = {
            1426
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Veron Amberstill"
          },
          note = "Ram Breeder",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 24,
        name = "White Ram",
        icon = 132248,
        itemId = 5873,
        spellId = 6898,
        source = {
          mapId = 0,
          uiMapIds = {
            1426
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Veron Amberstill"
          },
          note = "Ram Breeder",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 25,
        name = "Brown Ram",
        icon = 132248,
        itemId = 5872,
        spellId = 6899,
        source = {
          mapId = 0,
          uiMapIds = {
            1426
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Veron Amberstill"
          },
          note = "Ram Breeder",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 94,
        name = "Swift Brown Ram",
        icon = 132248,
        itemId = 18786,
        spellId = 23238,
        source = {
          mapId = 0,
          uiMapIds = {
            1426
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Veron Amberstill"
          },
          note = "Ram Breeder",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 95,
        name = "Swift Gray Ram",
        icon = 132248,
        itemId = 18787,
        spellId = 23239,
        source = {
          mapId = 0,
          uiMapIds = {
            1426
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Veron Amberstill"
          },
          note = "Ram Breeder",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 96,
        name = "Swift White Ram",
        icon = 132248,
        itemId = 18785,
        spellId = 23240,
        source = {
          mapId = 0,
          uiMapIds = {
            1426
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Veron Amberstill"
          },
          note = "Ram Breeder",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Veron Amberstill",
      npcID = 1261
    },
    expansion = 0
  },
  {
    id = 5,
    mounts = {
      {
        id = 26,
        name = "Striped Frostsaber",
        icon = 132267,
        itemId = 8631,
        spellId = 8394,
        source = {
          mapId = 0,
          uiMapIds = {
            1457
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lelanai"
          },
          note = "Saber Handler",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 31,
        name = "Spotted Frostsaber",
        icon = 132267,
        itemId = 8632,
        spellId = 10789,
        source = {
          mapId = 0,
          uiMapIds = {
            1457
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lelanai"
          },
          note = "Saber Handler",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 34,
        name = "Striped Nightsaber",
        icon = 132225,
        itemId = 8629,
        spellId = 10793,
        source = {
          mapId = 0,
          uiMapIds = {
            1457
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lelanai"
          },
          note = "Saber Handler",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 85,
        name = "Swift Mistsaber",
        icon = 132267,
        itemId = 18767,
        spellId = 23219,
        source = {
          mapId = 0,
          uiMapIds = {
            1457
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lelanai"
          },
          note = "Saber Handler",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 87,
        name = "Swift Frostsaber",
        icon = 132267,
        itemId = 18766,
        spellId = 23221,
        source = {
          mapId = 0,
          uiMapIds = {
            1457
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lelanai"
          },
          note = "Saber Handler",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 107,
        name = "Swift Stormsaber",
        icon = 132267,
        itemId = 18902,
        spellId = 23338,
        source = {
          mapId = 0,
          uiMapIds = {
            1457
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lelanai"
          },
          note = "Saber Handler",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Lelanai",
      npcID = 4730
    },
    expansion = 0
  },
  {
    id = 6,
    mounts = {
      {
        id = 27,
        name = "Emerald Raptor",
        icon = 132253,
        itemId = 8588,
        spellId = 8395,
        source = {
          mapId = 0,
          uiMapIds = {
            1411
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zjolnir"
          },
          note = "Raptor Handler",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 36,
        name = "Turquoise Raptor",
        icon = 132253,
        itemId = 8591,
        spellId = 10796,
        source = {
          mapId = 0,
          uiMapIds = {
            1411
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zjolnir"
          },
          note = "Raptor Handler",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 38,
        name = "Violet Raptor",
        icon = 132253,
        itemId = 8592,
        spellId = 10799,
        source = {
          mapId = 0,
          uiMapIds = {
            1411
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zjolnir"
          },
          note = "Raptor Handler",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 97,
        name = "Swift Blue Raptor",
        icon = 132253,
        itemId = 18788,
        spellId = 23241,
        source = {
          mapId = 0,
          uiMapIds = {
            1411
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zjolnir"
          },
          note = "Raptor Handler",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 98,
        name = "Swift Olive Raptor",
        icon = 132253,
        itemId = 18789,
        spellId = 23242,
        source = {
          mapId = 0,
          uiMapIds = {
            1411
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zjolnir"
          },
          note = "Raptor Handler",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 99,
        name = "Swift Orange Raptor",
        icon = 132253,
        itemId = 18790,
        spellId = 23243,
        source = {
          mapId = 0,
          uiMapIds = {
            1411
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zjolnir"
          },
          note = "Raptor Handler",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Zjolnir",
      npcID = 7952
    },
    expansion = 0
  },
  {
    id = 7,
    mounts = {
      {
        id = 39,
        name = "Red Mechanostrider",
        icon = 132247,
        itemId = 8563,
        spellId = 10873,
        source = {
          mapId = 0,
          uiMapIds = {
            1426
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Milli Featherwhistle"
          },
          note = "Mechanostrider vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 40,
        name = "Blue Mechanostrider",
        icon = 132247,
        itemId = 8595,
        spellId = 10969,
        source = {
          mapId = 0,
          uiMapIds = {
            1426
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Milli Featherwhistle"
          },
          note = "Mechanostrider vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 57,
        name = "Green Mechanostrider",
        icon = 132247,
        itemId = 13321,
        spellId = 17453,
        source = {
          mapId = 0,
          uiMapIds = {
            1426
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Milli Featherwhistle"
          },
          note = "Mechanostrider vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 58,
        name = "Unpainted Mechanostrider",
        icon = 132247,
        itemId = 13322,
        spellId = 17454,
        source = {
          mapId = 0,
          uiMapIds = {
            1426
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Milli Featherwhistle"
          },
          note = "Mechanostrider vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 88,
        name = "Swift Yellow Mechanostrider",
        icon = 132247,
        itemId = 18774,
        spellId = 23222,
        source = {
          mapId = 0,
          uiMapIds = {
            1426
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Milli Featherwhistle"
          },
          note = "Mechanostrider vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 89,
        name = "Swift White Mechanostrider",
        icon = 132247,
        itemId = 18773,
        spellId = 23223,
        source = {
          mapId = 0,
          uiMapIds = {
            1426
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Milli Featherwhistle"
          },
          note = "Mechanostrider vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 90,
        name = "Swift Green Mechanostrider",
        icon = 132247,
        itemId = 18772,
        spellId = 23225,
        source = {
          mapId = 0,
          uiMapIds = {
            1426
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Milli Featherwhistle"
          },
          note = "Mechanostrider vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Milli Featherwhistle",
      npcID = 7955
    },
    expansion = 0
  },
  {
    id = 8,
    mounts = {
      {
        id = 55,
        name = "Winterspring Frostsaber",
        icon = 132252,
        itemId = 13086,
        spellId = 17229,
        source = {
          mapId = 0,
          uiMapIds = {
            1452
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "They Grow Up So Fast"
          },
          note = "Winterspring Frostsaber daily quest chain.",
          cost = {
            type = "gold",
            amount = 11250000
          }
        }
      }
    },
    source = {
      type = "Quest",
      name = "They Grow Up So Fast",
      npcID = 10618
    },
    expansion = 0
  },
  {
    id = 9,
    mounts = {
      {
        id = 65,
        name = "Red Skeletal Horse",
        icon = 132264,
        itemId = 13331,
        spellId = 17462,
        source = {
          mapId = 0,
          uiMapIds = {
            1420
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zachariah Post"
          },
          note = "Skeletal Horse vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 66,
        name = "Blue Skeletal Horse",
        icon = 132264,
        itemId = 13332,
        spellId = 17463,
        source = {
          mapId = 0,
          uiMapIds = {
            1420
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zachariah Post"
          },
          note = "Skeletal Horse vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 67,
        name = "Brown Skeletal Horse",
        icon = 132264,
        itemId = 13333,
        spellId = 17464,
        source = {
          mapId = 0,
          uiMapIds = {
            1420
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zachariah Post"
          },
          note = "Skeletal Horse vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 68,
        name = "Green Skeletal Warhorse",
        icon = 132264,
        itemId = 13334,
        spellId = 17465,
        source = {
          mapId = 0,
          uiMapIds = {
            1420
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zachariah Post"
          },
          note = "Skeletal Horse vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 100,
        name = "Purple Skeletal Warhorse",
        icon = 132264,
        itemId = 18791,
        spellId = 23246,
        source = {
          mapId = 0,
          uiMapIds = {
            1420
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zachariah Post"
          },
          note = "Skeletal Horse vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Zachariah Post",
      npcID = 4731
    },
    expansion = 0
  },
  {
    id = 10,
    mounts = {
      {
        id = 69,
        name = "Rivendare's Deathcharger",
        icon = 132264,
        itemId = 13335,
        spellId = 17481,
        source = {
          mapId = 329,
          uiMapIds = {},
          allowedDifficultyIds = {
            1
          },
          journalEncounter = {
            id = 456,
            name = "Lord Aurius Rivendare",
            instanceId = 1292,
            uiMapId = 318
          },
          dungeonEncounter = {
            id = 484,
            name = "Baron Rivendare",
            mapId = 329
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "Stratholme"
    },
    expansion = 0
  },
  {
    id = 11,
    mounts = {
      {
        id = 71,
        name = "Gray Kodo",
        icon = 132243,
        itemId = 15277,
        spellId = 18989,
        source = {
          mapId = 0,
          uiMapIds = {
            1412
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Harb Clawhoof"
          },
          note = "Kodo vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 72,
        name = "Brown Kodo",
        icon = 132245,
        itemId = 15290,
        spellId = 18990,
        source = {
          mapId = 0,
          uiMapIds = {
            1412
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Harb Clawhoof"
          },
          note = "Kodo vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 101,
        name = "Great White Kodo",
        icon = 132243,
        itemId = 18793,
        spellId = 23247,
        source = {
          mapId = 0,
          uiMapIds = {
            1412
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Harb Clawhoof"
          },
          note = "Kodo vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 102,
        name = "Great Gray Kodo",
        icon = 132243,
        itemId = 18795,
        spellId = 23248,
        source = {
          mapId = 0,
          uiMapIds = {
            1412
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Harb Clawhoof"
          },
          note = "Kodo vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 103,
        name = "Great Brown Kodo",
        icon = 132245,
        itemId = 18794,
        spellId = 23249,
        source = {
          mapId = 0,
          uiMapIds = {
            1412
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Harb Clawhoof"
          },
          note = "Kodo vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Harb Clawhoof",
      npcID = 3685
    },
    expansion = 0
  },
  {
    id = 12,
    mounts = {
      {
        id = 75,
        name = "Black War Steed",
        icon = 132251,
        itemId = 18241,
        spellId = 22717,
        source = {
          mapId = 0,
          uiMapIds = {
            1453
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lieutenant Karter"
          },
          note = "Alliance PvP mount vendor. Marks of Honor come from rated PvP wins, the first random battleground/arena win of the day, or as drops from older PvP content.",
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 77,
        name = "Black Battlestrider",
        icon = 132247,
        itemId = 18243,
        spellId = 22719,
        source = {
          mapId = 0,
          uiMapIds = {
            1453
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lieutenant Karter"
          },
          note = "Alliance PvP mount vendor. Marks of Honor come from rated PvP wins, the first random battleground/arena win of the day, or as drops from older PvP content.",
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 78,
        name = "Black War Ram",
        icon = 132248,
        itemId = 18244,
        spellId = 22720,
        source = {
          mapId = 0,
          uiMapIds = {
            1453
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lieutenant Karter"
          },
          note = "Alliance PvP mount vendor. Marks of Honor come from rated PvP wins, the first random battleground/arena win of the day, or as drops from older PvP content.",
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 81,
        name = "Black War Tiger",
        icon = 132225,
        itemId = 18242,
        spellId = 22723,
        source = {
          mapId = 0,
          uiMapIds = {
            1453
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lieutenant Karter"
          },
          note = "Alliance PvP mount vendor. Marks of Honor come from rated PvP wins, the first random battleground/arena win of the day, or as drops from older PvP content.",
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Lieutenant Karter",
      npcID = 12783
    },
    expansion = 0
  },
  {
    id = 13,
    mounts = {
      {
        id = 76,
        name = "Black War Kodo",
        icon = 132245,
        itemId = 18247,
        spellId = 22718,
        source = {
          mapId = 0,
          uiMapIds = {
            1454
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Raider Bork"
          },
          note = "Horde PvP mount vendor. Marks of Honor come from rated PvP wins, the first random battleground/arena win of the day, or as drops from older PvP content.",
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 79,
        name = "Black War Raptor",
        icon = 132253,
        itemId = 18246,
        spellId = 22721,
        source = {
          mapId = 0,
          uiMapIds = {
            1454
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Raider Bork"
          },
          note = "Horde PvP mount vendor. Marks of Honor come from rated PvP wins, the first random battleground/arena win of the day, or as drops from older PvP content.",
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 80,
        name = "Red Skeletal Warhorse",
        icon = 132264,
        itemId = 18248,
        spellId = 22722,
        source = {
          mapId = 0,
          uiMapIds = {
            1454
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Raider Bork"
          },
          note = "Horde PvP mount vendor. Marks of Honor come from rated PvP wins, the first random battleground/arena win of the day, or as drops from older PvP content.",
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 82,
        name = "Black War Wolf",
        icon = 132224,
        itemId = 18245,
        spellId = 22724,
        source = {
          mapId = 0,
          uiMapIds = {
            1454
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Raider Bork"
          },
          note = "Horde PvP mount vendor. Marks of Honor come from rated PvP wins, the first random battleground/arena win of the day, or as drops from older PvP content.",
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Raider Bork",
      npcID = 12796
    },
    expansion = 0
  },
  {
    id = 14,
    mounts = {
      {
        id = 108,
        name = "Frostwolf Howler",
        icon = 134227,
        itemId = 19029,
        spellId = 23509,
        source = {
          mapId = 0,
          uiMapIds = {
            1416
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Jorek Ironside"
          },
          note = "Alterac Valley vendor (Horde)",
          cost = {
            type = "gold",
            amount = 8000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Jorek Ironside",
      npcID = 13219
    },
    expansion = 0
  },
  {
    id = 15,
    mounts = {
      {
        id = 109,
        name = "Stormpike Battle Charger",
        icon = 132248,
        itemId = 19030,
        spellId = 23510,
        source = {
          mapId = 0,
          uiMapIds = {
            1416
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Thanthaldis Snowgleam"
          },
          note = "Alterac Valley vendor (Alliance)",
          cost = {
            type = "gold",
            amount = 8000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Thanthaldis Snowgleam",
      npcID = 13217
    },
    expansion = 0
  },
  {
    id = 16,
    mounts = {
      {
        id = 110,
        name = "Swift Razzashi Raptor",
        icon = 132253,
        itemId = 19872,
        spellId = 24242,
        source = {
          mapId = 309,
          uiMapIds = {},
          allowedDifficultyIds = {
            148
          },
          dungeonEncounter = {
            id = 787,
            name = "Bloodlord Mandokir",
            mapId = 309
          }
        }
      },
      {
        id = 111,
        name = "Swift Zulian Tiger",
        icon = 132242,
        itemId = 19902,
        spellId = 24252,
        source = {
          mapId = 309,
          uiMapIds = {},
          allowedDifficultyIds = {
            148
          },
          dungeonEncounter = {
            id = 789,
            name = "High Priest Thekal",
            mapId = 309
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Zul'Gurub"
    },
    expansion = 0
  },
  {
    id = 17,
    mounts = {
      {
        id = 117,
        name = "Blue Qiraji Battle Tank",
        icon = 134398,
        itemId = 21218,
        spellId = 25953,
        source = {
          mapId = 531,
          uiMapIds = {},
          allowedDifficultyIds = {
            9
          },
          specialEncounter = {
            name = "Trash"
          }
        }
      },
      {
        id = 118,
        name = "Red Qiraji Battle Tank",
        icon = 134396,
        itemId = 21321,
        spellId = 26054,
        source = {
          mapId = 531,
          uiMapIds = {},
          allowedDifficultyIds = {
            9
          },
          specialEncounter = {
            name = "Trash"
          }
        }
      },
      {
        id = 119,
        name = "Yellow Qiraji Battle Tank",
        icon = 134395,
        itemId = 21324,
        spellId = 26055,
        source = {
          mapId = 531,
          uiMapIds = {},
          allowedDifficultyIds = {
            9
          },
          specialEncounter = {
            name = "Trash"
          }
        }
      },
      {
        id = 120,
        name = "Green Qiraji Battle Tank",
        icon = 134397,
        itemId = 21323,
        spellId = 26056,
        source = {
          mapId = 531,
          uiMapIds = {},
          allowedDifficultyIds = {
            9
          },
          specialEncounter = {
            name = "Trash"
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Temple of Ahn'Qiraj"
    },
    expansion = 0
  }
}

MRPData.Steps = steps
