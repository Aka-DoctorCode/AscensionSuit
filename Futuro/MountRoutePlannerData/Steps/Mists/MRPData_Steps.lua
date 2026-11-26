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
        itemId = 903,
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
        itemId = 1043,
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
            instanceId = 236,
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
        itemId = 29231,
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
        itemId = 29231,
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
            amount = 1000,
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
            amount = 1000,
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
        id = 373,
        name = "Abyssal Seahorse",
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
    id = 75,
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
    id = 76,
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
    id = 77,
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
    id = 78,
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
    id = 79,
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
    id = 80,
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
    id = 81,
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
    id = 82,
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
    id = 83,
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
    id = 84,
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
    id = 85,
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
    id = 86,
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
    id = 87,
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
    id = 88,
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
    id = 89,
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
    id = 90,
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
    id = 91,
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
    id = 92,
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
    id = 93,
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
    id = 94,
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
    id = 95,
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
    id = 96,
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
    id = 97,
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
    id = 98,
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
    id = 99,
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
    id = 100,
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
    id = 101,
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
    id = 102,
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
    id = 103,
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
    id = 104,
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
    id = 105,
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
    id = 106,
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
    id = 107,
    mounts = {
      {
        id = 476,
        name = "Heavenly Jade Cloud Serpent",
        icon = 237237,
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
    id = 108,
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
            6
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
    id = 109,
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
    id = 110,
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
    id = 111,
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
    id = 112,
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
    id = 113,
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
    id = 114,
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
    id = 115,
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
    id = 116,
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
    id = 117,
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
    id = 118,
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
    id = 119,
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
    id = 120,
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
    id = 121,
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
    id = 122,
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
    id = 123,
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
    id = 124,
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
    id = 125,
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
    id = 126,
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
    id = 127,
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
    id = 128,
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
    id = 129,
    mounts = {
      {
        id = 554,
        name = "Vicious Warsaber",
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
    id = 130,
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
    id = 131,
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
    id = 132,
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
  }
}

MRPData.Steps = steps
