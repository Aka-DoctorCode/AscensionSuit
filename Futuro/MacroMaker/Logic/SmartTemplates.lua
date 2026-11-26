--[[
    SmartTemplates.lua
    Macro Maker - Smart Macro Template Generator
    Target: World of Warcraft Retail 12.1 (Midnight)
]]

local AddOnName, MM = ...

MM.SmartTemplates = MM.SmartTemplates or {}
local ST = MM.SmartTemplates

--- Generates a resilient Mouseover macro
function ST:GenerateMouseoverMacro(spellName, isHelpful)
    local cleanName = (spellName or ""):trim()
    if cleanName == "" then return "" end

    if isHelpful then
        return string.format([[#showtooltip %s
/cast [@mouseover,help,nodead][help,nodead][@player] %s]], cleanName, cleanName)
    else
        return string.format([[#showtooltip %s
/cast [@mouseover,harm,nodead][harm,nodead][] %s]], cleanName, cleanName)
    end
end

--- Generates an instant reticle / @cursor macro (e.g., Heroic Leap, Blizzard, Sigil)
function ST:GenerateCursorMacro(spellName)
    local cleanName = (spellName or ""):trim()
    if cleanName == "" then return "" end

    return string.format([[#showtooltip %s
/cast [@cursor] %s]], cleanName, cleanName)
end

--- Generates an interrupt / CC focus macro with regular target fallback
function ST:GenerateFocusMacro(spellName)
    local cleanName = (spellName or ""):trim()
    if cleanName == "" then return "" end

    return string.format([[#showtooltip %s
/cast [@focus,harm,nodead][] %s]], cleanName, cleanName)
end

--- Generates a dynamic macro switching between Hero Talent abilities using [known:ID]
function ST:GenerateHeroTalentMacro(spell1, spell1ID, spell2)
    local s1 = (spell1 or ""):trim()
    local s2 = (spell2 or ""):trim()
    local id = tonumber(spell1ID)

    if id and id > 0 and s2 ~= "" then
        return string.format([[#showtooltip
/cast [known:%d] %s; %s]], id, s1, s2)
    elseif s1 ~= "" and s2 ~= "" then
        return string.format([[#showtooltip
/cast %s
/cast %s]], s1, s2)
    end
    return string.format("#showtooltip %s\n/cast %s", s1, s1)
end

