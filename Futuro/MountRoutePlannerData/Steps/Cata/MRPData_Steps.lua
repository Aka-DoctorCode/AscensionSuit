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
      },
      {
        id = 337,
        name = "Striped Dawnsaber",
        icon = 132225,
        itemId = 47100,
        spellId = 66847,
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
          note = "Winterspring Frostsaber daily quest chain."
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
      },
      {
        id = 314,
        name = "Black Skeletal Horse",
        icon = 132264,
        itemId = 46308,
        spellId = 64977,
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
        id = 336,
        name = "Ochre Skeletal Warhorse",
        icon = 132264,
        itemId = 47101,
        spellId = 66846,
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
        itemId = 18063,
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
      },
      {
        id = 309,
        name = "White Kodo",
        icon = 132243,
        itemId = 46100,
        spellId = 64657,
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
            type = "currency",
            amount = 2000,
            currencyId = 1901
          }
        }
      },
      {
        id = 77,
        name = "Black Battlestrider",
        icon = 298587,
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
            type = "currency",
            amount = 2000,
            currencyId = 1901
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
            type = "currency",
            amount = 2000,
            currencyId = 1901
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
            type = "currency",
            amount = 2000,
            currencyId = 1901
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
          cost = {
            type = "currency",
            amount = 2000,
            currencyId = 1901
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
            type = "currency",
            amount = 2000,
            currencyId = 1901
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
            type = "currency",
            amount = 2000,
            currencyId = 1901
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
            type = "currency",
            amount = 2000,
            currencyId = 1901
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
            type = "currency",
            amount = 2000,
            currencyId = 1901
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
          cost = {
            type = "currency",
            amount = 2000,
            currencyId = 1901
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
            1424
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
            type = "currency",
            amount = 2000,
            currencyId = 1901
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
            1424
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
            type = "currency",
            amount = 2000,
            currencyId = 1901
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
    id = 17,
    mounts = {
      {
        id = 129,
        name = "Golden Gryphon",
        icon = 294468,
        itemId = 25470,
        spellId = 32235,
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
            name = "Tannec Stonebeak"
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
        icon = 294467,
        itemId = 25471,
        spellId = 32239,
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
            name = "Tannec Stonebeak"
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
        icon = 294469,
        itemId = 25472,
        spellId = 32240,
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
            name = "Tannec Stonebeak"
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
            1453
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tannec Stonebeak"
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
            1453
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tannec Stonebeak"
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
            1453
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tannec Stonebeak"
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
            1453
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tannec Stonebeak"
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
      name = "Tannec Stonebeak",
      npcID = 43768
    },
    expansion = 1
  },
  {
    id = 18,
    mounts = {
      {
        id = 133,
        name = "Tawny Wind Rider",
        icon = 298596,
        itemId = 25474,
        spellId = 32243,
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
            name = "Drakma"
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
        icon = 298588,
        itemId = 25475,
        spellId = 32244,
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
            name = "Drakma"
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
        icon = 298589,
        itemId = 25476,
        spellId = 32245,
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
            name = "Drakma"
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
        icon = 298594,
        itemId = 25477,
        spellId = 32246,
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
            name = "Drakma"
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
        icon = 298592,
        itemId = 25531,
        spellId = 32295,
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
            name = "Drakma"
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
        icon = 298595,
        itemId = 25532,
        spellId = 32296,
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
            name = "Drakma"
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
      name = "Drakma",
      npcID = 44918
    },
    expansion = 1
  },
  {
    id = 19,
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
    id = 20,
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
    id = 21,
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
    id = 22,
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
    id = 23,
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
        itemId = 29231,
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
    id = 24,
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
        itemId = 29231,
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
    id = 25,
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
    id = 26,
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
    id = 27,
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
    id = 28,
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
    id = 29,
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
    id = 30,
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
    id = 31,
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
    id = 32,
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
    id = 33,
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
    id = 34,
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
    id = 35,
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
    id = 36,
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
    id = 37,
    mounts = {
      {
        id = 213,
        name = "Swift White Hawkstrider",
        icon = 132237,
        itemId = 35513,
        spellId = 46628,
        source = {
          mapId = 585,
          uiMapIds = {
            348
          },
          allowedDifficultyIds = {
            2
          },
          journalEncounter = {
            id = 533,
            name = "Kael'thas Sunstrider",
            instanceId = 249,
            uiMapId = 348
          },
          dungeonEncounter = {
            id = 1894,
            name = "Kael'thas Sunstrider",
            mapId = 585
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "Magisters' Terrace"
    },
    expansion = 1
  },
  {
    id = 38,
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
  },
  {
    id = 39,
    mounts = {
      {
        id = 236,
        name = "Winged Steed of the Ebon Blade",
        icon = 294466,
        itemId = 40775,
        spellId = 54729,
        source = {
          mapId = 0,
          uiMapIds = {
            1423
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dread Commander Thalanor"
          },
          note = "Death Knight mount vendor at Acherus",
          cost = {
            type = "gold",
            amount = 10000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Dread Commander Thalanor",
      npcID = 29587
    },
    expansion = 2
  },
  {
    id = 40,
    mounts = {
      {
        id = 237,
        name = "White Polar Bear",
        icon = 132117,
        itemId = 40777,
        spellId = 54753,
        source = {
          mapId = 0,
          uiMapIds = {
            120
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Hyldnir Spoils"
          },
          note = "Reward bag from Gretta daily quests at Brunnhildar Village."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Hyldnir Spoils"
    },
    expansion = 2
  },
  {
    id = 41,
    mounts = {
      {
        id = 246,
        name = "Azure Drake",
        icon = 236230,
        itemId = 43952,
        spellId = 59567,
        source = {
          mapId = 616,
          uiMapIds = {
            141
          },
          allowedDifficultyIds = {
            3,
            4
          },
          journalEncounter = {
            id = 1617,
            name = "Malygos",
            instanceId = 756,
            uiMapId = 141
          },
          dungeonEncounter = {
            id = 1094,
            name = "Malygos",
            mapId = 616
          }
        }
      },
      {
        id = 247,
        name = "Blue Drake",
        icon = 236231,
        itemId = 43953,
        spellId = 59568,
        source = {
          mapId = 616,
          uiMapIds = {
            141
          },
          allowedDifficultyIds = {
            3,
            4
          },
          journalEncounter = {
            id = 1617,
            name = "Malygos",
            instanceId = 756,
            uiMapId = 141
          },
          dungeonEncounter = {
            id = 1094,
            name = "Malygos",
            mapId = 616
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "The Eye of Eternity"
    },
    expansion = 2
  },
  {
    id = 42,
    mounts = {
      {
        id = 248,
        name = "Bronze Drake",
        icon = 236232,
        itemId = 43951,
        spellId = 59569,
        source = {
          mapId = 595,
          uiMapIds = {
            131
          },
          allowedDifficultyIds = {
            2
          },
          specialEncounter = {
            name = "Infinite Corruptor"
          },
          note = "In order for him to be available, you must complete the timed event in under 25 minutes."
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "The Culling of Stratholme"
    },
    expansion = 2
  },
  {
    id = 43,
    mounts = {
      {
        id = 249,
        name = "Red Drake",
        icon = 236234,
        itemId = 43955,
        spellId = 59570,
        source = {
          mapId = 0,
          uiMapIds = {
            115
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Cielstrasza"
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
      name = "Cielstrasza",
      npcID = 32533
    },
    expansion = 2
  },
  {
    id = 44,
    mounts = {
      {
        id = 250,
        name = "Twilight Drake",
        icon = 236235,
        itemId = 43954,
        spellId = 59571,
        source = {
          mapId = 615,
          uiMapIds = {
            155
          },
          allowedDifficultyIds = {
            4
          },
          note = "All 3 outer dragons must still be alive when Sartharion was pulled in order for this mount to drop.",
          journalEncounter = {
            id = 1616,
            name = "Sartharion",
            instanceId = 755,
            uiMapId = 155
          },
          dungeonEncounter = {
            id = 1090,
            name = "Sartharion",
            mapId = 615
          }
        }
      },
      {
        id = 253,
        name = "Black Drake",
        icon = 236235,
        itemId = 43986,
        spellId = 59650,
        source = {
          mapId = 615,
          uiMapIds = {
            155
          },
          allowedDifficultyIds = {
            3
          },
          note = "All 3 outer dragons must still be alive when Sartharion was pulled in order for this mount to drop.",
          journalEncounter = {
            id = 1616,
            name = "Sartharion",
            instanceId = 755,
            uiMapId = 155
          },
          dungeonEncounter = {
            id = 1090,
            name = "Sartharion",
            mapId = 615
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "The Obsidian Sanctum"
    },
    expansion = 2
  },
  {
    id = 45,
    mounts = {
      {
        id = 254,
        name = "Black War Mammoth",
        icon = 236237,
        itemId = 43956,
        spellId = 59785,
        source = {
          mapId = 0,
          uiMapIds = {
            123
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Knight Dameron"
          },
          note = "Alliance PvP vendor",
          cost = {
            type = "currency",
            amount = 2000,
            currencyId = 1901
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Knight Dameron",
      npcID = 32294
    },
    expansion = 2
  },
  {
    id = 46,
    mounts = {
      {
        id = 255,
        name = "Black War Mammoth",
        icon = 236237,
        itemId = 44077,
        spellId = 59788,
        source = {
          mapId = 0,
          uiMapIds = {
            123
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Stone Guard Mukar"
          },
          note = "Horde PvP vendor",
          cost = {
            type = "currency",
            amount = 2000,
            currencyId = 1901
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Stone Guard Mukar",
      npcID = 32296
    },
    expansion = 2
  },
  {
    id = 47,
    mounts = {
      {
        id = 256,
        name = "Wooly Mammoth",
        icon = 132255,
        itemId = 44230,
        spellId = 59791,
        source = {
          mapId = 0,
          uiMapIds = {
            125
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Mei Francis"
          },
          note = "Exotic mount dealer",
          cost = {
            type = "gold",
            amount = 100000000
          }
        }
      },
      {
        id = 257,
        name = "Wooly Mammoth",
        icon = 132255,
        itemId = 44231,
        spellId = 59793,
        source = {
          mapId = 0,
          uiMapIds = {
            125
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Mei Francis"
          },
          note = "Exotic mount dealer",
          cost = {
            type = "gold",
            amount = 100000000
          }
        }
      },
      {
        id = 269,
        name = "Armored Brown Bear",
        icon = 236244,
        itemId = 44225,
        spellId = 60114,
        source = {
          mapId = 0,
          uiMapIds = {
            125
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Mei Francis"
          },
          note = "Exotic mount dealer",
          cost = {
            type = "gold",
            amount = 7500000
          }
        }
      },
      {
        id = 270,
        name = "Armored Brown Bear",
        icon = 236244,
        itemId = 44226,
        spellId = 60116,
        source = {
          mapId = 0,
          uiMapIds = {
            125
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Mei Francis"
          },
          note = "Exotic mount dealer",
          cost = {
            type = "gold",
            amount = 7500000
          }
        }
      },
      {
        id = 276,
        name = "Armored Snowy Gryphon",
        icon = 132239,
        itemId = 44689,
        spellId = 61229,
        source = {
          mapId = 0,
          uiMapIds = {
            125
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Mei Francis"
          },
          note = "Exotic mount dealer",
          cost = {
            type = "gold",
            amount = 20000000
          }
        }
      },
      {
        id = 277,
        name = "Armored Blue Wind Rider",
        icon = 298593,
        itemId = 44690,
        spellId = 61230,
        source = {
          mapId = 0,
          uiMapIds = {
            125
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Mei Francis"
          },
          note = "Exotic mount dealer",
          cost = {
            type = "gold",
            amount = 20000000
          }
        }
      },
      {
        id = 280,
        name = "Traveler's Tundra Mammoth",
        icon = 236239,
        itemId = 44235,
        spellId = 61425,
        source = {
          mapId = 0,
          uiMapIds = {
            125
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Mei Francis"
          },
          note = "Exotic mount dealer",
          cost = {
            type = "gold",
            amount = 200000000
          }
        }
      },
      {
        id = 284,
        name = "Traveler's Tundra Mammoth",
        icon = 236239,
        itemId = 44234,
        spellId = 61447,
        source = {
          mapId = 0,
          uiMapIds = {
            125
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Mei Francis"
          },
          note = "Exotic mount dealer",
          cost = {
            type = "gold",
            amount = 200000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Mei Francis",
      npcID = 32216
    },
    expansion = 2
  },
  {
    id = 48,
    mounts = {
      {
        id = 258,
        name = "Ice Mammoth",
        icon = 236241,
        itemId = 44080,
        spellId = 59797,
        source = {
          mapId = 0,
          uiMapIds = {
            120
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lillehoff"
          },
          cost = {
            type = "gold",
            amount = 10000000
          }
        }
      },
      {
        id = 259,
        name = "Ice Mammoth",
        icon = 236241,
        itemId = 43958,
        spellId = 59799,
        source = {
          mapId = 0,
          uiMapIds = {
            120
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lillehoff"
          },
          cost = {
            type = "gold",
            amount = 10000000
          }
        }
      },
      {
        id = 288,
        name = "Grand Ice Mammoth",
        icon = 236241,
        itemId = 44086,
        spellId = 61469,
        source = {
          mapId = 0,
          uiMapIds = {
            120
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lillehoff"
          },
          cost = {
            type = "gold",
            amount = 100000000
          }
        }
      },
      {
        id = 289,
        name = "Grand Ice Mammoth",
        icon = 236241,
        itemId = 43961,
        spellId = 61470,
        source = {
          mapId = 0,
          uiMapIds = {
            120
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lillehoff"
          },
          cost = {
            type = "gold",
            amount = 100000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Lillehoff",
      npcID = 32540
    },
    expansion = 2
  },
  {
    id = 49,
    mounts = {
      {
        id = 264,
        name = "Blue Proto-Drake",
        icon = 236233,
        itemId = 44151,
        spellId = 59996,
        source = {
          mapId = 575,
          uiMapIds = {
            137
          },
          allowedDifficultyIds = {
            2
          },
          journalEncounter = {
            id = 643,
            name = "Skadi the Ruthless",
            instanceId = 286,
            uiMapId = 137
          },
          dungeonEncounter = {
            id = 581,
            name = "Skadi the Ruthless",
            mapId = 575
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "Utgarde Pinnacle"
    },
    expansion = 2
  },
  {
    id = 50,
    mounts = {
      {
        id = 265,
        name = "Time-Lost Proto-Drake",
        icon = 236233,
        itemId = 44168,
        spellId = 60002,
        source = {
          mapId = 0,
          uiMapIds = {
            120
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Time-Lost Proto-Drake"
          },
          note = "Shares spawn timer (2-8h) with Vyragosa. 4 spawn points, each with a unique patrol path."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Time-Lost Proto-Drake",
      npcID = 32491
    },
    expansion = 2
  },
  {
    id = 51,
    mounts = {
      {
        id = 286,
        name = "Grand Black War Mammoth",
        icon = 236237,
        itemId = 43959,
        spellId = 61465,
        source = {
          mapId = 624,
          uiMapIds = {
            156
          },
          allowedDifficultyIds = {
            3,
            4
          },
          factionMask = -2,
          journalEncounter = {
            id = 1597,
            name = "Archavon the Stone Watcher",
            instanceId = 753,
            uiMapId = 156
          },
          dungeonEncounter = {
            id = 1126,
            name = "Archavon the Stone Watcher",
            mapId = 624
          }
        }
      },
      {
        id = 286,
        name = "Grand Black War Mammoth",
        icon = 236237,
        itemId = 43959,
        spellId = 61465,
        source = {
          mapId = 624,
          uiMapIds = {
            156
          },
          allowedDifficultyIds = {
            3,
            4
          },
          factionMask = -2,
          journalEncounter = {
            id = 1598,
            name = "Emalon the Storm Watcher",
            instanceId = 753,
            uiMapId = 156
          },
          dungeonEncounter = {
            id = 1127,
            name = "Emalon the Storm Watcher",
            mapId = 624
          }
        }
      },
      {
        id = 286,
        name = "Grand Black War Mammoth",
        icon = 236237,
        itemId = 43959,
        spellId = 61465,
        source = {
          mapId = 624,
          uiMapIds = {
            156
          },
          allowedDifficultyIds = {
            3,
            4
          },
          factionMask = -2,
          journalEncounter = {
            id = 1599,
            name = "Koralon the Flame Watcher",
            instanceId = 753,
            uiMapId = 156
          },
          dungeonEncounter = {
            id = 1128,
            name = "Koralon the Flame Watcher",
            mapId = 624
          }
        }
      },
      {
        id = 286,
        name = "Grand Black War Mammoth",
        icon = 236237,
        itemId = 43959,
        spellId = 61465,
        source = {
          mapId = 624,
          uiMapIds = {
            156
          },
          allowedDifficultyIds = {
            3,
            4
          },
          factionMask = -2,
          journalEncounter = {
            id = 1600,
            name = "Toravon the Ice Watcher",
            instanceId = 753,
            uiMapId = 156
          },
          dungeonEncounter = {
            id = 1129,
            name = "Toravon the Ice Watcher",
            mapId = 624
          }
        }
      },
      {
        id = 287,
        name = "Grand Black War Mammoth",
        icon = 236237,
        itemId = 44083,
        spellId = 61467,
        source = {
          mapId = 624,
          uiMapIds = {
            156
          },
          allowedDifficultyIds = {
            3,
            4
          },
          factionMask = -3,
          journalEncounter = {
            id = 1597,
            name = "Archavon the Stone Watcher",
            instanceId = 753,
            uiMapId = 156
          },
          dungeonEncounter = {
            id = 1126,
            name = "Archavon the Stone Watcher",
            mapId = 624
          }
        }
      },
      {
        id = 287,
        name = "Grand Black War Mammoth",
        icon = 236237,
        itemId = 44083,
        spellId = 61467,
        source = {
          mapId = 624,
          uiMapIds = {
            156
          },
          allowedDifficultyIds = {
            3,
            4
          },
          factionMask = -3,
          journalEncounter = {
            id = 1598,
            name = "Emalon the Storm Watcher",
            instanceId = 753,
            uiMapId = 156
          },
          dungeonEncounter = {
            id = 1127,
            name = "Emalon the Storm Watcher",
            mapId = 624
          }
        }
      },
      {
        id = 287,
        name = "Grand Black War Mammoth",
        icon = 236237,
        itemId = 44083,
        spellId = 61467,
        source = {
          mapId = 624,
          uiMapIds = {
            156
          },
          allowedDifficultyIds = {
            3,
            4
          },
          factionMask = -3,
          journalEncounter = {
            id = 1599,
            name = "Koralon the Flame Watcher",
            instanceId = 753,
            uiMapId = 156
          },
          dungeonEncounter = {
            id = 1128,
            name = "Koralon the Flame Watcher",
            mapId = 624
          }
        }
      },
      {
        id = 287,
        name = "Grand Black War Mammoth",
        icon = 236237,
        itemId = 44083,
        spellId = 61467,
        source = {
          mapId = 624,
          uiMapIds = {
            156
          },
          allowedDifficultyIds = {
            3,
            4
          },
          factionMask = -3,
          journalEncounter = {
            id = 1600,
            name = "Toravon the Ice Watcher",
            instanceId = 753,
            uiMapId = 156
          },
          dungeonEncounter = {
            id = 1129,
            name = "Toravon the Ice Watcher",
            mapId = 624
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Vault of Archavon"
    },
    expansion = 2
  },
  {
    id = 52,
    mounts = {
      {
        id = 293,
        name = "Black Dragonhawk Mount",
        icon = 0,
        itemId = 0,
        spellId = 62048,
        source = {
          mapId = 0,
          uiMapIds = {
            1446
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Doomwalker"
          },
          note = "World boss near Caverns of Time. Spawns during WoW Anniversary."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Doomwalker",
      npcID = 17711
    },
    expansion = 1
  },
  {
    id = 53,
    mounts = {
      {
        id = 293,
        name = "Black Dragonhawk Mount",
        icon = 0,
        itemId = 0,
        spellId = 62048,
        source = {
          mapId = 0,
          uiMapIds = {
            1446
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Historian Ma'di"
          },
          note = "Anniversary vendor near Caverns of Time.",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Historian Ma'di",
      npcID = 158061
    },
    expansion = 1
  },
  {
    id = 54,
    mounts = {
      {
        id = 294,
        name = "Stormwind Steed",
        icon = 132261,
        itemId = 45125,
        spellId = 63232,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Corporal Arthur Flew"
          },
          note = "Argent Tournament — Alliance racial",
          cost = {
            type = "currency",
            amount = 100,
            currencyId = 241
          }
        }
      },
      {
        id = 321,
        name = "Swift Gray Steed",
        icon = 132261,
        itemId = 46752,
        spellId = 65640,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Corporal Arthur Flew"
          },
          note = "Argent Tournament — Alliance racial",
          costs = {
            {
              type = "gold",
              amount = 5000000
            },
            {
              type = "currency",
              amount = 5,
              currencyId = 241
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Corporal Arthur Flew",
      npcID = 33307
    },
    expansion = 2
  },
  {
    id = 55,
    mounts = {
      {
        id = 295,
        name = "Darkspear Raptor",
        icon = 132253,
        itemId = 45593,
        spellId = 63635,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Samamba"
          },
          note = "Argent Tournament — Troll",
          cost = {
            type = "currency",
            amount = 100,
            currencyId = 241
          }
        }
      },
      {
        id = 325,
        name = "Swift Purple Raptor",
        icon = 132253,
        itemId = 46743,
        spellId = 65644,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Samamba"
          },
          note = "Argent Tournament — Troll",
          costs = {
            {
              type = "gold",
              amount = 5000000
            },
            {
              type = "currency",
              amount = 5,
              currencyId = 241
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Samamba",
      npcID = 33554
    },
    expansion = 2
  },
  {
    id = 56,
    mounts = {
      {
        id = 296,
        name = "Ironforge Ram",
        icon = 132248,
        itemId = 45586,
        spellId = 63636,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Derrick Brindlebeard"
          },
          note = "Argent Tournament — Dwarf",
          cost = {
            type = "currency",
            amount = 100,
            currencyId = 241
          }
        }
      },
      {
        id = 324,
        name = "Swift Violet Ram",
        icon = 132248,
        itemId = 46748,
        spellId = 65643,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Derrick Brindlebeard"
          },
          note = "Argent Tournament — Dwarf",
          costs = {
            {
              type = "gold",
              amount = 5000000
            },
            {
              type = "currency",
              amount = 5,
              currencyId = 241
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Derrick Brindlebeard",
      npcID = 33310
    },
    expansion = 2
  },
  {
    id = 57,
    mounts = {
      {
        id = 297,
        name = "Darnassian Nightsaber",
        icon = 132267,
        itemId = 45591,
        spellId = 63637,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Rook Hawkfist"
          },
          note = "Argent Tournament — Night Elf",
          cost = {
            type = "currency",
            amount = 100,
            currencyId = 241
          }
        }
      },
      {
        id = 319,
        name = "Swift Moonsaber",
        icon = 132267,
        itemId = 46744,
        spellId = 65638,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Rook Hawkfist"
          },
          note = "Argent Tournament — Night Elf",
          costs = {
            {
              type = "gold",
              amount = 5000000
            },
            {
              type = "currency",
              amount = 5,
              currencyId = 241
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Rook Hawkfist",
      npcID = 33653
    },
    expansion = 2
  },
  {
    id = 58,
    mounts = {
      {
        id = 298,
        name = "Gnomeregan Mechanostrider",
        icon = 132247,
        itemId = 45589,
        spellId = 63638,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Rillie Spindlenut"
          },
          note = "Argent Tournament — Gnome",
          cost = {
            type = "currency",
            amount = 100,
            currencyId = 241
          }
        }
      },
      {
        id = 323,
        name = "Turbostrider",
        icon = 132247,
        itemId = 46747,
        spellId = 65642,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Rillie Spindlenut"
          },
          note = "Argent Tournament — Gnome",
          costs = {
            {
              type = "gold",
              amount = 5000000
            },
            {
              type = "currency",
              amount = 5,
              currencyId = 241
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Rillie Spindlenut",
      npcID = 33650
    },
    expansion = 2
  },
  {
    id = 59,
    mounts = {
      {
        id = 299,
        name = "Exodar Elekk",
        icon = 132257,
        itemId = 45590,
        spellId = 63639,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Irisee"
          },
          note = "Argent Tournament — Draenei",
          cost = {
            type = "currency",
            amount = 100,
            currencyId = 241
          }
        }
      },
      {
        id = 318,
        name = "Great Red Elekk",
        icon = 132257,
        itemId = 46745,
        spellId = 65637,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Irisee"
          },
          note = "Argent Tournament — Draenei",
          costs = {
            {
              type = "gold",
              amount = 5000000
            },
            {
              type = "currency",
              amount = 5,
              currencyId = 241
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Irisee",
      npcID = 33657
    },
    expansion = 2
  },
  {
    id = 60,
    mounts = {
      {
        id = 300,
        name = "Orgrimmar Wolf",
        icon = 132224,
        itemId = 45595,
        spellId = 63640,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Freka Bloodaxe"
          },
          note = "Argent Tournament — Orc",
          cost = {
            type = "currency",
            amount = 100,
            currencyId = 241
          }
        }
      },
      {
        id = 327,
        name = "Swift Burgundy Wolf",
        icon = 132224,
        itemId = 46749,
        spellId = 65646,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Freka Bloodaxe"
          },
          note = "Argent Tournament — Orc",
          costs = {
            {
              type = "gold",
              amount = 5000000
            },
            {
              type = "currency",
              amount = 5,
              currencyId = 241
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Freka Bloodaxe",
      npcID = 33553
    },
    expansion = 2
  },
  {
    id = 61,
    mounts = {
      {
        id = 301,
        name = "Thunder Bluff Kodo",
        icon = 132243,
        itemId = 45592,
        spellId = 63641,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Doru Thunderhorn"
          },
          note = "Argent Tournament — Tauren",
          cost = {
            type = "currency",
            amount = 100,
            currencyId = 241
          }
        }
      },
      {
        id = 322,
        name = "Great Golden Kodo",
        icon = 132243,
        itemId = 46750,
        spellId = 65641,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Doru Thunderhorn"
          },
          note = "Argent Tournament — Tauren",
          costs = {
            {
              type = "gold",
              amount = 5000000
            },
            {
              type = "currency",
              amount = 5,
              currencyId = 241
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Doru Thunderhorn",
      npcID = 33556
    },
    expansion = 2
  },
  {
    id = 62,
    mounts = {
      {
        id = 302,
        name = "Silvermoon Hawkstrider",
        icon = 132236,
        itemId = 45596,
        spellId = 63642,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Trellis Morningsun"
          },
          note = "Argent Tournament — Blood Elf",
          cost = {
            type = "currency",
            amount = 100,
            currencyId = 241
          }
        }
      },
      {
        id = 320,
        name = "Swift Red Hawkstrider",
        icon = 132236,
        itemId = 46751,
        spellId = 65639,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Trellis Morningsun"
          },
          note = "Argent Tournament — Blood Elf",
          costs = {
            {
              type = "gold",
              amount = 5000000
            },
            {
              type = "currency",
              amount = 5,
              currencyId = 241
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Trellis Morningsun",
      npcID = 33557
    },
    expansion = 2
  },
  {
    id = 63,
    mounts = {
      {
        id = 303,
        name = "Forsaken Warhorse",
        icon = 132264,
        itemId = 45597,
        spellId = 63643,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Eliza Killian"
          },
          note = "Argent Tournament — Forsaken",
          cost = {
            type = "currency",
            amount = 100,
            currencyId = 241
          }
        }
      },
      {
        id = 326,
        name = "White Skeletal Warhorse",
        icon = 132264,
        itemId = 46746,
        spellId = 65645,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Eliza Killian"
          },
          note = "Argent Tournament — Forsaken",
          costs = {
            {
              type = "gold",
              amount = 5000000
            },
            {
              type = "currency",
              amount = 5,
              currencyId = 241
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Eliza Killian",
      npcID = 33555
    },
    expansion = 2
  },
  {
    id = 64,
    mounts = {
      {
        id = 304,
        name = "Mimiron's Head",
        icon = 133861,
        itemId = 45693,
        spellId = 63796,
        source = {
          mapId = 603,
          uiMapIds = {
            150
          },
          allowedDifficultyIds = {
            4
          },
          note = "Defeat Yogg-Saron without the assistance of any Keepers in order for this mount to drop.",
          journalEncounter = {
            id = 1649,
            name = "Yogg-Saron",
            instanceId = 759,
            uiMapId = 150
          },
          dungeonEncounter = {
            id = 1143,
            name = "Yogg-Saron",
            mapId = 603
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Ulduar"
    },
    expansion = 2
  },
  {
    id = 65,
    mounts = {
      {
        id = 305,
        name = "Argent Hippogryph",
        icon = 132265,
        itemId = 45725,
        spellId = 63844,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Faction Quartermasters"
          },
          note = "Argent Tournament faction quartermasters.",
          cost = {
            type = "currency",
            amount = 150,
            currencyId = 241
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Faction Quartermasters"
    },
    expansion = 2
  },
  {
    id = 66,
    mounts = {
      {
        id = 311,
        name = "Venomhide Ravasaur",
        icon = 132253,
        itemId = 46102,
        spellId = 64659,
        source = {
          mapId = 0,
          uiMapIds = {
            1449
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "They Grow Up So Fast (Un'Goro)"
          },
          note = "Venomhide Ravasaur daily quest chain."
        }
      }
    },
    source = {
      type = "Quest",
      name = "They Grow Up So Fast (Un'Goro)"
    },
    expansion = 2
  },
  {
    id = 67,
    mounts = {
      {
        id = 329,
        name = "Silver Covenant Hippogryph",
        icon = 132265,
        itemId = 46813,
        spellId = 66087,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Hiren Loresong"
          },
          note = "Argent Tournament — Silver Covenant",
          cost = {
            type = "currency",
            amount = 150,
            currencyId = 241
          }
        }
      },
      {
        id = 331,
        name = "Quel'dorei Steed",
        icon = 132261,
        itemId = 46815,
        spellId = 66090,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Hiren Loresong"
          },
          note = "Argent Tournament — Silver Covenant",
          cost = {
            type = "currency",
            amount = 100,
            currencyId = 241
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Hiren Loresong",
      npcID = 34881
    },
    expansion = 2
  },
  {
    id = 68,
    mounts = {
      {
        id = 330,
        name = "Sunreaver Dragonhawk",
        icon = 132188,
        itemId = 46814,
        spellId = 66088,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Vasarin Redmorn"
          },
          note = "Argent Tournament — Sunreavers",
          cost = {
            type = "currency",
            amount = 150,
            currencyId = 241
          }
        }
      },
      {
        id = 332,
        name = "Sunreaver Hawkstrider",
        icon = 132236,
        itemId = 46816,
        spellId = 66091,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Vasarin Redmorn"
          },
          note = "Argent Tournament — Sunreavers",
          cost = {
            type = "currency",
            amount = 100,
            currencyId = 241
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Vasarin Redmorn",
      npcID = 34772
    },
    expansion = 2
  },
  {
    id = 69,
    mounts = {
      {
        id = 338,
        name = "Argent Charger",
        icon = 132226,
        itemId = 47179,
        spellId = 66906,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dame Evniki Kapsalis"
          },
          note = "Argent Tournament — Crusade Quartermaster",
          cost = {
            type = "currency",
            amount = 100,
            currencyId = 241
          }
        }
      },
      {
        id = 341,
        name = "Argent Warhorse",
        icon = 132261,
        itemId = 47180,
        spellId = 67466,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dame Evniki Kapsalis"
          },
          note = "Argent Tournament — Crusade Quartermaster",
          cost = {
            type = "currency",
            amount = 100,
            currencyId = 241
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Dame Evniki Kapsalis",
      npcID = 34885
    },
    expansion = 2
  },
  {
    id = 70,
    mounts = {
      {
        id = 349,
        name = "Onyxian Drake",
        icon = 254650,
        itemId = 49636,
        spellId = 69395,
        source = {
          mapId = 249,
          uiMapIds = {
            248
          },
          allowedDifficultyIds = {
            3,
            4
          },
          journalEncounter = {
            id = 1651,
            name = "Onyxia",
            instanceId = 760,
            uiMapId = 248
          },
          dungeonEncounter = {
            id = 1084,
            name = "Onyxia",
            mapId = 249
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Onyxia's Lair"
    },
    expansion = 0
  },
  {
    id = 71,
    mounts = {
      {
        id = 352,
        name = "X-45 Heartbreaker",
        icon = 135448,
        itemId = 50250,
        spellId = 71342,
        source = {
          mapId = 0,
          uiMapIds = {
            1421
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Heart-Shaped Box"
          },
          note = "Love is in the Air daily reward from Shadowfang Keep."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Heart-Shaped Box"
    },
    expansion = 2
  },
  {
    id = 72,
    mounts = {
      {
        id = 363,
        name = "Invincible",
        icon = 345787,
        itemId = 50818,
        spellId = 72286,
        source = {
          mapId = 631,
          uiMapIds = {
            192
          },
          allowedDifficultyIds = {
            6
          },
          journalEncounter = {
            id = 1636,
            name = "The Lich King",
            instanceId = 758,
            uiMapId = 192
          },
          dungeonEncounter = {
            id = 1106,
            name = "The Lich King",
            mapId = 631
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Icecrown Citadel"
    },
    expansion = 2
  },
  {
    id = 73,
    mounts = {
      {
        id = 366,
        name = "Crimson Deathcharger",
        icon = 237534,
        itemId = 52200,
        spellId = 73313,
        source = {
          mapId = 0,
          uiMapIds = {
            118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Mograine's Reunion"
          },
          note = "Final quest in the Shadowmourne legendary chain."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Mograine's Reunion"
    },
    expansion = 2
  },
  {
    id = 74,
    mounts = {
      {
        id = 1884,
        name = "Drake of the North Wind",
        icon = 461144,
        itemId = 63040,
        spellId = 88742,
        source = {
          mapId = 657,
          uiMapIds = {
            325
          },
          allowedDifficultyIds = {
            1,
            2
          },
          journalEncounter = {
            id = 115,
            name = "Altairus",
            instanceId = 68,
            uiMapId = 325
          },
          dungeonEncounter = {
            id = 1041,
            name = "Altairus",
            mapId = 657
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "The Vortex Pinnacle"
    },
    expansion = 3
  },
  {
    id = 75,
    mounts = {
      {
        id = 1885,
        name = "Drake of the South Wind",
        icon = 461145,
        itemId = 63041,
        spellId = 88744,
        source = {
          mapId = 754,
          uiMapIds = {
            328
          },
          allowedDifficultyIds = {
            3,
            4,
            5,
            6
          },
          journalEncounter = {
            id = 155,
            name = "Al'Akir",
            instanceId = 74,
            uiMapId = 328
          },
          dungeonEncounter = {
            id = 1034,
            name = "Al'Akir",
            mapId = 754
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Throne of the Four Winds"
    },
    expansion = 3
  },
  {
    id = 76,
    mounts = {
      {
        id = 1886,
        name = "Vitreous Stone Drake",
        icon = 461139,
        itemId = 63043,
        spellId = 88746,
        source = {
          mapId = 725,
          uiMapIds = {
            324
          },
          allowedDifficultyIds = {
            1,
            2
          },
          journalEncounter = {
            id = 111,
            name = "Slabhide",
            instanceId = 67,
            uiMapId = 324
          },
          dungeonEncounter = {
            id = 1059,
            name = "Slabhide",
            mapId = 725
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "The Stonecore"
    },
    expansion = 3
  },
  {
    id = 77,
    mounts = {
      {
        id = 1899,
        name = "Armored Razzashi Raptor",
        icon = 132253,
        itemId = 68823,
        spellId = 96491,
        source = {
          mapId = 859,
          uiMapIds = {
            337
          },
          allowedDifficultyIds = {
            2
          },
          journalEncounter = {
            id = 176,
            name = "Bloodlord Mandokir",
            instanceId = 76,
            uiMapId = 337
          },
          dungeonEncounter = {
            id = 1179,
            name = "Bloodlord Mandokir",
            mapId = 859
          }
        }
      },
      {
        id = 1900,
        name = "Swift Zulian Panther",
        icon = 132225,
        itemId = 68824,
        spellId = 96499,
        source = {
          mapId = 859,
          uiMapIds = {
            337
          },
          allowedDifficultyIds = {
            2
          },
          journalEncounter = {
            id = 181,
            name = "High Priestess Kilnara",
            instanceId = 76,
            uiMapId = 337
          },
          dungeonEncounter = {
            id = 1180,
            name = "High Priestess Kilnara",
            mapId = 859
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "Zul'Gurub"
    },
    expansion = 3
  },
  {
    id = 78,
    mounts = {
      {
        id = 1904,
        name = "Pureblood Fire Hawk",
        icon = 134337,
        itemId = 69224,
        spellId = 97493,
        source = {
          mapId = 720,
          uiMapIds = {
            369
          },
          allowedDifficultyIds = {
            3,
            4,
            5,
            6
          },
          journalEncounter = {
            id = 198,
            name = "Ragnaros",
            instanceId = 78,
            uiMapId = 369
          },
          dungeonEncounter = {
            id = 1203,
            name = "Ragnaros",
            mapId = 720
          }
        }
      },
      {
        id = 1914,
        name = "Flametalon of Alysrazor",
        icon = 526578,
        itemId = 71665,
        spellId = 101542,
        source = {
          mapId = 720,
          uiMapIds = {
            367
          },
          allowedDifficultyIds = {
            3,
            4,
            5,
            6
          },
          journalEncounter = {
            id = 194,
            name = "Alysrazor",
            instanceId = 78,
            uiMapId = 367
          },
          dungeonEncounter = {
            id = 1205,
            name = "Shannox",
            mapId = 720
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Firelands"
    },
    expansion = 3
  },
  {
    id = 79,
    mounts = {
      {
        id = 1931,
        name = "Blazing Drake",
        icon = 236234,
        itemId = 77067,
        spellId = 107842,
        source = {
          mapId = 967,
          uiMapIds = {
            415
          },
          allowedDifficultyIds = {
            3,
            4,
            5,
            6
          },
          journalEncounter = {
            id = 333,
            name = "Madness of Deathwing",
            instanceId = 187,
            uiMapId = 415
          },
          dungeonEncounter = {
            id = 1299,
            name = "Madness of Deathwing",
            mapId = 967
          }
        }
      },
      {
        id = 1933,
        name = "Life-Binder's Handmaiden",
        icon = 236234,
        itemId = 77069,
        spellId = 107845,
        source = {
          mapId = 967,
          uiMapIds = {
            415
          },
          allowedDifficultyIds = {
            5,
            6
          },
          journalEncounter = {
            id = 333,
            name = "Madness of Deathwing",
            instanceId = 187,
            uiMapId = 415
          },
          dungeonEncounter = {
            id = 1299,
            name = "Madness of Deathwing",
            mapId = 967
          }
        }
      },
      {
        id = 1934,
        name = "Experiment 12-B",
        icon = 236235,
        itemId = 78919,
        spellId = 110039,
        source = {
          mapId = 967,
          uiMapIds = {
            409
          },
          allowedDifficultyIds = {
            3,
            4,
            5,
            6
          },
          journalEncounter = {
            id = 331,
            name = "Ultraxion",
            instanceId = 187,
            uiMapId = 409
          },
          dungeonEncounter = {
            id = 1297,
            name = "Ultraxion",
            mapId = 967
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Dragon Soul"
    },
    expansion = 3
  }
}

MRPData.Steps = steps
