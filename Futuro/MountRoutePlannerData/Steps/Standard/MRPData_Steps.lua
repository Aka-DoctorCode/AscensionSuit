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
            56
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
            56
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
        itemId = 2414,
        spellId = 472,
        source = {
          mapId = 0,
          uiMapIds = {
            37
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
            37
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
            37
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
            37
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
            37
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
        itemId = 1132,
        spellId = 580,
        source = {
          mapId = 0,
          uiMapIds = {
            85
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
            85
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
            85
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
            85
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
            85
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
            85
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
            27
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
            27
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
            27
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
            27
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
            27
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
            27
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
            89
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
            89
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
            89
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
            89
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
            89
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
            89
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
            89
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
            1
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
            1
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
            1
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
            1
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
            1
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
            1
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
            27
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
            27
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
            27
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
            27
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
            27
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
            27
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
            27
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
            83
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
            18
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
            18
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
            18
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
            18
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
            18
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
            18
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
            18
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
            1,
            24
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
        id = 69,
        name = "Rivendare's Deathcharger",
        icon = 132264,
        itemId = 13335,
        spellId = 17481,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      },
      {
        id = 185,
        name = "Raven Lord",
        icon = 132372,
        itemId = 32768,
        spellId = 41252,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      },
      {
        id = 213,
        name = "Swift White Hawkstrider",
        icon = 132237,
        itemId = 35513,
        spellId = 46628,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      },
      {
        id = 264,
        name = "Blue Proto-Drake",
        icon = 236233,
        itemId = 44151,
        spellId = 59996,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      },
      {
        id = 278,
        name = "Green Proto-Drake",
        icon = 236233,
        itemId = 44707,
        spellId = 61294,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      },
      {
        id = 395,
        name = "Drake of the North Wind",
        icon = 461144,
        itemId = 63040,
        spellId = 88742,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      },
      {
        id = 397,
        name = "Vitreous Stone Drake",
        icon = 461139,
        itemId = 63043,
        spellId = 88746,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      },
      {
        id = 410,
        name = "Armored Razzashi Raptor",
        icon = 132253,
        itemId = 68823,
        spellId = 96491,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      },
      {
        id = 411,
        name = "Swift Zulian Panther",
        icon = 132225,
        itemId = 68824,
        spellId = 96499,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      },
      {
        id = 781,
        name = "Infinite Timereaver",
        icon = 298656,
        itemId = 133543,
        spellId = 201098,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      },
      {
        id = 875,
        name = "Midnight",
        icon = 1338623,
        itemId = 142236,
        spellId = 229499,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      },
      {
        id = 995,
        name = "Sharkbait",
        icon = 134059,
        itemId = 159842,
        spellId = 254813,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      },
      {
        id = 1040,
        name = "Tomb Stalker",
        icon = 1908013,
        itemId = 159921,
        spellId = 266058,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      },
      {
        id = 1053,
        name = "Underrot Crawg",
        icon = 1017860,
        itemId = 160829,
        spellId = 273541,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      },
      {
        id = 1252,
        name = "Mechagon Peacekeeper",
        icon = 2620862,
        itemId = 168826,
        spellId = 299158,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      },
      {
        id = 1406,
        name = "Marrowfang",
        icon = 3849264,
        itemId = 181819,
        spellId = 336036,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      },
      {
        id = 1481,
        name = "Cartel Master's Gearglider",
        icon = 3802393,
        itemId = 186638,
        spellId = 353263,
        source = {
          mapId = 2579,
          uiMapIds = {
            2194
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:208216::::::::80:::::\124h[Reins of the Quantum Courser]\124h\124r.",
          journalEncounter = {
            id = 2538,
            name = "Chrono-Lord Deios",
            instanceId = 1209,
            uiMapId = 2194
          },
          dungeonEncounter = {
            id = 2673,
            name = "Chrono-Lord Deios",
            mapId = 2579
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "Dawn of the Infinite"
    },
    expansion = 9
  },
  {
    id = 12,
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
            7
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
            7
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
            7
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
            7
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
            7
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
            7
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
    id = 13,
    mounts = {
      {
        id = 993,
        name = "Squawks",
        icon = 1716281,
        itemId = 163586,
        spellId = 254811,
        source = {
          mapId = 0,
          uiMapIds = {
            1161
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Island Expeditions"
          },
          note = "Random mount drops from Island Expedition completions."
        }
      },
      {
        id = 1169,
        name = "Surf Jelly",
        icon = 237321,
        itemId = 163585,
        spellId = 278979,
        source = {
          mapId = 0,
          uiMapIds = {
            1161
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Island Expeditions"
          },
          note = "Random mount drops from Island Expedition completions."
        }
      },
      {
        id = 1175,
        name = "Twilight Avenger",
        icon = 236235,
        itemId = 163584,
        spellId = 279466,
        source = {
          mapId = 0,
          uiMapIds = {
            1161
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Island Expeditions"
          },
          note = "Random mount drops from Island Expedition completions."
        }
      },
      {
        id = 1176,
        name = "Craghorn Chasm-Leaper",
        icon = 797882,
        itemId = 163583,
        spellId = 279467,
        source = {
          mapId = 0,
          uiMapIds = {
            1161
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Island Expeditions"
          },
          note = "Random mount drops from Island Expedition completions."
        }
      },
      {
        id = 1178,
        name = "Qinsho's Eternal Hound",
        icon = 625905,
        itemId = 163582,
        spellId = 279469,
        source = {
          mapId = 0,
          uiMapIds = {
            1161
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Island Expeditions"
          },
          note = "Random mount drops from Island Expedition completions."
        }
      },
      {
        id = 1209,
        name = "Stonehide Elderhorn",
        icon = 1508511,
        itemId = 166470,
        spellId = 288712,
        source = {
          mapId = 0,
          uiMapIds = {
            1161
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Island Expeditions"
          },
          note = "Random mount drops from Island Expedition completions."
        }
      },
      {
        id = 1211,
        name = "Bloodgorged Hunter",
        icon = 0,
        itemId = 166468,
        spellId = 288720,
        source = {
          mapId = 0,
          uiMapIds = {
            1161
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Island Expeditions"
          },
          note = "Random mount drops from Island Expedition completions."
        }
      },
      {
        id = 1212,
        name = "Island Thunderscale",
        icon = 1610629,
        itemId = 166467,
        spellId = 288721,
        source = {
          mapId = 0,
          uiMapIds = {
            1161
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Island Expeditions"
          },
          note = "Random mount drops from Island Expedition completions."
        }
      },
      {
        id = 1213,
        name = "Risen Mare",
        icon = 132264,
        itemId = 166466,
        spellId = 288722,
        source = {
          mapId = 0,
          uiMapIds = {
            1161
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Island Expeditions"
          },
          note = "Random mount drops from Island Expedition completions."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Island Expeditions"
    },
    expansion = 7
  },
  {
    id = 14,
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
            84
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
            type = "item",
            amount = 15,
            itemId = 137642
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
            84
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
            type = "item",
            amount = 15,
            itemId = 137642
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
            84
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
            type = "item",
            amount = 15,
            itemId = 137642
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
            84
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
            type = "item",
            amount = 15,
            itemId = 137642
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
            84
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
            type = "item",
            amount = 15,
            itemId = 137642
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
    id = 15,
    mounts = {
      {
        id = 76,
        name = "Black War Kodo",
        icon = 132243,
        itemId = 18247,
        spellId = 22718,
        source = {
          mapId = 0,
          uiMapIds = {
            85
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
            type = "item",
            amount = 15,
            itemId = 137642
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
            85
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
            type = "item",
            amount = 15,
            itemId = 137642
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
            85
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
            type = "item",
            amount = 15,
            itemId = 137642
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
            85
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
            type = "item",
            amount = 15,
            itemId = 137642
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
            85
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
            type = "item",
            amount = 15,
            itemId = 137642
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
    id = 16,
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
            25
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
            amount = 15,
            itemId = 137642
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
    id = 17,
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
            25
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
            amount = 15,
            itemId = 137642
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
    id = 18,
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
            9,
            18
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
            9,
            18
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
            9,
            18
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
            9,
            18
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
    id = 19,
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
            210
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
    id = 20,
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
            84
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
            84
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
            84
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
            84
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
            84
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
            84
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
            84
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
    id = 21,
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
            85
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
            85
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
            85
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
            85
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
            85
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
            85
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
    id = 22,
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
            94
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
            94
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
            94
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
            94
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
            94
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
            94
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
            94
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
    id = 23,
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
            103
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
            103
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
            103
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
            103
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
            103
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
            103
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
            107
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
            107
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
    id = 25,
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
            107
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
            107
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
            107
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
            107
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
            107
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
            107
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
            107
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
            107
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
            107
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
            107
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
    id = 27,
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
            107
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
            107
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
            107
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
            107
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
            107
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
            107
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
            107
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
            107
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
    id = 28,
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
    id = 29,
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
            108
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
            108
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
            108
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
            108
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
            108
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
    id = 30,
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
    id = 31,
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
    id = 32,
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
            104
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
    id = 33,
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
            104
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
    id = 34,
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
            104
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
    id = 35,
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
            104
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
    id = 36,
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
            104
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
    id = 37,
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
            104
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
    id = 38,
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
            32
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
            32
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
    id = 39,
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
            102
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
    id = 40,
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
    id = 41,
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
            18
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
      },
      {
        id = 2623,
        name = "The Headless Horseman's Ghoulish Charger",
        icon = 7096232,
        itemId = 247721,
        spellId = 1245198,
        source = {
          mapId = 0,
          uiMapIds = {
            18
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
    id = 42,
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
            23
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
    id = 43,
    mounts = {
      {
        id = 237,
        name = "White Polar Bear",
        icon = 236245,
        itemId = 43962,
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
    id = 44,
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
    id = 45,
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
    id = 46,
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
    id = 47,
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
    id = 48,
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
            type = "item",
            amount = 15,
            itemId = 137642
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
    id = 49,
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
            type = "item",
            amount = 15,
            itemId = 137642
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
    id = 50,
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
    id = 51,
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
    id = 52,
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
            id = 2029,
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
    id = 53,
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
    id = 54,
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
    id = 55,
    mounts = {
      {
        id = 293,
        name = "Illidari Doomhawk",
        icon = 132188,
        itemId = 186469,
        spellId = 62048,
        source = {
          mapId = 0,
          uiMapIds = {
            71
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
      },
      {
        id = 1798,
        name = "Azure Worldchiller",
        icon = 5260432,
        itemId = 208572,
        spellId = 420097,
        source = {
          mapId = 0,
          uiMapIds = {
            71
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
    id = 56,
    mounts = {
      {
        id = 293,
        name = "Illidari Doomhawk",
        icon = 132188,
        itemId = 186469,
        spellId = 62048,
        source = {
          mapId = 0,
          uiMapIds = {
            71
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
      },
      {
        id = 1798,
        name = "Azure Worldchiller",
        icon = 5260432,
        itemId = 208572,
        spellId = 420097,
        source = {
          mapId = 0,
          uiMapIds = {
            71
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
    id = 57,
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
    id = 58,
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
    id = 59,
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
    id = 60,
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
    id = 61,
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
    id = 62,
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
    id = 63,
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
    id = 64,
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
    id = 65,
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
    id = 66,
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
    id = 67,
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
            14,
            33
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
    id = 68,
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
    id = 69,
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
            78
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
    id = 70,
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
    id = 71,
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
    id = 72,
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
    id = 73,
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
    id = 74,
    mounts = {
      {
        id = 352,
        name = "X-45 Heartbreaker",
        icon = 4254090,
        itemId = 50250,
        spellId = 71342,
        source = {
          mapId = 0,
          uiMapIds = {
            21
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
    id = 75,
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
    id = 76,
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
    id = 77,
    mounts = {
      {
        id = 373,
        name = "Vashj'ir Seahorse",
        icon = 433440,
        itemId = 54465,
        spellId = 75207,
        source = {
          mapId = 0,
          uiMapIds = {
            201
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "The Abyssal Ride"
          },
          note = "Introductory quest in Vashj'ir zone."
        }
      }
    },
    source = {
      type = "Quest",
      name = "The Abyssal Ride"
    },
    expansion = 3
  },
  {
    id = 78,
    mounts = {
      {
        id = 388,
        name = "Goblin Trike",
        icon = 134237,
        itemId = 62461,
        spellId = 87090,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Kall Worthaton"
          },
          note = "Goblin Trike vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 389,
        name = "Goblin Turbo-Trike",
        icon = 134238,
        itemId = 62462,
        spellId = 87091,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Kall Worthaton"
          },
          note = "Goblin Trike vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Kall Worthaton",
      npcID = 48510
    },
    expansion = 3
  },
  {
    id = 79,
    mounts = {
      {
        id = 393,
        name = "Phosphorescent Stone Drake",
        icon = 461141,
        itemId = 63042,
        spellId = 88718,
        source = {
          mapId = 0,
          uiMapIds = {
            207
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Aeonaxx"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Aeonaxx",
      npcID = 50062
    },
    expansion = 3
  },
  {
    id = 80,
    mounts = {
      {
        id = 394,
        name = "Drake of the West Wind",
        icon = 461143,
        itemId = 63039,
        spellId = 88741,
        source = {
          mapId = 0,
          uiMapIds = {
            245
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Quartermaster Brazie"
          },
          cost = {
            type = "currency",
            amount = 165,
            currencyId = 391
          }
        }
      },
      {
        id = 405,
        name = "Spectral Steed",
        icon = 464161,
        itemId = 64998,
        spellId = 92231,
        source = {
          mapId = 0,
          uiMapIds = {
            245
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Quartermaster Brazie"
          },
          cost = {
            type = "currency",
            amount = 165,
            currencyId = 391
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Quartermaster Brazie",
      npcID = 47328
    },
    expansion = 3
  },
  {
    id = 81,
    mounts = {
      {
        id = 395,
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
    id = 82,
    mounts = {
      {
        id = 396,
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
    id = 83,
    mounts = {
      {
        id = 397,
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
    id = 84,
    mounts = {
      {
        id = 398,
        name = "Brown Riding Camel",
        icon = 454771,
        itemId = 63044,
        spellId = 88748,
        source = {
          mapId = 0,
          uiMapIds = {
            249
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Blacksmith Abasi"
          },
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      },
      {
        id = 399,
        name = "Tan Riding Camel",
        icon = 454773,
        itemId = 63045,
        spellId = 88749,
        source = {
          mapId = 0,
          uiMapIds = {
            249
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Blacksmith Abasi"
          },
          cost = {
            type = "gold",
            amount = 1000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Blacksmith Abasi",
      npcID = 48617
    },
    expansion = 3
  },
  {
    id = 85,
    mounts = {
      {
        id = 400,
        name = "Grey Riding Camel",
        icon = 454772,
        itemId = 63046,
        spellId = 88750,
        source = {
          mapId = 0,
          uiMapIds = {
            249
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Dormus the Camel-Hoarder"
          },
          note = "Accessed via Mysterious Camel Figurines in Uldum."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Dormus the Camel-Hoarder",
      npcID = 50245
    },
    expansion = 3
  },
  {
    id = 86,
    mounts = {
      {
        id = 401,
        name = "Dark Phoenix",
        icon = 464141,
        itemId = 63125,
        spellId = 88990,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Guild Vendors"
          },
          note = "Requires Guild Level 25. Available from guild vendors in major cities.",
          cost = {
            type = "gold",
            amount = 30000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Guild Vendors"
    },
    expansion = 3
  },
  {
    id = 87,
    mounts = {
      {
        id = 406,
        name = "Spectral Wolf",
        icon = 464162,
        itemId = 64999,
        spellId = 92232,
        source = {
          mapId = 0,
          uiMapIds = {
            245
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Pogg"
          },
          cost = {
            type = "currency",
            amount = 165,
            currencyId = 391
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Pogg",
      npcID = 48531
    },
    expansion = 3
  },
  {
    id = 88,
    mounts = {
      {
        id = 409,
        name = "Kor'kron Annihilator",
        icon = 464143,
        itemId = 67107,
        spellId = 93644,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Goram"
          },
          note = "Horde guild mount vendor",
          cost = {
            type = "gold",
            amount = 15000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Goram",
      npcID = 46572
    },
    expansion = 4
  },
  {
    id = 89,
    mounts = {
      {
        id = 410,
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
        id = 411,
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
    id = 90,
    mounts = {
      {
        id = 415,
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
            14,
            15,
            33
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
        id = 425,
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
            14,
            15,
            33
          },
          journalEncounter = {
            id = 194,
            name = "Alysrazor",
            instanceId = 78,
            uiMapId = 367
          },
          dungeonEncounter = {
            id = 1206,
            name = "Alysrazor",
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
    id = 91,
    mounts = {
      {
        id = 419,
        name = "Amani Battle Bear",
        icon = 132117,
        itemId = 69747,
        spellId = 98204,
        source = {
          mapId = 568,
          uiMapIds = {
            333
          },
          allowedDifficultyIds = {
            2
          },
          note = "In order for Kasha's Bag to drop, you must complete the timed event in under 45 minutes.",
          journalEncounter = {
            id = 189,
            name = "Halazzi",
            instanceId = 77,
            uiMapId = 333
          },
          dungeonEncounter = {
            id = 1192,
            name = "Halazzi",
            mapId = 568
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "Zul'Aman"
    },
    expansion = 3
  },
  {
    id = 92,
    mounts = {
      {
        id = 420,
        name = "Subdued Seahorse",
        icon = 433440,
        itemId = 67151,
        spellId = 98718,
        source = {
          mapId = 0,
          uiMapIds = {
            205
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Poseidus"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Poseidus",
      npcID = 50005
    },
    expansion = 3
  },
  {
    id = 93,
    mounts = {
      {
        id = 429,
        name = "Swift Forest Strider",
        icon = 132198,
        itemId = 72140,
        spellId = 102346,
        source = {
          mapId = 0,
          uiMapIds = {
            407
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lhara"
          },
          note = "Darkmoon Faire souvenir vendor",
          cost = {
            type = "currency",
            amount = 180,
            currencyId = 515
          }
        }
      },
      {
        id = 434,
        name = "Darkmoon Dancing Bear",
        icon = 132183,
        itemId = 73766,
        spellId = 103081,
        source = {
          mapId = 0,
          uiMapIds = {
            407
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lhara"
          },
          note = "Darkmoon Faire souvenir vendor",
          cost = {
            type = "currency",
            amount = 180,
            currencyId = 515
          }
        }
      },
      {
        id = 962,
        name = "Darkmoon Dirigible",
        icon = 1519491,
        itemId = 153485,
        spellId = 247448,
        source = {
          mapId = 0,
          uiMapIds = {
            407
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lhara"
          },
          note = "Darkmoon Faire souvenir vendor",
          cost = {
            type = "currency",
            amount = 1000,
            currencyId = 515
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Lhara",
      npcID = 14846
    },
    expansion = 3
  },
  {
    id = 94,
    mounts = {
      {
        id = 430,
        name = "Swift Springstrider",
        icon = 132198,
        itemId = 72145,
        spellId = 102349,
        source = {
          mapId = 0,
          uiMapIds = {
            1
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Noblegarden Merchant"
          },
          note = "Available during Noblegarden event.",
          cost = {
            type = "item",
            amount = 500,
            itemId = 44791
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Noblegarden Merchant",
      npcID = 32837
    },
    expansion = 1
  },
  {
    id = 95,
    mounts = {
      {
        id = 431,
        name = "Swift Lovebird",
        icon = 132198,
        itemId = 72146,
        spellId = 102350,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lovely Merchant (Alliance)"
          },
          note = "Love is in the Air seasonal vendor.",
          cost = {
            type = "item",
            amount = 270,
            itemId = 49927
          }
        }
      },
      {
        id = 1941,
        name = "Heartseeker Mana Ray",
        icon = 1570762,
        itemId = 210973,
        spellId = 427777,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lovely Merchant (Alliance)"
          },
          note = "Love is in the Air seasonal vendor.",
          cost = {
            type = "item",
            amount = 270,
            itemId = 49927
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Lovely Merchant (Alliance)",
      npcID = 37674
    },
    expansion = 4
  },
  {
    id = 96,
    mounts = {
      {
        id = 431,
        name = "Swift Lovebird",
        icon = 132198,
        itemId = 72146,
        spellId = 102350,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lovely Merchant (Horde)"
          },
          note = "Love is in the Air seasonal vendor.",
          cost = {
            type = "item",
            amount = 270,
            itemId = 49927
          }
        }
      },
      {
        id = 1941,
        name = "Heartseeker Mana Ray",
        icon = 1570762,
        itemId = 210973,
        spellId = 427777,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lovely Merchant (Horde)"
          },
          note = "Love is in the Air seasonal vendor.",
          cost = {
            type = "item",
            amount = 270,
            itemId = 49927
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Lovely Merchant (Horde)",
      npcID = 37674
    },
    expansion = 4
  },
  {
    id = 97,
    mounts = {
      {
        id = 435,
        name = "Mountain Horse",
        icon = 132261,
        itemId = 73838,
        spellId = 103195,
        source = {
          mapId = 0,
          uiMapIds = {
            89
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Astrid Langstrump"
          },
          note = "Mountain Horse vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 436,
        name = "Swift Mountain Horse",
        icon = 132261,
        itemId = 73839,
        spellId = 103196,
        source = {
          mapId = 0,
          uiMapIds = {
            89
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Astrid Langstrump"
          },
          note = "Mountain Horse vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Astrid Langstrump",
      npcID = 55285
    },
    expansion = 3
  },
  {
    id = 98,
    mounts = {
      {
        id = 442,
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
        id = 444,
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
        id = 445,
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
  },
  {
    id = 99,
    mounts = {
      {
        id = 448,
        name = "Jade Cloud Serpent",
        icon = 656172,
        itemId = 79802,
        spellId = 113199,
        source = {
          mapId = 0,
          uiMapIds = {
            371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Riding the Skies"
          },
          note = "Order of the Cloud Serpent questline reward.",
          questChain = {
            {
              questID = 30134,
              name = "Wild Things",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30135,
              name = "Beating the Odds",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30136,
              name = "Empty Nests",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30137,
              name = "Egg Collection",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30138,
              name = "Choosing the One",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30139,
              name = "The Rider's Journey",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30142,
              name = "It's A...",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30143,
              name = "They Grow Like Weeds",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30144,
              name = "Flight Training: Ring Round-Up",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30145,
              name = "Flight Training: Full Speed Ahead",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30187,
              name = "Flight Training: In Due Course",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30188,
              name = "Riding the Skies",
              x = 56.8,
              y = 45.1,
              mapID = 371
            }
          }
        }
      },
      {
        id = 464,
        name = "Azure Cloud Serpent",
        icon = 656171,
        itemId = 85430,
        spellId = 123992,
        source = {
          mapId = 0,
          uiMapIds = {
            371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Riding the Skies"
          },
          note = "Order of the Cloud Serpent questline reward.",
          questChain = {
            {
              questID = 30134,
              name = "Wild Things",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30135,
              name = "Beating the Odds",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30136,
              name = "Empty Nests",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30137,
              name = "Egg Collection",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30138,
              name = "Choosing the One",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30139,
              name = "The Rider's Journey",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30142,
              name = "It's A...",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30143,
              name = "They Grow Like Weeds",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30144,
              name = "Flight Training: Ring Round-Up",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30145,
              name = "Flight Training: Full Speed Ahead",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30187,
              name = "Flight Training: In Due Course",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30188,
              name = "Riding the Skies",
              x = 56.8,
              y = 45.1,
              mapID = 371
            }
          }
        }
      },
      {
        id = 465,
        name = "Golden Cloud Serpent",
        icon = 656175,
        itemId = 85429,
        spellId = 123993,
        source = {
          mapId = 0,
          uiMapIds = {
            371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Riding the Skies"
          },
          note = "Order of the Cloud Serpent questline reward.",
          questChain = {
            {
              questID = 30134,
              name = "Wild Things",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30135,
              name = "Beating the Odds",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30136,
              name = "Empty Nests",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30137,
              name = "Egg Collection",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30138,
              name = "Choosing the One",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30139,
              name = "The Rider's Journey",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30142,
              name = "It's A...",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30143,
              name = "They Grow Like Weeds",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30144,
              name = "Flight Training: Ring Round-Up",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30145,
              name = "Flight Training: Full Speed Ahead",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30187,
              name = "Flight Training: In Due Course",
              x = 56.8,
              y = 45.1,
              mapID = 371
            },
            {
              questID = 30188,
              name = "Riding the Skies",
              x = 56.8,
              y = 45.1,
              mapID = 371
            }
          }
        }
      }
    },
    source = {
      type = "Quest",
      name = "Riding the Skies"
    },
    expansion = 4
  },
  {
    id = 100,
    mounts = {
      {
        id = 449,
        name = "Azure Water Strider",
        icon = 648868,
        itemId = 81354,
        spellId = 118089,
        source = {
          mapId = 0,
          uiMapIds = {
            418
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Nat Pagle"
          },
          cost = {
            type = "gold",
            amount = 44444444
          }
        }
      },
      {
        id = 488,
        name = "Crimson Water Strider",
        icon = 648868,
        itemId = 87791,
        spellId = 127271,
        source = {
          mapId = 0,
          uiMapIds = {
            418
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Nat Pagle"
          },
          cost = {
            type = "gold",
            amount = 44444444
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Nat Pagle",
      npcID = 63721
    },
    expansion = 4
  },
  {
    id = 101,
    mounts = {
      {
        id = 452,
        name = "Green Dragon Turtle",
        icon = 657917,
        itemId = 82765,
        spellId = 120395,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Turtlemaster Odai"
          },
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 453,
        name = "Great Red Dragon Turtle",
        icon = 656349,
        itemId = 82811,
        spellId = 120822,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Turtlemaster Odai"
          },
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 492,
        name = "Black Dragon Turtle",
        icon = 656342,
        itemId = 87795,
        spellId = 127286,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Turtlemaster Odai"
          },
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 493,
        name = "Blue Dragon Turtle",
        icon = 656343,
        itemId = 87796,
        spellId = 127287,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Turtlemaster Odai"
          },
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 494,
        name = "Brown Dragon Turtle",
        icon = 656344,
        itemId = 87797,
        spellId = 127288,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Turtlemaster Odai"
          },
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 495,
        name = "Purple Dragon Turtle",
        icon = 657918,
        itemId = 87799,
        spellId = 127289,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Turtlemaster Odai"
          },
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 496,
        name = "Red Dragon Turtle",
        icon = 657919,
        itemId = 87800,
        spellId = 127290,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Turtlemaster Odai"
          },
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 497,
        name = "Great Green Dragon Turtle",
        icon = 607883,
        itemId = 87801,
        spellId = 127293,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Turtlemaster Odai"
          },
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 498,
        name = "Great Black Dragon Turtle",
        icon = 656345,
        itemId = 87802,
        spellId = 127295,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Turtlemaster Odai"
          },
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 499,
        name = "Great Blue Dragon Turtle",
        icon = 656346,
        itemId = 87803,
        spellId = 127302,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Turtlemaster Odai"
          },
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 500,
        name = "Great Brown Dragon Turtle",
        icon = 656347,
        itemId = 87804,
        spellId = 127308,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Turtlemaster Odai"
          },
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 501,
        name = "Great Purple Dragon Turtle",
        icon = 656348,
        itemId = 87805,
        spellId = 127310,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Turtlemaster Odai"
          },
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Turtlemaster Odai",
      npcID = 66022
    },
    expansion = 4
  },
  {
    id = 102,
    mounts = {
      {
        id = 452,
        name = "Green Dragon Turtle",
        icon = 657917,
        itemId = 82765,
        spellId = 120395,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Old Whitenose"
          },
          note = "Pandaren Dragon Turtle vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 453,
        name = "Great Red Dragon Turtle",
        icon = 656349,
        itemId = 82811,
        spellId = 120822,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Old Whitenose"
          },
          note = "Pandaren Dragon Turtle vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 492,
        name = "Black Dragon Turtle",
        icon = 656342,
        itemId = 87795,
        spellId = 127286,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Old Whitenose"
          },
          note = "Pandaren Dragon Turtle vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 493,
        name = "Blue Dragon Turtle",
        icon = 656343,
        itemId = 87796,
        spellId = 127287,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Old Whitenose"
          },
          note = "Pandaren Dragon Turtle vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 494,
        name = "Brown Dragon Turtle",
        icon = 656344,
        itemId = 87797,
        spellId = 127288,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Old Whitenose"
          },
          note = "Pandaren Dragon Turtle vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 495,
        name = "Purple Dragon Turtle",
        icon = 657918,
        itemId = 87799,
        spellId = 127289,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Old Whitenose"
          },
          note = "Pandaren Dragon Turtle vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 496,
        name = "Red Dragon Turtle",
        icon = 657919,
        itemId = 87800,
        spellId = 127290,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Old Whitenose"
          },
          note = "Pandaren Dragon Turtle vendor",
          cost = {
            type = "gold",
            amount = 10000
          }
        }
      },
      {
        id = 497,
        name = "Great Green Dragon Turtle",
        icon = 607883,
        itemId = 87801,
        spellId = 127293,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Old Whitenose"
          },
          note = "Pandaren Dragon Turtle vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 498,
        name = "Great Black Dragon Turtle",
        icon = 656345,
        itemId = 87802,
        spellId = 127295,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Old Whitenose"
          },
          note = "Pandaren Dragon Turtle vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 499,
        name = "Great Blue Dragon Turtle",
        icon = 656346,
        itemId = 87803,
        spellId = 127302,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Old Whitenose"
          },
          note = "Pandaren Dragon Turtle vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 500,
        name = "Great Brown Dragon Turtle",
        icon = 656347,
        itemId = 87804,
        spellId = 127308,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Old Whitenose"
          },
          note = "Pandaren Dragon Turtle vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      },
      {
        id = 501,
        name = "Great Purple Dragon Turtle",
        icon = 656348,
        itemId = 87805,
        spellId = 127310,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Old Whitenose"
          },
          note = "Pandaren Dragon Turtle vendor",
          cost = {
            type = "gold",
            amount = 100000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Old Whitenose",
      npcID = 65068
    },
    expansion = 4
  },
  {
    id = 103,
    mounts = {
      {
        id = 460,
        name = "Grand Expedition Yak",
        icon = 616692,
        itemId = 84101,
        spellId = 122708,
        source = {
          mapId = 0,
          uiMapIds = {
            379
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Uncle Bigpocket"
          },
          note = "Grand Expedition Yak and riding yak vendor",
          cost = {
            type = "gold",
            amount = 1200000000
          }
        }
      },
      {
        id = 486,
        name = "Grey Riding Yak",
        icon = 656546,
        itemId = 87788,
        spellId = 127216,
        source = {
          mapId = 0,
          uiMapIds = {
            379
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Uncle Bigpocket"
          },
          note = "Grand Expedition Yak and riding yak vendor",
          cost = {
            type = "gold",
            amount = 30000000
          }
        }
      },
      {
        id = 487,
        name = "Blonde Riding Yak",
        icon = 656545,
        itemId = 87789,
        spellId = 127220,
        source = {
          mapId = 0,
          uiMapIds = {
            379
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Uncle Bigpocket"
          },
          note = "Grand Expedition Yak and riding yak vendor",
          cost = {
            type = "gold",
            amount = 30000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Uncle Bigpocket",
      npcID = 64518
    },
    expansion = 4
  },
  {
    id = 104,
    mounts = {
      {
        id = 463,
        name = "Amber Scorpion",
        icon = 620833,
        itemId = 85262,
        spellId = 123886,
        source = {
          mapId = 0,
          uiMapIds = {
            422
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Ambersmith Zikk"
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
      name = "Ambersmith Zikk",
      npcID = 64599
    },
    expansion = 4
  },
  {
    id = 105,
    mounts = {
      {
        id = 466,
        name = "Thundering Jade Cloud Serpent",
        icon = 656173,
        itemId = 85666,
        spellId = 124408,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Shay Pressler (Alliance)"
          },
          cost = {
            type = "gold",
            amount = 30000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Shay Pressler (Alliance)",
      npcID = 46602
    },
    expansion = 4
  },
  {
    id = 106,
    mounts = {
      {
        id = 466,
        name = "Thundering Jade Cloud Serpent",
        icon = 656173,
        itemId = 85666,
        spellId = 124408,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Goram (Horde)"
          },
          cost = {
            type = "gold",
            amount = 30000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Goram (Horde)",
      npcID = 46572
    },
    expansion = 4
  },
  {
    id = 107,
    mounts = {
      {
        id = 471,
        name = "Onyx Cloud Serpent",
        icon = 656171,
        itemId = 87768,
        spellId = 127154,
        source = {
          mapId = 0,
          uiMapIds = {
            388
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Surprise Attack!"
          },
          note = "Shado-Pan reputation quest chain reward."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Surprise Attack!"
    },
    expansion = 4
  },
  {
    id = 108,
    mounts = {
      {
        id = 473,
        name = "Heavenly Onyx Cloud Serpent",
        icon = 656169,
        itemId = 87771,
        spellId = 127158,
        source = {
          mapId = 870,
          uiMapIds = {
            379
          },
          allowedDifficultyIds = {
            -1
          },
          bonusRoll = true,
          journalEncounter = {
            id = 691,
            name = "Sha of Anger",
            instanceId = 322,
            uiMapId = 379
          }
        }
      }
    },
    source = {
      type = "WorldBoss",
      name = "Sha of Anger",
      npcID = 60491
    },
    expansion = 4
  },
  {
    id = 109,
    mounts = {
      {
        id = 475,
        name = "Heavenly Golden Cloud Serpent",
        icon = 901300,
        itemId = 87774,
        spellId = 127164,
        source = {
          mapId = 0,
          uiMapIds = {
            554
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Mistweaver Ku"
          },
          note = "Requires Guild Glory of the Pandaria Raider.",
          cost = {
            type = "gold",
            amount = 100000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Mistweaver Ku",
      npcID = 73306
    },
    expansion = 4
  },
  {
    id = 110,
    mounts = {
      {
        id = 476,
        name = "Yu'lei, Daughter of Jade",
        icon = 620831,
        itemId = 87775,
        spellId = 127165,
        source = {
          mapId = 0,
          uiMapIds = {
            554
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Mistweaver Xia"
          },
          note = "Timewalking vendor",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      },
      {
        id = 2474,
        name = "Copper-Maned Quilen",
        icon = 644374,
        itemId = 234740,
        spellId = 1214974,
        source = {
          mapId = 0,
          uiMapIds = {
            554
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Mistweaver Xia"
          },
          note = "Timewalking vendor",
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
      name = "Mistweaver Xia",
      npcID = 118828
    },
    expansion = 4
  },
  {
    id = 111,
    mounts = {
      {
        id = 478,
        name = "Astral Cloud Serpent",
        icon = 656166,
        itemId = 87777,
        spellId = 127170,
        source = {
          mapId = 1008,
          uiMapIds = {
            473
          },
          allowedDifficultyIds = {
            3,
            4,
            5,
            6,
            7
          },
          journalEncounter = {
            id = 726,
            name = "Elegon",
            instanceId = 317,
            uiMapId = 473
          },
          dungeonEncounter = {
            id = 1500,
            name = "Elegon",
            mapId = 1008
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Mogu'shan Vaults"
    },
    expansion = 4
  },
  {
    id = 112,
    mounts = {
      {
        id = 479,
        name = "Azure Riding Crane",
        icon = 656318,
        itemId = 87781,
        spellId = 127174,
        source = {
          mapId = 0,
          uiMapIds = {
            390
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Jaluu the Generous"
          },
          cost = {
            type = "gold",
            amount = 5000000
          }
        }
      },
      {
        id = 480,
        name = "Golden Riding Crane",
        icon = 605484,
        itemId = 87782,
        spellId = 127176,
        source = {
          mapId = 0,
          uiMapIds = {
            390
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Jaluu the Generous"
          },
          cost = {
            type = "gold",
            amount = 25000000
          }
        }
      },
      {
        id = 481,
        name = "Regal Riding Crane",
        icon = 656319,
        itemId = 87783,
        spellId = 127177,
        source = {
          mapId = 0,
          uiMapIds = {
            390
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Jaluu the Generous"
          },
          cost = {
            type = "gold",
            amount = 15000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Jaluu the Generous",
      npcID = 59908
    },
    expansion = 4
  },
  {
    id = 113,
    mounts = {
      {
        id = 503,
        name = "Crimson Pandaren Phoenix",
        icon = 657490,
        itemId = 89154,
        spellId = 129552,
        source = {
          mapId = 0,
          uiMapIds = {
            390
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Kai Featherfall"
          },
          cost = {
            type = "item",
            amount = 1,
            itemId = 90045
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Kai Featherfall",
      npcID = 66973
    },
    expansion = 4
  },
  {
    id = 114,
    mounts = {
      {
        id = 504,
        name = "Thundering August Cloud Serpent",
        icon = 656174,
        itemId = 89304,
        spellId = 129918,
        source = {
          mapId = 0,
          uiMapIds = {
            390
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Sage Whiteheart (Alliance)"
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
      name = "Sage Whiteheart (Alliance)",
      npcID = 64032
    },
    expansion = 4
  },
  {
    id = 115,
    mounts = {
      {
        id = 504,
        name = "Thundering August Cloud Serpent",
        icon = 656174,
        itemId = 89304,
        spellId = 129918,
        source = {
          mapId = 0,
          uiMapIds = {
            390
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Sage Lotusbloom (Horde)"
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
      name = "Sage Lotusbloom (Horde)",
      npcID = 64001
    },
    expansion = 4
  },
  {
    id = 116,
    mounts = {
      {
        id = 505,
        name = "Green Shado-Pan Riding Tiger",
        icon = 642579,
        itemId = 89305,
        spellId = 129932,
        source = {
          mapId = 0,
          uiMapIds = {
            388
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Rushi the Fox"
          },
          cost = {
            type = "gold",
            amount = 15000000
          }
        }
      },
      {
        id = 506,
        name = "Blue Shado-Pan Riding Tiger",
        icon = 642579,
        itemId = 89307,
        spellId = 129934,
        source = {
          mapId = 0,
          uiMapIds = {
            388
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Rushi the Fox"
          },
          cost = {
            type = "gold",
            amount = 5000000
          }
        }
      },
      {
        id = 507,
        name = "Red Shado-Pan Riding Tiger",
        icon = 642579,
        itemId = 89306,
        spellId = 129935,
        source = {
          mapId = 0,
          uiMapIds = {
            388
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Rushi the Fox"
          },
          cost = {
            type = "gold",
            amount = 25000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Rushi the Fox",
      npcID = 64595
    },
    expansion = 4
  },
  {
    id = 117,
    mounts = {
      {
        id = 508,
        name = "Brown Riding Goat",
        icon = 656321,
        itemId = 89362,
        spellId = 130086,
        source = {
          mapId = 0,
          uiMapIds = {
            376
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Gina Mudclaw"
          },
          cost = {
            type = "gold",
            amount = 4444444
          }
        }
      },
      {
        id = 510,
        name = "White Riding Goat",
        icon = 656322,
        itemId = 89390,
        spellId = 130137,
        source = {
          mapId = 0,
          uiMapIds = {
            376
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Gina Mudclaw"
          },
          cost = {
            type = "gold",
            amount = 28888888
          }
        }
      },
      {
        id = 511,
        name = "Black Riding Goat",
        icon = 656320,
        itemId = 89391,
        spellId = 130138,
        source = {
          mapId = 0,
          uiMapIds = {
            376
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Gina Mudclaw"
          },
          cost = {
            type = "gold",
            amount = 13333333
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Gina Mudclaw",
      npcID = 58706
    },
    expansion = 4
  },
  {
    id = 118,
    mounts = {
      {
        id = 509,
        name = "Red Flying Cloud",
        icon = 652810,
        itemId = 89363,
        spellId = 130092,
        source = {
          mapId = 0,
          uiMapIds = {
            390
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tan Shin Tiao"
          },
          cost = {
            type = "gold",
            amount = 6000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Tan Shin Tiao",
      npcID = 64605
    },
    expansion = 4
  },
  {
    id = 119,
    mounts = {
      {
        id = 515,
        name = "Son of Galleon",
        icon = 646378,
        itemId = 89783,
        spellId = 130965,
        source = {
          mapId = 870,
          uiMapIds = {
            376
          },
          allowedDifficultyIds = {
            -1
          },
          bonusRoll = true,
          journalEncounter = {
            id = 725,
            name = "Salyis's Warband",
            instanceId = 322,
            uiMapId = 376
          }
        }
      }
    },
    source = {
      type = "WorldBoss",
      name = "Salyis's Warband",
      npcID = 62346,
      targetName = "Galleon"
    },
    expansion = 4
  },
  {
    id = 120,
    mounts = {
      {
        id = 656,
        name = "Llothien Prowler",
        icon = 1338908,
        itemId = 116793,
        spellId = 171850,
        source = {
          mapId = 0,
          uiMapIds = {
            680
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Volpin the Elusive"
          },
          note = "Requires defeating Llothien Prowler-related rare."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Volpin the Elusive"
    },
    expansion = 6
  },
  {
    id = 121,
    mounts = {
      {
        id = 517,
        name = "Thundering Ruby Cloud Serpent",
        icon = 648628,
        itemId = 90655,
        spellId = 132036,
        source = {
          mapId = 0,
          uiMapIds = {
            390
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Alani"
          },
          note = "Requires 10 Skyshards combined into a Sky Crystal to remove Alani's shield."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Alani",
      npcID = 64403
    },
    expansion = 4
  },
  {
    id = 122,
    mounts = {
      {
        id = 526,
        name = "Grand Armored Gryphon",
        icon = 773275,
        itemId = 93168,
        spellId = 135416,
        source = {
          mapId = 0,
          uiMapIds = {
            418
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Agent Malley"
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
      name = "Agent Malley",
      npcID = 69059
    },
    expansion = 4
  },
  {
    id = 123,
    mounts = {
      {
        id = 527,
        name = "Grand Armored Wyvern",
        icon = 773277,
        itemId = 93169,
        spellId = 135418,
        source = {
          mapId = 0,
          uiMapIds = {
            418
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tuskripper Grukna"
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
      name = "Tuskripper Grukna",
      npcID = 69060
    },
    expansion = 4
  },
  {
    id = 124,
    mounts = {
      {
        id = 528,
        name = "Grand Gryphon",
        icon = 773274,
        itemId = 93385,
        spellId = 136163,
        source = {
          mapId = 0,
          uiMapIds = {
            379
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "The Silence"
          },
          note = "August Celestials questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "The Silence"
    },
    expansion = 4
  },
  {
    id = 125,
    mounts = {
      {
        id = 529,
        name = "Grand Wyvern",
        icon = 773276,
        itemId = 93386,
        spellId = 136164,
        source = {
          mapId = 0,
          uiMapIds = {
            379
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Breath of Darkest Shadow"
          },
          note = "August Celestials questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Breath of Darkest Shadow"
    },
    expansion = 4
  },
  {
    id = 126,
    mounts = {
      {
        id = 531,
        name = "Spawn of Horridon",
        icon = 791593,
        itemId = 93666,
        spellId = 136471,
        source = {
          mapId = 1098,
          uiMapIds = {
            509
          },
          allowedDifficultyIds = {
            3,
            4,
            5,
            6
          },
          journalEncounter = {
            id = 819,
            name = "Horridon",
            instanceId = 362,
            uiMapId = 509
          },
          dungeonEncounter = {
            id = 1575,
            name = "Horridon",
            mapId = 1098
          }
        }
      },
      {
        id = 543,
        name = "Clutch of Ji-Kun",
        icon = 800879,
        itemId = 95059,
        spellId = 139448,
        source = {
          mapId = 1098,
          uiMapIds = {
            511
          },
          allowedDifficultyIds = {
            3,
            4,
            5,
            6
          },
          journalEncounter = {
            id = 828,
            name = "Ji-Kun",
            instanceId = 362,
            uiMapId = 511
          },
          dungeonEncounter = {
            id = 1573,
            name = "Ji-Kun",
            mapId = 1098
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Throne of Thunder"
    },
    expansion = 4
  },
  {
    id = 127,
    mounts = {
      {
        id = 533,
        name = "Cobalt Primordial Direhorn",
        icon = 838685,
        itemId = 94228,
        spellId = 138423,
        source = {
          mapId = 870,
          uiMapIds = {
            507
          },
          allowedDifficultyIds = {
            -1
          },
          bonusRoll = true,
          journalEncounter = {
            id = 826,
            name = "Oondasta",
            instanceId = 322,
            uiMapId = 507
          }
        }
      }
    },
    source = {
      type = "WorldBoss",
      name = "Oondasta",
      npcID = 69161
    },
    expansion = 4
  },
  {
    id = 128,
    mounts = {
      {
        id = 534,
        name = "Amber Primordial Direhorn",
        icon = 838688,
        itemId = 94230,
        spellId = 138424,
        source = {
          mapId = 0,
          uiMapIds = {
            371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Zandalari Warbringer"
          },
          note = "Spawns in multiple zones. Drops one of three Primordial Direhorn colors."
        }
      },
      {
        id = 535,
        name = "Slate Primordial Direhorn",
        icon = 838687,
        itemId = 94229,
        spellId = 138425,
        source = {
          mapId = 0,
          uiMapIds = {
            371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Zandalari Warbringer"
          },
          note = "Spawns in multiple zones. Drops one of three Primordial Direhorn colors."
        }
      },
      {
        id = 536,
        name = "Jade Primordial Direhorn",
        icon = 838686,
        itemId = 94231,
        spellId = 138426,
        source = {
          mapId = 0,
          uiMapIds = {
            371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Zandalari Warbringer"
          },
          note = "Spawns in multiple zones. Drops one of three Primordial Direhorn colors."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Zandalari Warbringer",
      npcID = 69769
    },
    expansion = 4
  },
  {
    id = 129,
    mounts = {
      {
        id = 537,
        name = "Bone-White Primal Raptor",
        icon = 838684,
        itemId = 94290,
        spellId = 138640,
        source = {
          mapId = 0,
          uiMapIds = {
            507
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "A Mountain of Giant Dinosaur Bones"
          },
          note = "Collect 9999 Giant Dinosaur Bones on Isle of Giants."
        }
      }
    },
    source = {
      type = "Quest",
      name = "A Mountain of Giant Dinosaur Bones"
    },
    expansion = 4
  },
  {
    id = 130,
    mounts = {
      {
        id = 538,
        name = "Red Primal Raptor",
        icon = 132193,
        itemId = 94291,
        spellId = 138641,
        source = {
          mapId = 0,
          uiMapIds = {
            507
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Cracked Primal Egg"
          },
          note = "Drops from Zandalari Dinomancers. Hatches after 3 days."
        }
      },
      {
        id = 539,
        name = "Black Primal Raptor",
        icon = 838683,
        itemId = 94292,
        spellId = 138642,
        source = {
          mapId = 0,
          uiMapIds = {
            507
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Cracked Primal Egg"
          },
          note = "Drops from Zandalari Dinomancers. Hatches after 3 days."
        }
      },
      {
        id = 540,
        name = "Green Primal Raptor",
        icon = 132253,
        itemId = 94293,
        spellId = 138643,
        source = {
          mapId = 0,
          uiMapIds = {
            507
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Cracked Primal Egg"
          },
          note = "Drops from Zandalari Dinomancers. Hatches after 3 days."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Cracked Primal Egg"
    },
    expansion = 4
  },
  {
    id = 131,
    mounts = {
      {
        id = 542,
        name = "Thundering Cobalt Cloud Serpent",
        icon = 838689,
        itemId = 95057,
        spellId = 139442,
        source = {
          mapId = 1064,
          uiMapIds = {
            504
          },
          allowedDifficultyIds = {
            -1
          },
          bonusRoll = true,
          journalEncounter = {
            id = 814,
            name = "Nalak, The Storm Lord",
            instanceId = 322,
            uiMapId = 504
          }
        }
      }
    },
    source = {
      type = "WorldBoss",
      name = "Nalak, The Storm Lord",
      npcID = 69099,
      targetName = "Nalak"
    },
    expansion = 4
  },
  {
    id = 132,
    mounts = {
      {
        id = 545,
        name = "Golden Primal Direhorn",
        icon = 840402,
        itemId = 95564,
        spellId = 140249,
        source = {
          mapId = 0,
          uiMapIds = {
            504
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Hiren Loresong (Isle of Thunder)"
          },
          note = "Kirin Tor Offensive mount vendor",
          cost = {
            type = "gold",
            amount = 30000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Hiren Loresong (Isle of Thunder)",
      npcID = 68000
    },
    expansion = 4
  },
  {
    id = 133,
    mounts = {
      {
        id = 546,
        name = "Crimson Primal Direhorn",
        icon = 840403,
        itemId = 95565,
        spellId = 140250,
        source = {
          mapId = 0,
          uiMapIds = {
            504
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Vasarin Redmorn (Isle of Thunder)"
          },
          note = "Sunreaver Onslaught mount vendor",
          cost = {
            type = "gold",
            amount = 30000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Vasarin Redmorn (Isle of Thunder)",
      npcID = 67672
    },
    expansion = 4
  },
  {
    id = 134,
    mounts = {
      {
        id = 550,
        name = "Brawler's Burly Mushan Beast",
        icon = 646378,
        itemId = 98405,
        spellId = 142641,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Paul North"
          },
          note = "Brawler's Guild mount vendor",
          cost = {
            type = "gold",
            amount = 15000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Paul North",
      npcID = 68364
    },
    expansion = 7
  },
  {
    id = 135,
    mounts = {
      {
        id = 552,
        name = "Ironbound Wraithcharger",
        icon = 852890,
        itemId = 129744,
        spellId = 142910,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Auzin"
          },
          note = "Timewalking vendor",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      },
      {
        id = 2317,
        name = "Enchanted Spellweave Carpet",
        icon = 1029755,
        itemId = 231374,
        spellId = 468353,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Auzin"
          },
          note = "Timewalking vendor",
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
      name = "Auzin",
      npcID = 98690
    },
    expansion = 6
  },
  {
    id = 136,
    mounts = {
      {
        id = 554,
        name = "Vicious Kaldorei Warsaber",
        icon = 901174,
        itemId = 102514,
        spellId = 146615,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Necrolord Sipe"
          },
          note = "Vicious Saddle mounts (Alliance). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 640,
        name = "Vicious War Ram",
        icon = 132248,
        itemId = 116777,
        spellId = 171834,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Necrolord Sipe"
          },
          note = "Vicious Saddle mounts (Alliance). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 755,
        name = "Vicious War Mechanostrider",
        icon = 1113014,
        itemId = 124089,
        spellId = 183889,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Necrolord Sipe"
          },
          note = "Vicious Saddle mounts (Alliance). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 841,
        name = "Vicious Gilnean Warhorse",
        icon = 1418019,
        itemId = 140353,
        spellId = 223341,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Necrolord Sipe"
          },
          note = "Vicious Saddle mounts (Alliance). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 844,
        name = "Vicious War Elekk",
        icon = 1444270,
        itemId = 140350,
        spellId = 223578,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Necrolord Sipe"
          },
          note = "Vicious Saddle mounts (Alliance). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 873,
        name = "Vicious War Bear",
        icon = 1499689,
        itemId = 142234,
        spellId = 229487,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Necrolord Sipe"
          },
          note = "Vicious Saddle mounts (Alliance). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 876,
        name = "Vicious War Lion",
        icon = 1517168,
        itemId = 142237,
        spellId = 229512,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Necrolord Sipe"
          },
          note = "Vicious Saddle mounts (Alliance). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 900,
        name = "Vicious War Turtle",
        icon = 1537157,
        itemId = 143648,
        spellId = 232523,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Necrolord Sipe"
          },
          note = "Vicious Saddle mounts (Alliance). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 945,
        name = "Vicious War Fox",
        icon = 1608505,
        itemId = 152870,
        spellId = 242896,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Necrolord Sipe"
          },
          note = "Vicious Saddle mounts (Alliance). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 1027,
        name = "Vicious War Basilisk",
        icon = 1827500,
        itemId = 163122,
        spellId = 261433,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Necrolord Sipe"
          },
          note = "Vicious Saddle mounts (Alliance). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 1050,
        name = "Vicious War Riverbeast",
        icon = 2027020,
        itemId = 163123,
        spellId = 272481,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Necrolord Sipe"
          },
          note = "Vicious Saddle mounts (Alliance). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 1194,
        name = "Vicious White Warsaber",
        icon = 0,
        itemId = 173714,
        spellId = 281888,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Necrolord Sipe"
          },
          note = "Vicious Saddle mounts (Alliance). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 1195,
        name = "Vicious Black Warsaber",
        icon = 901174,
        itemId = 165019,
        spellId = 281887,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Necrolord Sipe"
          },
          note = "Vicious Saddle mounts (Alliance). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Necrolord Sipe",
      npcID = 73190
    },
    expansion = 4
  },
  {
    id = 137,
    mounts = {
      {
        id = 555,
        name = "Vicious Skeletal Warhorse",
        icon = 877361,
        itemId = 102533,
        spellId = 146622,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Deathguard Netharian"
          },
          note = "Vicious Saddle mounts (Horde). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 641,
        name = "Vicious War Raptor",
        icon = 1043774,
        itemId = 116778,
        spellId = 171835,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Deathguard Netharian"
          },
          note = "Vicious Saddle mounts (Horde). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 756,
        name = "Vicious War Kodo",
        icon = 1120007,
        itemId = 124540,
        spellId = 185052,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Deathguard Netharian"
          },
          note = "Vicious Saddle mounts (Horde). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 842,
        name = "Vicious War Trike",
        icon = 1408996,
        itemId = 140354,
        spellId = 223354,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Deathguard Netharian"
          },
          note = "Vicious Saddle mounts (Horde). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 843,
        name = "Vicious Warstrider",
        icon = 1417741,
        itemId = 140348,
        spellId = 223363,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Deathguard Netharian"
          },
          note = "Vicious Saddle mounts (Horde). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 874,
        name = "Vicious War Bear",
        icon = 1499690,
        itemId = 142235,
        spellId = 229486,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Deathguard Netharian"
          },
          note = "Vicious Saddle mounts (Horde). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 882,
        name = "Vicious War Scorpion",
        icon = 1522940,
        itemId = 142437,
        spellId = 230988,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Deathguard Netharian"
          },
          note = "Vicious Saddle mounts (Horde). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 901,
        name = "Vicious War Turtle",
        icon = 0,
        itemId = 143649,
        spellId = 232525,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Deathguard Netharian"
          },
          note = "Vicious Saddle mounts (Horde). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 946,
        name = "Vicious War Fox",
        icon = 1608506,
        itemId = 152869,
        spellId = 242897,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Deathguard Netharian"
          },
          note = "Vicious Saddle mounts (Horde). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 1026,
        name = "Vicious War Basilisk",
        icon = 1827501,
        itemId = 163121,
        spellId = 261434,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Deathguard Netharian"
          },
          note = "Vicious Saddle mounts (Horde). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 1045,
        name = "Vicious War Clefthoof",
        icon = 1982718,
        itemId = 163124,
        spellId = 270560,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Deathguard Netharian"
          },
          note = "Vicious Saddle mounts (Horde). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 1196,
        name = "Vicious Black Bonesteed",
        icon = 2238268,
        itemId = 165020,
        spellId = 281890,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Deathguard Netharian"
          },
          note = "Vicious Saddle mounts (Horde). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      },
      {
        id = 1197,
        name = "Vicious White Bonesteed",
        icon = 2238269,
        itemId = 173713,
        spellId = 281889,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Deathguard Netharian"
          },
          note = "Vicious Saddle mounts (Horde). The Vicious Saddle is earned from rated PvP — win ~100 rated arena/battleground matches (fewer at higher rating) during a PvP season to receive the saddle in the mail.",
          cost = {
            type = "item",
            amount = 1,
            itemId = 103533
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Deathguard Netharian",
      npcID = 73151
    },
    expansion = 4
  },
  {
    id = 138,
    mounts = {
      {
        id = 559,
        name = "Kor'kron Juggernaut",
        icon = 464143,
        itemId = 104253,
        spellId = 148417,
        source = {
          mapId = 1136,
          uiMapIds = {
            567
          },
          allowedDifficultyIds = {
            16
          },
          journalEncounter = {
            id = 869,
            name = "Garrosh Hellscream",
            instanceId = 369,
            uiMapId = 567
          },
          dungeonEncounter = {
            id = 1623,
            name = "Garrosh Hellscream",
            mapId = 1136
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Siege of Orgrimmar"
    },
    expansion = 4
  },
  {
    id = 139,
    mounts = {
      {
        id = 560,
        name = "Ashhide Mushan Beast",
        icon = 901299,
        itemId = 103638,
        spellId = 148428,
        source = {
          mapId = 0,
          uiMapIds = {
            554
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Speaker Gulan"
          },
          cost = {
            type = "currency",
            amount = 500,
            currencyId = 789
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Speaker Gulan",
      npcID = 73307
    },
    expansion = 4
  },
  {
    id = 140,
    mounts = {
      {
        id = 561,
        name = "Thundering Onyx Cloud Serpent",
        icon = 901301,
        itemId = 104269,
        spellId = 148476,
        source = {
          mapId = 0,
          uiMapIds = {
            554
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Huolon"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Huolon",
      npcID = 73167
    },
    expansion = 4
  },
  {
    id = 141,
    mounts = {
      {
        id = 608,
        name = "Witherhide Cliffstomper",
        icon = 1044794,
        itemId = 116655,
        spellId = 171616,
        source = {
          mapId = 0,
          uiMapIds = {
            582
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Trader Araanda"
          },
          cost = {
            type = "gold",
            amount = 200000000
          }
        }
      },
      {
        id = 620,
        name = "Rocktusk Battleboar",
        icon = 0,
        itemId = 116667,
        spellId = 171628,
        source = {
          mapId = 0,
          uiMapIds = {
            582
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Trader Araanda"
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
      name = "Trader Araanda",
      npcID = 95470
    },
    expansion = 5
  },
  {
    id = 142,
    mounts = {
      {
        id = 608,
        name = "Witherhide Cliffstomper",
        icon = 1044794,
        itemId = 116655,
        spellId = 171616,
        source = {
          mapId = 0,
          uiMapIds = {
            590
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Trader Darakk"
          },
          note = "Horde garrison Trading Post vendor",
          cost = {
            type = "gold",
            amount = 200000000
          }
        }
      },
      {
        id = 620,
        name = "Rocktusk Battleboar",
        icon = 0,
        itemId = 116667,
        spellId = 171628,
        source = {
          mapId = 0,
          uiMapIds = {
            590
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Trader Darakk"
          },
          note = "Horde garrison Trading Post vendor",
          cost = {
            type = "gold",
            amount = 100000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Trader Darakk",
      npcID = 95471
    },
    expansion = 5
  },
  {
    id = 143,
    mounts = {
      {
        id = 611,
        name = "Tundra Icehoof",
        icon = 0,
        itemId = 116658,
        spellId = 171619,
        source = {
          mapId = 0,
          uiMapIds = {
            534
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Vengeance, Deathtalon, Terrorfist, Doomroller"
          },
          note = "Rattling Iron Cage from any of the 4 Tanaan rares."
        }
      },
      {
        id = 622,
        name = "Armored Razorback",
        icon = 0,
        itemId = 116669,
        spellId = 171630,
        source = {
          mapId = 0,
          uiMapIds = {
            534
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Vengeance, Deathtalon, Terrorfist, Doomroller"
          },
          note = "Rattling Iron Cage from any of the 4 Tanaan rares."
        }
      },
      {
        id = 643,
        name = "Warsong Direfang",
        icon = 930076,
        itemId = 116780,
        spellId = 171837,
        source = {
          mapId = 0,
          uiMapIds = {
            534
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Vengeance, Deathtalon, Terrorfist, Doomroller"
          },
          note = "Rattling Iron Cage from any of the 4 Tanaan rares."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Vengeance, Deathtalon, Terrorfist, Doomroller"
    },
    expansion = 5
  },
  {
    id = 144,
    mounts = {
      {
        id = 612,
        name = "Bloodhoof Bull",
        icon = 0,
        itemId = 116659,
        spellId = 171620,
        source = {
          mapId = 0,
          uiMapIds = {
            550
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Nakk the Thunderer"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Nakk the Thunderer",
      npcID = 50990
    },
    expansion = 5
  },
  {
    id = 145,
    mounts = {
      {
        id = 613,
        name = "Ironhoof Destroyer",
        icon = 1045155,
        itemId = 116660,
        spellId = 171621,
        source = {
          mapId = 1205,
          uiMapIds = {
            600
          },
          allowedDifficultyIds = {
            16
          },
          journalEncounter = {
            id = 959,
            name = "Blackhand",
            instanceId = 457,
            uiMapId = 600
          },
          dungeonEncounter = {
            id = 1704,
            name = "Blackhand",
            mapId = 1205
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Blackrock Foundry"
    },
    expansion = 5
  },
  {
    id = 146,
    mounts = {
      {
        id = 614,
        name = "Mottled Meadowstomper",
        icon = 1031305,
        itemId = 116661,
        spellId = 171622,
        source = {
          mapId = 0,
          uiMapIds = {
            550
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Luk'hok"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Luk'hok",
      npcID = 50981
    },
    expansion = 5
  },
  {
    id = 147,
    mounts = {
      {
        id = 615,
        name = "Trained Meadowstomper",
        icon = 0,
        itemId = 116662,
        spellId = 171623,
        source = {
          mapId = 0,
          uiMapIds = {
            590
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Garrison Stables"
          },
          note = "Garrison Stables daily quest chains. Requires level 3 Stables building."
        }
      },
      {
        id = 628,
        name = "Trained Rocktusk",
        icon = 0,
        itemId = 116675,
        spellId = 171637,
        source = {
          mapId = 0,
          uiMapIds = {
            590
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Garrison Stables"
          },
          note = "Garrison Stables daily quest chains. Requires level 3 Stables building."
        }
      },
      {
        id = 629,
        name = "Trained Riverwallow",
        icon = 1044490,
        itemId = 116676,
        spellId = 171638,
        source = {
          mapId = 0,
          uiMapIds = {
            590
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Garrison Stables"
          },
          note = "Garrison Stables daily quest chains. Requires level 3 Stables building."
        }
      },
      {
        id = 647,
        name = "Trained Snarler",
        icon = 0,
        itemId = 116784,
        spellId = 171841,
        source = {
          mapId = 0,
          uiMapIds = {
            590
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Garrison Stables"
          },
          note = "Garrison Stables daily quest chains. Requires level 3 Stables building."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Garrison Stables"
    },
    expansion = 5
  },
  {
    id = 148,
    mounts = {
      {
        id = 616,
        name = "Shadowhide Pearltusk",
        icon = 0,
        itemId = 116663,
        spellId = 171624,
        source = {
          mapId = 0,
          uiMapIds = {
            534
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Invader's Forgotten Treasure"
          },
          note = "Found in chests from Tanaan Jungle rare kills."
        }
      },
      {
        id = 626,
        name = "Giant Coldsnout",
        icon = 0,
        itemId = 116673,
        spellId = 171635,
        source = {
          mapId = 0,
          uiMapIds = {
            534
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Invader's Forgotten Treasure"
          },
          note = "Found in chests from Tanaan Jungle rare kills."
        }
      },
      {
        id = 642,
        name = "Garn Steelmaw",
        icon = 930079,
        itemId = 116779,
        spellId = 171836,
        source = {
          mapId = 0,
          uiMapIds = {
            534
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Invader's Forgotten Treasure"
          },
          note = "Found in chests from Tanaan Jungle rare kills."
        }
      },
      {
        id = 649,
        name = "Smoky Direwolf",
        icon = 0,
        itemId = 116786,
        spellId = 171843,
        source = {
          mapId = 0,
          uiMapIds = {
            534
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Invader's Forgotten Treasure"
          },
          note = "Found in chests from Tanaan Jungle rare kills."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Invader's Forgotten Treasure"
    },
    expansion = 5
  },
  {
    id = 149,
    mounts = {
      {
        id = 617,
        name = "Dusty Rockhide",
        icon = 0,
        itemId = 116664,
        spellId = 171625,
        source = {
          mapId = 0,
          uiMapIds = {
            622
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Vindicator Nuurem"
          },
          cost = {
            type = "gold",
            amount = 50000000
          },
          costs = {
            {
              type = "currency",
              amount = 5000,
              currencyId = 823
            },
            {
              type = "gold",
              amount = 50000000
            }
          }
        }
      },
      {
        id = 618,
        name = "Armored Irontusk",
        icon = 1045156,
        itemId = 116665,
        spellId = 171626,
        source = {
          mapId = 0,
          uiMapIds = {
            622
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Vindicator Nuurem"
          },
          cost = {
            type = "gold",
            amount = 50000000
          },
          costs = {
            {
              type = "currency",
              amount = 5000,
              currencyId = 823
            },
            {
              type = "gold",
              amount = 50000000
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Vindicator Nuurem",
      npcID = 85932
    },
    expansion = 5
  },
  {
    id = 150,
    mounts = {
      {
        id = 624,
        name = "Wild Goretusk",
        icon = 0,
        itemId = 116671,
        spellId = 171633,
        source = {
          mapId = 0,
          uiMapIds = {
            534
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Z'tenga the Walker"
          },
          cost = {
            type = "item",
            amount = 1000,
            itemId = 124099
          }
        }
      },
      {
        id = 765,
        name = "Bristling Hellboar",
        icon = 0,
        itemId = 128480,
        spellId = 190690,
        source = {
          mapId = 0,
          uiMapIds = {
            534
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Z'tenga the Walker"
          },
          cost = {
            type = "item",
            amount = 5000,
            itemId = 124099
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Z'tenga the Walker",
      npcID = 92805
    },
    expansion = 5
  },
  {
    id = 151,
    mounts = {
      {
        id = 625,
        name = "Domesticated Razorback",
        icon = 0,
        itemId = 116672,
        spellId = 171634,
        source = {
          mapId = 0,
          uiMapIds = {
            590
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Gazrix Gearlock / Mimi Wizzlebub"
          },
          note = "Garrison bodyguard vendor (Horde: Gazrix, Alliance: Mimi).",
          cost = {
            type = "gold",
            amount = 50000000
          },
          costs = {
            {
              type = "currency",
              amount = 5000,
              currencyId = 823
            },
            {
              type = "gold",
              amount = 50000000
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Gazrix Gearlock / Mimi Wizzlebub",
      npcID = 88482
    },
    expansion = 5
  },
  {
    id = 152,
    mounts = {
      {
        id = 627,
        name = "Great Greytusk",
        icon = 0,
        itemId = 116674,
        spellId = 171636,
        source = {
          mapId = 0,
          uiMapIds = {
            525
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Gorok"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Gorok",
      npcID = 50992
    },
    expansion = 5
  },
  {
    id = 153,
    mounts = {
      {
        id = 630,
        name = "Sapphire Riverbeast",
        icon = 0,
        itemId = 116767,
        spellId = 171824,
        source = {
          mapId = 0,
          uiMapIds = {
            535
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Silthide"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Silthide",
      npcID = 51015
    },
    expansion = 5
  },
  {
    id = 154,
    mounts = {
      {
        id = 632,
        name = "Mosshide Riverwallow",
        icon = 0,
        itemId = 116768,
        spellId = 171825,
        source = {
          mapId = 0,
          uiMapIds = {
            590
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dawn-Seeker Krek / Dawn-Seeker Alkset"
          },
          cost = {
            type = "gold",
            amount = 500000000
          },
          costs = {
            {
              type = "currency",
              amount = 5000,
              currencyId = 823
            },
            {
              type = "gold",
              amount = 500000000
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Dawn-Seeker Krek / Dawn-Seeker Alkset",
      npcID = 86391
    },
    expansion = 5
  },
  {
    id = 155,
    mounts = {
      {
        id = 633,
        name = "Hellfire Infernal",
        icon = 1371268,
        itemId = 116770,
        spellId = 171827,
        source = {
          mapId = 1530,
          uiMapIds = {
            772
          },
          allowedDifficultyIds = {
            16
          },
          journalEncounter = {
            id = 1737,
            name = "Gul'dan",
            instanceId = 786,
            uiMapId = 772
          },
          dungeonEncounter = {
            id = 1866,
            name = "Gul'dan",
            mapId = 1530
          }
        }
      },
      {
        id = 791,
        name = "Felblaze Infernal",
        icon = 1371267,
        itemId = 137574,
        spellId = 213134,
        source = {
          mapId = 1530,
          uiMapIds = {
            772
          },
          allowedDifficultyIds = {
            14,
            15,
            16
          },
          journalEncounter = {
            id = 1737,
            name = "Gul'dan",
            instanceId = 786,
            uiMapId = 772
          },
          dungeonEncounter = {
            id = 1866,
            name = "Gul'dan",
            mapId = 1530
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "The Nighthold"
    },
    expansion = 6
  },
  {
    id = 156,
    mounts = {
      {
        id = 634,
        name = "Solar Spirehawk",
        icon = 840662,
        itemId = 116771,
        spellId = 171828,
        source = {
          mapId = 1116,
          uiMapIds = {
            542
          },
          allowedDifficultyIds = {
            -1
          },
          bonusRoll = false,
          journalEncounter = {
            id = 1262,
            name = "Rukhmar",
            instanceId = 557,
            uiMapId = 542
          }
        }
      }
    },
    source = {
      type = "WorldBoss",
      name = "Rukhmar",
      npcID = 83746
    },
    expansion = 5
  },
  {
    id = 157,
    mounts = {
      {
        id = 635,
        name = "Shadowmane Charger",
        icon = 1032613,
        itemId = 116772,
        spellId = 171829,
        source = {
          mapId = 0,
          uiMapIds = {
            590
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Ravenspeaker Skeega / Shadow-Sage Brakoss"
          },
          cost = {
            type = "gold",
            amount = 50000000
          },
          costs = {
            {
              type = "currency",
              amount = 5000,
              currencyId = 823
            },
            {
              type = "gold",
              amount = 50000000
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Ravenspeaker Skeega / Shadow-Sage Brakoss",
      npcID = 86037
    },
    expansion = 5
  },
  {
    id = 158,
    mounts = {
      {
        id = 636,
        name = "Swift Breezestrider",
        icon = 0,
        itemId = 116773,
        spellId = 171830,
        source = {
          mapId = 0,
          uiMapIds = {
            539
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Pathrunner"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Pathrunner",
      npcID = 50883
    },
    expansion = 5
  },
  {
    id = 159,
    mounts = {
      {
        id = 638,
        name = "Breezestrider Stallion",
        icon = 0,
        itemId = 116775,
        spellId = 171832,
        source = {
          mapId = 0,
          uiMapIds = {
            624
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dazzerian"
          },
          note = "Vol'jin's Spear quartermaster",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 823
          },
          costs = {
            {
              type = "currency",
              amount = 5000,
              currencyId = 823
            },
            {
              type = "gold",
              amount = 50000000
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Dazzerian",
      npcID = 85115
    },
    expansion = 5
  },
  {
    id = 160,
    mounts = {
      {
        id = 639,
        name = "Pale Thorngrazer",
        icon = 0,
        itemId = 116776,
        spellId = 171833,
        source = {
          mapId = 0,
          uiMapIds = {
            622
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Crafticus Mindbender"
          },
          cost = {
            type = "gold",
            amount = 50000000
          },
          costs = {
            {
              type = "currency",
              amount = 5000,
              currencyId = 823
            },
            {
              type = "gold",
              amount = 50000000
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Crafticus Mindbender",
      npcID = 91020
    },
    expansion = 5
  },
  {
    id = 161,
    mounts = {
      {
        id = 645,
        name = "Ironside Warwolf",
        icon = 930078,
        itemId = 116782,
        spellId = 171839,
        source = {
          mapId = 0,
          uiMapIds = {
            590
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Kil'rip"
          },
          note = "Garrison bodyguard vendor",
          cost = {
            type = "gold",
            amount = 50000000
          },
          costs = {
            {
              type = "currency",
              amount = 5000,
              currencyId = 823
            },
            {
              type = "gold",
              amount = 50000000
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Kil'rip",
      npcID = 86698
    },
    expansion = 5
  },
  {
    id = 162,
    mounts = {
      {
        id = 648,
        name = "Swift Frostwolf",
        icon = 0,
        itemId = 116785,
        spellId = 171842,
        source = {
          mapId = 0,
          uiMapIds = {
            590
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Beska Redtusk"
          },
          note = "Garrison bodyguard vendor",
          cost = {
            type = "gold",
            amount = 50000000
          },
          costs = {
            {
              type = "currency",
              amount = 5000,
              currencyId = 823
            },
            {
              type = "gold",
              amount = 50000000
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Beska Redtusk",
      npcID = 86036
    },
    expansion = 5
  },
  {
    id = 163,
    mounts = {
      {
        id = 652,
        name = "Champion's Treadblade",
        icon = 1046124,
        itemId = 116789,
        spellId = 171846,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Paulie"
          },
          note = "Rogue class mount vendor",
          cost = {
            type = "gold",
            amount = 1000000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Paulie",
      npcID = 87501
    },
    expansion = 6
  },
  {
    id = 164,
    mounts = {
      {
        id = 655,
        name = "Sunhide Gronnling",
        icon = 0,
        itemId = 116792,
        spellId = 171849,
        source = {
          mapId = 0,
          uiMapIds = {
            543
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Poundfist"
          },
          note = "Extremely rare spawn (48-96h timer)."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Poundfist",
      npcID = 50985
    },
    expansion = 5
  },
  {
    id = 165,
    mounts = {
      {
        id = 657,
        name = "Garn Nighthowl",
        icon = 132224,
        itemId = 116794,
        spellId = 171851,
        source = {
          mapId = 0,
          uiMapIds = {
            525
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Nok-Karosh"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Nok-Karosh",
      npcID = 81001
    },
    expansion = 5
  },
  {
    id = 166,
    mounts = {
      {
        id = 663,
        name = "Bloodfang Widow",
        icon = 1370997,
        itemId = 137570,
        spellId = 213115,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "The Mad Merchant"
          },
          note = "Rare spawn in Dalaran Underbelly"
        }
      }
    },
    source = {
      type = "Vendor",
      name = "The Mad Merchant",
      npcID = 108468
    },
    expansion = 6
  },
  {
    id = 167,
    mounts = {
      {
        id = 682,
        name = "Voidtalon of the Dark Star",
        icon = 1094600,
        itemId = 121815,
        spellId = 179478,
        source = {
          mapId = 0,
          uiMapIds = {
            542
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Voidtalon Egg"
          },
          note = "Rarely-spawning Edge of Reality portals in Draenor zones."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Voidtalon Egg"
    },
    expansion = 5
  },
  {
    id = 168,
    mounts = {
      {
        id = 751,
        name = "Felsteel Annihilator",
        icon = 1114455,
        itemId = 123890,
        spellId = 182912,
        source = {
          mapId = 1448,
          uiMapIds = {
            670
          },
          allowedDifficultyIds = {
            16
          },
          journalEncounter = {
            id = 1438,
            name = "Archimonde",
            instanceId = 669,
            uiMapId = 670
          },
          dungeonEncounter = {
            id = 1799,
            name = "Archimonde",
            mapId = 1448
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Hellfire Citadel"
    },
    expansion = 5
  },
  {
    id = 169,
    mounts = {
      {
        id = 753,
        name = "Corrupted Dreadwing",
        icon = 1115910,
        itemId = 123974,
        spellId = 183117,
        source = {
          mapId = 0,
          uiMapIds = {
            534
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dawn-Seeker Krisek"
          },
          cost = {
            type = "currency",
            amount = 150000,
            currencyId = 823
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Dawn-Seeker Krisek",
      npcID = 95424
    },
    expansion = 5
  },
  {
    id = 170,
    mounts = {
      {
        id = 768,
        name = "Deathtusk Felboar",
        icon = 1240370,
        itemId = 128526,
        spellId = 190977,
        source = {
          mapId = 0,
          uiMapIds = {
            534
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Shadow Hunter Denjai"
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Shadow Hunter Denjai",
      npcID = 96014
    },
    expansion = 5
  },
  {
    id = 171,
    mounts = {
      {
        id = 768,
        name = "Deathtusk Felboar",
        icon = 1240370,
        itemId = 128526,
        spellId = 190977,
        source = {
          mapId = 0,
          uiMapIds = {
            534
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Vindicator Krethos"
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Vindicator Krethos",
      npcID = 90974
    },
    expansion = 5
  },
  {
    id = 172,
    mounts = {
      {
        id = 769,
        name = "Minion of Grumpus",
        icon = 1245298,
        itemId = 128671,
        spellId = 191314,
        source = {
          mapId = 0,
          uiMapIds = {
            590
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Izzy Hollyfizzle"
          },
          note = "Garrison events coordinator. Buy Savage Gift during Feast of Winter Veil.",
          cost = {
            type = "item",
            amount = 5,
            itemId = 128659
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Izzy Hollyfizzle",
      npcID = 96362
    },
    expansion = 5
  },
  {
    id = 173,
    mounts = {
      {
        id = 778,
        name = "Eclipse Dragonhawk",
        icon = 132188,
        itemId = 129923,
        spellId = 194464,
        source = {
          mapId = 0,
          uiMapIds = {
            111
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Cupri"
          },
          note = "Timewalking vendor",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      },
      {
        id = 2225,
        name = "Amani Hunting Bear",
        icon = 132121,
        itemId = 224399,
        spellId = 452645,
        source = {
          mapId = 0,
          uiMapIds = {
            111
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Cupri"
          },
          note = "Timewalking vendor",
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
      name = "Cupri",
      npcID = 98685
    },
    expansion = 6
  },
  {
    id = 174,
    mounts = {
      {
        id = 793,
        name = "Predatory Bloodgazer",
        icon = 1332542,
        itemId = 137577,
        spellId = 213158,
        source = {
          mapId = 0,
          uiMapIds = {
            630
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Bloodgazer Reunion"
          },
          note = "Falcosaur pet quest chain in Azsuna."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Bloodgazer Reunion"
    },
    expansion = 6
  },
  {
    id = 175,
    mounts = {
      {
        id = 794,
        name = "Brilliant Direbeak",
        icon = 1332544,
        itemId = 137579,
        spellId = 213164,
        source = {
          mapId = 0,
          uiMapIds = {
            634
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Direbeak Reunion"
          },
          note = "Falcosaur pet quest chain in Stormheim."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Direbeak Reunion"
    },
    expansion = 6
  },
  {
    id = 176,
    mounts = {
      {
        id = 795,
        name = "Snowfeather Hunter",
        icon = 1332545,
        itemId = 137578,
        spellId = 213163,
        source = {
          mapId = 0,
          uiMapIds = {
            650
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Snowfeather Reunion"
          },
          note = "Falcosaur pet quest chain in Highmountain."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Snowfeather Reunion"
    },
    expansion = 6
  },
  {
    id = 177,
    mounts = {
      {
        id = 796,
        name = "Viridian Sharptalon",
        icon = 1332543,
        itemId = 137580,
        spellId = 213165,
        source = {
          mapId = 0,
          uiMapIds = {
            641
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Sharptalon Reunion"
          },
          note = "Falcosaur pet quest chain in Val'sharah."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Sharptalon Reunion"
    },
    expansion = 6
  },
  {
    id = 178,
    mounts = {
      {
        id = 800,
        name = "Brinedeep Bottom-Feeder",
        icon = 1339352,
        itemId = 138811,
        spellId = 214791,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Conjurer Margoss"
          },
          cost = {
            type = "item",
            amount = 100,
            itemId = 138777
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Conjurer Margoss",
      npcID = 108825
    },
    expansion = 6
  },
  {
    id = 179,
    mounts = {
      {
        id = 803,
        name = "Mastercraft Gravewing",
        icon = 3852563,
        itemId = 186479,
        spellId = 215545,
        source = {
          mapId = 0,
          uiMapIds = {
            1961
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Stygian Stonecrusher"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Stygian Stonecrusher",
      npcID = 179985
    },
    expansion = 8
  },
  {
    id = 180,
    mounts = {
      {
        id = 838,
        name = "Fathom Dweller",
        icon = 970851,
        itemId = 138201,
        spellId = 223018,
        source = {
          mapId = 0,
          uiMapIds = {
            630
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Kosumoth the Hungering"
          },
          note = "World boss on Eye of Azshara island. Requires attunement."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Kosumoth the Hungering",
      npcID = 111573
    },
    expansion = 6
  },
  {
    id = 181,
    mounts = {
      {
        id = 847,
        name = "Arcadian War Turtle",
        icon = 1339043,
        itemId = 141713,
        spellId = 227956,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Xur'ios"
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Xur'ios",
      npcID = 107109
    },
    expansion = 6
  },
  {
    id = 182,
    mounts = {
      {
        id = 855,
        name = "Darkwater Skate",
        icon = 1418615,
        itemId = 142398,
        spellId = 228919,
        source = {
          mapId = 0,
          uiMapIds = {
            407
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Galissa Sundew"
          },
          cost = {
            type = "item",
            amount = 500,
            itemId = 124669
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Galissa Sundew",
      npcID = 55103
    },
    expansion = 7
  },
  {
    id = 183,
    mounts = {
      {
        id = 860,
        name = "Archmage's Prismatic Disc",
        icon = 0,
        itemId = 0,
        spellId = 229376,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dispersion of the Discs"
          },
          note = "Mage class mount questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Dispersion of the Discs"
    },
    expansion = 6
  },
  {
    id = 184,
    mounts = {
      {
        id = 861,
        name = "High Priest's Lightsworn Seeker",
        icon = 0,
        itemId = 0,
        spellId = 229377,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "The Sunken Vault"
          },
          note = "Priest class mount questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "The Sunken Vault"
    },
    expansion = 6
  },
  {
    id = 185,
    mounts = {
      {
        id = 864,
        name = "Ban-Lu, Grandmaster's Companion",
        icon = 1511764,
        itemId = 142225,
        spellId = 229385,
        source = {
          mapId = 0,
          uiMapIds = {
            371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "The Trial of Ban-Lu"
          },
          note = "Monk class mount questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "The Trial of Ban-Lu"
    },
    expansion = 6
  },
  {
    id = 186,
    mounts = {
      {
        id = 865,
        name = "Huntmaster's Loyal Wolfhawk",
        icon = 1512621,
        itemId = 142227,
        spellId = 229386,
        source = {
          mapId = 0,
          uiMapIds = {
            739
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Night of the Wilds"
          },
          note = "Hunter class mount questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Night of the Wilds"
    },
    expansion = 6
  },
  {
    id = 187,
    mounts = {
      {
        id = 866,
        name = "Deathlord's Vilebrood Vanquisher",
        icon = 1518275,
        itemId = 142231,
        spellId = 229387,
        source = {
          mapId = 0,
          uiMapIds = {
            23
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "The Lost Glacier"
          },
          note = "Death Knight class mount questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "The Lost Glacier"
    },
    expansion = 6
  },
  {
    id = 188,
    mounts = {
      {
        id = 867,
        name = "Battlelord's Bloodthirsty War Wyrm",
        icon = 1518317,
        itemId = 142232,
        spellId = 229388,
        source = {
          mapId = 0,
          uiMapIds = {
            634
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "The Trial of Rage"
          },
          note = "Warrior class mount questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "The Trial of Rage"
    },
    expansion = 6
  },
  {
    id = 189,
    mounts = {
      {
        id = 868,
        name = "Slayer's Felbroken Shrieker",
        icon = 0,
        itemId = 0,
        spellId = 229417,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "To Fel and Back"
          },
          note = "Demon Hunter class mount questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "To Fel and Back"
    },
    expansion = 6
  },
  {
    id = 190,
    mounts = {
      {
        id = 870,
        name = "Huntmaster's Fierce Wolfhawk",
        icon = 1519097,
        itemId = 142226,
        spellId = 229438,
        source = {
          mapId = 0,
          uiMapIds = {
            739
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Pan the Kind Hand"
          },
          note = "Hunter Order Hall mount vendor",
          cost = {
            type = "currency",
            amount = 1000,
            currencyId = 1220
          }
        }
      },
      {
        id = 872,
        name = "Huntmaster's Dire Wolfhawk",
        icon = 1519096,
        itemId = 142228,
        spellId = 229439,
        source = {
          mapId = 0,
          uiMapIds = {
            739
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Pan the Kind Hand"
          },
          note = "Hunter Order Hall mount vendor",
          cost = {
            type = "currency",
            amount = 1000,
            currencyId = 1220
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Pan the Kind Hand",
      npcID = 100661
    },
    expansion = 6
  },
  {
    id = 191,
    mounts = {
      {
        id = 875,
        name = "Midnight",
        icon = 1338623,
        itemId = 142236,
        spellId = 229499,
        source = {
          mapId = 1651,
          uiMapIds = {
            809
          },
          allowedDifficultyIds = {
            23,
            8
          },
          journalEncounter = {
            id = 1835,
            name = "Attumen the Huntsman",
            instanceId = 860,
            uiMapId = 809
          },
          dungeonEncounter = {
            id = 1960,
            name = "Attumen the Huntsman",
            mapId = 1651
          }
        }
      },
      {
        id = 883,
        name = "Smoldering Ember Wyrm",
        icon = 1527954,
        itemId = 142552,
        spellId = 231428,
        source = {
          mapId = 1651,
          uiMapIds = {
            814
          },
          allowedDifficultyIds = {
            23,
            8
          },
          note = "Upon opening the door after zoning into Karazhan, the following emote happens: \"The strange chill of a dark presence winds through the air.\" This starts the timer for the first crystal.\nYou have a STRICT timing to make it to Opera, kill Opera and click the first Soul Fragment. You have 8 minutes from the moment you zone in to click the first crystal.\nFrom there on each Soul Fragment you click add a bit of time to your timer. But its very very tight.\nAfter the first crystal you will gain a buff,  Medivh's Echo, with a 6min duration. This is now your timer. As you click crystals, it will add a stacking buff and 5 minutes to the time you had left on your buff.\nIf you fail the speed run, you will get an emote notification: \"The air grows slightly warmer\".\nThe Soul Fragments are located as follows: 1 in the audience from Opera, 1 before Maiden (you don't need to kill her), 1 after you kill Moroes, 1 in the Spider Room (then you click the portal to the stairway), 1 after you kill Curator.\nIf you click all the Soul Fragment within the allotted time, run back to Nightbane's room after killing Curator.\nUpon clicking the final crystal in time, your timer buff will change to  Medivh's Presence and you will have 5 minutes to go speak with Medivh and summon Nightbane. When you speak to Medivh you get the One Night in Karazhan One Night in Karazhan achievement.\nThe original Roleplay upon summoning Nightbane will then play, and then you will be able to fight Nightbane.\nOnce you speak to Medivh and Nightbane is summoned, you are able to wipe without worry. He will still be there and shout at you as he continuously slays you.",
          dungeonEncounter = {
            id = 2031,
            name = "Nightbane",
            mapId = 1651
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "Return to Karazhan"
    },
    expansion = 6
  },
  {
    id = 192,
    mounts = {
      {
        id = 877,
        name = "Ivory Hawkstrider",
        icon = 1531511,
        itemId = 142369,
        spellId = 230401,
        source = {
          mapId = 0,
          uiMapIds = {
            650
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Trinket"
          },
          note = "Highmountain emissary vendor",
          cost = {
            type = "gold",
            amount = 100000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Trinket",
      npcID = 115887
    },
    expansion = 6
  },
  {
    id = 193,
    mounts = {
      {
        id = 881,
        name = "Arcanist's Manasaber",
        icon = 1525362,
        itemId = 142436,
        spellId = 230987,
        source = {
          mapId = 0,
          uiMapIds = {
            680
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Fate of the Nightborne"
          },
          note = "Complete the Suramar Insurrection questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Fate of the Nightborne"
    },
    expansion = 6
  },
  {
    id = 194,
    mounts = {
      {
        id = 884,
        name = "Shadowblade's Murderous Omen",
        icon = 1519516,
        itemId = 143493,
        spellId = 231434,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Hiding In Plain Sight"
          },
          note = "Rogue class mount questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Hiding In Plain Sight"
    },
    expansion = 6
  },
  {
    id = 195,
    mounts = {
      {
        id = 885,
        name = "Highlord's Golden Charger",
        icon = 1519875,
        itemId = 143502,
        spellId = 231435,
        source = {
          mapId = 0,
          uiMapIds = {
            23
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Stirring in the Shadows"
          },
          note = "Paladin class mount questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Stirring in the Shadows"
    },
    expansion = 6
  },
  {
    id = 196,
    mounts = {
      {
        id = 888,
        name = "Farseer's Raging Tempest",
        icon = 1020304,
        itemId = 143489,
        spellId = 231442,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Gathering of the Storms"
          },
          note = "Shaman class mount questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Gathering of the Storms"
    },
    expansion = 6
  },
  {
    id = 197,
    mounts = {
      {
        id = 889,
        name = "Shadowblade's Lethal Omen",
        icon = 1525720,
        itemId = 143492,
        spellId = 231523,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zan Shivsproket"
          },
          note = "Rogue class mount vendor in Dalaran sewers",
          cost = {
            type = "currency",
            amount = 1000,
            currencyId = 1220
          }
        }
      },
      {
        id = 890,
        name = "Shadowblade's Baneful Omen",
        icon = 1519518,
        itemId = 143491,
        spellId = 231524,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zan Shivsproket"
          },
          note = "Rogue class mount vendor in Dalaran sewers",
          cost = {
            type = "currency",
            amount = 1000,
            currencyId = 1220
          }
        }
      },
      {
        id = 891,
        name = "Shadowblade's Crimson Omen",
        icon = 1519519,
        itemId = 143490,
        spellId = 231525,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zan Shivsproket"
          },
          note = "Rogue class mount vendor in Dalaran sewers",
          cost = {
            type = "currency",
            amount = 1000,
            currencyId = 1220
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Zan Shivsproket",
      npcID = 121282
    },
    expansion = 6
  },
  {
    id = 198,
    mounts = {
      {
        id = 892,
        name = "Highlord's Vengeful Charger",
        icon = 1519877,
        itemId = 143503,
        spellId = 231587,
        source = {
          mapId = 0,
          uiMapIds = {
            23
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Crusader Lord Dalfors"
          },
          note = "Paladin Order Hall mount vendor",
          cost = {
            type = "currency",
            amount = 1000,
            currencyId = 1220
          }
        }
      },
      {
        id = 893,
        name = "Highlord's Vigilant Charger",
        icon = 1519876,
        itemId = 143504,
        spellId = 231588,
        source = {
          mapId = 0,
          uiMapIds = {
            23
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Crusader Lord Dalfors"
          },
          note = "Paladin Order Hall mount vendor",
          cost = {
            type = "currency",
            amount = 1000,
            currencyId = 1220
          }
        }
      },
      {
        id = 894,
        name = "Highlord's Valorous Charger",
        icon = 1519878,
        itemId = 143505,
        spellId = 231589,
        source = {
          mapId = 0,
          uiMapIds = {
            23
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Crusader Lord Dalfors"
          },
          note = "Paladin Order Hall mount vendor",
          cost = {
            type = "currency",
            amount = 1000,
            currencyId = 1220
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Crusader Lord Dalfors",
      npcID = 99976
    },
    expansion = 6
  },
  {
    id = 199,
    mounts = {
      {
        id = 898,
        name = "Netherlord's Chaotic Wrathsteed",
        icon = 0,
        itemId = 0,
        spellId = 232412,
        source = {
          mapId = 0,
          uiMapIds = {
            717
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "The Wrathsteed of Xoroth"
          },
          note = "Warlock class mount questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "The Wrathsteed of Xoroth"
    },
    expansion = 6
  },
  {
    id = 200,
    mounts = {
      {
        id = 899,
        name = "Abyss Worm",
        icon = 1519579,
        itemId = 143643,
        spellId = 232519,
        source = {
          mapId = 1676,
          uiMapIds = {
            851
          },
          allowedDifficultyIds = {
            14,
            15,
            16,
            17
          },
          journalEncounter = {
            id = 1861,
            name = "Mistress Sassz'ine",
            instanceId = 875,
            uiMapId = 851
          },
          dungeonEncounter = {
            id = 2037,
            name = "Mistress Sassz'ine",
            mapId = 1676
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Tomb of Sargeras"
    },
    expansion = 6
  },
  {
    id = 201,
    mounts = {
      {
        id = 905,
        name = "Leywoven Flying Carpet",
        icon = 1610263,
        itemId = 143764,
        spellId = 233364,
        source = {
          mapId = 0,
          uiMapIds = {
            680
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Nightfallen Cache"
          },
          note = "Paragon reputation reward from The Nightfallen."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Nightfallen Cache"
    },
    expansion = 6
  },
  {
    id = 202,
    mounts = {
      {
        id = 906,
        name = "Darkspore Mana Ray",
        icon = 1570760,
        itemId = 152843,
        spellId = 235764,
        source = {
          mapId = 0,
          uiMapIds = {
            882
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Fel-Spotted Egg"
          },
          note = "Drops from Argus rares. Hatches after 5 days into one of four mana rays."
        }
      },
      {
        id = 974,
        name = "Vibrant Mana Ray",
        icon = 1570764,
        itemId = 152842,
        spellId = 253106,
        source = {
          mapId = 0,
          uiMapIds = {
            882
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Fel-Spotted Egg"
          },
          note = "Drops from Argus rares. Hatches after 5 days into one of four mana rays."
        }
      },
      {
        id = 975,
        name = "Felglow Mana Ray",
        icon = 1570765,
        itemId = 152841,
        spellId = 253108,
        source = {
          mapId = 0,
          uiMapIds = {
            882
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Fel-Spotted Egg"
          },
          note = "Drops from Argus rares. Hatches after 5 days into one of four mana rays."
        }
      },
      {
        id = 976,
        name = "Scintillating Mana Ray",
        icon = 1570763,
        itemId = 152840,
        spellId = 253109,
        source = {
          mapId = 0,
          uiMapIds = {
            882
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Fel-Spotted Egg"
          },
          note = "Drops from Argus rares. Hatches after 5 days into one of four mana rays."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Fel-Spotted Egg"
    },
    expansion = 6
  },
  {
    id = 203,
    mounts = {
      {
        id = 926,
        name = "Alabaster Hyena",
        icon = 1519597,
        itemId = 161773,
        spellId = 237287,
        source = {
          mapId = 0,
          uiMapIds = {
            864
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Hoarder Jena"
          },
          cost = {
            type = "gold",
            amount = 100000000
          }
        }
      },
      {
        id = 1060,
        name = "Voldunai Dunescraper",
        icon = 1624586,
        itemId = 161667,
        spellId = 275840,
        source = {
          mapId = 0,
          uiMapIds = {
            864
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Hoarder Jena"
          },
          cost = {
            type = "gold",
            amount = 900000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Hoarder Jena",
      npcID = 135804
    },
    expansion = 7
  },
  {
    id = 204,
    mounts = {
      {
        id = 930,
        name = "Netherlord's Brimstone Wrathsteed",
        icon = 1581442,
        itemId = 143637,
        spellId = 238452,
        source = {
          mapId = 0,
          uiMapIds = {
            717
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Calydus"
          },
          note = "Warlock Order Hall mount vendor",
          cost = {
            type = "currency",
            amount = 1000,
            currencyId = 1220
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Calydus",
      npcID = 101097
    },
    expansion = 6
  },
  {
    id = 205,
    mounts = {
      {
        id = 931,
        name = "Netherlord's Accursed Wrathsteed",
        icon = 1582838,
        itemId = 142233,
        spellId = 238454,
        source = {
          mapId = 0,
          uiMapIds = {
            646
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Lord Hel'Nurath"
          },
          note = "Rare event spawn on Broken Shore."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Lord Hel'Nurath",
      npcID = 119629
    },
    expansion = 6
  },
  {
    id = 206,
    mounts = {
      {
        id = 932,
        name = "Lightforged Warframe",
        icon = 1586383,
        itemId = 152788,
        spellId = 239013,
        source = {
          mapId = 0,
          uiMapIds = {
            1161
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Vindicator Jaelaana"
          },
          cost = {
            type = "gold",
            amount = 6250000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Vindicator Jaelaana",
      npcID = 135446
    },
    expansion = 6
  },
  {
    id = 207,
    mounts = {
      {
        id = 939,
        name = "Sable Ruinstrider",
        icon = 1602313,
        itemId = 152791,
        spellId = 242305,
        source = {
          mapId = 0,
          uiMapIds = {
            882
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Toraan the Revered"
          },
          cost = {
            type = "gold",
            amount = 100000000
          }
        }
      },
      {
        id = 964,
        name = "Amethyst Ruinstrider",
        icon = 1602319,
        itemId = 152794,
        spellId = 253004,
        source = {
          mapId = 0,
          uiMapIds = {
            882
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Toraan the Revered"
          },
          cost = {
            type = "gold",
            amount = 100000000
          }
        }
      },
      {
        id = 965,
        name = "Cerulean Ruinstrider",
        icon = 1602314,
        itemId = 152797,
        spellId = 253007,
        source = {
          mapId = 0,
          uiMapIds = {
            882
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Toraan the Revered"
          },
          cost = {
            type = "gold",
            amount = 100000000
          }
        }
      },
      {
        id = 966,
        name = "Beryl Ruinstrider",
        icon = 1602318,
        itemId = 152795,
        spellId = 253005,
        source = {
          mapId = 0,
          uiMapIds = {
            882
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Toraan the Revered"
          },
          cost = {
            type = "gold",
            amount = 100000000
          }
        }
      },
      {
        id = 967,
        name = "Umber Ruinstrider",
        icon = 1602315,
        itemId = 152796,
        spellId = 253008,
        source = {
          mapId = 0,
          uiMapIds = {
            882
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Toraan the Revered"
          },
          cost = {
            type = "gold",
            amount = 100000000
          }
        }
      },
      {
        id = 968,
        name = "Russet Ruinstrider",
        icon = 1602320,
        itemId = 152793,
        spellId = 253006,
        source = {
          mapId = 0,
          uiMapIds = {
            882
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Toraan the Revered"
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
      name = "Toraan the Revered",
      npcID = 127151
    },
    expansion = 6
  },
  {
    id = 208,
    mounts = {
      {
        id = 941,
        name = "Highmountain Elderhorn",
        icon = 1278545,
        itemId = 147807,
        spellId = 242874,
        source = {
          mapId = 0,
          uiMapIds = {
            650
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Highmountain Supplies"
          },
          note = "Paragon reputation reward from Highmountain Tribe."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Highmountain Supplies"
    },
    expansion = 6
  },
  {
    id = 209,
    mounts = {
      {
        id = 942,
        name = "Wild Dreamrunner",
        icon = 1610262,
        itemId = 147804,
        spellId = 242875,
        source = {
          mapId = 0,
          uiMapIds = {
            641
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Dreamweaver Cache"
          },
          note = "Paragon reputation reward from Dreamweavers."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Dreamweaver Cache"
    },
    expansion = 6
  },
  {
    id = 210,
    mounts = {
      {
        id = 943,
        name = "Cloudwing Hippogryph",
        icon = 1610261,
        itemId = 147806,
        spellId = 242881,
        source = {
          mapId = 0,
          uiMapIds = {
            630
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Farondis Chest"
          },
          note = "Paragon reputation reward from Court of Farondis."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Farondis Chest"
    },
    expansion = 6
  },
  {
    id = 211,
    mounts = {
      {
        id = 944,
        name = "Valarjar Stormwing",
        icon = 1503309,
        itemId = 147805,
        spellId = 242882,
        source = {
          mapId = 0,
          uiMapIds = {
            634
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Valarjar Strongbox"
          },
          note = "Paragon reputation reward from Valarjar."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Valarjar Strongbox"
    },
    expansion = 6
  },
  {
    id = 212,
    mounts = {
      {
        id = 954,
        name = "Shackled Ur'zul",
        icon = 1581747,
        itemId = 152789,
        spellId = 243651,
        source = {
          mapId = 1712,
          uiMapIds = {
            918
          },
          allowedDifficultyIds = {
            16
          },
          journalEncounter = {
            id = 2031,
            name = "Argus the Unmaker",
            instanceId = 946,
            uiMapId = 918
          },
          dungeonEncounter = {
            id = 2092,
            name = "Argus the Unmaker",
            mapId = 1712
          }
        }
      },
      {
        id = 971,
        name = "Antoran Charhound",
        icon = 1709931,
        itemId = 152816,
        spellId = 253088,
        source = {
          mapId = 1712,
          uiMapIds = {
            909
          },
          allowedDifficultyIds = {
            14,
            15,
            16,
            17
          },
          journalEncounter = {
            id = 1987,
            name = "Felhounds of Sargeras",
            instanceId = 946,
            uiMapId = 909
          },
          dungeonEncounter = {
            id = 2074,
            name = "Felhounds of Sargeras",
            mapId = 1712
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Antorus, the Burning Throne"
    },
    expansion = 6
  },
  {
    id = 213,
    mounts = {
      {
        id = 955,
        name = "Vile Fiend",
        icon = 1616211,
        itemId = 152790,
        spellId = 243652,
        source = {
          mapId = 0,
          uiMapIds = {
            885
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Houndmaster Kerrax"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Houndmaster Kerrax",
      npcID = 127288
    },
    expansion = 6
  },
  {
    id = 214,
    mounts = {
      {
        id = 958,
        name = "Spectral Pterrorwing",
        icon = 1624589,
        itemId = 161664,
        spellId = 244712,
        source = {
          mapId = 0,
          uiMapIds = {
            862
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Natal'hakata"
          },
          cost = {
            type = "gold",
            amount = 900000000
          }
        }
      },
      {
        id = 1058,
        name = "Cobalt Pterrordax",
        icon = 1624578,
        itemId = 161665,
        spellId = 275837,
        source = {
          mapId = 0,
          uiMapIds = {
            862
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Natal'hakata"
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
      name = "Natal'hakata",
      npcID = 131287
    },
    expansion = 7
  },
  {
    id = 215,
    mounts = {
      {
        id = 961,
        name = "Lucid Nightmare",
        icon = 1668955,
        itemId = 151623,
        spellId = 247402,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Puzzler's Desire"
          },
          note = "Lucid Nightmare puzzle. Starts at Curiosities & Moore."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Puzzler's Desire"
    },
    expansion = 6
  },
  {
    id = 216,
    mounts = {
      {
        id = 970,
        name = "Maddened Chaosrunner",
        icon = 1602316,
        itemId = 152814,
        spellId = 253058,
        source = {
          mapId = 0,
          uiMapIds = {
            882
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Wrangler Kravos"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Wrangler Kravos",
      npcID = 126852
    },
    expansion = 6
  },
  {
    id = 217,
    mounts = {
      {
        id = 973,
        name = "Lambent Mana Ray",
        icon = 1570761,
        itemId = 152844,
        spellId = 253107,
        source = {
          mapId = 0,
          uiMapIds = {
            882
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Venomtail Skyfin"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Venomtail Skyfin",
      npcID = 126867
    },
    expansion = 6
  },
  {
    id = 218,
    mounts = {
      {
        id = 979,
        name = "Crimson Slavermaw",
        icon = 1711456,
        itemId = 152905,
        spellId = 253661,
        source = {
          mapId = 0,
          uiMapIds = {
            885
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Blistermaw"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Blistermaw",
      npcID = 122958
    },
    expansion = 6
  },
  {
    id = 219,
    mounts = {
      {
        id = 980,
        name = "Acid Belcher",
        icon = 1711455,
        itemId = 152904,
        spellId = 253662,
        source = {
          mapId = 0,
          uiMapIds = {
            882
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Skreeg the Devourer"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Skreeg the Devourer",
      npcID = 126912
    },
    expansion = 6
  },
  {
    id = 220,
    mounts = {
      {
        id = 981,
        name = "Biletooth Gnasher",
        icon = 1711454,
        itemId = 152903,
        spellId = 253660,
        source = {
          mapId = 0,
          uiMapIds = {
            885
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Argus"
          },
          note = "Various Argus zone rares."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Argus"
    },
    expansion = 6
  },
  {
    id = 221,
    mounts = {
      {
        id = 983,
        name = "Glorious Felcrusher",
        icon = 1713157,
        itemId = 153042,
        spellId = 254069,
        source = {
          mapId = 0,
          uiMapIds = {
            882
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Gleaming Footlocker"
          },
          note = "Paragon reputation reward from Army of the Light."
        }
      },
      {
        id = 984,
        name = "Blessed Felcrusher",
        icon = 1715044,
        itemId = 153043,
        spellId = 254258,
        source = {
          mapId = 0,
          uiMapIds = {
            882
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Gleaming Footlocker"
          },
          note = "Paragon reputation reward from Army of the Light."
        }
      },
      {
        id = 985,
        name = "Avenging Felcrusher",
        icon = 1715045,
        itemId = 153044,
        spellId = 254259,
        source = {
          mapId = 0,
          uiMapIds = {
            882
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Gleaming Footlocker"
          },
          note = "Paragon reputation reward from Army of the Light."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Gleaming Footlocker"
    },
    expansion = 6
  },
  {
    id = 222,
    mounts = {
      {
        id = 995,
        name = "Sharkbait",
        icon = 134059,
        itemId = 159842,
        spellId = 254813,
        source = {
          mapId = 1754,
          uiMapIds = {
            936
          },
          allowedDifficultyIds = {
            23,
            8
          },
          journalEncounter = {
            id = 2095,
            name = "Harlan Sweete",
            instanceId = 1001,
            uiMapId = 936
          },
          dungeonEncounter = {
            id = 2096,
            name = "Lord Harlan Sweete",
            mapId = 1754
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "Freehold"
    },
    expansion = 7
  },
  {
    id = 223,
    mounts = {
      {
        id = 1010,
        name = "Admiralty Stallion",
        icon = 132261,
        itemId = 161911,
        spellId = 259213,
        source = {
          mapId = 0,
          uiMapIds = {
            1161
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Fray"
          },
          cost = {
            type = "gold",
            amount = 100000000
          }
        }
      },
      {
        id = 1064,
        name = "Proudmoore Sea Scout",
        icon = 773275,
        itemId = 161879,
        spellId = 275868,
        source = {
          mapId = 0,
          uiMapIds = {
            1161
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Fray"
          },
          cost = {
            type = "gold",
            amount = 900000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Provisioner Fray",
      npcID = 135808
    },
    expansion = 7
  },
  {
    id = 224,
    mounts = {
      {
        id = 1012,
        name = "Green Marsh Hopper",
        icon = 1802889,
        itemId = 163183,
        spellId = 259740,
        source = {
          mapId = 0,
          uiMapIds = {
            863
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Gottum"
          },
          note = "Marsh Hopper vendor",
          cost = {
            type = "gold",
            amount = 3333330000
          }
        }
      },
      {
        id = 1206,
        name = "Blue Marsh Hopper",
        icon = 0,
        itemId = 166442,
        spellId = 288587,
        source = {
          mapId = 0,
          uiMapIds = {
            863
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Gottum"
          },
          note = "Marsh Hopper vendor",
          cost = {
            type = "gold",
            amount = 3333330000
          }
        }
      },
      {
        id = 1207,
        name = "Yellow Marsh Hopper",
        icon = 0,
        itemId = 166443,
        spellId = 288589,
        source = {
          mapId = 0,
          uiMapIds = {
            863
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Gottum"
          },
          note = "Marsh Hopper vendor",
          cost = {
            type = "gold",
            amount = 3333330000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Gottum",
      npcID = 148810
    },
    expansion = 7
  },
  {
    id = 225,
    mounts = {
      {
        id = 1013,
        name = "Honeyback Harvester",
        icon = 2027853,
        itemId = 170069,
        spellId = 259741,
        source = {
          mapId = 0,
          uiMapIds = {
            942
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Leaving the Hive: Harvester"
          },
          note = "Complete the Honeyback Harvester bee questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Leaving the Hive: Harvester"
    },
    expansion = 7
  },
  {
    id = 226,
    mounts = {
      {
        id = 1015,
        name = "Dapple Gray",
        icon = 132261,
        itemId = 161912,
        spellId = 260172,
        source = {
          mapId = 0,
          uiMapIds = {
            942
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Sister Lilyana"
          },
          cost = {
            type = "gold",
            amount = 100000000
          }
        }
      },
      {
        id = 1063,
        name = "Stormsong Coastwatcher",
        icon = 0,
        itemId = 161909,
        spellId = 275866,
        source = {
          mapId = 0,
          uiMapIds = {
            942
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Sister Lilyana"
          },
          cost = {
            type = "gold",
            amount = 900000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Sister Lilyana",
      npcID = 135800
    },
    expansion = 7
  },
  {
    id = 227,
    mounts = {
      {
        id = 1016,
        name = "Smoky Charger",
        icon = 132261,
        itemId = 161910,
        spellId = 260173,
        source = {
          mapId = 0,
          uiMapIds = {
            896
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Quartermaster Alcorn"
          },
          cost = {
            type = "gold",
            amount = 100000000
          }
        }
      },
      {
        id = 1062,
        name = "Dusky Waycrest Gryphon",
        icon = 0,
        itemId = 161908,
        spellId = 275859,
        source = {
          mapId = 0,
          uiMapIds = {
            896
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Quartermaster Alcorn"
          },
          cost = {
            type = "gold",
            amount = 900000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Quartermaster Alcorn",
      npcID = 135815
    },
    expansion = 7
  },
  {
    id = 228,
    mounts = {
      {
        id = 1040,
        name = "Tomb Stalker",
        icon = 1908013,
        itemId = 159921,
        spellId = 266058,
        source = {
          mapId = 1762,
          uiMapIds = {
            1004
          },
          allowedDifficultyIds = {
            23,
            8
          },
          journalEncounter = {
            id = 2172,
            name = "Dazar, The First King",
            instanceId = 1041,
            uiMapId = 1004
          },
          dungeonEncounter = {
            id = 2143,
            name = "King Dazar",
            mapId = 1762
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "King's Rest"
    },
    expansion = 7
  },
  {
    id = 229,
    mounts = {
      {
        id = 1042,
        name = "Siltwing Albatross",
        icon = 1929243,
        itemId = 166745,
        spellId = 266925,
        source = {
          mapId = 0,
          uiMapIds = {
            1161
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Captain Klarisa"
          },
          cost = {
            type = "currency",
            amount = 1000,
            currencyId = 1710
          }
        }
      },
      {
        id = 1208,
        name = "Saltwater Seahorse",
        icon = 433440,
        itemId = 166471,
        spellId = 288711,
        source = {
          mapId = 0,
          uiMapIds = {
            1161
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Captain Klarisa"
          },
          cost = {
            type = "currency",
            amount = 500,
            currencyId = 1710
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Captain Klarisa",
      npcID = 148922
    },
    expansion = 7
  },
  {
    id = 230,
    mounts = {
      {
        id = 1042,
        name = "Siltwing Albatross",
        icon = 1929243,
        itemId = 166745,
        spellId = 266925,
        source = {
          mapId = 0,
          uiMapIds = {
            862
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Captain Zen'taga"
          },
          cost = {
            type = "currency",
            amount = 1000,
            currencyId = 1710
          }
        }
      },
      {
        id = 1208,
        name = "Saltwater Seahorse",
        icon = 433440,
        itemId = 166471,
        spellId = 288711,
        source = {
          mapId = 0,
          uiMapIds = {
            862
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Captain Zen'taga"
          },
          cost = {
            type = "currency",
            amount = 500,
            currencyId = 1710
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Captain Zen'taga",
      npcID = 148923
    },
    expansion = 7
  },
  {
    id = 231,
    mounts = {
      {
        id = 1053,
        name = "Underrot Crawg",
        icon = 1017860,
        itemId = 160829,
        spellId = 273541,
        source = {
          mapId = 1841,
          uiMapIds = {
            1042
          },
          allowedDifficultyIds = {
            23,
            8
          },
          journalEncounter = {
            id = 2158,
            name = "Unbound Abomination",
            instanceId = 1022,
            uiMapId = 1042
          },
          dungeonEncounter = {
            id = 2123,
            name = "Unbound Abomination",
            mapId = 1841
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "The Underrot"
    },
    expansion = 7
  },
  {
    id = 232,
    mounts = {
      {
        id = 1059,
        name = "Captured Swampstalker",
        icon = 1624583,
        itemId = 161666,
        spellId = 275838,
        source = {
          mapId = 0,
          uiMapIds = {
            863
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Lija"
          },
          cost = {
            type = "gold",
            amount = 900000000
          }
        }
      },
      {
        id = 1061,
        name = "Expedition Bloodswarmer",
        icon = 1618563,
        itemId = 161774,
        spellId = 275841,
        source = {
          mapId = 0,
          uiMapIds = {
            863
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Lija"
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
      name = "Provisioner Lija",
      npcID = 135459
    },
    expansion = 7
  },
  {
    id = 233,
    mounts = {
      {
        id = 1173,
        name = "Broken Highland Mustang",
        icon = 132261,
        itemId = 163578,
        spellId = 279457,
        source = {
          mapId = 0,
          uiMapIds = {
            14
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Knight-Captain Aldrin"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Knight-Captain Aldrin",
      npcID = 142739
    },
    expansion = 7
  },
  {
    id = 234,
    mounts = {
      {
        id = 1174,
        name = "Highland Mustang",
        icon = 132261,
        itemId = 163579,
        spellId = 279456,
        source = {
          mapId = 0,
          uiMapIds = {
            14
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Doomrider Helgrim"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Doomrider Helgrim",
      npcID = 142741
    },
    expansion = 7
  },
  {
    id = 235,
    mounts = {
      {
        id = 1179,
        name = "Palehide Direhorn",
        icon = 838688,
        itemId = 163589,
        spellId = 279474,
        source = {
          mapId = 0,
          uiMapIds = {
            1165
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Talutu"
          },
          cost = {
            type = "gold",
            amount = 5000000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Talutu",
      npcID = 125879
    },
    expansion = 7
  },
  {
    id = 236,
    mounts = {
      {
        id = 1179,
        name = "Palehide Direhorn",
        icon = 838688,
        itemId = 163589,
        spellId = 279474,
        source = {
          mapId = 0,
          uiMapIds = {
            895
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tricky Nick"
          },
          note = "Sells Mighty Caravan Brutosaur and Palehide Direhorn",
          cost = {
            type = "gold",
            amount = 5000000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Tricky Nick",
      npcID = 142691
    },
    expansion = 7
  },
  {
    id = 237,
    mounts = {
      {
        id = 1180,
        name = "Swift Albino Raptor",
        icon = 838684,
        itemId = 163644,
        spellId = 279569,
        source = {
          mapId = 0,
          uiMapIds = {
            14
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Beastrider Kama"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Beastrider Kama",
      npcID = 142709
    },
    expansion = 7
  },
  {
    id = 238,
    mounts = {
      {
        id = 1182,
        name = "Lil' Donkey",
        icon = 132261,
        itemId = 163646,
        spellId = 279608,
        source = {
          mapId = 0,
          uiMapIds = {
            14
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Overseer Krix"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Overseer Krix"
    },
    expansion = 7
  },
  {
    id = 239,
    mounts = {
      {
        id = 1183,
        name = "Skullripper",
        icon = 132193,
        itemId = 163645,
        spellId = 279611,
        source = {
          mapId = 0,
          uiMapIds = {
            14
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Skullripper"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Skullripper",
      npcID = 142437
    },
    expansion = 7
  },
  {
    id = 240,
    mounts = {
      {
        id = 1185,
        name = "Witherbark Direwing",
        icon = 132182,
        itemId = 163706,
        spellId = 279868,
        source = {
          mapId = 0,
          uiMapIds = {
            14
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Nimar the Slayer"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Nimar the Slayer",
      npcID = 142692
    },
    expansion = 7
  },
  {
    id = 241,
    mounts = {
      {
        id = 1199,
        name = "Blackpaw",
        icon = 571585,
        itemId = 166428,
        spellId = 288438,
        source = {
          mapId = 0,
          uiMapIds = {
            62
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Agathe Wyrmwood"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Agathe Wyrmwood"
    },
    expansion = 7
  },
  {
    id = 242,
    mounts = {
      {
        id = 1199,
        name = "Blackpaw",
        icon = 571585,
        itemId = 166428,
        spellId = 288438,
        source = {
          mapId = 0,
          uiMapIds = {
            62
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Blackpaw"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Blackpaw",
      npcID = 149660
    },
    expansion = 7
  },
  {
    id = 243,
    mounts = {
      {
        id = 1200,
        name = "Ashenvale Chimaera",
        icon = 2406628,
        itemId = 166432,
        spellId = 288495,
        source = {
          mapId = 0,
          uiMapIds = {
            62
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Alash'anir"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Alash'anir"
    },
    expansion = 7
  },
  {
    id = 244,
    mounts = {
      {
        id = 1201,
        name = "Frightened Kodo",
        icon = 132245,
        itemId = 166433,
        spellId = 288499,
        source = {
          mapId = 0,
          uiMapIds = {
            62
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Frightened Kodo"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Frightened Kodo",
      npcID = 148790
    },
    expansion = 7
  },
  {
    id = 245,
    mounts = {
      {
        id = 1203,
        name = "Umber Nightsaber",
        icon = 2344137,
        itemId = 166434,
        spellId = 288503,
        source = {
          mapId = 0,
          uiMapIds = {
            62
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Moxo the Beheader"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Moxo the Beheader"
    },
    expansion = 7
  },
  {
    id = 246,
    mounts = {
      {
        id = 1203,
        name = "Umber Nightsaber",
        icon = 2344137,
        itemId = 166434,
        spellId = 288503,
        source = {
          mapId = 0,
          uiMapIds = {
            62
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Athil Dewfire"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Athil Dewfire",
      npcID = 148037
    },
    expansion = 7
  },
  {
    id = 247,
    mounts = {
      {
        id = 1204,
        name = "Sandy Nightsaber",
        icon = 2475039,
        itemId = 166436,
        spellId = 288506,
        source = {
          mapId = 0,
          uiMapIds = {
            895
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Stoutforge"
          },
          cost = {
            type = "currency",
            amount = 350,
            currencyId = 1717
          }
        }
      },
      {
        id = 1214,
        name = "Azureshell Krolusk",
        icon = 1573603,
        itemId = 166465,
        spellId = 288736,
        source = {
          mapId = 0,
          uiMapIds = {
            895
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Stoutforge"
          },
          cost = {
            type = "currency",
            amount = 200,
            currencyId = 1717
          }
        }
      },
      {
        id = 1216,
        name = "Priestess' Moonsaber",
        icon = 2475038,
        itemId = 166463,
        spellId = 288740,
        source = {
          mapId = 0,
          uiMapIds = {
            895
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Stoutforge"
          },
          cost = {
            type = "currency",
            amount = 750,
            currencyId = 1717
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Provisioner Stoutforge",
      npcID = 148927
    },
    expansion = 7
  },
  {
    id = 248,
    mounts = {
      {
        id = 1204,
        name = "Sandy Nightsaber",
        icon = 2475039,
        itemId = 166436,
        spellId = 288506,
        source = {
          mapId = 0,
          uiMapIds = {
            862
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Mukra"
          },
          cost = {
            type = "currency",
            amount = 350,
            currencyId = 1717
          }
        }
      },
      {
        id = 1210,
        name = "Bloodthirsty Dreadwing",
        icon = 0,
        itemId = 166469,
        spellId = 288714,
        source = {
          mapId = 0,
          uiMapIds = {
            862
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Mukra"
          },
          cost = {
            type = "currency",
            amount = 750,
            currencyId = 1716
          }
        }
      },
      {
        id = 1215,
        name = "Rubyshell Krolusk",
        icon = 1573607,
        itemId = 166464,
        spellId = 288735,
        source = {
          mapId = 0,
          uiMapIds = {
            862
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Mukra"
          },
          cost = {
            type = "currency",
            amount = 200,
            currencyId = 1716
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Provisioner Mukra",
      npcID = 148924
    },
    expansion = 7
  },
  {
    id = 249,
    mounts = {
      {
        id = 1205,
        name = "Kaldorei Nightsaber",
        icon = 0,
        itemId = 166435,
        spellId = 288505,
        source = {
          mapId = 0,
          uiMapIds = {
            62
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Croz Bloodrage"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Croz Bloodrage"
    },
    expansion = 7
  },
  {
    id = 250,
    mounts = {
      {
        id = 1205,
        name = "Kaldorei Nightsaber",
        icon = 0,
        itemId = 166435,
        spellId = 288505,
        source = {
          mapId = 0,
          uiMapIds = {
            62
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Shadowclaw"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Shadowclaw"
    },
    expansion = 7
  },
  {
    id = 251,
    mounts = {
      {
        id = 1217,
        name = "G.M.O.D.",
        icon = 2011108,
        itemId = 166518,
        spellId = 289083,
        source = {
          mapId = 2070,
          uiMapIds = {
            1352,
            1364
          },
          allowedDifficultyIds = {
            14,
            15,
            16
          },
          journalEncounter = {
            id = 2334,
            name = "High Tinker Mekkatorque",
            instanceId = 1176,
            uiMapId = 1352
          },
          dungeonEncounter = {
            id = 2276,
            name = "Mekkatorque",
            mapId = 2070
          }
        }
      },
      {
        id = 1217,
        name = "G.M.O.D.",
        icon = 2011108,
        itemId = 166518,
        spellId = 289083,
        source = {
          mapId = 2070,
          uiMapIds = {
            1352,
            1364
          },
          allowedDifficultyIds = {
            17
          },
          journalEncounter = {
            id = 2343,
            name = "Lady Jaina Proudmoore",
            instanceId = 1176,
            uiMapId = 1364
          },
          dungeonEncounter = {
            id = 2281,
            name = "Lady Jaina Proudmoore",
            mapId = 2070
          }
        }
      },
      {
        id = 1219,
        name = "Glacial Tidestorm",
        icon = 135862,
        itemId = 166705,
        spellId = 289555,
        source = {
          mapId = 2070,
          uiMapIds = {
            1364
          },
          allowedDifficultyIds = {
            16
          },
          journalEncounter = {
            id = 2343,
            name = "Lady Jaina Proudmoore",
            instanceId = 1176,
            uiMapId = 1364
          },
          dungeonEncounter = {
            id = 2281,
            name = "Lady Jaina Proudmoore",
            mapId = 2070
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Battle of Dazar'alor"
    },
    expansion = 7
  },
  {
    id = 252,
    mounts = {
      {
        id = 1227,
        name = "Aerial Unit R-21/X",
        icon = 2574427,
        itemId = 168830,
        spellId = 290718,
        source = {
          mapId = 2097,
          uiMapIds = {
            1497
          },
          allowedDifficultyIds = {
            8,
            23
          },
          note = "In order for the mount to drop, you must complete the dungeon on Hard Mode.",
          journalEncounter = {
            id = 2331,
            name = "King Mechagon",
            instanceId = 1178,
            uiMapId = 1497
          },
          dungeonEncounter = {
            id = 2260,
            name = "King Mechagon",
            mapId = 2097
          }
        }
      },
      {
        id = 1252,
        name = "Mechagon Peacekeeper",
        icon = 2620862,
        itemId = 168826,
        spellId = 299158,
        source = {
          mapId = 2097,
          uiMapIds = {
            1490
          },
          allowedDifficultyIds = {
            8,
            23
          },
          journalEncounter = {
            id = 2355,
            name = "HK-8 Aerial Oppression Unit",
            instanceId = 1178,
            uiMapId = 1490
          },
          dungeonEncounter = {
            id = 2291,
            name = "HK-8 Aerial Oppression Unit",
            mapId = 2097
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "Operation: Mechagon"
    },
    expansion = 7
  },
  {
    id = 253,
    mounts = {
      {
        id = 1229,
        name = "Rusty Mechanocrawler",
        icon = 2620863,
        itemId = 168823,
        spellId = 291492,
        source = {
          mapId = 0,
          uiMapIds = {
            1462
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Mechagon"
          },
          note = "Random mount drop from Mechagon rare events."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Mechagon"
    },
    expansion = 7
  },
  {
    id = 254,
    mounts = {
      {
        id = 1230,
        name = "Unshackled Waveray",
        icon = 2620776,
        itemId = 167170,
        spellId = 291538,
        source = {
          mapId = 0,
          uiMapIds = {
            1355
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Finder Pruc"
          },
          cost = {
            type = "currency",
            amount = 250,
            currencyId = 1721
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Finder Pruc",
      npcID = 153512
    },
    expansion = 7
  },
  {
    id = 255,
    mounts = {
      {
        id = 1231,
        name = "Ankoan Waveray",
        icon = 2620775,
        itemId = 167167,
        spellId = 292407,
        source = {
          mapId = 0,
          uiMapIds = {
            1355
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Artisan Okata"
          },
          cost = {
            type = "currency",
            amount = 250,
            currencyId = 1721
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Artisan Okata",
      npcID = 153509
    },
    expansion = 7
  },
  {
    id = 256,
    mounts = {
      {
        id = 1237,
        name = "Royal Snapdragon",
        icon = 2766226,
        itemId = 169198,
        spellId = 294038,
        source = {
          mapId = 0,
          uiMapIds = {
            1355
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Unshackled Supplies"
          },
          note = "Paragon reputation reward from The Unshackled."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Unshackled Supplies"
    },
    expansion = 7
  },
  {
    id = 257,
    mounts = {
      {
        id = 1239,
        name = "X-995 Mechanocat",
        icon = 2831006,
        itemId = 167751,
        spellId = 294143,
        source = {
          mapId = 0,
          uiMapIds = {
            1462
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Pascal-K1N6"
          },
          note = "Sells X-995 Mechanocat. Requires paint vials from rares."
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Pascal-K1N6",
      npcID = 150359
    },
    expansion = 7
  },
  {
    id = 258,
    mounts = {
      {
        id = 1242,
        name = "Beastlord's Irontusk",
        icon = 0,
        itemId = 167894,
        spellId = 294568,
        source = {
          mapId = 0,
          uiMapIds = {
            624
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Kronnus"
          },
          note = "Timewalking vendor",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      },
      {
        id = 1243,
        name = "Beastlord's Warwolf",
        icon = 0,
        itemId = 167895,
        spellId = 294569,
        source = {
          mapId = 0,
          uiMapIds = {
            624
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Kronnus"
          },
          note = "Timewalking vendor",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      },
      {
        id = 2470,
        name = "Nightfall Skyreaver",
        icon = 943739,
        itemId = 234716,
        spellId = 1214920,
        source = {
          mapId = 0,
          uiMapIds = {
            624
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Kronnus"
          },
          note = "Timewalking vendor",
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
      name = "Kronnus",
      npcID = 151987
    },
    expansion = 5
  },
  {
    id = 259,
    mounts = {
      {
        id = 1242,
        name = "Beastlord's Irontusk",
        icon = 0,
        itemId = 167894,
        spellId = 294568,
        source = {
          mapId = 0,
          uiMapIds = {
            622
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tempra"
          },
          note = "Timewalking vendor",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      },
      {
        id = 1243,
        name = "Beastlord's Warwolf",
        icon = 0,
        itemId = 167895,
        spellId = 294569,
        source = {
          mapId = 0,
          uiMapIds = {
            622
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tempra"
          },
          note = "Timewalking vendor",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      },
      {
        id = 2470,
        name = "Nightfall Skyreaver",
        icon = 943739,
        itemId = 234716,
        spellId = 1214920,
        source = {
          mapId = 0,
          uiMapIds = {
            622
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tempra"
          },
          note = "Timewalking vendor",
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
      name = "Tempra",
      npcID = 151955
    },
    expansion = 5
  },
  {
    id = 260,
    mounts = {
      {
        id = 1248,
        name = "Junkheap Drifter",
        icon = 2902998,
        itemId = 168370,
        spellId = 297157,
        source = {
          mapId = 0,
          uiMapIds = {
            1462
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Rustfeather"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Rustfeather",
      npcID = 152182
    },
    expansion = 7
  },
  {
    id = 261,
    mounts = {
      {
        id = 1249,
        name = "Child of Torcali",
        icon = 2429953,
        itemId = 168408,
        spellId = 297560,
        source = {
          mapId = 0,
          uiMapIds = {
            862
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Wander Not Alone"
          },
          note = "Torcali raptor questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Wander Not Alone"
    },
    expansion = 7
  },
  {
    id = 262,
    mounts = {
      {
        id = 1250,
        name = "Mollie",
        icon = 2916284,
        itemId = 174842,
        spellId = 298367,
        source = {
          mapId = 0,
          uiMapIds = {
            864
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Dunegorger Kraulok"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Dunegorger Kraulok",
      npcID = 138794
    },
    expansion = 7
  },
  {
    id = 263,
    mounts = {
      {
        id = 1253,
        name = "Scrapforged Mechaspider",
        icon = 2620864,
        itemId = 168827,
        spellId = 299159,
        source = {
          mapId = 0,
          uiMapIds = {
            1462
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Drive It Away Today"
          },
          note = "Construct the Mechaspider from parts found on Mechagon."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Drive It Away Today"
    },
    expansion = 7
  },
  {
    id = 264,
    mounts = {
      {
        id = 1254,
        name = "Rustbolt Resistor",
        icon = 2574426,
        itemId = 168829,
        spellId = 299170,
        source = {
          mapId = 0,
          uiMapIds = {
            1462
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Stolen Royal Vendorbot"
          },
          cost = {
            type = "gold",
            amount = 1900000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Stolen Royal Vendorbot",
      npcID = 150716
    },
    expansion = 7
  },
  {
    id = 265,
    mounts = {
      {
        id = 1255,
        name = "Deepcoral Snapdragon",
        icon = 2766228,
        itemId = 169200,
        spellId = 300147,
        source = {
          mapId = 0,
          uiMapIds = {
            1355
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Wild Tame"
          },
          note = "Snapdragon story quest."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Wild Tame"
    },
    expansion = 7
  },
  {
    id = 266,
    mounts = {
      {
        id = 1256,
        name = "Snapdragon Kelpstalker",
        icon = 2766227,
        itemId = 169199,
        spellId = 300146,
        source = {
          mapId = 0,
          uiMapIds = {
            1355
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Good Girl"
          },
          note = "Snapdragon story quest."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Good Girl"
    },
    expansion = 7
  },
  {
    id = 267,
    mounts = {
      {
        id = 1257,
        name = "Silent Glider",
        icon = 2620777,
        itemId = 169163,
        spellId = 300149,
        source = {
          mapId = 0,
          uiMapIds = {
            1355
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Soundless"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Soundless",
      npcID = 152290
    },
    expansion = 7
  },
  {
    id = 268,
    mounts = {
      {
        id = 1258,
        name = "Fabious",
        icon = 2741477,
        itemId = 169201,
        spellId = 300150,
        source = {
          mapId = 0,
          uiMapIds = {
            1355
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Fabious"
          },
          note = "Use S.E.L.F.I.E. Camera near Fabious. Rare spawn along Nazjatar coast."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Fabious"
    },
    expansion = 7
  },
  {
    id = 269,
    mounts = {
      {
        id = 1260,
        name = "Crimson Tidestallion",
        icon = 2741468,
        itemId = 169202,
        spellId = 300153,
        source = {
          mapId = 0,
          uiMapIds = {
            1355
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Mrrl"
          },
          note = "Murloc trading game vendor",
          cost = {
            type = "item",
            amount = 4,
            itemId = 169783
          },
          costs = {
            {
              type = "item",
              amount = 4,
              itemId = 169783
            },
            {
              type = "item",
              amount = 2,
              itemId = 169780
            },
            {
              type = "item",
              amount = 1,
              itemId = 170100
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Mrrl",
      npcID = 152084
    },
    expansion = 7
  },
  {
    id = 270,
    mounts = {
      {
        id = 1262,
        name = "Inkscale Deepseeker",
        icon = 2741465,
        itemId = 169203,
        spellId = 300151,
        source = {
          mapId = 0,
          uiMapIds = {
            1355
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dazzerian (Nazjatar)"
          },
          note = "Nazjatar PvP mount vendor",
          cost = {
            type = "item",
            amount = 150,
            itemId = 168802
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Dazzerian (Nazjatar)",
      npcID = 154652
    },
    expansion = 7
  },
  {
    id = 271,
    mounts = {
      {
        id = 1293,
        name = "Ny'alotha Allseer",
        icon = 3067412,
        itemId = 174872,
        spellId = 308814,
        source = {
          mapId = 2217,
          uiMapIds = {
            1597
          },
          allowedDifficultyIds = {
            16
          },
          journalEncounter = {
            id = 2375,
            name = "N'Zoth the Corruptor",
            instanceId = 1180,
            uiMapId = 1597
          },
          dungeonEncounter = {
            id = 2344,
            name = "N'Zoth the Corruptor",
            mapId = 2217
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Ny'alotha, the Waking City"
    },
    expansion = 7
  },
  {
    id = 272,
    mounts = {
      {
        id = 1297,
        name = "Clutch of Ha-Li",
        icon = 3229545,
        itemId = 173887,
        spellId = 312751,
        source = {
          mapId = 0,
          uiMapIds = {
            1530
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Ha-Li"
          },
          note = "N'Zoth assault rare in Vale of Eternal Blossoms."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Ha-Li",
      npcID = 157153
    },
    expansion = 7
  },
  {
    id = 273,
    mounts = {
      {
        id = 1304,
        name = "Mawsworn Soulhunter",
        icon = 2998184,
        itemId = 184167,
        spellId = 312762,
        source = {
          mapId = 0,
          uiMapIds = {
            1543
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Gorged Shadehound"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Gorged Shadehound"
    },
    expansion = 8
  },
  {
    id = 274,
    mounts = {
      {
        id = 1306,
        name = "Swift Gloomhoof",
        icon = 3155421,
        itemId = 180728,
        spellId = 312767,
        source = {
          mapId = 0,
          uiMapIds = {
            1565
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Night Mare"
          },
          note = "Requires Dreamland Lurker's Saddle from Oaken Assembly to ride."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Night Mare",
      npcID = 168135
    },
    expansion = 8
  },
  {
    id = 275,
    mounts = {
      {
        id = 1307,
        name = "Sundancer",
        icon = 3155425,
        itemId = 180773,
        spellId = 312765,
        source = {
          mapId = 0,
          uiMapIds = {
            1533
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Sundancer"
          },
          note = "Use Sunrider's Blessing from nearby altar + Skystrider Glider to reach. Mount via extra action button."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Sundancer",
      npcID = 170548
    },
    expansion = 8
  },
  {
    id = 276,
    mounts = {
      {
        id = 1310,
        name = "Horrid Dredwing",
        icon = 3087789,
        itemId = 180461,
        spellId = 332882,
        source = {
          mapId = 0,
          uiMapIds = {
            1525
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Harika the Horrid"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Harika the Horrid",
      npcID = 165290
    },
    expansion = 8
  },
  {
    id = 277,
    mounts = {
      {
        id = 1311,
        name = "Ivory Cloud Serpent",
        icon = 0,
        itemId = 174752,
        spellId = 315014,
        source = {
          mapId = 0,
          uiMapIds = {
            1530
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Ivory Cloud Serpent"
          },
          note = "Spawns from Zan-Tien Lasso on Ivory Cloud Serpent mob. Requires killing Anh-De the Loyal first."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Ivory Cloud Serpent"
    },
    expansion = 8
  },
  {
    id = 278,
    mounts = {
      {
        id = 1313,
        name = "Rajani Warserpent",
        icon = 838515,
        itemId = 174649,
        spellId = 315427,
        source = {
          mapId = 0,
          uiMapIds = {
            1530
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zhang Ku"
          },
          cost = {
            type = "item",
            amount = 1,
            itemId = 174230
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Zhang Ku",
      npcID = 160711
    },
    expansion = 8
  },
  {
    id = 279,
    mounts = {
      {
        id = 1314,
        name = "Drake of the Four Winds",
        icon = 3229542,
        itemId = 174641,
        spellId = 315847,
        source = {
          mapId = 0,
          uiMapIds = {
            1527
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Ishak of the Four Winds"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Ishak of the Four Winds",
      npcID = 157134
    },
    expansion = 8
  },
  {
    id = 280,
    mounts = {
      {
        id = 1315,
        name = "Mail Muncher",
        icon = 3005321,
        itemId = 174653,
        spellId = 315987,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Mail Muncher"
          },
          note = "Found in mailboxes during Horrific Visions."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Mail Muncher"
    },
    expansion = 7
  },
  {
    id = 281,
    mounts = {
      {
        id = 1317,
        name = "Waste Marauder",
        icon = 1929247,
        itemId = 174753,
        spellId = 316275,
        source = {
          mapId = 0,
          uiMapIds = {
            1527
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Rotfeaster"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Rotfeaster",
      npcID = 157146
    },
    expansion = 8
  },
  {
    id = 282,
    mounts = {
      {
        id = 1318,
        name = "Wastewander Skyterror",
        icon = 1929251,
        itemId = 174754,
        spellId = 316276,
        source = {
          mapId = 0,
          uiMapIds = {
            2199
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Qorra"
          },
          cost = {
            type = "gold",
            amount = 240000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Provisioner Qorra",
      npcID = 208347
    },
    expansion = 9
  },
  {
    id = 283,
    mounts = {
      {
        id = 1319,
        name = "Malevolent Drone",
        icon = 2914896,
        itemId = 174769,
        spellId = 316337,
        source = {
          mapId = 0,
          uiMapIds = {
            1527
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Corpse Eater"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Corpse Eater"
    },
    expansion = 8
  },
  {
    id = 284,
    mounts = {
      {
        id = 1320,
        name = "Shadowbarb Drone",
        icon = 2914897,
        itemId = 174771,
        spellId = 316339,
        source = {
          mapId = 0,
          uiMapIds = {
            1527
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "My Own Drone"
          },
          note = "Aqir Hive daily chain in N'Zoth assault Uldum."
        }
      }
    },
    source = {
      type = "Quest",
      name = "My Own Drone"
    },
    expansion = 8
  },
  {
    id = 285,
    mounts = {
      {
        id = 1321,
        name = "Wicked Swarmer",
        icon = 2914898,
        itemId = 174770,
        spellId = 316340,
        source = {
          mapId = 0,
          uiMapIds = {
            1473
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Wrathion"
          },
          cost = {
            type = "currency",
            amount = 100000,
            currencyId = 1719
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Wrathion",
      npcID = 189569
    },
    expansion = 8
  },
  {
    id = 286,
    mounts = {
      {
        id = 1327,
        name = "Ren's Stalwart Hound",
        icon = 3229544,
        itemId = 174841,
        spellId = 316722,
        source = {
          mapId = 0,
          uiMapIds = {
            1530
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Houndlord Ren"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Houndlord Ren",
      npcID = 157160
    },
    expansion = 8
  },
  {
    id = 287,
    mounts = {
      {
        id = 1328,
        name = "Xinlao",
        icon = 3229543,
        itemId = 174840,
        spellId = 316723,
        source = {
          mapId = 0,
          uiMapIds = {
            1530
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Anh-De the Loyal"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Anh-De the Loyal",
      npcID = 157466
    },
    expansion = 8
  },
  {
    id = 288,
    mounts = {
      {
        id = 1329,
        name = "Springfur Alpaca",
        icon = 2916287,
        itemId = 174859,
        spellId = 316802,
        source = {
          mapId = 0,
          uiMapIds = {
            1527
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Alpaca It In"
          },
          note = "Feed and befriend the Springfur Alpaca in Uldum over 7 days of N'Zoth assaults."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Alpaca It In"
    },
    expansion = 8
  },
  {
    id = 289,
    mounts = {
      {
        id = 1332,
        name = "Silky Shimmermoth",
        icon = 3255388,
        itemId = 180748,
        spellId = 318051,
        source = {
          mapId = 0,
          uiMapIds = {
            1565
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Master Clerk Salorn"
          },
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1813
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Master Clerk Salorn",
      npcID = 163714
    },
    expansion = 8
  },
  {
    id = 290,
    mounts = {
      {
        id = 1350,
        name = "Colossal Slaughterclaw",
        icon = 3546384,
        itemId = 182081,
        spellId = 327405,
        source = {
          mapId = 0,
          uiMapIds = {
            1536
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Supplies of the Undying Army"
          },
          note = "Paragon reputation reward from the Undying Army."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Supplies of the Undying Army"
    },
    expansion = 8
  },
  {
    id = 291,
    mounts = {
      {
        id = 1361,
        name = "Duskflutter Ardenmoth",
        icon = 3255389,
        itemId = 180729,
        spellId = 332256,
        source = {
          mapId = 0,
          uiMapIds = {
            1565
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Aithlyn"
          },
          cost = {
            type = "gold",
            amount = 300000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Aithlyn",
      npcID = 158556
    },
    expansion = 8
  },
  {
    id = 292,
    mounts = {
      {
        id = 1362,
        name = "Spinemaw Gladechewer",
        icon = 3084143,
        itemId = 180725,
        spellId = 334364,
        source = {
          mapId = 0,
          uiMapIds = {
            1565
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Gormtamer Tizo"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Gormtamer Tizo",
      npcID = 164107
    },
    expansion = 8
  },
  {
    id = 293,
    mounts = {
      {
        id = 1366,
        name = "Bonehoof Tauralus",
        icon = 3511737,
        itemId = 182075,
        spellId = 332457,
        source = {
          mapId = 0,
          uiMapIds = {
            1536
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Tahonta"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Tahonta",
      npcID = 162586
    },
    expansion = 8
  },
  {
    id = 294,
    mounts = {
      {
        id = 1369,
        name = "Armored Plaguerot Tauralus",
        icon = 3849327,
        itemId = 181821,
        spellId = 332464,
        source = {
          mapId = 0,
          uiMapIds = {
            1536
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Su Zettai"
          },
          cost = {
            type = "currency",
            amount = 3000,
            currencyId = 1813
          }
        }
      },
      {
        id = 1496,
        name = "Regal Corpsefly",
        icon = 3896765,
        itemId = 186488,
        spellId = 353884,
        source = {
          mapId = 0,
          uiMapIds = {
            1536
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Su Zettai"
          },
          cost = {
            type = "currency",
            amount = 7500,
            currencyId = 1813
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Su Zettai",
      npcID = 172176
    },
    expansion = 8
  },
  {
    id = 295,
    mounts = {
      {
        id = 1370,
        name = "Armored Bonehoof Tauralus",
        icon = 3511738,
        itemId = 181815,
        spellId = 332466,
        source = {
          mapId = 0,
          uiMapIds = {
            1536
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Sabriel the Bonecleaver"
          },
          note = "Theater of Pain area."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Sabriel the Bonecleaver",
      npcID = 168147
    },
    expansion = 8
  },
  {
    id = 296,
    mounts = {
      {
        id = 1372,
        name = "Blisterback Bloodtusk",
        icon = 3456125,
        itemId = 182085,
        spellId = 332478,
        source = {
          mapId = 0,
          uiMapIds = {
            1536
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Warbringer Mal'korak"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Warbringer Mal'korak",
      npcID = 162819
    },
    expansion = 8
  },
  {
    id = 297,
    mounts = {
      {
        id = 1373,
        name = "Gorespine",
        icon = 3456126,
        itemId = 182084,
        spellId = 332480,
        source = {
          mapId = 0,
          uiMapIds = {
            1536
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Nerissa Heartless"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Nerissa Heartless",
      npcID = 162690
    },
    expansion = 8
  },
  {
    id = 298,
    mounts = {
      {
        id = 1375,
        name = "Lurid Bloodtusk",
        icon = 3456128,
        itemId = 182082,
        spellId = 332484,
        source = {
          mapId = 0,
          uiMapIds = {
            1536
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Nalcorn Talsen"
          },
          cost = {
            type = "gold",
            amount = 300000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Nalcorn Talsen",
      npcID = 173003
    },
    expansion = 8
  },
  {
    id = 299,
    mounts = {
      {
        id = 1378,
        name = "Harvester's Dredwing",
        icon = 3087790,
        itemId = 185996,
        spellId = 332904,
        source = {
          mapId = 0,
          uiMapIds = {
            1525
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Harvester's War Chest"
          },
          note = "Paragon reputation reward from Court of Harvesters."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Harvester's War Chest"
    },
    expansion = 8
  },
  {
    id = 300,
    mounts = {
      {
        id = 1379,
        name = "Endmire Flyer",
        icon = 3155459,
        itemId = 180582,
        spellId = 332905,
        source = {
          mapId = 0,
          uiMapIds = {
            1525
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Famu the Infinite"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Famu the Infinite",
      npcID = 166521
    },
    expansion = 8
  },
  {
    id = 301,
    mounts = {
      {
        id = 1391,
        name = "Loyal Gorger",
        icon = 3601543,
        itemId = 182589,
        spellId = 333027,
        source = {
          mapId = 0,
          uiMapIds = {
            1525
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "A New Pack"
          },
          note = "Feed and befriend a gorm in Revendreth."
        }
      }
    },
    source = {
      type = "Quest",
      name = "A New Pack"
    },
    expansion = 8
  },
  {
    id = 302,
    mounts = {
      {
        id = 1393,
        name = "Wild Glimmerfur Prowler",
        icon = 3747448,
        itemId = 180730,
        spellId = 334366,
        source = {
          mapId = 0,
          uiMapIds = {
            1565
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Valfir the Unrelenting"
          },
          note = "Requires lure to clear corruption shield."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Valfir the Unrelenting",
      npcID = 168647
    },
    expansion = 8
  },
  {
    id = 303,
    mounts = {
      {
        id = 1397,
        name = "Wildseed Cradle",
        icon = 3747572,
        itemId = 180731,
        spellId = 334352,
        source = {
          mapId = 0,
          uiMapIds = {
            1565
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Cache of the Moon"
          },
          note = "Requires Night Fae covenant, Hidden Mirror puzzle."
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Cache of the Moon"
    },
    expansion = 8
  },
  {
    id = 304,
    mounts = {
      {
        id = 1404,
        name = "Silverwind Larion",
        icon = 3849785,
        itemId = 180772,
        spellId = 334433,
        source = {
          mapId = 0,
          uiMapIds = {
            1533
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Gift of the Silver Wind"
          },
          note = "Requires clicking 3 silver wind scrolls across Bastion."
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Gift of the Silver Wind"
    },
    expansion = 8
  },
  {
    id = 305,
    mounts = {
      {
        id = 1406,
        name = "Marrowfang",
        icon = 3849264,
        itemId = 181819,
        spellId = 336036,
        source = {
          mapId = 2286,
          uiMapIds = {
            1668
          },
          allowedDifficultyIds = {
            23,
            8
          },
          journalEncounter = {
            id = 2396,
            name = "Nalthor the Rimebinder",
            instanceId = 1182,
            uiMapId = 1668
          },
          dungeonEncounter = {
            id = 2390,
            name = "Nalthor the Rimebinder",
            mapId = 2286
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "The Necrotic Wake"
    },
    expansion = 8
  },
  {
    id = 306,
    mounts = {
      {
        id = 1410,
        name = "Hulking Deathroc",
        icon = 3546654,
        itemId = 182079,
        spellId = 336042,
        source = {
          mapId = 0,
          uiMapIds = {
            1536
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Violet Mistake"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Violet Mistake",
      npcID = 159140
    },
    expansion = 8
  },
  {
    id = 307,
    mounts = {
      {
        id = 1411,
        name = "Predatory Plagueroc",
        icon = 3546385,
        itemId = 182080,
        spellId = 336045,
        source = {
          mapId = 0,
          uiMapIds = {
            1536
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Gieger"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Gieger",
      npcID = 162741
    },
    expansion = 8
  },
  {
    id = 308,
    mounts = {
      {
        id = 1414,
        name = "Sinrunner Blanchy",
        icon = 2143082,
        itemId = 182614,
        spellId = 339588,
        source = {
          mapId = 0,
          uiMapIds = {
            1525
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dead Blanchy"
          },
          note = "6-day feeding chain. Visit Dead Blanchy once per day with: Day 1: 8 Handfuls of Oats, Day 2: Grooming Brush, Day 3: 4 Sturdy Horseshoes, Day 4: Bucket of Clean Water, Day 5: Comfortable Saddle Blanket, Day 6: Dredhollow Apple.",
          questChain = {
            {
              questID = 62038,
              name = "Day 1: 8 Handfuls of Oats"
            },
            {
              questID = 62042,
              name = "Day 2: Grooming Brush"
            },
            {
              questID = 62047,
              name = "Day 3: 4 Sturdy Horseshoes"
            },
            {
              questID = 62048,
              name = "Day 4: Bucket of Clean Water"
            },
            {
              questID = 62049,
              name = "Day 5: Comfortable Saddle Blanket"
            },
            {
              questID = 62050,
              name = "Day 6: Dredhollow Apple"
            }
          }
        }
      }
    },
    source = {
      type = "Quest",
      name = "Dead Blanchy",
      npcID = 173468
    },
    expansion = 8
  },
  {
    id = 309,
    mounts = {
      {
        id = 1415,
        name = "Arboreal Gulper",
        icon = 3731082,
        itemId = 182650,
        spellId = 339632,
        source = {
          mapId = 0,
          uiMapIds = {
            1565
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Humon'gozz"
          },
          note = "Requires using Unusually Large Mushroom to spawn."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Humon'gozz",
      npcID = 164112
    },
    expansion = 8
  },
  {
    id = 310,
    mounts = {
      {
        id = 1420,
        name = "Umbral Scythehorn",
        icon = 3084138,
        itemId = 183053,
        spellId = 340503,
        source = {
          mapId = 0,
          uiMapIds = {
            1565
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Spindlenose"
          },
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1813
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Spindlenose",
      npcID = 162447
    },
    expansion = 8
  },
  {
    id = 311,
    mounts = {
      {
        id = 1421,
        name = "Court Sinrunner",
        icon = 2143093,
        itemId = 183518,
        spellId = 341639,
        source = {
          mapId = 0,
          uiMapIds = {
            1525
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Mistress Mihaela"
          },
          cost = {
            type = "gold",
            amount = 300000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Mistress Mihaela",
      npcID = 156822
    },
    expansion = 8
  },
  {
    id = 312,
    mounts = {
      {
        id = 1425,
        name = "Gilded Prowler",
        icon = 3155392,
        itemId = 183740,
        spellId = 342334,
        source = {
          mapId = 0,
          uiMapIds = {
            1533
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Adjutant Nikos"
          },
          cost = {
            type = "gold",
            amount = 300000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Adjutant Nikos",
      npcID = 160470
    },
    expansion = 8
  },
  {
    id = 313,
    mounts = {
      {
        id = 1426,
        name = "Ascended Skymane",
        icon = 3155423,
        itemId = 183741,
        spellId = 342335,
        source = {
          mapId = 0,
          uiMapIds = {
            1533
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Cache of the Ascended"
          },
          note = "Requires completing all 4 Trials of Ascension."
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Cache of the Ascended"
    },
    expansion = 8
  },
  {
    id = 314,
    mounts = {
      {
        id = 1428,
        name = "Amber Ardenmoth",
        icon = 3255391,
        itemId = 183800,
        spellId = 342666,
        source = {
          mapId = 0,
          uiMapIds = {
            1565
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Wild Hunt Supplies"
          },
          note = "Paragon reputation reward from the Wild Hunt."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Wild Hunt Supplies"
    },
    expansion = 8
  },
  {
    id = 315,
    mounts = {
      {
        id = 1429,
        name = "Vibrant Flutterwing",
        icon = 3255390,
        itemId = 183801,
        spellId = 342667,
        source = {
          mapId = 0,
          uiMapIds = {
            1565
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Cortinarius"
          },
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1813
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Cortinarius",
      npcID = 174766
    },
    expansion = 8
  },
  {
    id = 316,
    mounts = {
      {
        id = 1434,
        name = "Deepstar Aurelid",
        icon = 3747573,
        itemId = 187676,
        spellId = 342680,
        source = {
          mapId = 0,
          uiMapIds = {
            1970
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Hirukon"
          },
          note = "Fishing rare. Requires bait crafting chain."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Hirukon",
      npcID = 180978
    },
    expansion = 8
  },
  {
    id = 317,
    mounts = {
      {
        id = 1436,
        name = "Battle-Hardened Aquilon",
        icon = 3771701,
        itemId = 186480,
        spellId = 343550,
        source = {
          mapId = 0,
          uiMapIds = {
            1961
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Duchess Mynx"
          },
          cost = {
            type = "currency",
            amount = 1000,
            currencyId = 1767
          }
        }
      },
      {
        id = 1486,
        name = "Winter Wilderling",
        icon = 3811755,
        itemId = 186495,
        spellId = 353858,
        source = {
          mapId = 0,
          uiMapIds = {
            1961
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Duchess Mynx"
          },
          cost = {
            type = "currency",
            amount = 1000,
            currencyId = 1767
          }
        }
      },
      {
        id = 1491,
        name = "Pale Gravewing",
        icon = 3852566,
        itemId = 186477,
        spellId = 353873,
        source = {
          mapId = 0,
          uiMapIds = {
            1961
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Duchess Mynx"
          },
          cost = {
            type = "currency",
            amount = 1000,
            currencyId = 1767
          }
        }
      },
      {
        id = 1497,
        name = "Battlefield Swarmer",
        icon = 3896754,
        itemId = 186490,
        spellId = 353885,
        source = {
          mapId = 0,
          uiMapIds = {
            1961
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Duchess Mynx"
          },
          cost = {
            type = "currency",
            amount = 1000,
            currencyId = 1767
          }
        }
      },
      {
        id = 1505,
        name = "Amber Shardhide",
        icon = 3931159,
        itemId = 186647,
        spellId = 354356,
        source = {
          mapId = 0,
          uiMapIds = {
            1961
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Duchess Mynx"
          },
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1767
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Duchess Mynx",
      npcID = 179321
    },
    expansion = 8
  },
  {
    id = 318,
    mounts = {
      {
        id = 1437,
        name = "Battle-Bound Warhound",
        icon = 3729479,
        itemId = 184062,
        spellId = 344228,
        source = {
          mapId = 0,
          uiMapIds = {
            1536
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Theater of Pain"
          },
          note = "Drops from Theater of Pain dungeon activities."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Theater of Pain"
    },
    expansion = 8
  },
  {
    id = 319,
    mounts = {
      {
        id = 1438,
        name = "Bulbous Necroray",
        icon = 0,
        itemId = 184160,
        spellId = 344574,
        source = {
          mapId = 0,
          uiMapIds = {
            1536
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Oozing Necroray Egg"
          },
          note = "Found in Maldraxxus. Hatches into one of three Necroray mounts."
        }
      },
      {
        id = 1439,
        name = "Infested Necroray",
        icon = 1570759,
        itemId = 184161,
        spellId = 344576,
        source = {
          mapId = 0,
          uiMapIds = {
            1536
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Oozing Necroray Egg"
          },
          note = "Found in Maldraxxus. Hatches into one of three Necroray mounts."
        }
      },
      {
        id = 1440,
        name = "Pestilent Necroray",
        icon = 0,
        itemId = 184162,
        spellId = 344575,
        source = {
          mapId = 0,
          uiMapIds = {
            1536
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Oozing Necroray Egg"
          },
          note = "Found in Maldraxxus. Hatches into one of three Necroray mounts."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Oozing Necroray Egg"
    },
    expansion = 8
  },
  {
    id = 320,
    mounts = {
      {
        id = 1441,
        name = "Bound Shadehound",
        icon = 2998185,
        itemId = 184168,
        spellId = 344577,
        source = {
          mapId = 0,
          uiMapIds = {
            1543
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Feral Shadehound"
          },
          note = "Tame a Shadehound in The Maw."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Feral Shadehound"
    },
    expansion = 8
  },
  {
    id = 321,
    mounts = {
      {
        id = 1445,
        name = "Slime Serpent",
        icon = 0,
        itemId = 0,
        spellId = 346141,
        source = {
          mapId = 0,
          uiMapIds = {
            1536
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Slime Serpent"
          },
          note = "Solo Heroic or higher difficulty Plaguefall dungeon. After defeating the last boss, Slime Serpent will be waiting in the area you fight the third boss."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Slime Serpent"
    },
    expansion = 8
  },
  {
    id = 322,
    mounts = {
      {
        id = 1449,
        name = "Lord of the Corpseflies",
        icon = 3896744,
        itemId = 186489,
        spellId = 347250,
        source = {
          mapId = 0,
          uiMapIds = {
            1961
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Fleshwing"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Fleshwing",
      npcID = 180042
    },
    expansion = 8
  },
  {
    id = 323,
    mounts = {
      {
        id = 1450,
        name = "Soaring Razorwing",
        icon = 3897764,
        itemId = 186648,
        spellId = 347251,
        source = {
          mapId = 0,
          uiMapIds = {
            1961
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Archivist Roh-Suir"
          },
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1931
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Archivist Roh-Suir",
      npcID = 178257
    },
    expansion = 8
  },
  {
    id = 324,
    mounts = {
      {
        id = 1454,
        name = "Tamed Mauler",
        icon = 3924116,
        itemId = 186641,
        spellId = 347536,
        source = {
          mapId = 0,
          uiMapIds = {
            1961
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Supplies of the Archivist's Codex"
          },
          note = "Archivist's Codex reputation reward."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Supplies of the Archivist's Codex"
    },
    expansion = 8
  },
  {
    id = 325,
    mounts = {
      {
        id = 1455,
        name = "Beryl Shardhide",
        icon = 3931155,
        itemId = 186644,
        spellId = 347810,
        source = {
          mapId = 0,
          uiMapIds = {
            1961
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Death's Advance Supplies"
          },
          note = "Death's Advance paragon reputation reward."
        }
      },
      {
        id = 1508,
        name = "Fierce Razorwing",
        icon = 3897736,
        itemId = 186649,
        spellId = 354359,
        source = {
          mapId = 0,
          uiMapIds = {
            1961
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Death's Advance Supplies"
          },
          note = "Death's Advance paragon reputation reward."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Death's Advance Supplies"
    },
    expansion = 8
  },
  {
    id = 326,
    mounts = {
      {
        id = 1467,
        name = "Noble Bruffalon",
        icon = 3996077,
        itemId = 192770,
        spellId = 349935,
        source = {
          mapId = 0,
          uiMapIds = {
            2151
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Storykeeper Ashekh"
          },
          cost = {
            type = "currency",
            amount = 100000,
            currencyId = 2118
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Storykeeper Ashekh",
      npcID = 200564
    },
    expansion = 9
  },
  {
    id = 327,
    mounts = {
      {
        id = 1471,
        name = "Vengeance",
        icon = 4034349,
        itemId = 186642,
        spellId = 351195,
        source = {
          mapId = 2450,
          uiMapIds = {
            2002
          },
          allowedDifficultyIds = {
            16
          },
          journalEncounter = {
            id = 2441,
            name = "Sylvanas Windrunner",
            instanceId = 1193,
            uiMapId = 2002
          },
          dungeonEncounter = {
            id = 2435,
            name = "Sylvanas Windrunner",
            mapId = 2450
          }
        }
      },
      {
        id = 1500,
        name = "Sanctum Gloomcharger",
        icon = 3636570,
        itemId = 186656,
        spellId = 354351,
        source = {
          mapId = 2450,
          uiMapIds = {
            1999
          },
          allowedDifficultyIds = {
            14,
            15,
            16,
            17
          },
          journalEncounter = {
            id = 2439,
            name = "The Nine",
            instanceId = 1193,
            uiMapId = 1999
          },
          dungeonEncounter = {
            id = 2429,
            name = "The Nine",
            mapId = 2450
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Sanctum of Domination"
    },
    expansion = 8
  },
  {
    id = 328,
    mounts = {
      {
        id = 1475,
        name = "Hand of Bahmethra",
        icon = 236925,
        itemId = 185973,
        spellId = 352309,
        source = {
          mapId = 0,
          uiMapIds = {
            1543
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Tormentors of Torghast"
          },
          note = "Weekly event in The Maw."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Tormentors of Torghast"
    },
    expansion = 8
  },
  {
    id = 329,
    mounts = {
      {
        id = 1476,
        name = "Wild Hunt Legsplitter",
        icon = 3084140,
        itemId = 186000,
        spellId = 352441,
        source = {
          mapId = 0,
          uiMapIds = {
            1565
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "War Chest of the Wild Hunt"
          },
          note = "Covenant campaign supply from Night Fae."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "War Chest of the Wild Hunt"
    },
    expansion = 8
  },
  {
    id = 330,
    mounts = {
      {
        id = 1477,
        name = "Undying Darkhound",
        icon = 3849322,
        itemId = 186103,
        spellId = 352742,
        source = {
          mapId = 0,
          uiMapIds = {
            1536
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "War Chest of the Undying Army"
          },
          note = "Covenant campaign supply from Necrolords."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "War Chest of the Undying Army"
    },
    expansion = 8
  },
  {
    id = 331,
    mounts = {
      {
        id = 1478,
        name = "Skyskin Hornstrider",
        icon = 4037553,
        itemId = 192800,
        spellId = 352926,
        source = {
          mapId = 0,
          uiMapIds = {
            71
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Brendormi"
          },
          cost = {
            type = "item",
            amount = 150,
            itemId = 202039
          },
          costs = {
            {
              type = "item",
              amount = 150,
              itemId = 202039
            },
            {
              type = "currency",
              amount = 3000,
              currencyId = 2118
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Brendormi",
      npcID = 199425
    },
    expansion = 9
  },
  {
    id = 332,
    mounts = {
      {
        id = 1481,
        name = "Cartel Master's Gearglider",
        icon = 3802393,
        itemId = 186638,
        spellId = 353263,
        source = {
          mapId = 2441,
          uiMapIds = {
            1989
          },
          allowedDifficultyIds = {
            23,
            2,
            8
          },
          journalEncounter = {
            id = 2455,
            name = "So'leah",
            instanceId = 1194,
            uiMapId = 1989
          },
          dungeonEncounter = {
            id = 2442,
            name = "So'leah",
            mapId = 2441
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "Tazavesh, the Veiled Market"
    },
    expansion = 8
  },
  {
    id = 333,
    mounts = {
      {
        id = 1485,
        name = "Autumnal Wilderling",
        icon = 3811756,
        itemId = 186494,
        spellId = 353857,
        source = {
          mapId = 0,
          uiMapIds = {
            1565
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Elwyn"
          },
          cost = {
            type = "currency",
            amount = 7500,
            currencyId = 1813
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Elwyn",
      npcID = 174914
    },
    expansion = 8
  },
  {
    id = 334,
    mounts = {
      {
        id = 1487,
        name = "Summer Wilderling",
        icon = 4034438,
        itemId = 186492,
        spellId = 353859,
        source = {
          mapId = 0,
          uiMapIds = {
            1961
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Escaped Wilderling"
          },
          note = "Spawns from events. Chase and interact."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Escaped Wilderling",
      npcID = 180013
    },
    expansion = 8
  },
  {
    id = 335,
    mounts = {
      {
        id = 1489,
        name = "Obsidian Gravewing",
        icon = 3852564,
        itemId = 186478,
        spellId = 353866,
        source = {
          mapId = 0,
          uiMapIds = {
            1525
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Chachi the Artiste"
          },
          cost = {
            type = "currency",
            amount = 7500,
            currencyId = 1813
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Chachi the Artiste",
      npcID = 174710
    },
    expansion = 8
  },
  {
    id = 336,
    mounts = {
      {
        id = 1493,
        name = "Forsworn Aquilon",
        icon = 3771702,
        itemId = 186483,
        spellId = 353877,
        source = {
          mapId = 0,
          uiMapIds = {
            1961
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Wild Worldcracker"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Wild Worldcracker",
      npcID = 180032
    },
    expansion = 8
  },
  {
    id = 337,
    mounts = {
      {
        id = 1494,
        name = "Ascendant's Aquilon",
        icon = 3771703,
        itemId = 186485,
        spellId = 353880,
        source = {
          mapId = 0,
          uiMapIds = {
            1533
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Adjutant Galos"
          },
          cost = {
            type = "currency",
            amount = 7500,
            currencyId = 1813
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Adjutant Galos",
      npcID = 174937
    },
    expansion = 8
  },
  {
    id = 338,
    mounts = {
      {
        id = 1501,
        name = "Soulbound Gloomcharger",
        icon = 3636571,
        itemId = 186657,
        spellId = 354352,
        source = {
          mapId = 0,
          uiMapIds = {
            1543
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Mysterious Gift from Ve'nari"
          },
          note = "Purchased from Ve'nari with Stygia."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Mysterious Gift from Ve'nari"
    },
    expansion = 8
  },
  {
    id = 339,
    mounts = {
      {
        id = 1502,
        name = "Fallen Charger",
        icon = 3636572,
        itemId = 186659,
        spellId = 354353,
        source = {
          mapId = 0,
          uiMapIds = {
            1543
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Fallen Charger"
          },
          note = "Roaming rare on a patrol path."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Fallen Charger",
      npcID = 179460
    },
    expansion = 8
  },
  {
    id = 340,
    mounts = {
      {
        id = 1506,
        name = "Crimson Shardhide",
        icon = 3931158,
        itemId = 186645,
        spellId = 354357,
        source = {
          mapId = 0,
          uiMapIds = {
            1961
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Malbog"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Malbog",
      npcID = 179684
    },
    expansion = 8
  },
  {
    id = 341,
    mounts = {
      {
        id = 1509,
        name = "Garnet Razorwing",
        icon = 3897751,
        itemId = 186652,
        spellId = 354360,
        source = {
          mapId = 0,
          uiMapIds = {
            1961
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Reliwik the Defiant"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Reliwik the Defiant",
      npcID = 180160
    },
    expansion = 8
  },
  {
    id = 342,
    mounts = {
      {
        id = 1514,
        name = "Rampaging Mauler",
        icon = 3931115,
        itemId = 187183,
        spellId = 356501,
        source = {
          mapId = 0,
          uiMapIds = {
            1961
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Konthrogz the Obliterator"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Konthrogz the Obliterator",
      npcID = 179472
    },
    expansion = 8
  },
  {
    id = 343,
    mounts = {
      {
        id = 1521,
        name = "Val'sharah Hippogryph",
        icon = 4218361,
        itemId = 187595,
        spellId = 359013,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Aridormi"
          },
          note = "Timewalking vendor",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      },
      {
        id = 2471,
        name = "Ur'zul Fleshripper",
        icon = 1581749,
        itemId = 234721,
        spellId = 1214940,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Aridormi"
          },
          note = "Timewalking vendor",
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
      name = "Aridormi",
      npcID = 180899
    },
    expansion = 6
  },
  {
    id = 344,
    mounts = {
      {
        id = 1522,
        name = "Heartlight Vombata",
        icon = 3747898,
        itemId = 187629,
        spellId = 359229,
        source = {
          mapId = 0,
          uiMapIds = {
            1970
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Vilo"
          },
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1813
          }
        }
      },
      {
        id = 1529,
        name = "Anointed Protostag",
        icon = 3747643,
        itemId = 187640,
        spellId = 359276,
        source = {
          mapId = 0,
          uiMapIds = {
            1970
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Vilo"
          },
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1813
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Vilo",
      npcID = 182257
    },
    expansion = 8
  },
  {
    id = 345,
    mounts = {
      {
        id = 1545,
        name = "Divine Kiss of Ohn'ahra",
        icon = 0,
        itemId = 0,
        spellId = 395644,
        source = {
          mapId = 0,
          uiMapIds = {
            2023
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "A Whispering Breeze"
          },
          note = "Complete the Ohn'ahran Plains campaign questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "A Whispering Breeze"
    },
    expansion = 9
  },
  {
    id = 346,
    mounts = {
      {
        id = 1546,
        name = "Iskaara Trader's Ottuk",
        icon = 4093846,
        itemId = 198871,
        spellId = 359409,
        source = {
          mapId = 0,
          uiMapIds = {
            2024
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tattukiaka"
          },
          note = "Iskaara Tuskarr vendor",
          cost = {
            type = "item",
            amount = 1,
            itemId = 195502
          },
          costs = {
            {
              type = "item",
              amount = 1,
              itemId = 195502
            },
            {
              type = "item",
              amount = 1,
              itemId = 195496
            }
          }
        }
      },
      {
        id = 1658,
        name = "Ivory Trader's Ottuk",
        icon = 4093855,
        itemId = 198873,
        spellId = 376879,
        source = {
          mapId = 0,
          uiMapIds = {
            2024
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tattukiaka"
          },
          note = "Iskaara Tuskarr vendor",
          cost = {
            type = "item",
            amount = 1,
            itemId = 193696
          },
          costs = {
            {
              type = "item",
              amount = 1,
              itemId = 193696
            },
            {
              type = "item",
              amount = 1,
              itemId = 193633
            },
            {
              type = "item",
              amount = 1,
              itemId = 193708
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Tattukiaka",
      npcID = 199448
    },
    expansion = 9
  },
  {
    id = 347,
    mounts = {
      {
        id = 1552,
        name = "Carcinized Zerethsteed",
        icon = 0,
        itemId = 190771,
        spellId = 359545,
        source = {
          mapId = 0,
          uiMapIds = {
            1970
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Leading Motives"
          },
          note = "Zereth Mortis questline reward."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Leading Motives"
    },
    expansion = 8
  },
  {
    id = 348,
    mounts = {
      {
        id = 1553,
        name = "Liberated Slyvern",
        icon = 4218759,
        itemId = 201440,
        spellId = 359622,
        source = {
          mapId = 0,
          uiMapIds = {
            2024
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Breezebiter"
          },
          note = "Flies overhead. Pull down with ranged attacks."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Breezebiter",
      npcID = 195353
    },
    expansion = 9
  },
  {
    id = 349,
    mounts = {
      {
        id = 1565,
        name = "Colossal Umbrahide Mawrat",
        icon = 4287556,
        itemId = 188700,
        spellId = 363178,
        source = {
          mapId = 0,
          uiMapIds = {
            1543
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Torghast Layers 13 or higher"
          },
          note = "Complete Torghast at layer 13+."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Torghast Layers 13 or higher"
    },
    expansion = 8
  },
  {
    id = 350,
    mounts = {
      {
        id = 1569,
        name = "Patient Bufonid",
        icon = 3778581,
        itemId = 188808,
        spellId = 363701,
        source = {
          mapId = 0,
          uiMapIds = {
            1970
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "The Patient Bufonid"
          },
          note = "Complete a series of daily quests in Zereth Mortis to tame."
        }
      }
    },
    source = {
      type = "Quest",
      name = "The Patient Bufonid"
    },
    expansion = 8
  },
  {
    id = 351,
    mounts = {
      {
        id = 1584,
        name = "Colossal Plaguespew Mawrat",
        icon = 4287555,
        itemId = 190765,
        spellId = 368105,
        source = {
          mapId = 0,
          uiMapIds = {
            1970
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Rhuv, Gorger of Ruin"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Rhuv, Gorger of Ruin",
      npcID = 182120
    },
    expansion = 8
  },
  {
    id = 352,
    mounts = {
      {
        id = 1585,
        name = "Colossal Wraithbound Mawrat",
        icon = 4287557,
        itemId = 190766,
        spellId = 368128,
        source = {
          mapId = 0,
          uiMapIds = {
            1543
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Mawsworn Supply Chest"
          },
          note = "Found in The Maw from Mawsworn activities."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Mawsworn Supply Chest"
    },
    expansion = 8
  },
  {
    id = 353,
    mounts = {
      {
        id = 1587,
        name = "Zereth Overseer",
        icon = 4216936,
        itemId = 190768,
        spellId = 368158,
        source = {
          mapId = 2481,
          uiMapIds = {
            2051
          },
          allowedDifficultyIds = {
            16
          },
          journalEncounter = {
            id = 2464,
            name = "The Jailer",
            instanceId = 1195,
            uiMapId = 2051
          },
          dungeonEncounter = {
            id = 2537,
            name = "The Jailer",
            mapId = 2481
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Sepulcher of the First Ones"
    },
    expansion = 8
  },
  {
    id = 354,
    mounts = {
      {
        id = 1597,
        name = "Grimhowl",
        icon = 2016650,
        itemId = 191123,
        spellId = 369666,
        source = {
          mapId = 0,
          uiMapIds = {
            2214
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Good Fiery Boy"
          }
        }
      }
    },
    source = {
      type = "Quest",
      name = "Good Fiery Boy"
    },
    expansion = 8
  },
  {
    id = 355,
    mounts = {
      {
        id = 1600,
        name = "Elusive Emerald Hawkstrider",
        icon = 132230,
        itemId = 191566,
        spellId = 370620,
        source = {
          mapId = 0,
          uiMapIds = {
            95
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Victory for the Sin'dorei"
          },
          note = "Heritage armor questline reward."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Victory for the Sin'dorei"
    },
    expansion = 9
  },
  {
    id = 356,
    mounts = {
      {
        id = 1612,
        name = "Loyal Magmammoth",
        icon = 4034835,
        itemId = 192601,
        spellId = 373859,
        source = {
          mapId = 0,
          uiMapIds = {
            2022
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Yries Lightfingers"
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Yries Lightfingers",
      npcID = 191135
    },
    expansion = 9
  },
  {
    id = 357,
    mounts = {
      {
        id = 1615,
        name = "Tamed Skitterfly",
        icon = 3995637,
        itemId = 192761,
        spellId = 374032,
        source = {
          mapId = 0,
          uiMapIds = {
            2022
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Granpap Whiskers"
          },
          cost = {
            type = "item",
            amount = 5,
            itemId = 201401
          }
        }
      },
      {
        id = 1616,
        name = "Azure Skitterfly",
        icon = 3995638,
        itemId = 192762,
        spellId = 374034,
        source = {
          mapId = 0,
          uiMapIds = {
            2022
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Granpap Whiskers"
          },
          cost = {
            type = "item",
            amount = 5,
            itemId = 201401
          },
          costs = {
            {
              type = "item",
              amount = 5,
              itemId = 201401
            },
            {
              type = "item",
              amount = 20,
              itemId = 193053
            },
            {
              type = "currency",
              amount = 750,
              currencyId = 2003
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Granpap Whiskers",
      npcID = 187408
    },
    expansion = 9
  },
  {
    id = 358,
    mounts = {
      {
        id = 1619,
        name = "Ancient Salamanther",
        icon = 4044069,
        itemId = 192772,
        spellId = 374090,
        source = {
          mapId = 0,
          uiMapIds = {
            2118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "The Forbidden Reach"
          },
          note = "Rare drops from rares across The Forbidden Reach."
        }
      },
      {
        id = 1627,
        name = "Gooey Snailemental",
        icon = 3996703,
        itemId = 192785,
        spellId = 374157,
        source = {
          mapId = 0,
          uiMapIds = {
            2118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "The Forbidden Reach"
          },
          note = "Rare drops from rares across The Forbidden Reach."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "The Forbidden Reach"
    },
    expansion = 9
  },
  {
    id = 359,
    mounts = {
      {
        id = 1622,
        name = "Stormhide Salamanther",
        icon = 4044072,
        itemId = 192775,
        spellId = 374098,
        source = {
          mapId = 0,
          uiMapIds = {
            2112
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Mythressa"
          },
          cost = {
            type = "currency",
            amount = 2000,
            currencyId = 2118
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Mythressa",
      npcID = 196516
    },
    expansion = 9
  },
  {
    id = 360,
    mounts = {
      {
        id = 1623,
        name = "Seething Slug",
        icon = 3996722,
        itemId = 192779,
        spellId = 374138,
        source = {
          mapId = 0,
          uiMapIds = {
            2133
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Seething Cache"
          },
          note = "Rare spawn treasure in Zaralek Cavern."
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Seething Cache"
    },
    expansion = 9
  },
  {
    id = 361,
    mounts = {
      {
        id = 1629,
        name = "Scrappy Worldsnail",
        icon = 3996706,
        itemId = 192786,
        spellId = 374162,
        source = {
          mapId = 0,
          uiMapIds = {
            2022
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dealer Vexil"
          },
          cost = {
            type = "item",
            amount = 1000,
            itemId = 202173
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Dealer Vexil",
      npcID = 193310
    },
    expansion = 9
  },
  {
    id = 362,
    mounts = {
      {
        id = 1634,
        name = "Mossy Mammoth",
        icon = 4034841,
        itemId = 192790,
        spellId = 374194,
        source = {
          mapId = 0,
          uiMapIds = {
            2118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Zskera Vaults"
          },
          note = "Weekly treasure room in The Forbidden Reach."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Zskera Vaults"
    },
    expansion = 9
  },
  {
    id = 363,
    mounts = {
      {
        id = 1635,
        name = "Plainswalker Bearer",
        icon = 4034842,
        itemId = 192791,
        spellId = 374196,
        source = {
          mapId = 0,
          uiMapIds = {
            2023
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Centaur Hunts (first hunt of each week)"
          },
          note = "Grand Hunt Spoils reward from weekly Centaur Hunts."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Centaur Hunts (first hunt of each week)"
    },
    expansion = 9
  },
  {
    id = 364,
    mounts = {
      {
        id = 1638,
        name = "Explorer's Stonehide Packbeast",
        icon = 4008182,
        itemId = 192796,
        spellId = 374204,
        source = {
          mapId = 0,
          uiMapIds = {
            2025
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Provisioner Aristta"
          },
          cost = {
            type = "currency",
            amount = 20000,
            currencyId = 2657
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Provisioner Aristta",
      npcID = 209192
    },
    expansion = 9
  },
  {
    id = 365,
    mounts = {
      {
        id = 1639,
        name = "Lizi, Thunderspine Tramper",
        icon = 4008180,
        itemId = 192799,
        spellId = 374247,
        source = {
          mapId = 0,
          uiMapIds = {
            2023
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "To Tame A Thunderspine"
          },
          note = "Complete Lizi's daily feeding chain over several days."
        }
      }
    },
    source = {
      type = "Quest",
      name = "To Tame A Thunderspine"
    },
    expansion = 9
  },
  {
    id = 366,
    mounts = {
      {
        id = 1645,
        name = "Renewed Magmammoth",
        icon = 4034837,
        itemId = 192807,
        spellId = 374278,
        source = {
          mapId = 0,
          uiMapIds = {
            2023
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Dreamsurges"
          },
          note = "Weekly rotating Dreamsurge event in Dragonflight zones."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Dreamsurges"
    },
    expansion = 9
  },
  {
    id = 367,
    mounts = {
      {
        id = 1653,
        name = "Brown War Ottuk",
        icon = 4093873,
        itemId = 201426,
        spellId = 376910,
        source = {
          mapId = 0,
          uiMapIds = {
            2024
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tatto"
          },
          cost = {
            type = "item",
            amount = 5,
            itemId = 201403
          },
          costs = {
            {
              type = "item",
              amount = 5,
              itemId = 201403
            },
            {
              type = "item",
              amount = 5,
              itemId = 201400
            },
            {
              type = "currency",
              amount = 1000,
              currencyId = 2003
            }
          }
        }
      },
      {
        id = 1655,
        name = "Yellow War Ottuk",
        icon = 4093875,
        itemId = 201425,
        spellId = 376913,
        source = {
          mapId = 0,
          uiMapIds = {
            2024
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tatto"
          },
          cost = {
            type = "item",
            amount = 5,
            itemId = 201403
          },
          costs = {
            {
              type = "item",
              amount = 5,
              itemId = 201403
            },
            {
              type = "item",
              amount = 5,
              itemId = 201400
            },
            {
              type = "currency",
              amount = 1000,
              currencyId = 2003
            }
          }
        }
      },
      {
        id = 1657,
        name = "Brown Scouting Ottuk",
        icon = 4093849,
        itemId = 198872,
        spellId = 376875,
        source = {
          mapId = 0,
          uiMapIds = {
            2024
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tatto"
          },
          cost = {
            type = "item",
            amount = 5,
            itemId = 201403
          },
          costs = {
            {
              type = "item",
              amount = 2,
              itemId = 201403
            },
            {
              type = "item",
              amount = 2,
              itemId = 201400
            },
            {
              type = "currency",
              amount = 750,
              currencyId = 2003
            }
          }
        }
      },
      {
        id = 1659,
        name = "Yellow Scouting Ottuk",
        icon = 4093859,
        itemId = 200118,
        spellId = 376880,
        source = {
          mapId = 0,
          uiMapIds = {
            2024
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tatto"
          },
          cost = {
            type = "item",
            amount = 5,
            itemId = 201403
          },
          costs = {
            {
              type = "item",
              amount = 2,
              itemId = 201403
            },
            {
              type = "item",
              amount = 2,
              itemId = 201400
            },
            {
              type = "currency",
              amount = 750,
              currencyId = 2003
            }
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Tatto",
      npcID = 186462
    },
    expansion = 9
  },
  {
    id = 368,
    mounts = {
      {
        id = 1656,
        name = "Otto",
        icon = 4093847,
        itemId = 198870,
        spellId = 376873,
        source = {
          mapId = 0,
          uiMapIds = {
            2133
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "The Way to an Otto's Heart"
          },
          note = "Otto the otter quest chain in Zaralek Cavern."
        }
      }
    },
    source = {
      type = "Quest",
      name = "The Way to an Otto's Heart"
    },
    expansion = 9
  },
  {
    id = 369,
    mounts = {
      {
        id = 1664,
        name = "Guardian Vorquin",
        icon = 4282543,
        itemId = 198808,
        spellId = 384963,
        source = {
          mapId = 0,
          uiMapIds = {
            2118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Treysh"
          },
          cost = {
            type = "gold",
            amount = 800000
          }
        }
      },
      {
        id = 1665,
        name = "Swift Armored Vorquin",
        icon = 4282542,
        itemId = 198810,
        spellId = 385134,
        source = {
          mapId = 0,
          uiMapIds = {
            2118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Treysh"
          },
          cost = {
            type = "gold",
            amount = 800000
          }
        }
      },
      {
        id = 1667,
        name = "Armored Vorquin Leystrider",
        icon = 4282541,
        itemId = 198809,
        spellId = 385131,
        source = {
          mapId = 0,
          uiMapIds = {
            2118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Treysh"
          },
          cost = {
            type = "gold",
            amount = 800000
          }
        }
      },
      {
        id = 1668,
        name = "Majestic Armored Vorquin",
        icon = 4282544,
        itemId = 198811,
        spellId = 385115,
        source = {
          mapId = 0,
          uiMapIds = {
            2118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Treysh"
          },
          cost = {
            type = "gold",
            amount = 800000
          }
        }
      },
      {
        id = 1683,
        name = "Crimson Vorquin",
        icon = 4731153,
        itemId = 201702,
        spellId = 394216,
        source = {
          mapId = 0,
          uiMapIds = {
            2118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Treysh"
          },
          cost = {
            type = "gold",
            amount = 400000
          }
        }
      },
      {
        id = 1684,
        name = "Sapphire Vorquin",
        icon = 4731151,
        itemId = 201704,
        spellId = 394218,
        source = {
          mapId = 0,
          uiMapIds = {
            2118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Treysh"
          },
          cost = {
            type = "gold",
            amount = 400000
          }
        }
      },
      {
        id = 1685,
        name = "Bronze Vorquin",
        icon = 4731152,
        itemId = 201720,
        spellId = 394219,
        source = {
          mapId = 0,
          uiMapIds = {
            2118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Treysh"
          },
          cost = {
            type = "gold",
            amount = 400000
          }
        }
      },
      {
        id = 1686,
        name = "Obsidian Vorquin",
        icon = 4731150,
        itemId = 201719,
        spellId = 394220,
        source = {
          mapId = 0,
          uiMapIds = {
            2118
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Treysh"
          },
          cost = {
            type = "gold",
            amount = 400000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Treysh",
      npcID = 198429
    },
    expansion = 9
  },
  {
    id = 370,
    mounts = {
      {
        id = 1664,
        name = "Guardian Vorquin",
        icon = 4282543,
        itemId = 198808,
        spellId = 384963,
        source = {
          mapId = 0,
          uiMapIds = {
            2112
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tethalash"
          },
          note = "Vorquin vendor in Valdrakken",
          cost = {
            type = "gold",
            amount = 800000
          }
        }
      },
      {
        id = 1665,
        name = "Swift Armored Vorquin",
        icon = 4282542,
        itemId = 198810,
        spellId = 385134,
        source = {
          mapId = 0,
          uiMapIds = {
            2112
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tethalash"
          },
          note = "Vorquin vendor in Valdrakken",
          cost = {
            type = "gold",
            amount = 800000
          }
        }
      },
      {
        id = 1667,
        name = "Armored Vorquin Leystrider",
        icon = 4282541,
        itemId = 198809,
        spellId = 385131,
        source = {
          mapId = 0,
          uiMapIds = {
            2112
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tethalash"
          },
          note = "Vorquin vendor in Valdrakken",
          cost = {
            type = "gold",
            amount = 800000
          }
        }
      },
      {
        id = 1668,
        name = "Majestic Armored Vorquin",
        icon = 4282544,
        itemId = 198811,
        spellId = 385115,
        source = {
          mapId = 0,
          uiMapIds = {
            2112
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tethalash"
          },
          note = "Vorquin vendor in Valdrakken",
          cost = {
            type = "gold",
            amount = 800000
          }
        }
      },
      {
        id = 1683,
        name = "Crimson Vorquin",
        icon = 4731153,
        itemId = 201702,
        spellId = 394216,
        source = {
          mapId = 0,
          uiMapIds = {
            2112
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tethalash"
          },
          note = "Vorquin vendor in Valdrakken",
          cost = {
            type = "gold",
            amount = 400000
          }
        }
      },
      {
        id = 1684,
        name = "Sapphire Vorquin",
        icon = 4731151,
        itemId = 201704,
        spellId = 394218,
        source = {
          mapId = 0,
          uiMapIds = {
            2112
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tethalash"
          },
          note = "Vorquin vendor in Valdrakken",
          cost = {
            type = "gold",
            amount = 400000
          }
        }
      },
      {
        id = 1685,
        name = "Bronze Vorquin",
        icon = 4731152,
        itemId = 201720,
        spellId = 394219,
        source = {
          mapId = 0,
          uiMapIds = {
            2112
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tethalash"
          },
          note = "Vorquin vendor in Valdrakken",
          cost = {
            type = "gold",
            amount = 400000
          }
        }
      },
      {
        id = 1686,
        name = "Obsidian Vorquin",
        icon = 4731150,
        itemId = 201719,
        spellId = 394220,
        source = {
          mapId = 0,
          uiMapIds = {
            2112
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tethalash"
          },
          note = "Vorquin vendor in Valdrakken",
          cost = {
            type = "gold",
            amount = 400000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Tethalash",
      npcID = 196637
    },
    expansion = 9
  },
  {
    id = 371,
    mounts = {
      {
        id = 1671,
        name = "Duskwing Ohuna",
        icon = 4094303,
        itemId = 198824,
        spellId = 385262,
        source = {
          mapId = 0,
          uiMapIds = {
            2025
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Celestine of the Harvest"
          },
          cost = {
            type = "item",
            amount = 1000,
            itemId = 207026
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Celestine of the Harvest",
      npcID = 210608
    },
    expansion = 9
  },
  {
    id = 372,
    mounts = {
      {
        id = 1672,
        name = "Zenet Hatchling",
        icon = 4094304,
        itemId = 198825,
        spellId = 385266,
        source = {
          mapId = 0,
          uiMapIds = {
            2023
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Zenet Egg"
          },
          note = "Clickable Zenet Egg spawn."
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Zenet Egg"
    },
    expansion = 9
  },
  {
    id = 373,
    mounts = {
      {
        id = 1674,
        name = "Temperamental Skyclaw",
        icon = 4218760,
        itemId = 201454,
        spellId = 385738,
        source = {
          mapId = 0,
          uiMapIds = {
            2024
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Zon'Wogi"
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Zon'Wogi",
      npcID = 190892
    },
    expansion = 9
  },
  {
    id = 374,
    mounts = {
      {
        id = 1729,
        name = "Big Slick in the City",
        icon = 5003561,
        itemId = 205155,
        spellId = 408313,
        source = {
          mapId = 0,
          uiMapIds = {
            2133
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Snailed It"
          },
          note = "Complete the Big Slick snail quest chain in Zaralek Cavern."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Snailed It"
    },
    expansion = 9
  },
  {
    id = 375,
    mounts = {
      {
        id = 1730,
        name = "Igneous Shalewing",
        icon = 5009628,
        itemId = 205197,
        spellId = 408627,
        source = {
          mapId = 0,
          uiMapIds = {
            2133
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Saccratros"
          },
          cost = {
            type = "item",
            amount = 400,
            itemId = 204727
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Saccratros",
      npcID = 203615
    },
    expansion = 9
  },
  {
    id = 376,
    mounts = {
      {
        id = 1732,
        name = "Cobalt Shalewing",
        icon = 5009625,
        itemId = 205203,
        spellId = 408647,
        source = {
          mapId = 0,
          uiMapIds = {
            2133
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Karokta"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Karokta"
    },
    expansion = 9
  },
  {
    id = 377,
    mounts = {
      {
        id = 1735,
        name = "Cataloged Shalewing",
        icon = 5009627,
        itemId = 205204,
        spellId = 408651,
        source = {
          mapId = 0,
          uiMapIds = {
            2133
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Researchers Under Fire"
          },
          note = "Researchers Under Fire public event reward."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Researchers Under Fire"
    },
    expansion = 9
  },
  {
    id = 378,
    mounts = {
      {
        id = 1736,
        name = "Boulder Hauler",
        icon = 5009631,
        itemId = 205209,
        spellId = 408653,
        source = {
          mapId = 0,
          uiMapIds = {
            2133
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Ponzo"
          },
          cost = {
            type = "item",
            amount = 85,
            itemId = 205188
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Ponzo",
      npcID = 204693
    },
    expansion = 9
  },
  {
    id = 379,
    mounts = {
      {
        id = 1737,
        name = "Sandy Shalewing",
        icon = 5009630,
        itemId = 205208,
        spellId = 408654,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Any Timewalking Vendor"
          },
          note = "Available from any Timewalking vendor during Timewalking events.",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      },
      {
        id = 2321,
        name = "Timely Buzzbee",
        icon = 6220328,
        itemId = 232624,
        spellId = 471538,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Any Timewalking Vendor"
          },
          note = "Available from any Timewalking vendor during Timewalking events.",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      },
      {
        id = 2518,
        name = "Chrono Corsair",
        icon = 6709878,
        itemId = 238739,
        spellId = 1226144,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Any Timewalking Vendor"
          },
          note = "Available from any Timewalking vendor during Timewalking events.",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      },
      {
        id = 2795,
        name = "Bronze Wilderling",
        icon = 7384867,
        itemId = 257511,
        spellId = 1261668,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Any Timewalking Vendor"
          },
          note = "Available from any Timewalking vendor during Timewalking events.",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      },
      {
        id = 2796,
        name = "Bronze Aquilon",
        icon = 7384838,
        itemId = 257513,
        spellId = 1261671,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Any Timewalking Vendor"
          },
          note = "Available from any Timewalking vendor during Timewalking events.",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      },
      {
        id = 2797,
        name = "Bronze Corpsefly",
        icon = 7384975,
        itemId = 257514,
        spellId = 1261677,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Any Timewalking Vendor"
          },
          note = "Available from any Timewalking vendor during Timewalking events.",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      },
      {
        id = 2798,
        name = "Bronze Gravewing",
        icon = 7384804,
        itemId = 257516,
        spellId = 1261681,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Any Timewalking Vendor"
          },
          note = "Available from any Timewalking vendor during Timewalking events.",
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
      name = "Any Timewalking Vendor"
    },
    expansion = 6
  },
  {
    id = 380,
    mounts = {
      {
        id = 1738,
        name = "Morsel Sniffer",
        icon = 5009629,
        itemId = 205207,
        spellId = 408655,
        source = {
          mapId = 0,
          uiMapIds = {
            2133
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Harlowe Marl"
          },
          cost = {
            type = "currency",
            amount = 800,
            currencyId = 2003
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Harlowe Marl",
      npcID = 257897
    },
    expansion = 9
  },
  {
    id = 381,
    mounts = {
      {
        id = 1744,
        name = "Grotto Netherwing Drake",
        icon = 5161800,
        itemId = 206156,
        spellId = 412088,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Dragon Keeping"
          },
          note = "Grotto Netherwing Drake questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Dragon Keeping"
    },
    expansion = 9
  },
  {
    id = 382,
    mounts = {
      {
        id = 1776,
        name = "White War Wolf",
        icon = 132266,
        itemId = 206673,
        spellId = 414316,
        source = {
          mapId = 0,
          uiMapIds = {
            2199
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Time Rifts"
          },
          note = "Complete Time Rift public events near Tyrhold for a chance at mount caches.",
          cost = {
            type = "currency",
            amount = 3000,
            currencyId = 2594
          }
        }
      },
      {
        id = 1777,
        name = "Ravenous Black Gryphon",
        icon = 0,
        itemId = 206674,
        spellId = 414323,
        source = {
          mapId = 0,
          uiMapIds = {
            2199
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Time Rifts"
          },
          note = "Complete Time Rift public events near Tyrhold for a chance at mount caches.",
          cost = {
            type = "currency",
            amount = 3000,
            currencyId = 2594
          }
        }
      },
      {
        id = 1778,
        name = "Gold-Toed Albatross",
        icon = 0,
        itemId = 206675,
        spellId = 414324,
        source = {
          mapId = 0,
          uiMapIds = {
            2199
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Time Rifts"
          },
          note = "Complete Time Rift public events near Tyrhold for a chance at mount caches.",
          cost = {
            type = "currency",
            amount = 3000,
            currencyId = 2594
          }
        }
      },
      {
        id = 1779,
        name = "Felstorm Dragon",
        icon = 0,
        itemId = 206676,
        spellId = 414326,
        source = {
          mapId = 0,
          uiMapIds = {
            2199
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Time Rifts"
          },
          note = "Complete Time Rift public events near Tyrhold for a chance at mount caches.",
          cost = {
            type = "currency",
            amount = 3000,
            currencyId = 2594
          }
        }
      },
      {
        id = 1781,
        name = "Sulfur Hound",
        icon = 236191,
        itemId = 206678,
        spellId = 414327,
        source = {
          mapId = 0,
          uiMapIds = {
            2199
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Time Rifts"
          },
          note = "Complete Time Rift public events near Tyrhold for a chance at mount caches.",
          cost = {
            type = "currency",
            amount = 3000,
            currencyId = 2594
          }
        }
      },
      {
        id = 1782,
        name = "Perfected Juggernaut",
        icon = 897696,
        itemId = 206679,
        spellId = 414328,
        source = {
          mapId = 0,
          uiMapIds = {
            2199
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Time Rifts"
          },
          note = "Complete Time Rift public events near Tyrhold for a chance at mount caches.",
          cost = {
            type = "currency",
            amount = 3000,
            currencyId = 2594
          }
        }
      },
      {
        id = 1783,
        name = "Scourgebound Vanquisher",
        icon = 303868,
        itemId = 206680,
        spellId = 414334,
        source = {
          mapId = 0,
          uiMapIds = {
            2199
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Time Rifts"
          },
          note = "Complete Time Rift public events near Tyrhold for a chance at mount caches.",
          cost = {
            type = "currency",
            amount = 3000,
            currencyId = 2594
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Time Rifts"
    },
    expansion = 9
  },
  {
    id = 383,
    mounts = {
      {
        id = 1808,
        name = "Blossoming Dreamstag",
        icon = 4995323,
        itemId = 209947,
        spellId = 423871,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Talisa Whisperbloom"
          },
          cost = {
            type = "item",
            amount = 1,
            itemId = 211376
          }
        }
      },
      {
        id = 1810,
        name = "Rekindled Dreamstag",
        icon = 4995320,
        itemId = 209950,
        spellId = 423877,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Talisa Whisperbloom"
          },
          cost = {
            type = "item",
            amount = 1,
            itemId = 211376
          }
        }
      },
      {
        id = 1816,
        name = "Evening Sun Dreamsaber",
        icon = 5100594,
        itemId = 210058,
        spellId = 424479,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Talisa Whisperbloom"
          },
          cost = {
            type = "item",
            amount = 1,
            itemId = 211376
          }
        }
      },
      {
        id = 1817,
        name = "Morning Flourish Dreamsaber",
        icon = 5100592,
        itemId = 210057,
        spellId = 424482,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Talisa Whisperbloom"
          },
          cost = {
            type = "item",
            amount = 1,
            itemId = 211376
          }
        }
      },
      {
        id = 1833,
        name = "Springtide Dreamtalon",
        icon = 5370987,
        itemId = 210769,
        spellId = 426955,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Talisa Whisperbloom"
          },
          cost = {
            type = "item",
            amount = 1,
            itemId = 211376
          }
        }
      },
      {
        id = 1835,
        name = "Snowfluff Dreamtalon",
        icon = 5370986,
        itemId = 210775,
        spellId = 427043,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Talisa Whisperbloom"
          },
          cost = {
            type = "item",
            amount = 1,
            itemId = 211376
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Talisa Whisperbloom",
      npcID = 212797
    },
    expansion = 9
  },
  {
    id = 384,
    mounts = {
      {
        id = 1809,
        name = "Suntouched Dreamstag",
        icon = 4995322,
        itemId = 209949,
        spellId = 423873,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Moon Priestess Lasara"
          },
          cost = {
            type = "currency",
            amount = 1200,
            currencyId = 2003
          }
        }
      },
      {
        id = 1811,
        name = "Lunar Dreamstag",
        icon = 4995321,
        itemId = 209951,
        spellId = 423891,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Moon Priestess Lasara"
          },
          cost = {
            type = "currency",
            amount = 1200,
            currencyId = 2003
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Moon Priestess Lasara",
      npcID = 50305
    },
    expansion = 9
  },
  {
    id = 385,
    mounts = {
      {
        id = 1815,
        name = "Winter Night Dreamsaber",
        icon = 5100591,
        itemId = 210059,
        spellId = 424476,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Dreamseed Cache"
          },
          note = "Plant and water Gigantic Dreamseed; loot Plump Dreamseed Cache."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Dreamseed Cache"
    },
    expansion = 9
  },
  {
    id = 386,
    mounts = {
      {
        id = 1818,
        name = "Anu'relos, Flame's Guidance",
        icon = 5171363,
        itemId = 210061,
        spellId = 424484,
        source = {
          mapId = 2549,
          uiMapIds = {
            2238
          },
          allowedDifficultyIds = {
            16
          },
          journalEncounter = {
            id = 2519,
            name = "Fyrakk the Blazing",
            instanceId = 1207,
            uiMapId = 2238
          },
          dungeonEncounter = {
            id = 2677,
            name = "Fyrakk the Blazing",
            mapId = 2549
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Amirdrassil, the Dream's Hope"
    },
    expansion = 9
  },
  {
    id = 387,
    mounts = {
      {
        id = 1830,
        name = "Flourishing Whimsydrake",
        icon = 5390426,
        itemId = 210412,
        spellId = 425338,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Emerald Welcome"
          },
          note = "Campaign quest reward."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Emerald Welcome"
    },
    expansion = 9
  },
  {
    id = 388,
    mounts = {
      {
        id = 1834,
        name = "Ochre Dreamtalon",
        icon = 5370985,
        itemId = 210774,
        spellId = 427041,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "A Little Hope is Never Without Worth"
          }
        }
      }
    },
    source = {
      type = "Quest",
      name = "A Little Hope is Never Without Worth"
    },
    expansion = 9
  },
  {
    id = 389,
    mounts = {
      {
        id = 1837,
        name = "Delugen",
        icon = 0,
        itemId = 210831,
        spellId = 427222,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Elianna"
          },
          cost = {
            type = "currency",
            amount = 1,
            currencyId = 2777
          }
        }
      },
      {
        id = 1838,
        name = "Talont",
        icon = 4896234,
        itemId = 210833,
        spellId = 427224,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Elianna"
          },
          cost = {
            type = "currency",
            amount = 1,
            currencyId = 2777
          }
        }
      },
      {
        id = 1839,
        name = "Stargrazer",
        icon = 4995323,
        itemId = 210945,
        spellId = 427226,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Elianna"
          },
          cost = {
            type = "currency",
            amount = 1,
            currencyId = 2777
          }
        }
      },
      {
        id = 1938,
        name = "Mammyth",
        icon = 4034835,
        itemId = 210946,
        spellId = 427546,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Elianna"
          },
          cost = {
            type = "currency",
            amount = 1,
            currencyId = 2777
          }
        }
      },
      {
        id = 1939,
        name = "Imagiwing",
        icon = 5009627,
        itemId = 210948,
        spellId = 427549,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Elianna"
          },
          cost = {
            type = "currency",
            amount = 1,
            currencyId = 2777
          }
        }
      },
      {
        id = 1940,
        name = "Salatrancer",
        icon = 0,
        itemId = 210969,
        spellId = 427724,
        source = {
          mapId = 0,
          uiMapIds = {
            2200
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Elianna"
          },
          cost = {
            type = "currency",
            amount = 1,
            currencyId = 2777
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Elianna",
      npcID = 211209
    },
    expansion = 9
  },
  {
    id = 390,
    mounts = {
      {
        id = 1949,
        name = "Gilnean Prowler",
        icon = 1338908,
        itemId = 211873,
        spellId = 430225,
        source = {
          mapId = 0,
          uiMapIds = {
            179
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Beginning a New Dawn"
          },
          note = "Gilneas Reclamation questline reward."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Beginning a New Dawn"
    },
    expansion = 9
  },
  {
    id = 391,
    mounts = {
      {
        id = 2023,
        name = "Noble Flying Carpet",
        icon = 5501360,
        itemId = 212599,
        spellId = 432455,
        source = {
          mapId = 0,
          uiMapIds = {
            1
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Daetan Swiftplume"
          },
          note = "Noblegarden event mob."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Daetan Swiftplume"
    },
    expansion = 6
  },
  {
    id = 392,
    mounts = {
      {
        id = 2038,
        name = "Clayscale Hornstrider",
        icon = 0,
        itemId = 212645,
        spellId = 432610,
        source = {
          mapId = 0,
          uiMapIds = {
            2024
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Azerothian Archives"
          },
          note = "Complete Azerothian Archives activities at Traitor's Rest."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Azerothian Archives"
    },
    expansion = 9
  },
  {
    id = 393,
    mounts = {
      {
        id = 2116,
        name = "Remembered Golden Gryphon",
        icon = 294468,
        itemId = 217985,
        spellId = 441324,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Remembrancer Amuul"
          },
          cost = {
            type = "currency",
            amount = 20000,
            currencyId = 3089
          }
        }
      },
      {
        id = 2117,
        name = "Remembered Wind Rider",
        icon = 298596,
        itemId = 217987,
        spellId = 441325,
        source = {
          mapId = 0,
          uiMapIds = {
            627
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Remembrancer Amuul"
          },
          cost = {
            type = "currency",
            amount = 20000,
            currencyId = 3089
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Remembrancer Amuul",
      npcID = 223710
    },
    expansion = 10
  },
  {
    id = 394,
    mounts = {
      {
        id = 2119,
        name = "Stonevault Mechsuit",
        icon = 5530986,
        itemId = 221765,
        spellId = 442358,
        source = {
          mapId = 2652,
          uiMapIds = {
            2341
          },
          allowedDifficultyIds = {
            8,
            23
          },
          journalEncounter = {
            id = 2582,
            name = "Void Speaker Eirich",
            instanceId = 1269,
            uiMapId = 2341
          },
          dungeonEncounter = {
            id = 2883,
            name = "Void Speaker Eirich",
            mapId = 2652
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "The Stonevault"
    },
    expansion = 10
  },
  {
    id = 395,
    mounts = {
      {
        id = 2144,
        name = "Delver's Dirigible",
        icon = 6029241,
        itemId = 219391,
        spellId = 446052,
        source = {
          mapId = 0,
          uiMapIds = {
            2248
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Ship It!"
          },
          note = "Complete the Delver's Dirigible questline."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Ship It!"
    },
    expansion = 10
  },
  {
    id = 396,
    mounts = {
      {
        id = 2148,
        name = "Smoldering Cinderbee",
        icon = 5633719,
        itemId = 221753,
        spellId = 447057,
        source = {
          mapId = 0,
          uiMapIds = {
            2339
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Auditor Balwurz"
          },
          cost = {
            type = "currency",
            amount = 11375,
            currencyId = 2815
          }
        }
      },
      {
        id = 2213,
        name = "Shale Ramolith",
        icon = 5767166,
        itemId = 223571,
        spellId = 449418,
        source = {
          mapId = 0,
          uiMapIds = {
            2339
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Auditor Balwurz"
          },
          cost = {
            type = "currency",
            amount = 8125,
            currencyId = 2815
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Auditor Balwurz",
      npcID = 223728
    },
    expansion = 10
  },
  {
    id = 397,
    mounts = {
      {
        id = 2159,
        name = "Machine Defense Unit 1-11",
        icon = 5768149,
        itemId = 223269,
        spellId = 448188,
        source = {
          mapId = 0,
          uiMapIds = {
            2214
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Awakened Cache"
          }
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Awakened Cache"
    },
    expansion = 10
  },
  {
    id = 398,
    mounts = {
      {
        id = 2162,
        name = "Cyan Glowmite",
        icon = 5550860,
        itemId = 222989,
        spellId = 447176,
        source = {
          mapId = 0,
          uiMapIds = {
            2214
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Waxmonger Squick"
          },
          cost = {
            type = "currency",
            amount = 11375,
            currencyId = 2815
          }
        }
      },
      {
        id = 2209,
        name = "Crimson Mudnose",
        icon = 5768110,
        itemId = 223505,
        spellId = 449269,
        source = {
          mapId = 0,
          uiMapIds = {
            2214
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Waxmonger Squick"
          },
          cost = {
            type = "currency",
            amount = 8125,
            currencyId = 2815
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Waxmonger Squick",
      npcID = 221390
    },
    expansion = 10
  },
  {
    id = 399,
    mounts = {
      {
        id = 2165,
        name = "Soaring Meaderbee",
        icon = 5633720,
        itemId = 223153,
        spellId = 447151,
        source = {
          mapId = 0,
          uiMapIds = {
            2248
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Cendvin"
          },
          cost = {
            type = "item",
            amount = 900,
            itemId = 225557
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Cendvin",
      npcID = 226205
    },
    expansion = 10
  },
  {
    id = 400,
    mounts = {
      {
        id = 2176,
        name = "Alunira",
        icon = 5551884,
        itemId = 223270,
        spellId = 447213,
        source = {
          mapId = 0,
          uiMapIds = {
            2248
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Alunira"
          },
          note = "Requires group. Use Prismatic Ring near Alunira to engage."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Alunira"
    },
    expansion = 10
  },
  {
    id = 401,
    mounts = {
      {
        id = 2177,
        name = "Aquamarine Swarmite",
        icon = 5172872,
        itemId = 223264,
        spellId = 447185,
        source = {
          mapId = 0,
          uiMapIds = {
            2255
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lady Vinazian"
          },
          cost = {
            type = "currency",
            amount = 3940,
            currencyId = 3056
          }
        }
      },
      {
        id = 2184,
        name = "Ferocious Jawcrawler",
        icon = 5688855,
        itemId = 223274,
        spellId = 447957,
        source = {
          mapId = 0,
          uiMapIds = {
            2255
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lady Vinazian"
          },
          cost = {
            type = "currency",
            amount = 2815,
            currencyId = 3056
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Lady Vinazian",
      npcID = 223750
    },
    expansion = 10
  },
  {
    id = 402,
    mounts = {
      {
        id = 2177,
        name = "Aquamarine Swarmite",
        icon = 5172872,
        itemId = 223264,
        spellId = 447185,
        source = {
          mapId = 0,
          uiMapIds = {
            2255
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Y'tekhi"
          },
          cost = {
            type = "currency",
            amount = 3940,
            currencyId = 3056
          }
        }
      },
      {
        id = 2184,
        name = "Ferocious Jawcrawler",
        icon = 5688855,
        itemId = 223274,
        spellId = 447957,
        source = {
          mapId = 0,
          uiMapIds = {
            2255
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Y'tekhi"
          },
          cost = {
            type = "currency",
            amount = 2815,
            currencyId = 3056
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Y'tekhi",
      npcID = 220867
    },
    expansion = 10
  },
  {
    id = 403,
    mounts = {
      {
        id = 2223,
        name = "Ascendant Skyrazor",
        icon = 5792085,
        itemId = 224151,
        spellId = 451491,
        source = {
          mapId = 2657,
          uiMapIds = {
            2295
          },
          allowedDifficultyIds = {
            16
          },
          journalEncounter = {
            id = 2602,
            name = "Queen Ansurek",
            instanceId = 1273,
            uiMapId = 2295
          },
          dungeonEncounter = {
            id = 2922,
            name = "Queen Ansurek",
            mapId = 2657
          }
        }
      },
      {
        id = 2219,
        name = "Sureki Skyrazor",
        icon = 5792081,
        itemId = 224147,
        spellId = 451486,
        source = {
          mapId = 2657,
          uiMapIds = {
            2295
          },
          allowedDifficultyIds = {
            15,
            16,
            17,
            14,
            220
          },
          journalEncounter = {
            id = 2602,
            name = "Queen Ansurek",
            instanceId = 1273,
            uiMapId = 2295
          },
          dungeonEncounter = {
            id = 2922,
            name = "Queen Ansurek",
            mapId = 2657
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Nerub-ar Palace"
    },
    expansion = 10
  },
  {
    id = 404,
    mounts = {
      {
        id = 2191,
        name = "Shackled Shadow",
        icon = 5767209,
        itemId = 223314,
        spellId = 448939,
        source = {
          mapId = 0,
          uiMapIds = {
            2215
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Auralia Steelstrike"
          },
          cost = {
            type = "currency",
            amount = 11375,
            currencyId = 2815
          }
        }
      },
      {
        id = 2193,
        name = "Vermillion Imperial Lynx",
        icon = 5689904,
        itemId = 223317,
        spellId = 448978,
        source = {
          mapId = 0,
          uiMapIds = {
            2215
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Auralia Steelstrike"
          },
          cost = {
            type = "currency",
            amount = 8125,
            currencyId = 2815
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Auralia Steelstrike",
      npcID = 213145
    },
    expansion = 10
  },
  {
    id = 405,
    mounts = {
      {
        id = 2192,
        name = "Beledar's Spawn",
        icon = 5767210,
        itemId = 223315,
        spellId = 448941,
        source = {
          mapId = 0,
          uiMapIds = {
            2215
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Beledar's Spawn"
          },
          note = "Spawns during Beledar shadow phase, every 3 hours."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Beledar's Spawn"
    },
    expansion = 10
  },
  {
    id = 406,
    mounts = {
      {
        id = 2194,
        name = "Dauntless Imperial Lynx",
        icon = 5689902,
        itemId = 223318,
        spellId = 448979,
        source = {
          mapId = 0,
          uiMapIds = {
            2215
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Spreading the Light"
          },
          note = "Rare reward from Spreading the Light events."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Spreading the Light"
    },
    expansion = 10
  },
  {
    id = 407,
    mounts = {
      {
        id = 2204,
        name = "Wick",
        icon = 1119937,
        itemId = 225548,
        spellId = 449264,
        source = {
          mapId = 2651,
          uiMapIds = {
            2303
          },
          allowedDifficultyIds = {
            8,
            23
          },
          journalEncounter = {
            id = 2561,
            name = "The Darkness",
            instanceId = 1210,
            uiMapId = 2303
          },
          dungeonEncounter = {
            id = 2788,
            name = "The Darkness",
            mapId = 2651
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "Darkflame Cleft"
    },
    expansion = 10
  },
  {
    id = 408,
    mounts = {
      {
        id = 2205,
        name = "Ol' Mole Rufus",
        icon = 5768107,
        itemId = 223501,
        spellId = 449258,
        source = {
          mapId = 0,
          uiMapIds = {
            2214
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Lurker of the Deeps"
          },
          note = "Fishing rare in The Ringing Deeps."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Lurker of the Deeps",
      npcID = 220285
    },
    expansion = 10
  },
  {
    id = 409,
    mounts = {
      {
        id = 2224,
        name = "Frayfeather Hippogryph",
        icon = 2020396,
        itemId = 224398,
        spellId = 452643,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Bobadormu"
          },
          note = "Timewalking vendor",
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
      name = "Bobadormu",
      npcID = 234555
    },
    expansion = 9
  },
  {
    id = 410,
    mounts = {
      {
        id = 2224,
        name = "Frayfeather Hippogryph",
        icon = 2020396,
        itemId = 224398,
        spellId = 452643,
        source = {
          mapId = 0,
          uiMapIds = {
            71
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Grannadormu"
          },
          note = "Timewalking vendor",
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
      name = "Grannadormu",
      npcID = 234556
    },
    expansion = 9
  },
  {
    id = 411,
    mounts = {
      {
        id = 2272,
        name = "Crimson Armored Growler",
        icon = 5912683,
        itemId = 229935,
        spellId = 465999,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Rocco Razzboom"
          },
          cost = {
            type = "currency",
            amount = 8125,
            currencyId = 2815
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Rocco Razzboom",
      npcID = 231406
    },
    expansion = 10
  },
  {
    id = 412,
    mounts = {
      {
        id = 2274,
        name = "Blackwater Bonecrusher",
        icon = 5912680,
        itemId = 229937,
        spellId = 466001,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Blackwater Trove"
          },
          note = "Treasure trove in Undermine."
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Blackwater Trove"
    },
    expansion = 10
  },
  {
    id = 413,
    mounts = {
      {
        id = 2276,
        name = "Darkfuse Chompactor",
        icon = 5912679,
        itemId = 229924,
        spellId = 466000,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Ando the Gat"
          },
          note = "Liberation of Undermine raid vendor",
          cost = {
            type = "gold",
            amount = 5000000
          }
        }
      },
      {
        id = 2278,
        name = "Flarendo the Furious",
        icon = 6123444,
        itemId = 229940,
        spellId = 466011,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Ando the Gat"
          },
          note = "Liberation of Undermine raid vendor",
          cost = {
            type = "gold",
            amount = 5000000
          }
        }
      },
      {
        id = 2279,
        name = "Thunderdrum Misfire",
        icon = 6043870,
        itemId = 229945,
        spellId = 466012,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Ando the Gat"
          },
          note = "Liberation of Undermine raid vendor",
          cost = {
            type = "gold",
            amount = 5000000
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Ando the Gat",
      npcID = 235621
    },
    expansion = 10
  },
  {
    id = 414,
    mounts = {
      {
        id = 2277,
        name = "Violet Armored Growler",
        icon = 5912682,
        itemId = 229936,
        spellId = 466002,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Smaks Topskimmer"
          },
          cost = {
            type = "currency",
            amount = 8125,
            currencyId = 2815
          }
        }
      },
      {
        id = 2280,
        name = "The Topskimmer Special",
        icon = 6043869,
        itemId = 229944,
        spellId = 466016,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Smaks Topskimmer"
          },
          cost = {
            type = "currency",
            amount = 11375,
            currencyId = 2815
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Smaks Topskimmer",
      npcID = 231409
    },
    expansion = 10
  },
  {
    id = 415,
    mounts = {
      {
        id = 2281,
        name = "Steamwheedle Supplier",
        icon = 6043868,
        itemId = 229943,
        spellId = 466014,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Steamwheedle Trove"
          },
          note = "Treasure trove in Undermine."
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Steamwheedle Trove"
    },
    expansion = 10
  },
  {
    id = 416,
    mounts = {
      {
        id = 2283,
        name = "Innovation Investigator",
        icon = 6043865,
        itemId = 229941,
        spellId = 466017,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Skedgit Cinderbangs"
          },
          cost = {
            type = "item",
            amount = 25,
            itemId = 234741
          }
        }
      },
      {
        id = 2290,
        name = "Asset Advocator",
        icon = 6074829,
        itemId = 229952,
        spellId = 466023,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Skedgit Cinderbangs"
          },
          cost = {
            type = "item",
            amount = 25,
            itemId = 234741
          }
        }
      },
      {
        id = 2292,
        name = "Margin Manipulator",
        icon = 6126217,
        itemId = 229954,
        spellId = 466025,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Skedgit Cinderbangs"
          },
          cost = {
            type = "item",
            amount = 25,
            itemId = 234741
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Skedgit Cinderbangs",
      npcID = 228286
    },
    expansion = 10
  },
  {
    id = 417,
    mounts = {
      {
        id = 2284,
        name = "Ochre Delivery Rocket",
        icon = 6123443,
        itemId = 229946,
        spellId = 466013,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Shredz the Scrapper"
          },
          cost = {
            type = "currency",
            amount = 11375,
            currencyId = 2815
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Shredz the Scrapper",
      npcID = 231407
    },
    expansion = 10
  },
  {
    id = 418,
    mounts = {
      {
        id = 2286,
        name = "Blackwater Shredder Deluxe Mk 2",
        icon = 6124650,
        itemId = 229948,
        spellId = 466019,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Boatswain Hardee"
          },
          cost = {
            type = "currency",
            amount = 8125,
            currencyId = 2815
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Boatswain Hardee",
      npcID = 231405
    },
    expansion = 10
  },
  {
    id = 419,
    mounts = {
      {
        id = 2287,
        name = "Darkfuse Demolisher",
        icon = 6124649,
        itemId = 229950,
        spellId = 466018,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Sitch Lowdown"
          },
          cost = {
            type = "currency",
            amount = 11375,
            currencyId = 2815
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Sitch Lowdown",
      npcID = 231396
    },
    expansion = 10
  },
  {
    id = 420,
    mounts = {
      {
        id = 2288,
        name = "Personalized Goblin S.C.R.A.P.per",
        icon = 6124651,
        itemId = 229949,
        spellId = 466020,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Sifted Pile of Scrap"
          }
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Sifted Pile of Scrap"
    },
    expansion = 10
  },
  {
    id = 421,
    mounts = {
      {
        id = 2289,
        name = "Venture Co-ordinator",
        icon = 6124648,
        itemId = 229951,
        spellId = 466022,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Venture Co. Trove"
          },
          note = "Treasure trove in Undermine."
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Venture Co. Trove"
    },
    expansion = 10
  },
  {
    id = 422,
    mounts = {
      {
        id = 2291,
        name = "Salvaged Goblin Gazillionaire's Flying Machine",
        icon = 6126220,
        itemId = 229953,
        spellId = 466026,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Gallagio Garbage"
          }
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Gallagio Garbage"
    },
    expansion = 10
  },
  {
    id = 423,
    mounts = {
      {
        id = 2294,
        name = "Mean Green Flying Machine",
        icon = 6126218,
        itemId = 229956,
        spellId = 466028,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lab Assistant Laszly"
          },
          cost = {
            type = "currency",
            amount = 11375,
            currencyId = 2815
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Lab Assistant Laszly",
      npcID = 231408
    },
    expansion = 10
  },
  {
    id = 424,
    mounts = {
      {
        id = 2295,
        name = "Bilgewater Bombardier",
        icon = 6126219,
        itemId = 229957,
        spellId = 466024,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Bilgewater Trove"
          },
          note = "Treasure trove in Undermine."
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Bilgewater Trove"
    },
    expansion = 10
  },
  {
    id = 425,
    mounts = {
      {
        id = 2303,
        name = "Violet Goblin Shredder",
        icon = 6124652,
        itemId = 229947,
        spellId = 466021,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Shipping and Handling"
          }
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Shipping and Handling"
    },
    expansion = 10
  },
  {
    id = 426,
    mounts = {
      {
        id = 2327,
        name = "Lunar Launcher",
        icon = 6236734,
        itemId = 232901,
        spellId = 472253,
        source = {
          mapId = 0,
          uiMapIds = {
            80
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lunar Festival"
          },
          note = "Available during Lunar Festival event.",
          cost = {
            type = "item",
            amount = 50,
            itemId = 21100
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Lunar Festival"
    },
    expansion = 3
  },
  {
    id = 427,
    mounts = {
      {
        id = 2328,
        name = "Love Witch's Sweeper",
        icon = 6215478,
        itemId = 232926,
        spellId = 472479,
        source = {
          mapId = 0,
          uiMapIds = {
            21
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Apothecary Hummel"
          },
          note = "Love is in the Air holiday boss in Shadowfang Keep."
        }
      },
      {
        id = 2492,
        name = "Spring Butterfly",
        icon = 6382168,
        itemId = 235658,
        spellId = 1218013,
        source = {
          mapId = 0,
          uiMapIds = {
            21
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Apothecary Hummel"
          },
          note = "Love is in the Air holiday boss in Shadowfang Keep."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Apothecary Hummel",
      npcID = 36296
    },
    expansion = 2
  },
  {
    id = 428,
    mounts = {
      {
        id = 2333,
        name = "Soweezi's Vintage Waveshredder",
        icon = 5661097,
        itemId = 233058,
        spellId = 473137,
        source = {
          mapId = 0,
          uiMapIds = {
            2369
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Soweezi"
          },
          cost = {
            type = "currency",
            amount = 10000,
            currencyId = 3090
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Soweezi",
      npcID = 234390
    },
    expansion = 10
  },
  {
    id = 429,
    mounts = {
      {
        id = 2334,
        name = "Bronze Goblin Waveshredder",
        icon = 5661096,
        itemId = 233064,
        spellId = 473188,
        source = {
          mapId = 0,
          uiMapIds = {
            2346
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Darkfuse Trove"
          },
          note = "Treasure trove in Undermine."
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Darkfuse Trove"
    },
    expansion = 10
  },
  {
    id = 430,
    mounts = {
      {
        id = 2469,
        name = "Prismatic Snapdragon",
        icon = 2027958,
        itemId = 233489,
        spellId = 474086,
        source = {
          mapId = 0,
          uiMapIds = {
            2369
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "A Loyal Friend"
          }
        }
      }
    },
    source = {
      type = "Quest",
      name = "A Loyal Friend"
    },
    expansion = 10
  },
  {
    id = 431,
    mounts = {
      {
        id = 2550,
        name = "K'arroc Swiftwing",
        icon = 6841152,
        itemId = 242715,
        spellId = 1233516,
        source = {
          mapId = 0,
          uiMapIds = {
            2371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Off to Tazavesh, Again"
          }
        }
      }
    },
    source = {
      type = "Quest",
      name = "Off to Tazavesh, Again"
    },
    expansion = 10
  },
  {
    id = 432,
    mounts = {
      {
        id = 2473,
        name = "Broodling of Sinestra",
        icon = 236235,
        itemId = 234730,
        spellId = 1214946,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Kiatke"
          },
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
      name = "Kiatke",
      npcID = 101759
    },
    expansion = 3
  },
  {
    id = 433,
    mounts = {
      {
        id = 2487,
        name = "The Big G",
        icon = 6245983,
        itemId = 235626,
        spellId = 1217760,
        source = {
          mapId = 2769,
          uiMapIds = {
            2409
          },
          allowedDifficultyIds = {
            16
          },
          journalEncounter = {
            id = 2646,
            name = "Chrome King Gallywix",
            instanceId = 1296,
            uiMapId = 2409
          },
          dungeonEncounter = {
            id = 3016,
            name = "Chrome King Gallywix",
            mapId = 2769
          }
        }
      },
      {
        id = 2507,
        name = "Prototype A.S.M.R.",
        icon = 5983710,
        itemId = 236960,
        spellId = 1221155,
        source = {
          mapId = 2769,
          uiMapIds = {
            2409
          },
          allowedDifficultyIds = {
            14,
            15,
            16,
            17,
            220
          },
          journalEncounter = {
            id = 2646,
            name = "Chrome King Gallywix",
            instanceId = 1296,
            uiMapId = 2409
          },
          dungeonEncounter = {
            id = 3016,
            name = "Chrome King Gallywix",
            mapId = 2769
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Liberation of Undermine"
    },
    expansion = 10
  },
  {
    id = 434,
    mounts = {
      {
        id = 2496,
        name = "Void-Scarred Gryphon",
        icon = 0,
        itemId = 235700,
        spellId = 1218229,
        source = {
          mapId = 0,
          uiMapIds = {
            2404
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Void-Scarred Gryphon"
          },
          note = "Drops inside the Revisited Horrific Vision of Stormwind. Enter via the portal in the Chamber of Heart (Vault of the Heavens)."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Void-Scarred Gryphon"
    },
    expansion = 10
  },
  {
    id = 435,
    mounts = {
      {
        id = 2497,
        name = "Void-Forged Stallion",
        icon = 132251,
        itemId = 235705,
        spellId = 1218305,
        source = {
          mapId = 0,
          uiMapIds = {
            2404
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Void-Forged Stallion"
          },
          note = "Drops inside the Revisited Horrific Vision of Stormwind. Enter via the portal in the Chamber of Heart (Vault of the Heavens)."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Void-Forged Stallion"
    },
    expansion = 10
  },
  {
    id = 436,
    mounts = {
      {
        id = 2498,
        name = "Void-Scarred Pack Mother",
        icon = 132224,
        itemId = 235706,
        spellId = 1218306,
        source = {
          mapId = 0,
          uiMapIds = {
            2403
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Void-Scarred Pack Mother"
          },
          note = "Drops inside the Revisited Horrific Vision of Orgrimmar. Enter via the portal in the Chamber of Heart (Vault of the Heavens)."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Void-Scarred Pack Mother"
    },
    expansion = 10
  },
  {
    id = 437,
    mounts = {
      {
        id = 2499,
        name = "Void-Scarred Windrider",
        icon = 132268,
        itemId = 235707,
        spellId = 1218307,
        source = {
          mapId = 0,
          uiMapIds = {
            2403
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Void-Scarred Windrider"
          },
          note = "Drops inside the Revisited Horrific Vision of Orgrimmar. Enter via the portal in the Chamber of Heart (Vault of the Heavens)."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Void-Scarred Windrider"
    },
    expansion = 10
  },
  {
    id = 438,
    mounts = {
      {
        id = 2501,
        name = "Corruption of the Aspects",
        icon = 6698671,
        itemId = 235711,
        spellId = 1218316,
        source = {
          mapId = 0,
          uiMapIds = {
            2339
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Torie"
          },
          cost = {
            type = "currency",
            amount = 40000,
            currencyId = 3149
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Torie",
      npcID = 238138
    },
    expansion = 10
  },
  {
    id = 439,
    mounts = {
      {
        id = 2510,
        name = "Terror of the Wastes",
        icon = 6320429,
        itemId = 237484,
        spellId = 1223187,
        source = {
          mapId = 0,
          uiMapIds = {
            2371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Om'sirik"
          },
          cost = {
            type = "currency",
            amount = 11375,
            currencyId = 2815
          }
        }
      },
      {
        id = 2556,
        name = "Ruby Void Creeper",
        icon = 6841594,
        itemId = 242729,
        spellId = 1233546,
        source = {
          mapId = 0,
          uiMapIds = {
            2371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Om'sirik"
          },
          cost = {
            type = "currency",
            amount = 8125,
            currencyId = 2815
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Om'sirik",
      npcID = 235252
    },
    expansion = 10
  },
  {
    id = 440,
    mounts = {
      {
        id = 2512,
        name = "Delver's Mana-Skimmer",
        icon = 6361900,
        itemId = 238051,
        spellId = 1224048,
        source = {
          mapId = 0,
          uiMapIds = {
            2248
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Repossessed!"
          }
        }
      }
    },
    source = {
      type = "Quest",
      name = "Repossessed!"
    },
    expansion = 10
  },
  {
    id = 441,
    mounts = {
      {
        id = 2519,
        name = "Radiant Imperial Lynx",
        icon = 6322044,
        itemId = 238829,
        spellId = 1226421,
        source = {
          mapId = 0,
          uiMapIds = {
            2215
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Lars Bronsmaelt"
          },
          cost = {
            type = "currency",
            amount = 8125,
            currencyId = 2815
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Lars Bronsmaelt",
      npcID = 240852
    },
    expansion = 10
  },
  {
    id = 442,
    mounts = {
      {
        id = 2535,
        name = "Void-Scarred Lynx",
        icon = 136202,
        itemId = 239563,
        spellId = 1228865,
        source = {
          mapId = 0,
          uiMapIds = {
            2215
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Confiscated Cultist's Bag"
          },
          note = "Reward from Nightfall daily Incursion quests in Hallowfall and Azj-Kahet (turned in to Mylton Wyldbraun). The bag can contain the Void-Scarred Lynx."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Confiscated Cultist's Bag",
      npcID = 234774
    },
    expansion = 10
  },
  {
    id = 443,
    mounts = {
      {
        id = 2552,
        name = "Lavender K'arroc",
        icon = 6841155,
        itemId = 242717,
        spellId = 1233518,
        source = {
          mapId = 0,
          uiMapIds = {
            2371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Shad'anis"
          },
          cost = {
            type = "currency",
            amount = 10,
            currencyId = 3303
          }
        }
      },
      {
        id = 2557,
        name = "Acidic Void Creeper",
        icon = 6841595,
        itemId = 242730,
        spellId = 1233547,
        source = {
          mapId = 0,
          uiMapIds = {
            2371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Shad'anis"
          },
          cost = {
            type = "currency",
            amount = 7,
            currencyId = 3303
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Shad'anis",
      npcID = 241624
    },
    expansion = 10
  },
  {
    id = 444,
    mounts = {
      {
        id = 2560,
        name = "Blue Barry",
        icon = 6661374,
        itemId = 242733,
        spellId = 1233559,
        source = {
          mapId = 0,
          uiMapIds = {
            2371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "A Blue for You"
          }
        }
      }
    },
    source = {
      type = "Quest",
      name = "A Blue for You"
    },
    expansion = 10
  },
  {
    id = 445,
    mounts = {
      {
        id = 2561,
        name = "Curious Slateback",
        icon = 6661375,
        itemId = 242734,
        spellId = 1233561,
        source = {
          mapId = 0,
          uiMapIds = {
            2371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Wriggling Pinnacle Cache"
          }
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Wriggling Pinnacle Cache"
    },
    expansion = 10
  },
  {
    id = 446,
    mounts = {
      {
        id = 2569,
        name = "Unbound Star-Eater",
        icon = 6841475,
        itemId = 243061,
        spellId = 1234573,
        source = {
          mapId = 2810,
          uiMapIds = {
            2467
          },
          allowedDifficultyIds = {
            16
          },
          journalEncounter = {
            id = 2691,
            name = "Dimensius, the All-Devouring",
            instanceId = 1302,
            uiMapId = 2467
          },
          dungeonEncounter = {
            id = 3135,
            name = "Dimensius, the All-Devouring",
            mapId = 2810
          }
        }
      },
      {
        id = 2606,
        name = "Royal Voidwing",
        icon = 6856023,
        itemId = 246445,
        spellId = 1242272,
        source = {
          mapId = 2810,
          uiMapIds = {
            2467
          },
          allowedDifficultyIds = {
            15,
            16,
            220,
            241
          },
          note = "This mount is only obtainable from \124cffa335ee\124Hitem:246446::::::::80:::::\124h[Mark of the Twilight Oath]\124h\124r, which starts the quest 'A Twilight Oath's End'. This quest is only available until the release of Midnight.",
          journalEncounter = {
            id = 2691,
            name = "Dimensius, the All-Devouring",
            instanceId = 1302,
            uiMapId = 2467
          },
          dungeonEncounter = {
            id = 3135,
            name = "Dimensius, the All-Devouring",
            mapId = 2810
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Manaforge Omega"
    },
    expansion = 10
  },
  {
    id = 447,
    mounts = {
      {
        id = 2586,
        name = "Moonlit Nightsaber",
        icon = 0,
        itemId = 245695,
        spellId = 1237631,
        source = {
          mapId = 0,
          uiMapIds = {
            862
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Churbro"
          },
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      },
      {
        id = 2587,
        name = "Ivory Savagemane",
        icon = 0,
        itemId = 245694,
        spellId = 1237703,
        source = {
          mapId = 0,
          uiMapIds = {
            862
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Churbro"
          },
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
      name = "Churbro",
      npcID = 239840
    },
    expansion = 7
  },
  {
    id = 448,
    mounts = {
      {
        id = 2601,
        name = "Pearlescent Krolusk",
        icon = 1573610,
        itemId = 246067,
        spellId = 1240632,
        source = {
          mapId = 0,
          uiMapIds = {
            2371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Urmag"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Urmag"
    },
    expansion = 10
  },
  {
    id = 449,
    mounts = {
      {
        id = 2602,
        name = "Translocated Gorger",
        icon = 0,
        itemId = 246159,
        spellId = 1241070,
        source = {
          mapId = 0,
          uiMapIds = {
            2371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Devourer Swarms"
          },
          note = "Kill Devourer Swarm rares in K'aresh areas."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Devourer Swarms"
    },
    expansion = 10
  },
  {
    id = 450,
    mounts = {
      {
        id = 2603,
        name = "Sthaarbs's Last Lunch",
        icon = 3931116,
        itemId = 246160,
        spellId = 1241076,
        source = {
          mapId = 0,
          uiMapIds = {
            2371
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Sthaarbs"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Sthaarbs"
    },
    expansion = 10
  },
  {
    id = 451,
    mounts = {
      {
        id = 2604,
        name = "OC91 Chariot",
        icon = 6792093,
        itemId = 246237,
        spellId = 1241263,
        source = {
          mapId = 0,
          uiMapIds = {
            2339
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Sir Finley Mrrgglton"
          },
          cost = {
            type = "currency",
            amount = 15000,
            currencyId = 2803
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Sir Finley Mrrgglton",
      npcID = 208070
    },
    expansion = 10
  },
  {
    id = 452,
    mounts = {
      {
        id = 2607,
        name = "Ashes of Belo'ren",
        icon = 7049048,
        itemId = 246590,
        spellId = 1242904,
        source = {
          mapId = 2913,
          uiMapIds = {
            2534
          },
          allowedDifficultyIds = {
            16
          },
          journalEncounter = {
            id = 2740,
            name = "Midnight Falls",
            instanceId = 1308,
            uiMapId = 2534
          },
          dungeonEncounter = {
            id = 3183,
            name = "Midnight Falls",
            mapId = 2913
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "March on Quel'Danas"
    },
    expansion = 11
  },
  {
    id = 453,
    mounts = {
      {
        id = 2614,
        name = "Fierce Grimlynx",
        icon = 7386625,
        itemId = 246734,
        spellId = 1243593,
        source = {
          mapId = 0,
          uiMapIds = {
            2413
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Naynar"
          },
          cost = {
            type = "currency",
            amount = 6000,
            currencyId = 3316
          }
        }
      },
      {
        id = 2710,
        name = "Cerulean Sporeglider",
        icon = 6254091,
        itemId = 252014,
        spellId = 1253929,
        source = {
          mapId = 0,
          uiMapIds = {
            2413
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Naynar"
          },
          cost = {
            type = "currency",
            amount = 8000,
            currencyId = 3316
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Naynar",
      npcID = 240407
    },
    expansion = 11
  },
  {
    id = 454,
    mounts = {
      {
        id = 2615,
        name = "Rootstalker Grimlynx",
        icon = 7386626,
        itemId = 246735,
        spellId = 1243597,
        source = {
          mapId = 0,
          uiMapIds = {
            2413
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Harandar Rare Creatures"
          },
          note = "Drops from various Harandar zone rares."
        }
      },
      {
        id = 2708,
        name = "Vibrant Petalwing",
        icon = 6916452,
        itemId = 252012,
        spellId = 1253927,
        source = {
          mapId = 0,
          uiMapIds = {
            2413
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Harandar Rare Creatures"
          },
          note = "Drops from various Harandar zone rares."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Harandar Rare Creatures"
    },
    expansion = 11
  },
  {
    id = 455,
    mounts = {
      {
        id = 2640,
        name = "Brewfest Bomber",
        icon = 7128724,
        itemId = 248761,
        spellId = 1247662,
        source = {
          mapId = 0,
          uiMapIds = {
            32
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Coren Direbrew"
          },
          note = "Brewfest holiday boss in Blackrock Depths."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Coren Direbrew",
      npcID = 23872
    },
    expansion = 1
  },
  {
    id = 456,
    mounts = {
      {
        id = 2693,
        name = "Amani Sunfeather",
        icon = 7414443,
        itemId = 250782,
        spellId = 1251433,
        source = {
          mapId = 0,
          uiMapIds = {
            2395
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Chel the Chip"
          },
          cost = {
            type = "currency",
            amount = 1600,
            currencyId = 3377
          }
        }
      },
      {
        id = 2772,
        name = "Blessed Amani Burrower",
        icon = 7414435,
        itemId = 257197,
        spellId = 1261348,
        source = {
          mapId = 0,
          uiMapIds = {
            2395
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Chel the Chip"
          },
          cost = {
            type = "currency",
            amount = 1600,
            currencyId = 3377
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Chel the Chip",
      npcID = 257633
    },
    expansion = 11
  },
  {
    id = 457,
    mounts = {
      {
        id = 2694,
        name = "Amani Windcaller",
        icon = 7414440,
        itemId = 250889,
        spellId = 1251630,
        source = {
          mapId = 0,
          uiMapIds = {
            2437
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Magovu"
          },
          cost = {
            type = "currency",
            amount = 8000,
            currencyId = 3316
          }
        }
      },
      {
        id = 2776,
        name = "Amani Blessed Bear",
        icon = 7263307,
        itemId = 257219,
        spellId = 1261357,
        source = {
          mapId = 0,
          uiMapIds = {
            2437
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Magovu"
          },
          cost = {
            type = "currency",
            amount = 6000,
            currencyId = 3316
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Magovu",
      npcID = 240279
    },
    expansion = 11
  },
  {
    id = 458,
    mounts = {
      {
        id = 2713,
        name = "Ruddy Sporeglider",
        icon = 7298537,
        itemId = 252017,
        spellId = 1253938,
        source = {
          mapId = 0,
          uiMapIds = {
            2413
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Peculiar Cauldron"
          }
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Peculiar Cauldron"
    },
    expansion = 11
  },
  {
    id = 459,
    mounts = {
      {
        id = 2747,
        name = "Untainted Grove Crawler",
        icon = 7109429,
        itemId = 256423,
        spellId = 1260354,
        source = {
          mapId = 0,
          uiMapIds = {
            2413
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Sporespawned Cache"
          }
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Sporespawned Cache"
    },
    expansion = 11
  },
  {
    id = 460,
    mounts = {
      {
        id = 2749,
        name = "Echo of Aln'sharan",
        icon = 3229534,
        itemId = 256424,
        spellId = 1260356,
        source = {
          mapId = 0,
          uiMapIds = {
            2413
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Aln'Sharan"
          }
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Aln'Sharan"
    },
    expansion = 11
  },
  {
    id = 461,
    mounts = {
      {
        id = 2751,
        name = "Augmented Stormray",
        icon = 7084910,
        itemId = 257085,
        spellId = 1261155,
        source = {
          mapId = 0,
          uiMapIds = {
            2405
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Voidstorm Rare Creatures"
          },
          note = "Drops from various Voidstorm zone rares."
        }
      },
      {
        id = 2827,
        name = "Sanguine Harrower",
        icon = 7455664,
        itemId = 260635,
        spellId = 1266700,
        source = {
          mapId = 0,
          uiMapIds = {
            2405
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Voidstorm Rare Creatures"
          },
          note = "Drops from various Voidstorm zone rares."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Voidstorm Rare Creatures"
    },
    expansion = 11
  },
  {
    id = 462,
    mounts = {
      {
        id = 2753,
        name = "Fiery Dragonhawk",
        icon = 7090841,
        itemId = 257142,
        spellId = 1261291,
        source = {
          mapId = 0,
          uiMapIds = {
            2395
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Caeris Fairdawn"
          },
          cost = {
            type = "currency",
            amount = 8000,
            currencyId = 3316
          }
        }
      },
      {
        id = 2761,
        name = "Crimson Silvermoon Hawkstrider",
        icon = 7415197,
        itemId = 257154,
        spellId = 1261322,
        source = {
          mapId = 0,
          uiMapIds = {
            2395
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Caeris Fairdawn"
          },
          cost = {
            type = "currency",
            amount = 6000,
            currencyId = 3316
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Caeris Fairdawn",
      npcID = 240838
    },
    expansion = 11
  },
  {
    id = 463,
    mounts = {
      {
        id = 2758,
        name = "Cobalt Dragonhawk",
        icon = 7112305,
        itemId = 257147,
        spellId = 1261302,
        source = {
          mapId = 0,
          uiMapIds = {
            2395
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Eversong Woods Rare Creatures"
          },
          note = "Drops from various Eversong Woods zone rares."
        }
      },
      {
        id = 2762,
        name = "Cerulean Hawkstrider",
        icon = 7415196,
        itemId = 257156,
        spellId = 1261323,
        source = {
          mapId = 0,
          uiMapIds = {
            2395
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Eversong Woods Rare Creatures"
          },
          note = "Drops from various Eversong Woods zone rares."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Eversong Woods Rare Creatures"
    },
    expansion = 11
  },
  {
    id = 464,
    mounts = {
      {
        id = 2760,
        name = "Amani Sharptalon",
        icon = 7414441,
        itemId = 257152,
        spellId = 1261316,
        source = {
          mapId = 0,
          uiMapIds = {
            2437
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Zul'Aman Rare Creatures"
          },
          note = "Drops from various Zul'Aman zone rares."
        }
      },
      {
        id = 2775,
        name = "Witherbark Pango",
        icon = 7414437,
        itemId = 257200,
        spellId = 1261351,
        source = {
          mapId = 0,
          uiMapIds = {
            2437
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Zul'Aman Rare Creatures"
          },
          note = "Drops from various Zul'Aman zone rares."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Zul'Aman Rare Creatures"
    },
    expansion = 11
  },
  {
    id = 465,
    mounts = {
      {
        id = 2764,
        name = "Duskbrute Harrower",
        icon = 7164284,
        itemId = 257176,
        spellId = 1261332,
        source = {
          mapId = 0,
          uiMapIds = {
            2444
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Slayer's Duellum Trove"
          }
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Slayer's Duellum Trove"
    },
    expansion = 11
  },
  {
    id = 466,
    mounts = {
      {
        id = 2767,
        name = "Contained Stormarion Defender",
        icon = 7164285,
        itemId = 257180,
        spellId = 1261334,
        source = {
          mapId = 0,
          uiMapIds = {
            2405
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Victorious Stormarion Cache"
          }
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Victorious Stormarion Cache"
    },
    expansion = 11
  },
  {
    id = 467,
    mounts = {
      {
        id = 2769,
        name = "Preyseeker's Hubris",
        icon = 7266832,
        itemId = 257191,
        spellId = 1261336,
        source = {
          mapId = 0,
          uiMapIds = {
            2393
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Construct V'anore"
          },
          cost = {
            type = "currency",
            amount = 2000,
            currencyId = 3392
          }
        }
      },
      {
        id = 2770,
        name = "Preyseeker's Wrath",
        icon = 7266833,
        itemId = 257192,
        spellId = 1261337,
        source = {
          mapId = 0,
          uiMapIds = {
            2393
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Construct V'anore"
          },
          cost = {
            type = "currency",
            amount = 2550,
            currencyId = 3392
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Construct V'anore",
      npcID = 252956
    },
    expansion = 11
  },
  {
    id = 468,
    mounts = {
      {
        id = 2778,
        name = "Ancestral War Bear",
        icon = 7263310,
        itemId = 257223,
        spellId = 1261360,
        source = {
          mapId = 0,
          uiMapIds = {
            2437
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Honored Warrior's Cache"
          }
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Honored Warrior's Cache"
    },
    expansion = 11
  },
  {
    id = 469,
    mounts = {
      {
        id = 2779,
        name = "Witherbark Warbear Mother",
        icon = 7263309,
        itemId = 257225,
        spellId = 1261362,
        source = {
          mapId = 0,
          uiMapIds = {
            2437
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Broken Throne"
          },
          note = "Broken Throne Ritual Site, Tier 2 or higher. Find the Lost Bear Cub and feed it 1 Practically Pork to get Chubs. Summon Chubs at a meat pile to spawn Angry Amani Warbear, reduce it to 5% health, then use 5 Practically Pork to receive the mount."
        }
      },
      {
        id = 2961,
        name = "Void-Corrupted Hex Eagle",
        icon = 135664,
        itemId = 269828,
        spellId = 1286606,
        source = {
          mapId = 0,
          uiMapIds = {
            2437
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Broken Throne"
          },
          note = "Broken Throne Ritual Site, Tier 2 or higher. Loot the Misplaced Ritual Candle, place it at the ritual skull under the tree, then click the center candle in the ritual circle to summon the eagle."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Broken Throne"
    },
    expansion = 11
  },
  {
    id = 470,
    mounts = {
      {
        id = 2785,
        name = "Relinquished Scarlet Charger",
        icon = 7322710,
        itemId = 257240,
        spellId = 1261391,
        source = {
          mapId = 0,
          uiMapIds = {
            2393
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Relinquishing Relics"
          },
          note = "Midnight quest chain reward."
        }
      }
    },
    source = {
      type = "Quest",
      name = "Relinquishing Relics"
    },
    expansion = 11
  },
  {
    id = 471,
    mounts = {
      {
        id = 2786,
        name = "Hexed Vilefeather Eagle",
        icon = 7143519,
        itemId = 257444,
        spellId = 1261576,
        source = {
          mapId = 0,
          uiMapIds = {
            2437
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Abandoned Ritual Skull"
          }
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Abandoned Ritual Skull"
    },
    expansion = 11
  },
  {
    id = 472,
    mounts = {
      {
        id = 2789,
        name = "Ravenous Shredclaw",
        icon = 6966388,
        itemId = 257445,
        spellId = 1261579,
        source = {
          mapId = 0,
          uiMapIds = {
            2405
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Void Researcher Anomander"
          },
          cost = {
            type = "currency",
            amount = 6000,
            currencyId = 3316
          }
        }
      },
      {
        id = 2828,
        name = "Voidbound Stormray",
        icon = 7455623,
        itemId = 260696,
        spellId = 1266702,
        source = {
          mapId = 0,
          uiMapIds = {
            2405
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Void Researcher Anomander"
          },
          cost = {
            type = "currency",
            amount = 8000,
            currencyId = 3316
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Void Researcher Anomander",
      npcID = 248328
    },
    expansion = 11
  },
  {
    id = 473,
    mounts = {
      {
        id = 2790,
        name = "Insatiable Shredclaw",
        icon = 6966390,
        itemId = 257446,
        spellId = 1261583,
        source = {
          mapId = 0,
          uiMapIds = {
            2405
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Final Clutch of Predaxas"
          }
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Final Clutch of Predaxas"
    },
    expansion = 11
  },
  {
    id = 474,
    mounts = {
      {
        id = 2791,
        name = "Prowling Shredclaw",
        icon = 6966387,
        itemId = 257447,
        spellId = 1261584,
        source = {
          mapId = 0,
          uiMapIds = {
            2444
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Thraxadar"
          },
          cost = {
            type = "currency",
            amount = 6000,
            currencyId = 3316
          }
        }
      },
      {
        id = 2792,
        name = "Frenzied Shredclaw",
        icon = 6966389,
        itemId = 257448,
        spellId = 1261585,
        source = {
          mapId = 0,
          uiMapIds = {
            2444
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Thraxadar"
          },
          cost = {
            type = "currency",
            amount = 6000,
            currencyId = 3316
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Thraxadar",
      npcID = 258328
    },
    expansion = 11
  },
  {
    id = 475,
    mounts = {
      {
        id = 2804,
        name = "Crimson Lupine",
        icon = 0,
        itemId = 258515,
        spellId = 1263387,
        source = {
          mapId = 0,
          uiMapIds = {
            1670
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Collector Ta'steld"
          },
          note = "Timewalking vendor",
          cost = {
            type = "currency",
            amount = 5000,
            currencyId = 1166
          }
        }
      },
      {
        id = 2815,
        name = "Snowpaw Glimmerfur Prowler",
        icon = 3747453,
        itemId = 259463,
        spellId = 1264988,
        source = {
          mapId = 0,
          uiMapIds = {
            1670
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Collector Ta'steld"
          },
          note = "Timewalking vendor",
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
      name = "Collector Ta'steld",
      npcID = 252687
    },
    expansion = 8
  },
  {
    id = 476,
    mounts = {
      {
        id = 2805,
        name = "Spectral Hawkstrider",
        icon = 6996382,
        itemId = 262914,
        spellId = 1263635,
        source = {
          mapId = 2805,
          uiMapIds = {
            2499
          },
          allowedDifficultyIds = {
            8,
            23
          },
          journalEncounter = {
            id = 2658,
            name = "The Restless Heart",
            instanceId = 1299,
            uiMapId = 2499
          },
          dungeonEncounter = {
            id = 3059,
            name = "Restless Heart",
            mapId = 2805
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "Windrunner Spire"
    },
    expansion = 11
  },
  {
    id = 477,
    mounts = {
      {
        id = 2807,
        name = "Brawlin' Bruno",
        icon = 7355714,
        itemId = 259227,
        spellId = 1264621,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Ulaani"
          },
          note = "Brawler's Guild vendor"
        }
      },
      {
        id = 2808,
        name = "Ballistic Bronco",
        icon = 7370110,
        itemId = 259238,
        spellId = 1264643,
        source = {
          mapId = 0,
          uiMapIds = {
            84
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Ulaani"
          },
          note = "Brawler's Guild vendor"
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Ulaani",
      npcID = 118898
    },
    expansion = 10
  },
  {
    id = 478,
    mounts = {
      {
        id = 2807,
        name = "Brawlin' Bruno",
        icon = 7355714,
        itemId = 259227,
        spellId = 1264621,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tiana Nevermorn"
          },
          note = "Brawler's Guild vendor"
        }
      },
      {
        id = 2808,
        name = "Ballistic Bronco",
        icon = 7370110,
        itemId = 259238,
        spellId = 1264643,
        source = {
          mapId = 0,
          uiMapIds = {
            85
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Tiana Nevermorn"
          },
          note = "Brawler's Guild vendor"
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Tiana Nevermorn",
      npcID = 115797
    },
    expansion = 10
  },
  {
    id = 479,
    mounts = {
      {
        id = 2817,
        name = "Lucent Hawkstrider",
        icon = 7454937,
        itemId = 260231,
        spellId = 1265784,
        source = {
          mapId = 2811,
          uiMapIds = {
            2520
          },
          allowedDifficultyIds = {
            8,
            23
          },
          journalEncounter = {
            id = 2662,
            name = "Degentrius",
            instanceId = 1300,
            uiMapId = 2520
          },
          dungeonEncounter = {
            id = 3074,
            name = "Degentrius",
            mapId = 2811
          }
        }
      }
    },
    source = {
      type = "Dungeon",
      name = "Magisters' Terrace (Midnight)"
    },
    expansion = 11
  },
  {
    id = 480,
    mounts = {
      {
        id = 2840,
        name = "Silvermoon's Arcane Defender",
        icon = 7349784,
        itemId = 262500,
        spellId = 1268924,
        source = {
          mapId = 0,
          uiMapIds = {
            2393
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Telemancer Astrandis"
          },
          cost = {
            type = "currency",
            amount = 10,
            currencyId = 3316
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Telemancer Astrandis",
      npcID = 242399
    },
    expansion = 11
  },
  {
    id = 481,
    mounts = {
      {
        id = 2841,
        name = "Elven Arcane Guardian",
        icon = 7349785,
        itemId = 262502,
        spellId = 1268926,
        source = {
          mapId = 0,
          uiMapIds = {
            2393
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Naleidea Rivergleam"
          },
          cost = {
            type = "currency",
            amount = 10000,
            currencyId = 2803
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Naleidea Rivergleam",
      npcID = 242398
    },
    expansion = 11
  },
  {
    id = 482,
    mounts = {
      {
        id = 2915,
        name = "Unbound Manawyrm",
        icon = 6698671,
        itemId = 264348,
        spellId = 1271698,
        source = {
          mapId = 0,
          uiMapIds = {
            2393
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Sergeant Vornin"
          },
          note = "Requires the Void Response Team and Ritual Site Disruptor achievements before Sergeant Vornin will sell it.",
          cost = {
            type = "currency",
            amount = 6000,
            currencyId = 3316
          }
        }
      },
      {
        id = 2935,
        name = "Void-Touched Hawkstrider",
        icon = 6996378,
        itemId = 268578,
        spellId = 1282936,
        source = {
          mapId = 0,
          uiMapIds = {
            2393
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Sergeant Vornin"
          },
          note = "Requires Ritual Sites Renown Rank 8 before Sergeant Vornin will sell it.",
          cost = {
            type = "currency",
            amount = 4500,
            currencyId = 3316
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Sergeant Vornin",
      npcID = 255503
    },
    expansion = 11
  },
  {
    id = 483,
    mounts = {
      {
        id = 2950,
        name = "Luminous Sporeglider",
        icon = 7298536,
        itemId = 269240,
        spellId = 1284973,
        source = {
          mapId = 1592,
          uiMapIds = {
            2427
          },
          allowedDifficultyIds = {
            14,
            15,
            17,
            233
          },
          journalEncounter = {
            id = 2711,
            name = "Rotmire",
            instanceId = 1305,
            uiMapId = 2427
          },
          dungeonEncounter = {
            id = 3159,
            name = "Rotmire",
            mapId = 1592
          }
        }
      }
    },
    source = {
      type = "Raid",
      name = "Sporefall"
    },
    expansion = 11
  },
  {
    id = 484,
    mounts = {
      {
        id = 2964,
        name = "Void-Touched Snapdragon",
        icon = 2027958,
        itemId = 270041,
        spellId = 1287357,
        source = {
          mapId = 0,
          uiMapIds = {
            2395
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Daggerspine Point"
          },
          note = "Daggerspine Point Ritual Site on any tier. Interact with Washed Up Kelp for a chance to spawn the mount, then kill and loot it."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Daggerspine Point"
    },
    expansion = 11
  },
  {
    id = 485,
    mounts = {
      {
        id = 2965,
        name = "Void-Corrupted Lynx",
        icon = 1392562,
        itemId = 270058,
        spellId = 1287359,
        source = {
          mapId = 0,
          uiMapIds = {
            2395
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "click",
          specialEncounter = {
            name = "Treasure and Rare Spoils"
          },
          note = "Ritual Sites Treasure and Rare Spoils can reward Pattern: Rope Lynx Harness and Broken Lynx Leash on Tier 5 or higher. Leatherworking uses both to craft this mount."
        }
      }
    },
    source = {
      type = "Treasure",
      name = "Treasure and Rare Spoils"
    },
    expansion = 11
  },
  {
    id = 486,
    mounts = {
      {
        id = 2988,
        name = "Voidmancer's Starcarver",
        icon = 7649260,
        itemId = 274649,
        spellId = 1294648,
        source = {
          mapId = 0,
          uiMapIds = {
            2599,
            2600
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Kifaan"
          },
          note = "Consortium vendor in Val and Naigtal. Achievement-gated mounts cost 15 Voidlight Marl each.",
          cost = {
            type = "currency",
            amount = 15,
            currencyId = 3316
          }
        }
      },
      {
        id = 2990,
        name = "Netherforged Nullframe",
        icon = 7535090,
        itemId = 274650,
        spellId = 1294663,
        source = {
          mapId = 0,
          uiMapIds = {
            2599,
            2600
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Kifaan"
          },
          note = "Consortium vendor in Val and Naigtal. Achievement-gated mounts cost 15 Voidlight Marl each.",
          cost = {
            type = "currency",
            amount = 15,
            currencyId = 3316
          }
        }
      },
      {
        id = 3033,
        name = "Tortured Gorger",
        icon = 3601543,
        itemId = 275664,
        spellId = 1297427,
        source = {
          mapId = 0,
          uiMapIds = {
            2599,
            2600
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "Kifaan"
          },
          note = "Consortium vendor in Val and Naigtal. Achievement-gated mounts cost 15 Voidlight Marl each.",
          cost = {
            type = "currency",
            amount = 15,
            currencyId = 3316
          }
        }
      }
    },
    source = {
      type = "Vendor",
      name = "Kifaan",
      npcID = 266234
    },
    expansion = 11
  },
  {
    id = 487,
    mounts = {
      {
        id = 3036,
        name = "Sun Festival's Painted Roc",
        icon = 7948243,
        itemId = 275464,
        spellId = 1298439,
        source = {
          mapId = 0,
          uiMapIds = {
            102
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "kill",
          specialEncounter = {
            name = "Ahune"
          },
          note = "Midsummer holiday boss in the Slave Pens (Coilfang Reservoir). Queue via Dungeon Finder during the Midsummer Fire Festival."
        }
      }
    },
    source = {
      type = "OpenWorld",
      name = "Ahune",
      npcID = 23035
    },
    expansion = 11
  },
  {
    id = 488,
    mounts = {
      {
        id = 2818,
        name = "Emerald Hawkstrider",
        icon = 7454938,
        itemId = 260233,
        spellId = 1265785,
        source = {
          mapId = 0,
          uiMapIds = {
            2393
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "The Battle of the Bridge"
          },
          note = "Midnight world quest reward that starts in Silvermoon City."
        }
      }
    },
    source = {
      type = "Quest",
      name = "The Battle of the Bridge"
    },
    expansion = 11
  },
  {
    id = 489,
    mounts = {
      {
        id = 2754,
        name = "Peridot Dragonhawk",
        icon = 7090843,
        itemId = 257143,
        spellId = 1261293,
        source = {
          mapId = 0,
          uiMapIds = {
            2424
          },
          allowedDifficultyIds = {
            -1
          },
          mechanic = "interact",
          specialEncounter = {
            name = "From Darkness, Light"
          },
          note = "Midnight world quest reward on the Isle of Quel'Danas."
        }
      }
    },
    source = {
      type = "Quest",
      name = "From Darkness, Light"
    },
    expansion = 11
  }
}

MRPData.Steps = steps
