--------------------------------------------------------------------------------
-- Macro Maker - Validator Module
-- Version: 1.0
-- Author: Satyros
--
-- Description:
--   Validates macro syntax, primarily checking for balanced brackets and 
--   identifying unknown condition keywords.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

MM.Validator = {}

-- Known Conditionals (Whitelist)
-- Source: WoW Wiki / Macro Conditionals
local KNOWN_CONDITIONALS = {
    ["help"]=true, ["harm"]=true, ["dead"]=true, ["nodead"]=true,
    ["combat"]=true, ["nocombat"]=true, ["stealth"]=true, ["nostealth"]=true,
    ["mounted"]=true, ["nomounted"]=true, ["swimming"]=true, ["noswimming"]=true,
    ["flying"]=true, ["noflying"]=true, ["flyable"]=true,
    ["indoors"]=true, ["outdoors"]=true, ["channeling"]=true, ["nochanneling"]=true,
    ["exists"]=true, ["noexists"]=true,
    ["party"]=true, ["raid"]=true, ["group"]=true, ["pet"]=true, ["nopet"]=true,
    ["mod"]=true, ["modifier"]=true, ["btn"]=true, ["button"]=true,
    ["equipped"]=true, ["worn"]=true, ["spec"]=true, ["form"]=true, ["stance"]=true,
    ["actionbar"]=true, ["cursor"]=true, ["mouseover"]=true, ["player"]=true, 
    ["target"]=true, ["focus"]=true, ["targettarget"]=true, 
    ["boss1"]=true, ["boss2"]=true, ["boss3"]=true, ["boss4"]=true,
    ["arena1"]=true, ["arena2"]=true, ["arena3"]=true, ["arena4"]=true, ["arena5"]=true,
    ["vehicleui"]=true, ["unithasvehicleui"]=true, ["pvpcombat"]=true,
    ["canexitvehicle"]=true, ["advflyable"]=true, -- Dragonriding
}

-- Conditionals that take arguments (e.g., [mod:shift])
local ARG_CONDITIONALS = {
    ["mod"]=true, ["modifier"]=true, ["btn"]=true, ["button"]=true,
    ["equipped"]=true, ["worn"]=true, ["spec"]=true, ["form"]=true, ["stance"]=true,
    ["actionbar"]=true, ["channeling"]=true, ["group"]=true, ["pet"]=true,
}

