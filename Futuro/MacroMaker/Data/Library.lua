--------------------------------------------------------------------------------
-- Macro Maker - Library Data
-- Version: 3.1 (WoW 12.1.0 Midnight Ready)
-- Author: Satyros
--
-- Description:
--   Comprehensive database of macro templates and snippets tailored for
--   World of Warcraft 12.1.0 Midnight across all 13 classes, specs,
--   Warband systems, healers, tanks, DPS, and PvP.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

-- 1. Snippet Categories
MM.SnippetCategories = {
    "Targeting",
    "Healing",
    "Cooldowns",
    "PvP",
    "Utility",
    "Pet",
    "Movement",
    "Housing & Travel",
    "Pet Battles",
    "Burst & Consumables",
}

-- 2. Snippet Database
MM.SnippetDB = {
    -- Cross-AddOn Suite Snippets
    {
        name = "Housing Teleport & Return (H.O.M.E.)",
        category = "Housing & Travel",
        desc = L["Teleports to your house or returns from neighborhood"] or "Teleports to your house or returns from neighborhood",
        code = "#showtooltip\n/click GHD_MacroButton\n/use [outdoors] Hearthstone",
        tags = {"housing", "home", "teleport", "travel", "ghd"},
    },
    {
        name = "Hearthstone & Homestone Rotation",
        category = "Housing & Travel",
        desc = L["Cast Homestone with mod:alt, fallback to standard Hearthstone"] or "Cast Homestone with mod:alt, fallback to standard Hearthstone",
        code = "#showtooltip\n/use [mod:alt] item:245842; item:6948",
        tags = {"hearthstone", "homestone", "travel"},
    },
    {
        name = "Safari Patrol Target (Z.O.O.)",
        category = "Pet Battles",
        desc = L["Target nearby wild battle pets and mark them"] or "Target nearby wild battle pets and mark them",
        code = "/tar [nodead] Wild Pet\n/script SetRaidTarget(\"target\", 8)",
        tags = {"pet", "safari", "wild", "target", "zoo"},
    },
    {
        name = "Revive & Bandage Battle Pets",
        category = "Pet Battles",
        desc = L["Cast Revive Battle Pets or use Battle Pet Bandage on combat end"] or "Cast Revive Battle Pets or use Battle Pet Bandage on combat end",
        code = "#showtooltip Revive Battle Pets\n/use [nocombat] Revive Battle Pets\n/use [nocombat] item:86143",
        tags = {"pet", "revive", "bandage", "zoo"},
    },
    {
        name = "Major Burst + Potion + Trinkets (Champion)",
        category = "Burst & Consumables",
        desc = L["Activate major cooldowns with DPS potion and trinkets"] or "Activate major cooldowns with DPS potion and trinkets",
        code = "#showtooltip\n/use 13\n/use 14\n/use Potion of Zealotry\n/cast [combat] COOLDOWN",
        tags = {"burst", "trinket", "potion", "consumable", "champion"},
    },
    {
        name = "Emergency Healing & Healthstone",
        category = "Burst & Consumables",
        desc = L["Use Healthstone and Healing Potion simultaneously with defensive CD"] or "Use Healthstone and Healing Potion simultaneously with defensive CD",
        code = "#showtooltip Healthstone\n/use Healthstone\n/use Invigorating Healing Potion\n/cast [combat] DEFENSIVE",
        tags = {"healing", "healthstone", "defensive", "emergency"},
    },

    -- General Utility
    {
        name = "Mouseover Smart Cast",
        category = "General Utility",
        desc = L["Cast on mouseover, fallback to target or player"],
        code = "#showtooltip\n/use [@mouseover,help,nodead][@target,help,nodead][@player] SPELL",
        tags = {"mouseover", "targeting", "heal", "smart"},
    },
    {
        name = "Harm / Help Dual Cast",
        category = "General Utility",
        desc = L["Cast heal on friendly mouseover or damage on enemy"],
        code = "#showtooltip\n/use [@mouseover,help,nodead][help] HELP_SPELL; [@mouseover,harm,nodead][harm] HARM_SPELL; HELP_SPELL",
        tags = {"harm", "help", "dual", "mouseover"},
    },
    {
        name = "Cursor Ground Target",
        category = "General Utility",
        desc = L["Instant cast ground targeting spell at cursor location"],
        code = "#showtooltip\n/use [@cursor] SPELL",
        tags = {"cursor", "ground", "aoe"},
    },
    {
        name = "Player Ground Drop",
        category = "General Utility",
        desc = L["Instant cast ground spell directly beneath player"],
        code = "#showtooltip\n/use [@player] SPELL",
        tags = {"player", "self", "ground"},
    },
    {
        name = "Focus Fallback",
        category = "General Utility",
        desc = L["Cast on focus, fallback to target"],
        code = "#showtooltip\n/use [@focus,exists,nodead][] SPELL",
        tags = {"focus", "targeting"},
    },
    {
        name = "Stopcasting Interrupt",
        category = "General Utility",
        desc = L["Immediately cancel current cast and interrupt target"],
        code = "#showtooltip INTERRUPT_SPELL\n/stopcasting\n/stopcasting\n/use [@focus,harm,nodead][] INTERRUPT_SPELL",
        tags = {"interrupt", "kick", "stopcasting"},
    },
    {
        name = "Auto-Attack Wrapper",
        category = "General Utility",
        desc = L["Ensure auto-attack starts on target switch"],
        code = "#showtooltip SPELL\n/startattack\n/use SPELL",
        tags = {"startattack", "melee", "dps"},
    },
    {
        name = "Warband & Banks Hub",
        category = "General Utility",
        desc = L["Smart router for Warband Bank, Inhibitor and Mobile Banking"],
        code = "#showtooltip\n/use [mod:shift] Mobile Banking(Guild Perk); [mod:ctrl] Warband Map to Everywhere All At Once; [mod:alt] Warband Bank Distance Inhibitor; Warband Bank",
        tags = {"warband", "bank", "utility", "account"},
    },
    {
        name = "Smart Mount (Skyriding/Steady)",
        category = "General Utility",
        desc = L["Mount based on flyable, swimming, or ground zone with dismount check"],
        code = "#showtooltip\n/dismount [mounted]\n/leavevehicle [vehicleui]\n/use [swimming] WATER_MOUNT; [flyable] FLYING_MOUNT; GROUND_MOUNT",
        tags = {"mount", "skyriding", "utility"},
    },
    {
        name = "Ultimate Survival Potion",
        category = "General Utility",
        desc = L["Healthstone first, then Healing Potion fallback"],
        code = "#showtooltip\n/use Healthstone\n/use Invigorating Healing Potion\n/use Potion of Devoured Dreams",
        tags = {"heal", "healthstone", "potion", "defense"},
    },
    {
        name = "Modifier Router (4 in 1)",
        category = "General Utility",
        desc = L["Different spell per modifier key (Shift, Ctrl, Alt, Nomod)"],
        code = "#showtooltip\n/use [mod:shift] SHIFT_ACTION; [mod:ctrl] CTRL_ACTION; [mod:alt] ALT_ACTION; DEFAULT_ACTION",
        tags = {"modifier", "router", "utility"},
    },
    {
        name = "Pet Attack / Return",
        category = "General Utility",
        desc = L["Toggle pet attack and follow with shift"],
        code = "/petattack [nomod,@mouseover,harm,nodead][nomod]\n/petfollow [mod:shift]",
        tags = {"pet", "attack", "follow"},
    },

    -- Healer
    {
        name = "Mouseover Heal / Harm",
        category = "Healer",
        desc = L["Heal mouseover if friendly, else harm target"],
        code = "#showtooltip\n/use [@mouseover,help,nodead][help] HEAL_SPELL; [@mouseover,harm,nodead][harm] DAMAGE_SPELL; HEAL_SPELL",
        tags = {"heal", "mouseover", "harmhelp"},
    },
    {
        name = "Dispel Priority (Mouseover > Target > Self)",
        category = "Healer",
        desc = L["Dispel priority chain with player fallback"],
        code = "#showtooltip\n/use [@mouseover,help,nodead][@target,help,nodead][@player] DISPEL_SPELL",
        tags = {"heal", "dispel", "cleanse"},
    },
    {
        name = "Emergency Heal + Burst Trinket",
        category = "Healer",
        desc = L["Fire on-use trinket with emergency cooldown"],
        code = "#showtooltip BIG_HEAL\n/use 13\n/use [@mouseover,help,nodead][@player] BIG_HEAL",
        tags = {"heal", "emergency", "trinket"},
    },
    {
        name = "Battle Res Mouseover",
        category = "Healer",
        desc = L["Battle Res dead mouseover or target"],
        code = "#showtooltip REZ_SPELL\n/use [@mouseover,help,dead][@target,help,dead] REZ_SPELL",
        tags = {"heal", "rez", "battleres"},
    },
    {
        name = "Eat & Drink Macro",
        category = "Healer",
        desc = L["Consume best food and drink out of combat"],
        code = "#showtooltip\n/use [nocombat] DRINK_ITEM\n/use [nocombat] FOOD_ITEM",
        tags = {"heal", "mana", "food", "utility"},
    },

    -- Tank
    {
        name = "Mouseover & Focus Taunt",
        category = "Tank",
        desc = L["Taunt mouseover, focus, or current target"],
        code = "#showtooltip TAUNT_SPELL\n/use [@mouseover,harm,nodead][@focus,harm,nodead][] TAUNT_SPELL",
        tags = {"tank", "taunt", "threat"},
    },
    {
        name = "Ground Tank Control (@Cursor / @Player)",
        category = "Tank",
        desc = L["Ground AoE under feet with shift, or cursor by default"],
        code = "#showtooltip GROUND_SPELL\n/use [mod:shift,@player][@cursor] GROUND_SPELL",
        tags = {"tank", "aoe", "ground"},
    },
    {
        name = "Panic Defense Wall",
        category = "Tank",
        desc = L["Major mitigation + Healthstone + Defensive trinket"],
        code = "#showtooltip DEFENSIVE_CD\n/use DEFENSIVE_CD\n/use Healthstone\n/use 13",
        tags = {"tank", "defensive", "cooldown"},
    },

    -- DPS
    {
        name = "All-in-One Burst Window",
        category = "DPS",
        desc = L["Pop potion, on-use trinkets, racial, and major cooldowns"],
        code = "#showtooltip MAJOR_CD\n/use 13\n/use 14\n/use Potion of Zealotry\n/use Blood Fury\n/use Berserking\n/use MAJOR_CD",
        tags = {"burst", "trinket", "cooldown", "dps"},
    },
    {
        name = "Trinket Slot 13",
        category = "DPS",
        desc = L["Activate upper on-use trinket slot"],
        code = "#showtooltip 13\n/use 13",
        tags = {"trinket", "use"},
    },
    {
        name = "Trinket Slot 14",
        category = "DPS",
        desc = L["Activate lower on-use trinket slot"],
        code = "#showtooltip 14\n/use 14",
        tags = {"trinket", "use"},
    },
    {
        name = "Assist Focus Target",
        category = "DPS",
        desc = L["Automatically acquire and attack the focus target's target"],
        code = "/assist [@focus,exists,nodead]\n/startattack",
        tags = {"assist", "target", "focus"},
    },

    -- PvP
    {
        name = "Arena 1-2-3 Router",
        category = "PvP",
        desc = L["Target or cast on Arena 1, 2, or 3 using Shift/Ctrl/Alt"],
        code = "#showtooltip CC_SPELL\n/use [mod:shift,@arena1][mod:ctrl,@arena2][mod:alt,@arena3][] CC_SPELL",
        tags = {"arena", "pvp", "modifier"},
    },
    {
        name = "Focus CC & Stopcast",
        category = "PvP",
        desc = L["Interrupt cast and crowd control focus target"],
        code = "#showtooltip CC_SPELL\n/stopcasting\n/stopcasting\n/use [@focus,harm,nodead][] CC_SPELL",
        tags = {"cc", "pvp", "focus", "stopcasting"},
    },
    {
        name = "Gladiator Trinket & Racial",
        category = "PvP",
        desc = L["PvP CC break trinket + racial combo"],
        code = "#showtooltip\n/use Gladiator's Medallion\n/use Every Man for Himself\n/use Will of the Forsaken",
        tags = {"pvp", "trinket", "break"},
    },
}

