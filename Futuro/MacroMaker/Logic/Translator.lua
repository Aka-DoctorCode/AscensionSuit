--------------------------------------------------------------------------------
-- Macro Maker - Translator Module
-- Version: 1.0 (Blizzard API Multi-Locale Engine)
-- Author: Satyros
--
-- Description:
--   Translates macro templates, spell names, item names, and template titles
--   dynamically into the player's active client language across all 10 WoW locales.
--   Supports: deDE, enUS, esES, esMX, frFR, itIT, ptBR, ruRU, koKR, zhCN, zhTW.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

MM.Translator = {}

--- Returns the active WoW client locale code (e.g., "deDE", "enUS", "frFR", etc.)
--- @return string locale
function MM.Translator:GetClientLocale()
    return GetLocale() or "enUS"
end

--- Returns true if the client language requires macro text localization.
--- @param locale string Optional locale override
--- @return boolean
function MM.Translator:NeedsLocalization(locale)
    locale = locale or self:GetClientLocale()
    return (locale ~= "enUS" and locale ~= "enGB")
end

--- Translates a single spell or item name from English into the target locale.
--- Uses runtime C_Spell / C_Item APIs when available, falling back to static API data.
--- @param englishName string Name in English
--- @param targetLocale string Target WoW locale (e.g. "deDE")
--- @return string localizedName
function MM.Translator:TranslateName(englishName, targetLocale)
    if not englishName or englishName == "" then return englishName end
    
    local trimmed = englishName:match("^%s*(.-)%s*$")
    if not trimmed or trimmed == "" or tonumber(trimmed) then
        return englishName -- Numeric slots (13, 14) or empty
    end

    targetLocale = targetLocale or self:GetClientLocale()
    if targetLocale == "enUS" or targetLocale == "enGB" then
        return englishName
    end

    -- 1. Try runtime C_Spell / C_Item if spell ID is known
    local id = MM.MacroSpellIDs and MM.MacroSpellIDs[trimmed]
    if id and id > 0 then
        if C_Spell and C_Spell.GetSpellName then
            local liveSpell = C_Spell.GetSpellName(id)
            if liveSpell and liveSpell ~= "" then
                -- Retain any leading/trailing whitespace
                local lead = englishName:match("^(%s*)")
                local trail = englishName:match("(%s*)$")
                return (lead or "") .. liveSpell .. (trail or "")
            end
        end
        if C_Item and C_Item.GetItemInfo then
            local liveItem = C_Item.GetItemInfo(id)
            if liveItem and liveItem ~= "" then
                local lead = englishName:match("^(%s*)")
                local trail = englishName:match("(%s*)$")
                return (lead or "") .. liveItem .. (trail or "")
            end
        end
    end

    -- 2. Fallback to generated static dictionary from Blizzard API
    local localeMap = MM.MacroSpellLocales and MM.MacroSpellLocales[targetLocale]
    if localeMap and localeMap[trimmed] then
        local lead = englishName:match("^(%s*)")
        local trail = englishName:match("(%s*)$")
        return (lead or "") .. localeMap[trimmed] .. (trail or "")
    end

    return englishName
end

--- Translates an action clause (text outside square brackets), handling sequences and semicolons.
--- @param clause string
--- @param targetLocale string
--- @return string translatedClause
function MM.Translator:TranslateClause(clause, targetLocale)
    if not clause or clause == "" then return clause end

    -- Check if this clause contains commas (e.g., castsequence or item list)
    if clause:find(",") then
        local parts = {}
        for part in clause:gmatch("([^,]+)") do
            -- check for reset= condition at beginning of sequence
            local resetCond, rest = part:match("^(%s*reset=%S+%s+)(.+)$")
            if resetCond and rest then
                table.insert(parts, resetCond .. self:TranslateName(rest, targetLocale))
            else
                table.insert(parts, self:TranslateName(part, targetLocale))
            end
        end
        return table.concat(parts, ",")
    else
        return self:TranslateName(clause, targetLocale)
    end
end

