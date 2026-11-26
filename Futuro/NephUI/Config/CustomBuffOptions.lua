local ADDON_NAME, ns = ...
local NephUI = ns.Addon

local function CreateCustomBuffOptions()
    return {
        type = "group",
        name = "Custom Buffs",
        order = 9,
        args = {
            header = {
                type = "header",
                name = "Custom Buffs",
                order = 1,
            },
            description = {
                type = "description",
                name = "Track spell casts. Add a spell ID to watch, choose an icon or leave blank, set a duration, and place buffs in groups. When you cast the spell, the icon appears with a cooldown timer.",
                order = 2,
            },
            customBuffsUI = {
                type = "customBuffs",
                name = "Custom Buffs",
                order = 3,
            },
        },
    }
end

ns.CreateCustomBuffOptions = CreateCustomBuffOptions