-- Comprehensive list of spells and items that do not trigger the Global Cooldown (Off-GCD)
MM.Validator.OFF_GCD_SPELLS = {
    -- Slot IDs
    ["13"] = true, ["14"] = true, ["6"] = true,
    -- Interrupts (All 13 Classes)
    [6552] = true,   ["pummel"] = true, ["zuschlagen"] = true,
    [2139] = true,   ["counterspell"] = true, ["gegenzauber"] = true,
    [1766] = true,   ["kick"] = true, ["tritt"] = true,
    [57994] = true,  ["wind shear"] = true, ["windstoß"] = true,
    [47528] = true,  ["mind freeze"] = true, ["gedankenfrost"] = true,
    [78675] = true,  ["solar beam"] = true, ["sonnenstrahl"] = true,
    [116705] = true, ["spear hand strike"] = true, ["fußfeger"] = true,
    [96231] = true,  ["rebuke"] = true, ["zurechtweisung"] = true,
    [106839] = true, ["skull bash"] = true, ["schädelstoß"] = true,
    [183752] = true, ["disrupt"] = true, ["unterbrechen"] = true,
    [357214] = true, ["quell"] = true, ["ersticken"] = true,
    [15487] = true,  ["silence"] = true, ["stille"] = true,
    -- Racial Abilities
    [20572] = true,  ["blood fury"] = true, ["kochendes blut"] = true,
    [26297] = true,  ["berserking"] = true, ["berserker"] = true,
    [265221] = true, ["fireblood"] = true, ["feuerblut"] = true,
    [274738] = true, ["ancestral call"] = true, ["ruf der ahnen"] = true,
    [25046] = true,  ["arcane torrent"] = true, ["arkaner strom"] = true,
    [20594] = true,  ["stoneform"] = true, ["steingestalt"] = true,
    [58984] = true,  ["shadowmeld"] = true, ["schattengestalt"] = true,
    [7744] = true,   ["will of the forsaken"] = true, ["wille der verlassenen"] = true,
    [59752] = true,  ["will to survive"] = true,
    [69070] = true,  ["rocket jump"] = true, ["raketensprung"] = true,
    [255647] = true, ["lights judgment"] = true, ["urteil des lichts"] = true,
    [312411] = true, ["bag of tricks"] = true, ["trickkiste"] = true,
    -- Core Defensives & Instant Off-GCD CDs
    [48792] = true,  ["icebound fortitude"] = true, ["eisige gegenwehr"] = true,
    [48707] = true,  ["anti-magic shell"] = true, ["antimagische hülle"] = true,
    [55233] = true,  ["vampiric blood"] = true, ["vampirblut"] = true,
    [2565] = true,   ["shield block"] = true, ["schildblock"] = true,
    [23920] = true,  ["spell reflection"] = true, ["zauberreflexion"] = true,
    [12975] = true,  ["last stand"] = true, ["letzte zuflucht"] = true,
    [190456] = true, ["ignore pain"] = true, ["zähne zusammenbeißen"] = true,
    [642] = true,    ["divine shield"] = true, ["gottesschild"] = true,
    [1022] = true,   ["blessing of protection"] = true, ["segen des schutzes"] = true,
    [633] = true,    ["lay on hands"] = true, ["handauflegung"] = true,
    [31884] = true,  ["avenging wrath"] = true, ["zornige vergeltung"] = true,
    [31850] = true,  ["ardent defender"] = true, ["unermüdlicher verteidiger"] = true,
    [1966] = true,   ["feint"] = true, ["finte"] = true,
    [31224] = true,  ["cloak of shadows"] = true, ["mantel der schatten"] = true,
    [5277] = true,   ["evasion"] = true, ["entrinnen"] = true,
    [1856] = true,   ["vanish"] = true, ["verschwinden"] = true,
    [45438] = true,  ["ice block"] = true, ["eisblock"] = true,
    [55342] = true,  ["mirror image"] = true, ["spiegelbilder"] = true,
    [104773] = true, ["unending resolve"] = true, ["erbarmungslose entschlossenheit"] = true,
    [108416] = true, ["dark pact"] = true, ["dunkler pakt"] = true,
    [22812] = true,  ["barkskin"] = true, ["baumrinde"] = true,
    [61336] = true,  ["survival instincts"] = true, ["überlebensinstinkte"] = true,
    [192081] = true, ["ironfur"] = true, ["eisenfell"] = true,
    [108271] = true, ["astral shift"] = true, ["astralverschiebung"] = true,
    [122470] = true, ["touch of karma"] = true, ["karma"] = true,
    [115203] = true, ["fortifying brew"] = true, ["stärkendes gebräu"] = true,
    [122783] = true, ["diffuse magic"] = true, ["magie diffundieren"] = true,
    [122278] = true, ["dampen harm"] = true, ["schaden dämpfen"] = true,
    [198589] = true, ["blur"] = true, ["verschwimmen"] = true,
    [196555] = true, ["netherwalk"] = true, ["netherwandeln"] = true,
    [196718] = true, ["darkness"] = true, ["dunkelheit"] = true,
    [363916] = true, ["obsidian scales"] = true, ["obsidianschuppen"] = true,
    [374348] = true, ["renewing blaze"] = true, ["erneuernde flammen"] = true,
    [374227] = true, ["zephyr"] = true,
    [186265] = true, ["aspect of the turtle"] = true, ["aspekt der schildkröte"] = true,
    [264735] = true, ["survival of the fittest"] = true, ["überleben des stärksten"] = true,
    [5384] = true,   ["feign death"] = true, ["totstellen"] = true,
}

--- Checks if a given spell or item name/ID does NOT trigger GCD.
--- @param identifier string|number
--- @return boolean
function MM.Validator:IsOffGCD(identifier)
    if not identifier or identifier == "" then return false end
    local strId = tostring(identifier):lower():match("^%s*(.-)%s*$")
    
    if self.OFF_GCD_SPELLS[strId] then return true end
    
    local numId = tonumber(strId)
    if numId and self.OFF_GCD_SPELLS[numId] then return true end
    
    -- Check C_Spell info if available
    if C_Spell and C_Spell.GetSpellInfo then
        local info = C_Spell.GetSpellInfo(identifier)
        if info and info.spellID and self.OFF_GCD_SPELLS[info.spellID] then
            return true
        end
    end
    
    return false
end