-- 3. Standard Template Categories
MM.TemplateCategories = {
    [L["General Utility"]] = {
        {name="Harm / Help Smart Router", desc=L["Heal friendly mouseover or damage enemy"], body="#showtooltip\n/use [@mouseover,help,nodead][help] HELP_SPELL; [@mouseover,harm,nodead][harm] HARM_SPELL; HELP_SPELL"},
        {name="Cursor Cast (Instant)", desc=L["Cast ground spell at mouse cursor"], body="#showtooltip\n/use [@cursor] SPELL"},
        {name="Player Cast (Under Self)", desc=L["Cast ground spell directly on yourself"], body="#showtooltip\n/use [@player] SPELL"},
        {name="Focus Kick & Interrupt", desc=L["Interrupt focus target without switching target"], body="#showtooltip INTERRUPT\n/stopcasting\n/use [@focus,harm,nodead][] INTERRUPT"},
        {name="Smart Mount & Dismount", desc=L["Dismount if flying, else call best mount"], body="#showtooltip\n/dismount [mounted]\n/leavevehicle [vehicleui]\n/use [swimming] WATER_MOUNT; [flyable] FLYING_MOUNT; GROUND_MOUNT"},
        {name="Warband & Personal Hub", desc=L["Access Warband bank, inhibitor and guild perks"], body="#showtooltip\n/use [mod:shift] Mobile Banking(Guild Perk); [mod:ctrl] Warband Map to Everywhere All At Once; [mod:alt] Warband Bank Distance Inhibitor; Warband Bank"},
        {name="Healthstone & Potion Safe", desc=L["Use Healthstone first, then best potion"], body="#showtooltip\n/use Healthstone\n/use Invigorating Healing Potion\n/use Potion of Devoured Dreams"},
        {name="Max Camera Distance", desc=L["Zoom camera out to maximum limit"], body="/console cameraDistanceMaxZoomFactor 2.6"},
        {name="Sell Grey Junk", desc=L["Sell all grey junk in inventory"], body="/run local C,G=C_Container,C_Item.GetItemInfo;for b=0,4 do for s=1,C.GetContainerNumSlots(b) do local l=C.GetContainerItemLink(b,s) if l and select(4,G(l))==0 then C.UseContainerItem(b,s) end end end"},
        {name="Reload UI", desc=L["Reload the user interface"], body="/reload"},
    },
    [L["Healer"]] = {
        {name="Mouseover Heal & Harm", desc=L["Heal friendly or attack enemy under mouse"], body="#showtooltip\n/use [@mouseover,help,nodead][help] HEAL_SPELL; [@mouseover,harm,nodead][harm] DAMAGE_SPELL; HEAL_SPELL"},
        {name="Dispel Mouseover & Self", desc=L["Dispel mouseover if friendly, else self"], body="#showtooltip\n/use [@mouseover,help,nodead][@player] DISPEL_SPELL"},
        {name="Battle Res Mouseover", desc=L["Cast Battle Res on dead mouseover target"], body="#showtooltip REZ_SPELL\n/use [@mouseover,help,dead][@target,help,dead] REZ_SPELL"},
        {name="Mass Resurrection", desc=L["Mass resurrect party out of combat"], body="#showtooltip Mass Resurrection\n/use [nocombat] Mass Resurrection"},
        {name="Emergency Burst Heal", desc=L["Use top trinket and major healing cooldown"], body="#showtooltip BIG_HEAL\n/use 13\n/use [@mouseover,help,nodead][@player] BIG_HEAL"},
        {name="Drink & Eat Safe", desc=L["Drink water and eat food out of combat"], body="#showtooltip\n/use [nocombat] DRINK_ITEM\n/use [nocombat] FOOD_ITEM"},
    },
    [L["Tank"]] = {
        {name="Mouseover & Focus Taunt", desc=L["Taunt mouseover or focus target"], body="#showtooltip TAUNT_SPELL\n/use [@mouseover,harm,nodead][@focus,harm,nodead][] TAUNT_SPELL"},
        {name="Ground AoE (@Player / @Cursor)", desc=L["Ground spell under self with shift, else cursor"], body="#showtooltip GROUND_SPELL\n/use [mod:shift,@player][@cursor] GROUND_SPELL"},
        {name="Defensive Panic Wall", desc=L["Pop defensive CD, Healthstone and Trinket"], body="#showtooltip DEFENSIVE_CD\n/use DEFENSIVE_CD\n/use Healthstone\n/use 13"},
        {name="Countdown Pull (10s)", desc=L["Start a 10-second pull timer in instance"], body="/countdown 10"},
    },
    [L["DPS"]] = {
        {name="Burst Cooldowns & Potions", desc=L["Activate all offensive CDs, racials and trinkets"], body="#showtooltip MAJOR_CD\n/use 13\n/use 14\n/use Potion of Zealotry\n/use Blood Fury\n/use Berserking\n/use MAJOR_CD"},
        {name="Auto-Attack Core Spell", desc=L["Start auto-attack upon casting core ability"], body="#showtooltip CORE_SPELL\n/startattack\n/use CORE_SPELL"},
        {name="Castsequence Burst Chain", desc=L["Execute spell chain with reset timer"], body="#showtooltip\n/castsequence reset=30 SPELL_1, SPELL_2, SPELL_3"},
        {name="Assist Focus", desc=L["Attack whatever the focus target is fighting"], body="/assist [@focus,exists,nodead]\n/startattack"},
    },
    [L["PvP"]] = {
        {name="Arena 1-2-3 Kick", desc=L["Interrupt Arena 1, 2, or 3 with Modifiers"], body="#showtooltip INTERRUPT\n/stopcasting\n/use [mod:shift,@arena1][mod:ctrl,@arena2][mod:alt,@arena3][] INTERRUPT"},
        {name="Focus CC & Stopcasting", desc=L["Instant CC on focus target"], body="#showtooltip CC_SPELL\n/stopcasting\n/use [@focus,harm,nodead][] CC_SPELL"},
        {name="Nameplate Mouseover CC", desc=L["CC mouseover nameplate or target"], body="#showtooltip CC_SPELL\n/use [@mouseover,harm,nodead][] CC_SPELL"},
        {name="Gladiator CC Break", desc=L["Use PvP trinket and racial stun breaker"], body="#showtooltip\n/use Gladiator's Medallion\n/use Every Man for Himself\n/use Will of the Forsaken"},
    },
    [L["Commands"]] = {
        {name="Reload UI", desc=L["Reload user interface"], body="/reload"},
        {name="Frame Stack", desc=L["Toggle UI Frame Stack Inspector"], body="/fstack"},
        {name="Event Trace", desc=L["Toggle WoW Event Trace Window"], body="/eventtrace"},
        {name="Lua Errors On", desc=L["Enable Lua Error dialogs"], body="/console scriptErrors 1"},
        {name="Lua Errors Off", desc=L["Disable Lua Error dialogs"], body="/console scriptErrors 0"},
        {name="CVar Default Reset", desc=L["Reset all CVars to game defaults"], body="/console cvar_default"},
    },
}