--- Generates a full Spec Starter Kit with essential macros for current player class
function ST:GenerateSpecStarterKit()
    local _, classFilename = UnitClass("player")
    local classKits = {
        WARRIOR = {
            { name = "Focus Pummel", body = "#showtooltip Pummel\n/cast [@focus,harm,nodead][] Pummel" },
            { name = "Cursor Leap", body = "#showtooltip Heroic Leap\n/cast [@cursor] Heroic Leap" },
            { name = "Burst Avatar", body = "#showtooltip Avatar\n/use 13\n/use 14\n/cast Avatar" },
        },
        PALADIN = {
            { name = "Focus Rebuke", body = "#showtooltip Rebuke\n/cast [@focus,harm,nodead][] Rebuke" },
            { name = "Mouseover Heal", body = "#showtooltip Flash of Light\n/cast [@mouseover,help,nodead][help,nodead][@player] Flash of Light" },
            { name = "Wings Burst", body = "#showtooltip Avenging Wrath\n/use 13\n/use 14\n/cast Avenging Wrath" },
        },
        HUNTER = {
            { name = "Focus Counter", body = "#showtooltip Counter Shot\n/cast [@focus,harm,nodead][] Counter Shot" },
            { name = "Focus Misdirect", body = "#showtooltip Misdirection\n/cast [@focus,help,nodead][@pet,exists][] Misdirection" },
            { name = "Cursor Trap", body = "#showtooltip Freezing Trap\n/cast [@cursor] Freezing Trap" },
        },
        ROGUE = {
            { name = "Focus Kick", body = "#showtooltip Kick\n/cast [@focus,harm,nodead][] Kick" },
            { name = "Focus Tricks", body = "#showtooltip Tricks of the Trade\n/cast [@focus,help,nodead][] Tricks of the Trade" },
            { name = "Burst Shadow", body = "#showtooltip Shadow Dance\n/use 13\n/use 14\n/cast Shadow Dance" },
        },
        PRIEST = {
            { name = "Mouseover Heal", body = "#showtooltip Flash Heal\n/cast [@mouseover,help,nodead][help,nodead][@player] Flash Heal" },
            { name = "Focus Silence", body = "#showtooltip Silence\n/cast [@focus,harm,nodead][] Silence" },
            { name = "Cursor MassDispel", body = "#showtooltip Mass Dispel\n/cast [@cursor] Mass Dispel" },
        },
        DEATHKNIGHT = {
            { name = "Focus Freeze", body = "#showtooltip Mind Freeze\n/cast [@focus,harm,nodead][] Mind Freeze" },
            { name = "Cursor DnD", body = "#showtooltip Death and Decay\n/cast [@cursor] Death and Decay" },
            { name = "Focus Grip", body = "#showtooltip Death Grip\n/cast [@focus,harm,nodead][] Death Grip" },
        },
        SHAMAN = {
            { name = "Focus WindShear", body = "#showtooltip Wind Shear\n/cast [@focus,harm,nodead][] Wind Shear" },
            { name = "Mouseover Surge", body = "#showtooltip Healing Surge\n/cast [@mouseover,help,nodead][help,nodead][@player] Healing Surge" },
            { name = "Cursor Totem", body = "#showtooltip Totemic Projection\n/cast [@cursor] Totemic Projection" },
        },
        MAGE = {
            { name = "Focus Counter", body = "#showtooltip Counterspell\n/cast [@focus,harm,nodead][] Counterspell" },
            { name = "Cursor Blizzard", body = "#showtooltip Blizzard\n/cast [@cursor] Blizzard" },
            { name = "Burst Power", body = "#showtooltip Icy Veins\n/use 13\n/use 14\n/cast Icy Veins" },
        },
        WARLOCK = {
            { name = "Focus Kick", body = "#showtooltip Command Demon\n/cast [@focus,harm,nodead][] Command Demon" },
            { name = "Mouseover Stone", body = "#showtooltip Soulstone\n/cast [@mouseover,help,nodead][help,nodead][@player] Soulstone" },
            { name = "Cursor Infernal", body = "#showtooltip Summon Infernal\n/cast [@cursor] Summon Infernal" },
        },
        MONK = {
            { name = "Focus Strike", body = "#showtooltip Spear Hand Strike\n/cast [@focus,harm,nodead][] Spear Hand Strike" },
            { name = "Mouseover Vivify", body = "#showtooltip Vivify\n/cast [@mouseover,help,nodead][help,nodead][@player] Vivify" },
            { name = "Cursor Ring", body = "#showtooltip Ring of Peace\n/cast [@cursor] Ring of Peace" },
        },
        DRUID = {
            { name = "Focus Bash", body = "#showtooltip Skull Bash\n/cast [@focus,harm,nodead][] Skull Bash" },
            { name = "Mouseover Rejuv", body = "#showtooltip Rejuvenation\n/cast [@mouseover,help,nodead][help,nodead][@player] Rejuvenation" },
            { name = "Cursor Vortex", body = "#showtooltip Ursol's Vortex\n/cast [@cursor] Ursol's Vortex" },
        },
        DEMONHUNTER = {
            { name = "Focus Disrupt", body = "#showtooltip Disrupt\n/cast [@focus,harm,nodead][] Disrupt" },
            { name = "Cursor Sigil", body = "#showtooltip Sigil of Flame\n/cast [@cursor] Sigil of Flame" },
            { name = "Meta Burst", body = "#showtooltip Metamorphosis\n/use 13\n/use 14\n/cast Metamorphosis" },
        },
        EVOKER = {
            { name = "Focus Quell", body = "#showtooltip Quell\n/cast [@focus,harm,nodead][] Quell" },
            { name = "Mouseover Reversion", body = "#showtooltip Reversion\n/cast [@mouseover,help,nodead][help,nodead][@player] Reversion" },
            { name = "Cursor Breath", body = "#showtooltip Deep Breath\n/cast [@cursor] Deep Breath" },
        },
    }
    return classKits[classFilename] or classKits["WARRIOR"]
end