--- Translates a full macro body string from English to the target locale.
--- Safely preserves all conditional brackets [...] and numeric equipment slots.
--- @param macroBody string The raw macro body text
--- @param targetLocale string Optional locale code (defaults to active client locale)
--- @return string localizedMacroText
function MM:LocalizeMacroText(macroBody, targetLocale)
    if not macroBody or macroBody == "" then return macroBody end

    targetLocale = targetLocale or (MM.Translator and MM.Translator:GetClientLocale()) or GetLocale() or "enUS"
    if not MM.Translator:NeedsLocalization(targetLocale) then
        return macroBody
    end

    local localeMap = MM.MacroSpellLocales and MM.MacroSpellLocales[targetLocale]
    if not localeMap then
        return macroBody
    end

    local outLines = {}
    for line in macroBody:gmatch("[^\r\n]+") do
        local trimmed = line:match("^%s*(.-)%s*$")
        
        -- Check if line is a command that executes or queries spells/items
        local isCommand = trimmed:find("^/use") or trimmed:find("^/cast") or 
                          trimmed:find("^/cancelaura") or trimmed:find("^#showtooltip") or 
                          trimmed:find("^/castsequence")

        if isCommand then
            -- Tokenize by bracketed conditionals [...] vs unbracketed action clauses
            -- Example: "/use [stealth] Pick Pocket; [mod:shift] Cheap Shot; Sinister Strike"
            local cmdPrefix, restOfLine = line:match("^(%s*[%w/#]+%s*)(.*)$")
            if cmdPrefix and restOfLine then
                local segments = {}
                local lastPos = 1
                local len = #restOfLine

                while lastPos <= len do
                    local bStart, bEnd = restOfLine:find("%b[]", lastPos)
                    if bStart then
                        -- Clause before bracket
                        if bStart > lastPos then
                            local textBefore = restOfLine:sub(lastPos, bStart - 1)
                            -- Split clauses by semicolon if present
                            local semiParts = {}
                            for p in textBefore:gmatch("([^;]+)") do
                                table.insert(semiParts, MM.Translator:TranslateClause(p, targetLocale))
                            end
                            table.insert(segments, table.concat(semiParts, ";"))
                        end
                        -- Retain the bracket EXACTLY as is (never translate [combat], [@mouseover], etc.)
                        table.insert(segments, restOfLine:sub(bStart, bEnd))
                        lastPos = bEnd + 1
                    else
                        -- Remaining text after all brackets
                        local textAfter = restOfLine:sub(lastPos)
                        local semiParts = {}
                        local hasTrailingSemi = textAfter:match(";%s*$")
                        for p in textAfter:gmatch("([^;]+)") do
                            table.insert(semiParts, MM.Translator:TranslateClause(p, targetLocale))
                        end
                        local joined = table.concat(semiParts, ";")
                        if hasTrailingSemi then joined = joined .. ";" end
                        table.insert(segments, joined)
                        break
                    end
                end

                table.insert(outLines, cmdPrefix .. table.concat(segments))
            else
                table.insert(outLines, line)
            end
        else
            table.insert(outLines, line)
        end
    end

    return table.concat(outLines, "\n")
end

--- Returns the localized title of a template snippet.
--- @param englishTitle string
--- @param targetLocale string Optional locale code
--- @return string localizedTitle
function MM:GetLocalizedTemplateName(englishTitle, targetLocale)
    if not englishTitle or englishTitle == "" then return englishTitle end
    
    targetLocale = targetLocale or (MM.Translator and MM.Translator:GetClientLocale()) or GetLocale() or "enUS"
    if targetLocale == "enUS" or targetLocale == "enGB" then
        return englishTitle
    end

    -- 1. Check L table first
    if L and L[englishTitle] and L[englishTitle] ~= englishTitle then
        return L[englishTitle]
    end

    -- 2. Check MacroTemplateTitles
    if MM.MacroTemplateTitles and MM.MacroTemplateTitles[targetLocale] then
        local trans = MM.MacroTemplateTitles[targetLocale][englishTitle]
        if trans then return trans end
    end

    return englishTitle
end

--- Returns the localized description of a template snippet.
--- @param desc string
--- @param targetLocale string Optional locale code
--- @return string localizedDesc
function MM:GetLocalizedTemplateDesc(desc, targetLocale)
    if not desc or desc == "" then return desc end
    if L and L[desc] and L[desc] ~= desc then
        return L[desc]
    end
    return desc
end