-- 4. Class Templates (WoW 12.1.0 Midnight)
MM.ClassTemplates = {
    ["ROGUE"] = {
        {name="Stealth / Bar Opener", desc=L["Pick Pocket and Cheap Shot in Stealth, else attack"], body="#showtooltip\n/use [stealth] Pick Pocket\n/use [stealth] Cheap Shot; Sinister Strike"},
        {name="Shadowstep Focus Kick", desc=L["Shadowstep and Kick focus target"], body="#showtooltip Kick\n/stopcasting\n/use [@focus,harm,nodead][@mouseover,harm,nodead][] Shadowstep\n/use [@focus,harm,nodead][@mouseover,harm,nodead][] Kick"},
        {name="Blind Mouseover & Focus", desc=L["Blind mouseover or focus target"], body="#showtooltip Blind\n/use [@mouseover,harm,nodead][@focus,harm,nodead][] Blind"},
        {name="Sap Mouseover", desc=L["Sap enemy mouseover without deselecting target"], body="#showtooltip Sap\n/use [@mouseover,harm,nodead][] Sap"},
        {name="Tricks on Focus / Target of Target", desc=L["Tricks of the Trade on tank or target's target"], body="#showtooltip Tricks of the Trade\n/use [@focus,help,nodead][@targettarget,help,nodead] Tricks of the Trade"},
        {name="Grappling Hook / Distract Cursor", desc=L["Ground target at cursor location"], body="#showtooltip Grappling Hook\n/use [@cursor] Grappling Hook"},
        {name="Vanish Instant Stopattack", desc=L["Stop auto-attacking and Vanish cleanly"], body="#showtooltip Vanish\n/stopattack\n/use Vanish"},
        {name="Shadow Dance / Burst Cooldowns", desc=L["Pop Shadow Dance, Symbols, and Trinkets"], body="#showtooltip Shadow Dance\n/use 13\n/use Symbols of Death\n/use Shadow Dance"},
    },
    ["WARRIOR"] = {
        {name="Heroic Leap Cursor", desc=L["Leap to cursor location instantly"], body="#showtooltip Heroic Leap\n/use [@cursor] Heroic Leap"},
        {name="Charge & Hamstring", desc=L["Charge and slow target"], body="#showtooltip Charge\n/use Charge\n/use Hamstring"},
        {name="Pummel Focus Stopcast", desc=L["Interrupt focus target immediately"], body="#showtooltip Pummel\n/stopcasting\n/use [@focus,harm,nodead][] Pummel"},
        {name="Intervene Mouseover", desc=L["Intervene friendly mouseover or focus"], body="#showtooltip Intervene\n/use [@mouseover,help,nodead][@focus,help,nodead][] Intervene"},
        {name="Shield Slam & Startattack", desc=L["Startattack coupled with primary ability"], body="#showtooltip Shield Slam\n/startattack\n/use Shield Slam"},
        {name="Avatar / Recklessness Burst", desc=L["Activate Avatar, Recklessness and Trinkets"], body="#showtooltip Avatar\n/use 13\n/use 14\n/use Blood Fury\n/use Avatar"},
        {name="Ravager / Spear Cursor", desc=L["Place Ravager or Spear at cursor"], body="#showtooltip Ravager\n/use [@cursor] Ravager"},
        {name="Taunt Focus", desc=L["Taunt focus target"], body="#showtooltip Taunt\n/use [@focus,harm,nodead][] Taunt"},
    },
    ["PALADIN"] = {
        {name="Bubble Cancel & Use", desc=L["Cast Divine Shield or cancel on second press"], body="#showtooltip Divine Shield\n/cancelaura Divine Shield\n/use Divine Shield"},
        {name="Blessing of Protection Mouseover", desc=L["BoP on friendly mouseover or cancel with mod"], body="#showtooltip Blessing of Protection\n/cancelaura [mod:shift] Blessing of Protection\n/use [@mouseover,help,nodead][] Blessing of Protection"},
        {name="Blessing of Freedom Mouseover", desc=L["Freedom on friendly mouseover"], body="#showtooltip Blessing of Freedom\n/use [@mouseover,help,nodead][] Blessing of Freedom"},
        {name="Intercession (Battle Rez)", desc=L["Battle rez mouseover or dead target"], body="#showtooltip Intercession\n/use [@mouseover,help,dead][@target,help,dead] Intercession"},
        {name="Lay on Hands Emergency", desc=L["Instant Lay on Hands on mouseover or player"], body="#showtooltip Lay on Hands\n/use [@mouseover,help,nodead][@player] Lay on Hands"},
        {name="Harm/Help (Judgment / Word of Glory)", desc=L["Damage enemy with Judgment or heal ally with WoG"], body="#showtooltip\n/use [@mouseover,help,nodead][help] Word of Glory; [@mouseover,harm,nodead][harm] Judgment; Word of Glory"},
        {name="Final Reckoning / Toll Cursor", desc=L["Ground reticle at cursor location"], body="#showtooltip Final Reckoning\n/use [@cursor] Final Reckoning"},
        {name="Rebuke Focus", desc=L["Interrupt focus target"], body="#showtooltip Rebuke\n/stopcasting\n/use [@focus,harm,nodead][] Rebuke"},
    },
    ["MAGE"] = {
        {name="Ice Block Cancel & Use", desc=L["Use Ice Block or cancel on second press"], body="#showtooltip Ice Block\n/cancelaura Ice Block\n/use Ice Block"},
        {name="Counterspell Focus Stopcast", desc=L["Cancel current cast and interrupt focus"], body="#showtooltip Counterspell\n/stopcasting\n/stopcasting\n/use [@focus,harm,nodead][] Counterspell"},
        {name="Blizzard / Ring of Frost Cursor", desc=L["Place Blizzard or Ring at cursor"], body="#showtooltip Blizzard\n/use [@cursor] Blizzard"},
        {name="Arcane Surge / Combustion Burst", desc=L["Pop offensive cooldowns and Trinkets"], body="#showtooltip Arcane Surge\n/use 13\n/use Arcane Surge\n/use Touch of the Magi"},
        {name="Remove Curse Mouseover", desc=L["Decurse friendly mouseover or self"], body="#showtooltip Remove Curse\n/use [@mouseover,help,nodead][@player] Remove Curse"},
        {name="Polymorph Focus", desc=L["Polymorph focus target"], body="#showtooltip Polymorph\n/use [@focus,harm,nodead][] Polymorph"},
        {name="Slow Fall Mouseover", desc=L["Slow Fall mouseover ally or self"], body="#showtooltip Slow Fall\n/use [@mouseover,help,nodead][@player] Slow Fall"},
        {name="Spellsteal Mouseover", desc=L["Steal buff from mouseover or target"], body="#showtooltip Spellsteal\n/use [@mouseover,harm,nodead][] Spellsteal"},
    },
    ["HUNTER"] = {
        {name="Smart Misdirection", desc=L["Misdirect to focus (Tank), else pet, else assist"], body="#showtooltip Misdirection\n/use [@focus,help,nodead][@pet,exists,nodead][@targettarget,help,nodead] Misdirection"},
        {name="Feign Death & Play Dead", desc=L["Simultaneous player and pet Feign Death"], body="#showtooltip Feign Death\n/use Play Dead\n/use Feign Death"},
        {name="Tar & Freezing Trap Cursor", desc=L["Deploy trap at cursor location"], body="#showtooltip Freezing Trap\n/use [@cursor] Freezing Trap"},
        {name="Counter Shot Focus", desc=L["Interrupt focus target"], body="#showtooltip Counter Shot\n/stopcasting\n/use [@focus,harm,nodead][] Counter Shot"},
        {name="Aspect of the Turtle Cancel", desc=L["Use Turtle or cancel on second press"], body="#showtooltip Aspect of the Turtle\n/cancelaura Aspect of the Turtle\n/use Aspect of the Turtle"},
        {name="Kill Command & Pet Attack", desc=L["Send pet and cast Kill Command"], body="#showtooltip Kill Command\n/petattack\n/use Kill Command"},
        {name="Master's Call Mouseover", desc=L["Freedom pet ability on mouseover or self"], body="#showtooltip Master's Call\n/use [@mouseover,help,nodead][@player] Master's Call"},
    },
    ["DRUID"] = {
        {name="Smart Travel Form", desc=L["Aquatic in water, Flight in air, Travel on ground"], body="#showtooltip Travel Form\n/use [swimming] Aquatic Form; [flyable,nocombat] Flight Form; Travel Form"},
        {name="Rebirth (Battle Rez) Mouseover", desc=L["Battle rez dead mouseover or target"], body="#showtooltip Rebirth\n/use [@mouseover,help,dead][@target,help,dead] Rebirth"},
        {name="Innervate Mouseover", desc=L["Innervate healer mouseover or target"], body="#showtooltip Innervate\n/use [@mouseover,help,nodead][] Innervate"},
        {name="Harm/Help (Wrath / Regrowth)", desc=L["Cast Regrowth on ally or Wrath on enemy"], body="#showtooltip\n/use [@mouseover,help,nodead][help] Regrowth; [@mouseover,harm,nodead][harm] Wrath; Regrowth"},
        {name="Efflorescence / Starfall Cursor", desc=L["Place ground spell at cursor"], body="#showtooltip Efflorescence\n/use [@cursor] Efflorescence"},
        {name="Skull Bash Focus", desc=L["Interrupt focus target"], body="#showtooltip Skull Bash\n/use [@focus,harm,nodead][] Skull Bash"},
        {name="Prowl (Clean Toggle)", desc=L["Stealth in Cat Form cleanly"], body="#showtooltip Prowl\n/cancelaura [stealth] Prowl\n/use [nostealth,nocombat] Prowl"},
        {name="Nature's Cure / Remove Corruption", desc=L["Dispel friendly mouseover or self"], body="#showtooltip Nature's Cure\n/use [@mouseover,help,nodead][@player] Nature's Cure"},
    },
    ["PRIEST"] = {
        {name="Power Infusion Whisper", desc=L["Cast PI on mouseover/focus and whisper them"], body="#showtooltip Power Infusion\n/use [@mouseover,help,nodead][@focus,help,nodead][] Power Infusion\n/run local u=UnitName(\"mouseover\") or UnitName(\"focus\") if u then SendChatMessage(\"Power Infusion on YOU!\",\"WHISPER\",nil,u) end"},
        {name="Mass Dispel & Barrier Cursor", desc=L["Place Mass Dispel or Barrier at cursor"], body="#showtooltip Mass Dispel\n/use [@cursor] Mass Dispel"},
        {name="Harm/Help (Smite / Flash Heal)", desc=L["Flash Heal ally or Smite enemy under mouse"], body="#showtooltip\n/use [@mouseover,help,nodead][help] Flash Heal; [@mouseover,harm,nodead][harm] Smite; Flash Heal"},
        {name="Leap of Faith Mouseover", desc=L["Pull friendly mouseover target"], body="#showtooltip Leap of Faith\n/use [@mouseover,help,nodead] Leap of Faith"},
        {name="Silence / Chastise Focus", desc=L["Interrupt or CC focus target"], body="#showtooltip Silence\n/stopcasting\n/use [@focus,harm,nodead][] Silence"},
        {name="Purify & Dispel Magic Dual", desc=L["Cleanse ally or purge enemy under mouse"], body="#showtooltip Purify\n/use [@mouseover,help,nodead] Purify; [@mouseover,harm,nodead] Dispel Magic; Purify"},
        {name="Guardian Spirit / Pain Supp Mouseover", desc=L["Major defensive on friendly mouseover"], body="#showtooltip Guardian Spirit\n/use [@mouseover,help,nodead][@player] Guardian Spirit"},
    },
    ["SHAMAN"] = {
        {name="Wind Shear Focus Stopcast", desc=L["Fastest interrupt on focus target"], body="#showtooltip Wind Shear\n/stopcasting\n/use [@focus,harm,nodead][] Wind Shear"},
        {name="Healing Rain / Earthquake Cursor", desc=L["Ground AoE at cursor location"], body="#showtooltip Healing Rain\n/use [@cursor] Healing Rain"},
        {name="Cleanse / Purge Dual", desc=L["Dispel friendly or purge enemy under mouse"], body="#showtooltip Cleanse Spirit\n/use [@mouseover,help,nodead] Cleanse Spirit; [@mouseover,harm,nodead] Purge; Cleanse Spirit"},
        {name="Totemic Projection Cursor", desc=L["Move active totems to cursor"], body="#showtooltip Totemic Projection\n/use [@cursor] Totemic Projection"},
        {name="Harm/Help (Lightning Bolt / Healing Surge)", desc=L["Heal ally or strike enemy on one button"], body="#showtooltip\n/use [@mouseover,help,nodead][help] Healing Surge; [@mouseover,harm,nodead][harm] Lightning Bolt; Healing Surge"},
        {name="Ascendance / Primordial Wave Burst", desc=L["Pop offensive cooldowns and Trinkets"], body="#showtooltip Ascendance\n/use 13\n/use Primordial Wave\n/use Ascendance"},
        {name="Hex Focus", desc=L["Hex focus target"], body="#showtooltip Hex\n/use [@focus,harm,nodead][] Hex"},
    },
    ["WARLOCK"] = {
        {name="Demonic Gateway Cursor", desc=L["Instant Gateway deployment at cursor"], body="#showtooltip Demonic Gateway\n/use [@cursor] Demonic Gateway"},
        {name="Soulstone Mouseover & Dead", desc=L["Battle rez or pre-buff soulstone on mouseover"], body="#showtooltip Soulstone\n/use [@mouseover,help,dead][@mouseover,help,nodead][] Soulstone"},
        {name="Soulburn + Demonic Circle Port", desc=L["Sprint port with Soulburn"], body="#showtooltip Demonic Circle: Teleport\n/use Soulburn\n/use Demonic Circle: Teleport"},
        {name="Havoc Focus", desc=L["Place Havoc on focus or mouseover"], body="#showtooltip Havoc\n/use [@focus,harm,nodead][@mouseover,harm,nodead][] Havoc"},
        {name="Command Demon (Spell Lock) Focus", desc=L["Pet interrupt on focus target"], body="#showtooltip Command Demon\n/stopcasting\n/use [@focus,harm,nodead][] Command Demon"},
        {name="Rain of Fire / Cataclysm Cursor", desc=L["Ground AoE at cursor location"], body="#showtooltip Rain of Fire\n/use [@cursor] Rain of Fire"},
        {name="Fear / Banish Focus", desc=L["CC focus target"], body="#showtooltip Fear\n/use [@focus,harm,nodead][] Fear"},
    },
    ["MONK"] = {
        {name="Transcendence Set & Swap", desc=L["Shift to port, normal press to set location"], body="#showtooltip Transcendence\n/use [mod:shift] Transcendence: Transfer; Transcendence"},
        {name="Ring of Peace Cursor", desc=L["Deploy Ring of Peace at cursor location"], body="#showtooltip Ring of Peace\n/use [@cursor] Ring of Peace"},
        {name="Spear Hand Strike Focus", desc=L["Interrupt focus target"], body="#showtooltip Spear Hand Strike\n/stopcasting\n/use [@focus,harm,nodead][] Spear Hand Strike"},
        {name="Tiger's Lust / Detox Mouseover", desc=L["Cleanse or sprint friendly mouseover"], body="#showtooltip Tiger's Lust\n/use [@mouseover,help,nodead][@player] Tiger's Lust"},
        {name="Harm/Help (Tiger Palm / Vivify)", desc=L["Vivify friendly or Tiger Palm enemy"], body="#showtooltip\n/use [@mouseover,help,nodead][help] Vivify; [@mouseover,harm,nodead][harm] Tiger Palm; Vivify"},
        {name="Summon Black Ox Statue Cursor", desc=L["Deploy Ox statue at cursor"], body="#showtooltip Summon Black Ox Statue\n/use [@cursor] Summon Black Ox Statue"},
        {name="Paralysis Focus", desc=L["Incapacitate focus target"], body="#showtooltip Paralysis\n/use [@focus,harm,nodead][] Paralysis"},
    },
    ["DEMONHUNTER"] = {
        {name="Sigil Suite (Cursor / Player)", desc=L["Deploy Sigils at cursor, or under self with shift"], body="#showtooltip Sigil of Silence\n/use [mod:shift,@player][@cursor] Sigil of Silence"},
        {name="Metamorphosis Cursor", desc=L["Instant Metamorphosis jump to cursor"], body="#showtooltip Metamorphosis\n/use [@cursor] Metamorphosis"},
        {name="Disrupt Focus Stopcast", desc=L["Interrupt focus target"], body="#showtooltip Disrupt\n/stopcasting\n/use [@focus,harm,nodead][] Disrupt"},
        {name="The Hunt / Burst Window", desc=L["The Hunt with on-use trinkets"], body="#showtooltip The Hunt\n/use 13\n/use The Hunt"},
        {name="Consume Magic Focus", desc=L["Purge magic buff from focus target"], body="#showtooltip Consume Magic\n/use [@focus,harm,nodead][] Consume Magic"},
        {name="Sigil of Misery / Chains Cursor", desc=L["Crowd control Sigil at cursor"], body="#showtooltip Sigil of Misery\n/use [@cursor] Sigil of Misery"},
    },
    ["DEATHKNIGHT"] = {
        {name="Death and Decay (Cursor / Player)", desc=L["Drop DnD at cursor, or under feet with shift"], body="#showtooltip Death and Decay\n/use [mod:shift,@player][@cursor] Death and Decay"},
        {name="Death Grip Focus & Mouseover", desc=L["Grip mouseover or focus target"], body="#showtooltip Death Grip\n/use [@mouseover,harm,nodead][@focus,harm,nodead][] Death Grip"},
        {name="Mind Freeze Focus", desc=L["Interrupt focus target immediately"], body="#showtooltip Mind Freeze\n/stopcasting\n/use [@focus,harm,nodead][] Mind Freeze"},
        {name="Raise Ally (Battle Rez)", desc=L["Battle rez dead mouseover or target"], body="#showtooltip Raise Ally\n/use [@mouseover,help,dead][@target,help,dead] Raise Ally"},
        {name="Anti-Magic Zone Cursor", desc=L["Deploy AMZ at cursor location"], body="#showtooltip Anti-Magic Zone\n/use [@cursor] Anti-Magic Zone"},
        {name="Lichborne Self-Heal", desc=L["Lichborne and cast Death Coil on self"], body="#showtooltip Lichborne\n/use Lichborne\n/use [@player] Death Coil"},
        {name="Asphyxiate Focus", desc=L["Stun focus target"], body="#showtooltip Asphyxiate\n/use [@focus,harm,nodead][] Asphyxiate"},
    },
    ["EVOKER"] = {
        {name="Rescue Cursor & Mouseover", desc=L["Fly ally to cursor destination"], body="#showtooltip Rescue\n/use [@cursor] Rescue"},
        {name="Quell Focus Stopcast", desc=L["Interrupt focus target"], body="#showtooltip Quell\n/stopcasting\n/use [@focus,harm,nodead][] Quell"},
        {name="Verdant Embrace Mouseover", desc=L["Fly to heal friendly mouseover or self"], body="#showtooltip Verdant Embrace\n/use [@mouseover,help,nodead][@player] Verdant Embrace"},
        {name="Deep Breath / Dream Flight Cursor", desc=L["Instant empowered breath at cursor"], body="#showtooltip Deep Breath\n/use [@cursor] Deep Breath"},
        {name="Cauterizing Flame / Naturalize Mouseover", desc=L["Dispel bleed, curse, poison on mouseover"], body="#showtooltip Cauterizing Flame\n/use [@mouseover,help,nodead][@player] Cauterizing Flame"},
        {name="Harm/Help (Living Flame)", desc=L["Heal friendly or damage enemy on one button"], body="#showtooltip Living Flame\n/use [@mouseover,help,nodead][help] Living Flame; [@mouseover,harm,nodead][harm] Living Flame; Living Flame"},
        {name="Time Spiral / Zephyr Safe", desc=L["Party movement speed and AoE defense"], body="#showtooltip Zephyr\n/use Zephyr\n/use Time Spiral"},
    },
}