--- Validates a full macro body string.
--- @param body string The full macro text.
--- @return boolean isValid True if no errors found.
--- @return table errors A list of error strings (empty if valid).
function MM.Validator:ValidateBody(body)
    local errors = {}
    if not body or body == "" then return true, errors end
    
    -- Check 255-char limit
    if #body > 255 then
        table.insert(errors, { msg = format("Macro body is %d characters (max 255). It will be truncated!", #body), line = 0 })
    end
    
    local lineIndex = 0
    for line in body:gmatch("[^\r\n]+") do
        lineIndex = lineIndex + 1
        -- Skip comments
        if not line:find("^%s*//") then 
             local valid, lineErrors = self:ValidateLine(line)
             if not valid then
                 for _, err in ipairs(lineErrors) do
                     table.insert(errors, { msg = err, line = lineIndex })
                 end
             end
        end
    end
    
    return (#errors == 0), errors
end

--- Checks if a macro name is already used in the given scope.
--- @param name string The macro name to check.
--- @param scope string "account" or "character".
--- @param excludeIndex number|nil Index to exclude (for updating existing).
--- @return boolean isDuplicate True if a macro with this name already exists.
function MM.Validator:CheckDuplicateName(name, scope, excludeIndex)
    if not name or name == "" then return false end
    
    local global, perChar = GetNumMacros()
    local startIdx, count
    
    if scope == "account" then
        startIdx, count = 1, global
    elseif scope == "character" then
        startIdx, count = 121, perChar
    else
        return false -- Library doesn't enforce unique names
    end
    
    for i = startIdx, startIdx + count - 1 do
        if i ~= excludeIndex then
            local existingName = GetMacroInfo(i)
            if existingName and existingName:lower() == name:lower() then
                return true
            end
        end
    end
    return false
end

local spellValidationCache = {}

--- Clears the internal spell validation cache.
function MM.Validator:ClearSpellValidationCache()
    table.wipe(spellValidationCache)
end

--- Validates a spell name by checking if it exists in the spell database (memoized for O(1) lookups).
--- @param spellName string The spell name to validate.
--- @return boolean exists True if the spell exists.
function MM.Validator:ValidateSpellName(spellName)
    if not spellName or spellName == "" then return true end -- Empty is OK
    
    -- Skip items, slot numbers, and special tokens
    if tonumber(spellName) then return true end
    if spellName:match("^%d+$") then return true end
    
    local key = spellName:lower()
    if spellValidationCache[key] ~= nil then
        return spellValidationCache[key]
    end
    
    -- Try C_Spell API (modern)
    if C_Spell and C_Spell.GetSpellInfo then
        local info = C_Spell.GetSpellInfo(spellName)
        if info then
            spellValidationCache[key] = true
            return true
        end
    end
    
    -- Could be an item name - try item lookup
    if C_Item and C_Item.GetItemInfo then
        local info = C_Item.GetItemInfo(spellName)
        if info then
            spellValidationCache[key] = true
            return true
        end
    end
    
    spellValidationCache[key] = false
    return false -- Not found
end

--- Validates a single line of macro text.
function MM.Validator:ValidateLine(line)
    local errors = {}
    
    -- Check Balanced Brackets
    local depth = 0
    for i = 1, #line do
        local c = line:sub(i,i)
        if c == "[" then depth = depth + 1 end
        if c == "]" then depth = depth - 1 end
        if depth < 0 then
            table.insert(errors, "Unbalanced brackets: Unexpected ']'")
            return false, errors
        end
    end
    if depth > 0 then
        table.insert(errors, "Unbalanced brackets: Missing ']'")
    end
    
    -- Parse Conditions to check for Logic Errors
    -- Split line by semicolon to get alternatives
    -- /cast [comb] Spell; [comb] Spell2
    
    local cmd, rest = line:match("^(%S+)%s+(.*)")
    if cmd then
        local blocks = {}
        -- Very basic split by ; that ignores ; inside [ ] (not standardized but usually ; is main separator)
        -- Actually, ; is a separator for /cast commands.
        -- Let's check each block inside [ ]
        
        local hasEmptyBlock = false
        
        for conditionBlock in line:gmatch("%[(.-)%]") do
             -- Check for Unreachable Code (Empty block [] is always true)
             if conditionBlock:match("^%s*$") then
                 if hasEmptyBlock then
                     table.insert(errors, "Unreachable code: Multiple empty conditions '[]' detected. Only the first will ever execute.")
                 end
                 hasEmptyBlock = true
             else
                 -- If we already had an empty block, these subsequent specific conditions are unreachable
                 if hasEmptyBlock then
                     table.insert(errors, "Unreachable code: Condition ["..conditionBlock.."] appears after an always-true condition [].")
                 end
                 
                 -- Check internal conflicts
                 local tags = {}
                 for part in conditionBlock:gmatch("[^,]+") do
                     part = part:match("^%s*(.-)%s*$"):lower()
                     
                     -- Remove params
                     local tag = part:match("^(%a+)")
                     if tag then
                         if part:sub(1,3) == "mod" then tag = "mod" end -- simplify modifiers
                         tags[tag] = true
                     end
                 end
                 
                 -- Conflict Rules
                 if tags["help"] and tags["harm"] then table.insert(errors, "Conflict: [help] and [harm] cannot both be true.") end
                 if tags["dead"] and tags["nodead"] then table.insert(errors, "Conflict: [dead] and [nodead] cannot both be true.") end
                 if tags["combat"] and tags["nocombat"] then table.insert(errors, "Conflict: [combat] and [nocombat] cannot both be true.") end
                 if tags["stealth"] and tags["nostealth"] then table.insert(errors, "Conflict: [stealth] and [nostealth] cannot both be true.") end
                 if tags["exists"] and tags["noexists"] then table.insert(errors, "Conflict: [exists] and [noexists] cannot both be true.") end
                 if tags["channeling"] and tags["nochanneling"] then table.insert(errors, "Conflict: [channeling] and [nochanneling] cannot both be true.") end
                 if tags["mounted"] and tags["nomounted"] then table.insert(errors, "Conflict: [mounted] and [nomounted] cannot both be true.") end
                 -- Additional conflict rules
                 if tags["mounted"] and tags["indoors"] then table.insert(errors, "Warning: [mounted] and [indoors] are rarely both true.") end
                 if tags["flying"] and tags["indoors"] then table.insert(errors, "Conflict: [flying] and [indoors] cannot both be true.") end
                 if tags["swimming"] and tags["mounted"] then table.insert(errors, "Warning: [swimming] and [mounted] are rarely both true.") end
                 if tags["pet"] and tags["nopet"] then table.insert(errors, "Conflict: [pet] and [nopet] cannot both be true.") end
             end
        end
    end
    
    return (#errors == 0), errors
end

--- Comprehensive Diagnostic Analysis for Macro Text.
--- @param body string The macro text to analyze.
--- @return table diagnostics { status = "ok"|"warning"|"error", issues = { { type="error"|"warning"|"tip", title=..., desc=... } } }
function MM.Validator:AnalyzeMacro(body)
    local result = {
        status = "ok",
        issues = {}
    }
    
    if not body or body:match("^%s*$") then
        return result
    end
    
    -- 1. Character Limit Check
    local len = #body
    if len > 255 then
        result.status = "error"
        table.insert(result.issues, {
            type = "error",
            title = L["Character Limit Exceeded"] or "Character Limit Exceeded",
            desc = string.format(L["Macro is %d/255 characters. WoW will truncate everything past character 255!"] or "Das Makro hat %d/255 Zeichen. WoW schneidet alles ab Zeichen 255 ab!", len)
        })
    elseif len > 210 and MM.Optimizer then
        local opt = MM.Optimizer:OptimizeBody(body)
        local saved = len - #opt
        if saved > 10 then
            if result.status ~= "error" then result.status = "warning" end
            table.insert(result.issues, {
                type = "tip",
                title = L["Optimization Available"] or "Optimization Available",
                desc = string.format(L["You can save %d characters by clicking 'Optimize Code'."] or "Du kannst %d Zeichen sparen, indem du auf 'Optimize Code' klickst.", saved)
            })
        end
    end
    
    -- 2. Check for missing #showtooltip
    local hasShowTooltip = body:find("^%s*#showtooltip") ~= nil or body:find("\n%s*#showtooltip") ~= nil
    local hasCast = body:find("/cast") ~= nil or body:find("/use") ~= nil or body:find("/castsequence") ~= nil
    if hasCast and not hasShowTooltip then
        if result.status == "ok" then result.status = "warning" end
        table.insert(result.issues, {
            type = "tip",
            title = L["Missing #showtooltip"] or "Fehlendes #showtooltip",
            desc = L["Add '#showtooltip' at the top so the action bar displays the active spell's icon, cooldown, and tooltip."] or "Add '#showtooltip' at the top so the action bar displays the active spell's icon, cooldown, and tooltip."
        })
    end
    
    -- 3. Check for multiple GCD spells without conditionals on separate /cast lines
    local gcdSpells = 0
    local checkedSpells = {}
    
    for line in body:gmatch("[^\r\n]+") do
        local trimmed = line:match("^%s*(.-)%s*$")
        if trimmed and (trimmed:find("^/cast%s+") or trimmed:find("^/use%s+")) then
            if not trimmed:find("%[") and not trimmed:find("/castsequence") and not trimmed:find("/castrandom") then
                local spellName = trimmed:match("^/%w+%s+(.+)")
                if spellName and spellName ~= "" and not tonumber(spellName) then
                    local isOffGCD = self:IsOffGCD(spellName)
                    if not isOffGCD then
                        gcdSpells = gcdSpells + 1
                    end
                end
            end
            
            -- Dead/Unknown Spell Check
            local spellCandidate = trimmed:match("^/%w+%s+(.+)")
            if spellCandidate and spellCandidate ~= "" then
                -- Strip conditions e.g. [@mouseover,help] Spell -> Spell
                local cleanName = spellCandidate:gsub("%[.-%]", ""):match("^%s*(.-)%s*$")
                -- If it has multiple options (e.g. SpellA; SpellB), check each
                for subSpell in cleanName:gmatch("[^;]+") do
                    subSpell = subSpell:match("^%s*(.-)%s*$")
                    if subSpell and subSpell ~= "" and not checkedSpells[subSpell:lower()] and not tonumber(subSpell) then
                        checkedSpells[subSpell:lower()] = true
                        -- Ignore known commands, item slots, bag items
                        if not subSpell:find("^item:") and not subSpell:find("^macro:") and subSpell ~= "13" and subSpell ~= "14" and subSpell ~= "6" then
                            local exists = self:ValidateSpellName(subSpell)
                            if not exists then
                                if result.status == "ok" then result.status = "warning" end
                                table.insert(result.issues, {
                                    type = "warning",
                                    title = L["Dead / Unknown Spells (1)"] or "Unbekannter Zauber",
                                    desc = string.format("'%s' wurde in der Zauber-Datenbank nicht gefunden (möglicherweise veraltet oder Tippfehler).", subSpell)
                                })
                            end
                        end
                    end
                end
            end
        end
    end
    
    if gcdSpells > 1 then
        if result.status ~= "error" then result.status = "warning" end
        table.insert(result.issues, {
            type = "warning",
            title = L["Potential GCD Conflict"] or "Potential GCD Conflict",
            desc = L["Multiple /cast commands without modifiers were detected. Spells on the Global Cooldown (GCD) cannot trigger together on the same click. Consider using Shift/Ctrl modifiers or a /castsequence."] or "Multiple /cast commands without modifiers were detected. Spells on the Global Cooldown (GCD) cannot trigger together on the same click. Consider using Shift/Ctrl modifiers or a /castsequence."
        })
    end
    
    -- 4. Syntax & Unbalanced Brackets
    local valid, errs = MM.Validator:ValidateBody(body)
    if not valid then
        result.status = "error"
        for _, err in ipairs(errs) do
            table.insert(result.issues, {
                type = "error",
                title = L["Syntax Error"] or "Syntaxfehler",
                desc = err.msg or "Syntax error"
            })
        end
    end
    
    return result
end

--- Analyzes a /castsequence line for cooldown mismatches and lockup risks
function MM.Validator:AnalyzeCastSequence(line)
    if not line or not line:find("/castsequence") then return nil end
    local warnings = {}

    local hasReset = line:find("reset%s*=") ~= nil
    local spellsPart = line:gsub("^%s*/castsequence%s*", ""):gsub("%[.-%]", "")
    if hasReset then
        spellsPart = spellsPart:gsub("reset%s*=%s*[^%s]+%s*", "")
    end

    local spellList = {}
    for s in spellsPart:gmatch("[^,]+") do
        local clean = s:match("^%s*(.-)%s*$")
        if clean and clean ~= "" then
            table.insert(spellList, clean)
        end
    end

    if #spellList > 1 and not hasReset then
        table.insert(warnings, {
            type = "warning",
            title = "Missing reset= Condition",
            desc = "CastSequence contains multiple spells without a 'reset=' condition. If a spell has a cooldown, the sequence may permanently lock until combat ends.",
        })
    end

    for _, sp in ipairs(spellList) do
        if self.OFF_GCD_SPELLS and self.OFF_GCD_SPELLS[sp:lower()] then
            table.insert(warnings, {
                type = "info",
                title = "Off-GCD Spell in CastSequence",
                desc = string.format("'%s' is off the Global Cooldown. Putting it inside /castsequence may delay it unnecessarily compared to a separate /cast line.", sp),
            })
        end
    end

    return warnings
end

