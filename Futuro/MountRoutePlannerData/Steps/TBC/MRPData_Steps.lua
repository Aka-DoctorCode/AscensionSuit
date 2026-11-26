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
          uiMapIds = {
            318
          },
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
            name = "Lord Aurius Rivendare",
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
          costs = {
            {
              type = "item",
              amount = 30,
              itemId = 20558
            },
            {
              type = "item",
              amount = 30,
              itemId = 20559
            },
            {
              type = "item",
              amount = 30,
              itemId = 20560
            }
          },
          cost = {
            type = "item",
            amount = 30,
            itemId = 20558
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
          costs = {
            {
              type = "item",
              amount = 30,
              itemId = 20558
            },
            {
              type = "item",
              amount = 30,
              itemId = 20559
            },
            {
              type = "item",
              amount = 30,
              itemId = 20560
            }
          },
          cost = {
            type = "item",
            amount = 30,
            itemId = 20558
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
          costs = {
            {
              type = "item",
              amount = 30,
              itemId = 20558
            },
            {
              type = "item",
              amount = 30,
              itemId = 20559
            },
            {
              type = "item",
              amount = 30,
              itemId = 20560
            }
          },
          cost = {
            type = "item",
            amount = 30,
            itemId = 20558
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
          costs = {
            {
              type = "item",
              amount = 30,
              itemId = 20558
            },
            {
              type = "item",
              amount = 30,
              itemId = 20559
            },
            {
              type = "item",
              amount = 30,
              itemId = 20560
            }
          },
          cost = {
            type = "item",
            amount = 30,
            itemId = 20558
          }
        }
      },
      {
        id = 220,
        name = "Black War Elekk",
        icon = 132259,
        itemId = 35906,
        spellId = 48027,
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
          costs = {
            {
              type = "item",
              amount = 30,
              itemId = 20558
            },
            {
              type = "item",
              amount = 30,
              itemId = 20559
            },
            {
              type = "item",
              amount = 30,
              itemId = 20560
            }
          },
          cost = {
            type = "item",
            amount = 30,
            itemId = 20558
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
          costs = {
            {
              type = "item",
              amount = 30,
              itemId = 20558
            },
            {
              type = "item",
              amount = 30,
              itemId = 20559
            },
            {
              type = "item",
              amount = 30,
              itemId = 20560
            }
          },
          cost = {
            type = "item",
            amount = 30,
            itemId = 20558
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
          costs = {
            {
              type = "item",
              amount = 30,
              itemId = 20558
            },
            {
              type = "item",
              amount = 30,
              itemId = 20559
            },
            {
              type = "item",
              amount = 30,
              itemId = 20560
            }
          },
          cost = {
            type = "item",
            amount = 30,
            itemId = 20558
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
          costs = {
            {
              type = "item",
              amount = 30,
              itemId = 20558
            },
            {
              type = "item",
              amount = 30,
              itemId = 20559
            },
            {
              type = "item",
              amount = 30,
              itemId = 20560
            }
          },
          cost = {
            type = "item",
            amount = 30,
            itemId = 20558
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
          costs = {
            {
              type = "item",
              amount = 30,
              itemId = 20558
            },
            {
              type = "item",
              amount = 30,
              itemId = 20559
            },
            {
              type = "item",
              amount = 30,
              itemId = 20560
            }
          },
          cost = {
            type = "item",
            amount = 30,
            itemId = 20558
          }
        }
      },
      {
        id = 162,
        name = "Swift Warstrider",
        icon = 132233,
        itemId = 29225,
        spellId = 35028,
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
          costs = {
            {
              type = "item",
              amount = 30,
              itemId = 20558
            },
            {
              type = "item",
              amount = 30,
              itemId = 20559
            },
            {
              type = "item",
              amount = 30,
              itemId = 20560
            }
          },
          cost = {
            type = "item",
            amount = 30,
            itemId = 20558
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
            type = "item",
            amount = 50,
            itemId = 20560
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
            type = "item",
            amount = 50,
            itemId = 20560
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
          uiMapIds = {
            319,
            320,
            321
          },
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
          uiMapIds = {
            319,
            320,
            321
          },
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
          uiMapIds = {
            319,
            320,
            321
          },
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
          uiMapIds = {
            319,
            320,
            321
          },
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
  },
  {
    id = 18,
    mounts = {
      {
        id = 125,
        name = "Riding Turtle",
        icon = 132199,
        itemId = 23720,
        spellId = 30174,
        source = {
          mapId = 0,
          uiMapIds = {
            1434
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Landro Longshot"
          },
          note = "TCG loot code redemption NPC in Booty Bay"
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Landro Longshot",
      npcID = 17249
    },
    expansion = 1
  },
  {
    id = 19,
    mounts = {
      {
        id = 129,
        name = "Golden Gryphon",
        icon = 132239,
        itemId = 25470,
        spellId = 32235,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Brunn Flamebeard"
          },
          note = "Gryphon Master",
          cost = {
            type = "gold",
            amount = 400000
          }
        }
      },
      {
        id = 130,
        name = "Ebon Gryphon",
        icon = 132239,
        itemId = 25471,
        spellId = 32239,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Brunn Flamebeard"
          },
          note = "Gryphon Master",
          cost = {
            type = "gold",
            amount = 400000
          }
        }
      },
      {
        id = 131,
        name = "Snowy Gryphon",
        icon = 132239,
        itemId = 25472,
        spellId = 32240,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Brunn Flamebeard"
          },
          note = "Gryphon Master",
          cost = {
            type = "gold",
            amount = 400000
          }
        }
      },
      {
        id = 132,
        name = "Swift Blue Gryphon",
        icon = 132239,
        itemId = 25473,
        spellId = 32242,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Brunn Flamebeard"
          },
          note = "Gryphon Master",
          cost = {
            type = "gold",
            amount = 800000
          }
        }
      },
      {
        id = 137,
        name = "Swift Red Gryphon",
        icon = 132239,
        itemId = 25527,
        spellId = 32289,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Brunn Flamebeard"
          },
          note = "Gryphon Master",
          cost = {
            type = "gold",
            amount = 800000
          }
        }
      },
      {
        id = 138,
        name = "Swift Green Gryphon",
        icon = 132239,
        itemId = 25528,
        spellId = 32290,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Brunn Flamebeard"
          },
          note = "Gryphon Master",
          cost = {
            type = "gold",
            amount = 800000
          }
        }
      },
      {
        id = 139,
        name = "Swift Purple Gryphon",
        icon = 132239,
        itemId = 25529,
        spellId = 32292,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Brunn Flamebeard"
          },
          note = "Gryphon Master",
          cost = {
            type = "gold",
            amount = 800000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Brunn Flamebeard",
      npcID = 20510
    },
    expansion = 1
  },
  {
    id = 20,
    mounts = {
      {
        id = 133,
        name = "Tawny Wind Rider",
        icon = 132268,
        itemId = 25474,
        spellId = 32243,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dama Wildmane"
          },
          note = "Wind Rider vendor",
          cost = {
            type = "gold",
            amount = 500000
          }
        }
      },
      {
        id = 134,
        name = "Blue Wind Rider",
        icon = 132268,
        itemId = 25475,
        spellId = 32244,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dama Wildmane"
          },
          note = "Wind Rider vendor",
          cost = {
            type = "gold",
            amount = 500000
          }
        }
      },
      {
        id = 135,
        name = "Green Wind Rider",
        icon = 132268,
        itemId = 25476,
        spellId = 32245,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dama Wildmane"
          },
          note = "Wind Rider vendor",
          cost = {
            type = "gold",
            amount = 500000
          }
        }
      },
      {
        id = 136,
        name = "Swift Red Wind Rider",
        icon = 132268,
        itemId = 25477,
        spellId = 32246,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dama Wildmane"
          },
          note = "Wind Rider vendor",
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 140,
        name = "Swift Green Wind Rider",
        icon = 132268,
        itemId = 25531,
        spellId = 32295,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dama Wildmane"
          },
          note = "Wind Rider vendor",
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 141,
        name = "Swift Yellow Wind Rider",
        icon = 132268,
        itemId = 25532,
        spellId = 32296,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dama Wildmane"
          },
          note = "Wind Rider vendor",
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Dama Wildmane",
      npcID = 20494
    },
    expansion = 1
  },
  {
    id = 21,
    mounts = {
      {
        id = 146,
        name = "Swift Pink Hawkstrider",
        icon = 132232,
        itemId = 28936,
        spellId = 33660,
        source = {
          mapId = 0,
          uiMapIds = {
            1941
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Winaestra"
          },
          note = "Hawkstrider vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 152,
        name = "Red Hawkstrider",
        icon = 132227,
        itemId = 28927,
        spellId = 34795,
        source = {
          mapId = 0,
          uiMapIds = {
            1941
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Winaestra"
          },
          note = "Hawkstrider vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 157,
        name = "Purple Hawkstrider",
        icon = 132231,
        itemId = 29222,
        spellId = 35018,
        source = {
          mapId = 0,
          uiMapIds = {
            1941
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Winaestra"
          },
          note = "Hawkstrider vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 158,
        name = "Blue Hawkstrider",
        icon = 132229,
        itemId = 29220,
        spellId = 35020,
        source = {
          mapId = 0,
          uiMapIds = {
            1941
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Winaestra"
          },
          note = "Hawkstrider vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 159,
        name = "Black Hawkstrider",
        icon = 132228,
        itemId = 29221,
        spellId = 35022,
        source = {
          mapId = 0,
          uiMapIds = {
            1941
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Winaestra"
          },
          note = "Hawkstrider vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 160,
        name = "Swift Green Hawkstrider",
        icon = 132235,
        itemId = 29223,
        spellId = 35025,
        source = {
          mapId = 0,
          uiMapIds = {
            1941
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Winaestra"
          },
          note = "Hawkstrider vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 161,
        name = "Swift Purple Hawkstrider",
        icon = 132236,
        itemId = 29224,
        spellId = 35027,
        source = {
          mapId = 0,
          uiMapIds = {
            1941
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Winaestra"
          },
          note = "Hawkstrider vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Winaestra",
      npcID = 16264
    },
    expansion = 1
  },
  {
    id = 22,
    mounts = {
      {
        id = 147,
        name = "Brown Elekk",
        icon = 132254,
        itemId = 28481,
        spellId = 34406,
        source = {
          mapId = 0,
          uiMapIds = {
            1947
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Torallius the Pack Handler"
          },
          note = "Elekk vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 163,
        name = "Gray Elekk",
        icon = 132255,
        itemId = 29744,
        spellId = 35710,
        source = {
          mapId = 0,
          uiMapIds = {
            1947
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Torallius the Pack Handler"
          },
          note = "Elekk vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 164,
        name = "Purple Elekk",
        icon = 132256,
        itemId = 29743,
        spellId = 35711,
        source = {
          mapId = 0,
          uiMapIds = {
            1947
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Torallius the Pack Handler"
          },
          note = "Elekk vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 165,
        name = "Great Green Elekk",
        icon = 132259,
        itemId = 29746,
        spellId = 35712,
        source = {
          mapId = 0,
          uiMapIds = {
            1947
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Torallius the Pack Handler"
          },
          note = "Elekk vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 166,
        name = "Great Blue Elekk",
        icon = 132258,
        itemId = 29745,
        spellId = 35713,
        source = {
          mapId = 0,
          uiMapIds = {
            1947
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Torallius the Pack Handler"
          },
          note = "Elekk vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 167,
        name = "Great Purple Elekk",
        icon = 132260,
        itemId = 29747,
        spellId = 35714,
        source = {
          mapId = 0,
          uiMapIds = {
            1947
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Torallius the Pack Handler"
          },
          note = "Elekk vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Torallius the Pack Handler",
      npcID = 17584
    },
    expansion = 1
  },
  {
    id = 23,
    mounts = {
      {
        id = 151,
        name = "Dark War Talbuk",
        icon = 134060,
        itemId = 29228,
        spellId = 34790,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Aldraan (Alliance)"
          },
          cost = {
            type = "item",
            amount = 100,
            itemId = 26045
          },
          costs = {
            {
              type = "item",
              amount = 100,
              itemId = 26045
            },
            {
              type = "item",
              amount = 20,
              itemId = 26044
            }
          }
        }
      },
      {
        id = 171,
        name = "Dark Riding Talbuk",
        icon = 134060,
        itemId = 28915,
        spellId = 39316,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Aldraan (Alliance)"
          },
          cost = {
            type = "item",
            amount = 70,
            itemId = 26045
          },
          costs = {
            {
              type = "item",
              amount = 70,
              itemId = 26045
            },
            {
              type = "item",
              amount = 15,
              itemId = 26044
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Aldraan (Alliance)",
      npcID = 21485
    },
    expansion = 1
  },
  {
    id = 24,
    mounts = {
      {
        id = 151,
        name = "Dark War Talbuk",
        icon = 134060,
        itemId = 29228,
        spellId = 34790,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Coreiel (Horde)"
          },
          note = "Halaa talbuk vendor",
          cost = {
            type = "item",
            amount = 100,
            itemId = 26045
          },
          costs = {
            {
              type = "item",
              amount = 100,
              itemId = 26045
            },
            {
              type = "item",
              amount = 20,
              itemId = 26044
            }
          }
        }
      },
      {
        id = 171,
        name = "Dark Riding Talbuk",
        icon = 134060,
        itemId = 28915,
        spellId = 39316,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Coreiel (Horde)"
          },
          note = "Halaa talbuk vendor",
          cost = {
            type = "item",
            amount = 70,
            itemId = 26045
          },
          costs = {
            {
              type = "item",
              amount = 70,
              itemId = 26045
            },
            {
              type = "item",
              amount = 15,
              itemId = 26044
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Coreiel (Horde)",
      npcID = 21474
    },
    expansion = 1
  },
  {
    id = 25,
    mounts = {
      {
        id = 153,
        name = "Cobalt War Talbuk",
        icon = 134060,
        itemId = 29102,
        spellId = 34896,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Nasela"
          },
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 154,
        name = "White War Talbuk",
        icon = 134060,
        itemId = 29103,
        spellId = 34897,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Nasela"
          },
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 155,
        name = "Silver War Talbuk",
        icon = 134060,
        itemId = 29104,
        spellId = 34898,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Nasela"
          },
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 156,
        name = "Tan War Talbuk",
        icon = 134060,
        itemId = 29105,
        spellId = 34899,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Nasela"
          },
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 170,
        name = "Cobalt Riding Talbuk",
        icon = 134060,
        itemId = 31829,
        spellId = 39315,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Nasela"
          },
          cost = {
            type = "gold",
            amount = 700000
          }
        }
      },
      {
        id = 172,
        name = "Silver Riding Talbuk",
        icon = 134060,
        itemId = 31831,
        spellId = 39317,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Nasela"
          },
          cost = {
            type = "gold",
            amount = 700000
          }
        }
      },
      {
        id = 173,
        name = "Tan Riding Talbuk",
        icon = 134060,
        itemId = 31833,
        spellId = 39318,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Nasela"
          },
          cost = {
            type = "gold",
            amount = 700000
          }
        }
      },
      {
        id = 174,
        name = "White Riding Talbuk",
        icon = 134060,
        itemId = 31835,
        spellId = 39319,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Nasela"
          },
          cost = {
            type = "gold",
            amount = 700000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Provisioner Nasela",
      npcID = 20241
    },
    expansion = 1
  },
  {
    id = 26,
    mounts = {
      {
        id = 153,
        name = "Cobalt War Talbuk",
        icon = 134060,
        itemId = 29102,
        spellId = 34896,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Trader Narasu"
          },
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 154,
        name = "White War Talbuk",
        icon = 134060,
        itemId = 29103,
        spellId = 34897,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Trader Narasu"
          },
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 155,
        name = "Silver War Talbuk",
        icon = 134060,
        itemId = 29104,
        spellId = 34898,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Trader Narasu"
          },
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 156,
        name = "Tan War Talbuk",
        icon = 134060,
        itemId = 29105,
        spellId = 34899,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Trader Narasu"
          },
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 170,
        name = "Cobalt Riding Talbuk",
        icon = 134060,
        itemId = 31829,
        spellId = 39315,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Trader Narasu"
          },
          cost = {
            type = "gold",
            amount = 700000
          }
        }
      },
      {
        id = 172,
        name = "Silver Riding Talbuk",
        icon = 134060,
        itemId = 31831,
        spellId = 39317,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Trader Narasu"
          },
          cost = {
            type = "gold",
            amount = 700000
          }
        }
      },
      {
        id = 173,
        name = "Tan Riding Talbuk",
        icon = 134060,
        itemId = 31833,
        spellId = 39318,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Trader Narasu"
          },
          cost = {
            type = "gold",
            amount = 700000
          }
        }
      },
      {
        id = 174,
        name = "White Riding Talbuk",
        icon = 134060,
        itemId = 31835,
        spellId = 39319,
        source = {
          mapId = 0,
          uiMapIds = {
            1951
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Trader Narasu"
          },
          cost = {
            type = "gold",
            amount = 700000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Trader Narasu",
      npcID = 20240
    },
    expansion = 1
  },
  {
    id = 27,
    mounts = {
      {
        id = 168,
        name = "Fiery Warhorse",
        icon = 132238,
        itemId = 30480,
        spellId = 36702,
        source = {
          mapId = 532,
          uiMapIds = {
            350
          },
          allowedDifficultyIds = {
            3
          },
          journalEncounter = {
            id = 1553,
            name = "Attumen the Huntsman",
            instanceId = 745,
            uiMapId = 350
          },
          dungeonEncounter = {
            id = 652,
            name = "Attumen the Huntsman",
            mapId = 532
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Karazhan"
    },
    expansion = 1
  },
  {
    id = 28,
    mounts = {
      {
        id = 176,
        name = "Green Riding Nether Ray",
        icon = 132191,
        itemId = 32314,
        spellId = 39798,
        source = {
          mapId = 0,
          uiMapIds = {
            1952
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Grella"
          },
          cost = {
            type = "gold",
            amount = 2000000
          }
        }
      },
      {
        id = 177,
        name = "Red Riding Nether Ray",
        icon = 132191,
        itemId = 32317,
        spellId = 39800,
        source = {
          mapId = 0,
          uiMapIds = {
            1952
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Grella"
          },
          cost = {
            type = "gold",
            amount = 2000000
          }
        }
      },
      {
        id = 178,
        name = "Purple Riding Nether Ray",
        icon = 132191,
        itemId = 32316,
        spellId = 39801,
        source = {
          mapId = 0,
          uiMapIds = {
            1952
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Grella"
          },
          cost = {
            type = "gold",
            amount = 2000000
          }
        }
      },
      {
        id = 179,
        name = "Silver Riding Nether Ray",
        icon = 132191,
        itemId = 32318,
        spellId = 39802,
        source = {
          mapId = 0,
          uiMapIds = {
            1952
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Grella"
          },
          cost = {
            type = "gold",
            amount = 2000000
          }
        }
      },
      {
        id = 180,
        name = "Blue Riding Nether Ray",
        icon = 132191,
        itemId = 32319,
        spellId = 39803,
        source = {
          mapId = 0,
          uiMapIds = {
            1952
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Grella"
          },
          cost = {
            type = "gold",
            amount = 2000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Grella",
      npcID = 23367
    },
    expansion = 1
  },
  {
    id = 29,
    mounts = {
      {
        id = 183,
        name = "Ashes of Al'ar",
        icon = 134468,
        itemId = 32458,
        spellId = 40192,
        source = {
          mapId = 550,
          uiMapIds = {
            334
          },
          allowedDifficultyIds = {
            4
          },
          journalEncounter = {
            id = 1576,
            name = "Kael'thas Sunstrider",
            instanceId = 749,
            uiMapId = 334
          },
          dungeonEncounter = {
            id = 733,
            name = "Kael'thas Sunstrider",
            mapId = 550
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "The Eye"
    },
    expansion = 1
  },
  {
    id = 30,
    mounts = {
      {
        id = 185,
        name = "Raven Lord",
        icon = 132372,
        itemId = 32768,
        spellId = 41252,
        source = {
          mapId = 556,
          uiMapIds = {
            259
          },
          allowedDifficultyIds = {
            2
          },
          journalEncounter = {
            id = 542,
            name = "Anzu",
            instanceId = 252,
            uiMapId = 259
          },
          dungeonEncounter = {
            id = 1904,
            name = "Anzu",
            mapId = 556
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "Sethekk Halls"
    },
    expansion = 1
  },
  {
    id = 31,
    mounts = {
      {
        id = 186,
        name = "Onyx Netherwing Drake",
        icon = 132250,
        itemId = 32857,
        spellId = 41513,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Onyxien the Onyx Netherwing Drake"
          },
          note = "Netherwing Drake questline reward — reach Exalted with Netherwing."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Onyxien the Onyx Netherwing Drake"
    },
    expansion = 1
  },
  {
    id = 32,
    mounts = {
      {
        id = 187,
        name = "Azure Netherwing Drake",
        icon = 132250,
        itemId = 32858,
        spellId = 41514,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Suraku the Azure Netherwing Drake"
          }
        }
      }
    },
    source = {
      type = "Quest",
      name = "Suraku the Azure Netherwing Drake"
    },
    expansion = 1
  },
  {
    id = 33,
    mounts = {
      {
        id = 188,
        name = "Cobalt Netherwing Drake",
        icon = 132250,
        itemId = 32859,
        spellId = 41515,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Jorus the Cobalt Netherwing Drake"
          }
        }
      }
    },
    source = {
      type = "Quest",
      name = "Jorus the Cobalt Netherwing Drake"
    },
    expansion = 1
  },
  {
    id = 34,
    mounts = {
      {
        id = 189,
        name = "Purple Netherwing Drake",
        icon = 132250,
        itemId = 32860,
        spellId = 41516,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Malfas the Purple Netherwing Drake"
          }
        }
      }
    },
    source = {
      type = "Quest",
      name = "Malfas the Purple Netherwing Drake"
    },
    expansion = 1
  },
  {
    id = 35,
    mounts = {
      {
        id = 190,
        name = "Veridian Netherwing Drake",
        icon = 132250,
        itemId = 32861,
        spellId = 41517,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zoya the Veridian Netherwing Drake"
          }
        }
      }
    },
    source = {
      type = "Quest",
      name = "Zoya the Veridian Netherwing Drake"
    },
    expansion = 1
  },
  {
    id = 36,
    mounts = {
      {
        id = 191,
        name = "Violet Netherwing Drake",
        icon = 132250,
        itemId = 32862,
        spellId = 41518,
        source = {
          mapId = 0,
          uiMapIds = {
            1948
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Voranaku the Violet Netherwing Drake"
          }
        }
      }
    },
    source = {
      type = "Quest",
      name = "Voranaku the Violet Netherwing Drake"
    },
    expansion = 1
  },
  {
    id = 37,
    mounts = {
      {
        id = 202,
        name = "Swift Brewfest Ram",
        icon = 132248,
        itemId = 33977,
        spellId = 43900,
        source = {
          mapId = 0,
          uiMapIds = {
            1427
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Keg-Shaped Treasure Chest"
          },
          note = "Brewfest daily reward from Coren Direbrew in Blackrock Depths."
        }
      },
      {
        id = 226,
        name = "Great Brewfest Kodo",
        icon = 132246,
        itemId = 37828,
        spellId = 49379,
        source = {
          mapId = 0,
          uiMapIds = {
            1427
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Keg-Shaped Treasure Chest"
          },
          note = "Brewfest daily reward from Coren Direbrew in Blackrock Depths."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Keg-Shaped Treasure Chest"
    },
    expansion = 1
  },
  {
    id = 38,
    mounts = {
      {
        id = 203,
        name = "Cenarion War Hippogryph",
        icon = 132265,
        itemId = 33999,
        spellId = 43927,
        source = {
          mapId = 0,
          uiMapIds = {
            1946
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Fedryen Swiftspear"
          },
          cost = {
            type = "gold",
            amount = 20000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Fedryen Swiftspear",
      npcID = 17904
    },
    expansion = 1
  },
  {
    id = 39,
    mounts = {
      {
        id = 219,
        name = "Headless Horseman's Mount",
        icon = 132501,
        itemId = 37012,
        spellId = 48025,
        source = {
          mapId = 0,
          uiMapIds = {
            1420
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Loot-Filled Pumpkin"
          },
          note = "Hallow's End daily reward from Headless Horseman in Scarlet Monastery."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Loot-Filled Pumpkin"
    },
    expansion = 1
  }
}

MRPData.Steps = steps