-- 5. Spec Templates (WoW 12.1.5 Midnight - All 39 Specializations)
MM.SpecTemplates = {
    -- WARRIOR
    [71] = { -- Arms
        {name="Colossus Smash / Warbreaker", desc=L["Burst + Trinkets"], body="#showtooltip Colossus Smash\n/use 13\n/use Avatar\n/use Colossus Smash"},
        {name="Bladestorm & Cancel", desc=L["Bladestorm or cancel on press"], body="#showtooltip Bladestorm\n/cancelaura Bladestorm\n/use Bladestorm"},
    },
    [72] = { -- Fury
        {name="Recklessness Burst", desc=L["Recklessness + Avatar + Trinket"], body="#showtooltip Recklessness\n/use 13\n/use Avatar\n/use Recklessness"},
        {name="Enraged Regen Defense", desc=L["Enraged Regen + Healthstone"], body="#showtooltip Enraged Regeneration\n/use Enraged Regeneration\n/use Healthstone"},
    },
    [73] = { -- Protection
        {name="Shield Wall Panic", desc=L["Shield Wall + Last Stand + Healthstone"], body="#showtooltip Shield Wall\n/use Shield Wall\n/use Last Stand\n/use Healthstone"},
        {name="Ravager Cursor", desc=L["Drop Ravager at cursor"], body="#showtooltip Ravager\n/use [@cursor] Ravager"},
        {name="Spell Block & Demoralizing Shout", desc=L["12.1.5 Protection Magic Defense + Demo Shout"], body="#showtooltip Spell Block\n/use Spell Block\n/use Demoralizing Shout"},
    },

    -- PALADIN
    [65] = { -- Holy
        {name="Beacon of Light Mouseover", desc=L["Beacon friendly mouseover"], body="#showtooltip Beacon of Light\n/use [@mouseover,help,nodead][] Beacon of Light"},
        {name="Avenging Wrath Healer Burst", desc=L["Avenging Wrath + Trinket"], body="#showtooltip Avenging Wrath\n/use 13\n/use Avenging Wrath"},
    },
    [66] = { -- Protection
        {name="Divine Toll Cursor", desc=L["Divine Toll at cursor"], body="#showtooltip Divine Toll\n/use [@cursor] Divine Toll"},
        {name="Ardent Defender Emergency", desc=L["Ardent Defender + Healthstone"], body="#showtooltip Ardent Defender\n/use Ardent Defender\n/use Healthstone"},
    },
    [70] = { -- Retribution
        {name="Execution Sentence Burst", desc=L["Execution Sentence + Avenging Wrath + Trinket"], body="#showtooltip Execution Sentence\n/use 13\n/use Avenging Wrath\n/use Execution Sentence"},
        {name="Wake of Ashes Core", desc=L["Wake of Ashes + Startattack"], body="#showtooltip Wake of Ashes\n/startattack\n/use Wake of Ashes"},
    },

    -- HUNTER
    [253] = { -- Beast Mastery
        {name="Bestial Wrath & Call of the Wild", desc=L["Burst + Trinkets"], body="#showtooltip Bestial Wrath\n/use 13\n/use Call of the Wild\n/use Bestial Wrath\n/petattack"},
    },
    [254] = { -- Marksmanship
        {name="Trueshot Burst", desc=L["Trueshot + Trinket + Racial"], body="#showtooltip Trueshot\n/use 13\n/use Blood Fury\n/use Trueshot"},
        {name="Volley & Explosive Shot Cursor", desc=L["12.1.5 Marksmanship AoE Cursor Volley"], body="#showtooltip Volley\n/use [@cursor] Volley\n/use Explosive Shot"},
    },
    [255] = { -- Survival
        {name="Coordinated Assault Burst", desc=L["Coordinated Assault + Trinket"], body="#showtooltip Coordinated Assault\n/use 13\n/use Coordinated Assault\n/petattack"},
    },

    -- ROGUE
    [259] = { -- Assassination
        {name="Deathmark Burst", desc=L["Deathmark + Kingsbane + Trinket"], body="#showtooltip Deathmark\n/use 13\n/use Deathmark\n/use Kingsbane"},
    },
    [260] = { -- Outlaw
        {name="Adrenaline Rush Burst", desc=L["Adrenaline Rush + Blade Flurry + Trinket"], body="#showtooltip Adrenaline Rush\n/use 13\n/use Blade Flurry\n/use Adrenaline Rush"},
    },
    [261] = { -- Subtlety
        {name="Secret Technique Burst", desc=L["Shadow Dance + Symbols + Secret Tech"], body="#showtooltip Secret Technique\n/use Symbols of Death\n/use Shadow Dance\n/use Secret Technique"},
    },

    -- PRIEST
    [256] = { -- Discipline
        {name="Power Word: Barrier Cursor", desc=L["Barrier at cursor"], body="#showtooltip Power Word: Barrier\n/use [@cursor] Power Word: Barrier"},
        {name="Evangelism Burst", desc=L["Evangelism + Trinket"], body="#showtooltip Evangelism\n/use 13\n/use Evangelism"},
    },
    [257] = { -- Holy
        {name="Holy Word: Salvation Cursor", desc=L["Salvation at cursor"], body="#showtooltip Holy Word: Salvation\n/use [@cursor] Holy Word: Salvation"},
        {name="Apotheosis Burst", desc=L["Apotheosis + Trinket"], body="#showtooltip Apotheosis\n/use 13\n/use Apotheosis"},
    },
    [258] = { -- Shadow
        {name="Void Eruption / Dark Ascension", desc=L["Burst + Trinkets"], body="#showtooltip Void Eruption\n/use 13\n/use Power Infusion\n/use Void Eruption"},
        {name="Shadow Crash Cursor", desc=L["Crash at cursor"], body="#showtooltip Shadow Crash\n/use [@cursor] Shadow Crash"},
    },

    -- DEATH KNIGHT
    [250] = { -- Blood
        {name="Vampiric Blood Emergency", desc=L["Vamp Blood + Healthstone"], body="#showtooltip Vampiric Blood\n/use Vampiric Blood\n/use Healthstone"},
        {name="Abomination Limb Core", desc=L["Grip + AoE"], body="#showtooltip Abomination Limb\n/use 13\n/use Abomination Limb"},
    },
    [251] = { -- Frost
        {name="Pillar of Frost Burst", desc=L["Pillar + Empower Rune Weapon + Trinket"], body="#showtooltip Pillar of Frost\n/use 13\n/use Empower Rune Weapon\n/use Pillar of Frost"},
    },
    [252] = { -- Unholy
        {name="Unholy Assault / Apocalypse", desc=L["Army + Apocalypse + Trinket"], body="#showtooltip Apocalypse\n/use 13\n/use Dark Transformation\n/use Apocalypse"},
    },

    -- SHAMAN
    [262] = { -- Elemental
        {name="Stormkeeper Burst", desc=L["Stormkeeper + Primordial Wave + Trinket"], body="#showtooltip Stormkeeper\n/use 13\n/use Primordial Wave\n/use Stormkeeper"},
    },
    [263] = { -- Enhancement
        {name="Feral Spirit Burst", desc=L["Feral Spirit + Ascendance + Trinket"], body="#showtooltip Feral Spirit\n/use 13\n/use Ascendance\n/use Feral Spirit"},
    },
    [264] = { -- Restoration
        {name="Spirit Link Totem Cursor", desc=L["Drop Spirit Link at cursor"], body="#showtooltip Spirit Link Totem\n/use [@cursor] Spirit Link Totem"},
    },

    -- MAGE
    [62] = { -- Arcane
        {name="Arcane Surge Burst", desc=L["Arcane Surge + Touch of the Magi + Trinket"], body="#showtooltip Arcane Surge\n/use 13\n/use Touch of the Magi\n/use Arcane Surge"},
    },
    [63] = { -- Fire
        {name="Combustion One-Shot", desc=L["Combustion + Firestarter + Trinket"], body="#showtooltip Combustion\n/use 13\n/use Combustion"},
    },
    [64] = { -- Frost
        {name="Icy Veins Burst", desc=L["Icy Veins + Comet Storm + Trinket"], body="#showtooltip Icy Veins\n/use 13\n/use Comet Storm\n/use Icy Veins"},
    },

    -- WARLOCK
    [265] = { -- Affliction
        {name="Soul Rot / Darkglare Burst", desc=L["Soul Rot + Darkglare + Trinket"], body="#showtooltip Darkglare\n/use 13\n/use Soul Rot\n/use Summon Darkglare"},
    },
    [266] = { -- Demonology
        {name="Nether Portal / Tyrant Burst", desc=L["Summon Demonic Tyrant + Trinket"], body="#showtooltip Summon Demonic Tyrant\n/use 13\n/use Summon Demonic Tyrant\n/petattack"},
    },
    [267] = { -- Destruction
        {name="Summon Infernal Burst", desc=L["Infernal at cursor + Trinket"], body="#showtooltip Summon Infernal\n/use 13\n/use [@cursor] Summon Infernal"},
    },

    -- MONK
    [268] = { -- Brewmaster
        {name="Weapons of Order Burst", desc=L["Weapons of Order + Trinket"], body="#showtooltip Weapons of Order\n/use 13\n/use Weapons of Order"},
    },
    [269] = { -- Windwalker
        {name="Touch of Death Priority", desc=L["Instant execute with Touch of Death"], body="#showtooltip Touch of Death\n/use [@mouseover,harm,nodead][] Touch of Death"},
    },
    [270] = { -- Mistweaver
        {name="Revival Emergency", desc=L["Mass dispel and instant heal Revival"], body="#showtooltip Revival\n/use 13\n/use Revival"},
    },

    -- DRUID
    [102] = { -- Balance
        {name="Incarnation: Chosen of Elune", desc=L["Incarnation + Fury of Elune + Trinket"], body="#showtooltip Incarnation: Chosen of Elune\n/use 13\n/use Incarnation: Chosen of Elune"},
    },
    [103] = { -- Feral
        {name="Berserk / Tiger's Fury", desc=L["Tiger's Fury + Berserk + Trinket"], body="#showtooltip Berserk\n/use 13\n/use Tiger's Fury\n/use Berserk"},
    },
    [104] = { -- Guardian
        {name="Incarnation: Guardian of Ursoc", desc=L["Invincible Bear Mode"], body="#showtooltip Incarnation: Guardian of Ursoc\n/use 13\n/use Incarnation: Guardian of Ursoc"},
    },
    [105] = { -- Restoration
        {name="Flourish Burst", desc=L["Flourish + Convoke + Trinket"], body="#showtooltip Flourish\n/use 13\n/use Flourish"},
    },

    -- DEMON HUNTER
    [577] = { -- Havoc
        {name="Essence Break Combo", desc=L["Essence Break + Death Sweep"], body="#showtooltip Essence Break\n/use 13\n/use Essence Break\n/use Death Sweep"},
    },
    [581] = { -- Vengeance
        {name="Fiery Brand Emergency", desc=L["Fiery Brand + Demon Spikes"], body="#showtooltip Fiery Brand\n/use Fiery Brand\n/use Demon Spikes"},
    },

    -- EVOKER
    [1467] = { -- Devastation
        {name="Dragonrage Burst", desc=L["Dragonrage + Tip the Scales + Trinket"], body="#showtooltip Dragonrage\n/use 13\n/use Tip the Scales\n/use Dragonrage"},
    },
    [1468] = { -- Preservation
        {name="Rewind Emergency", desc=L["Rewind mass raid health recovery"], body="#showtooltip Rewind\n/use 13\n/use Rewind"},
    },
    [1473] = { -- Augmentation
        {name="Breath of Eons Cursor", desc=L["Breath of Eons at cursor location"], body="#showtooltip Breath of Eons\n/use [@cursor] Breath of Eons"},
        {name="Ebon Might Priority", desc=L["Ebon Might buff on primary target/focus"], body="#showtooltip Ebon Might\n/use [@focus,help,nodead][@target,help,nodead][@player] Ebon Might"},
    },
}
