--------------------------------------------------------------------------------
-- Macro Maker - Optimizer Module
-- Version: 1.0
-- Author: Satyros
--
-- Description:
--   Enhances macro code by removing redundancies and shortening syntax.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

MM.Optimizer = {}

--- Optimizes the entire macro body.
function MM.Optimizer:OptimizeBody(body)
    if not body or body == "" then return "" end
    local lines = {}
    
    -- 1. Parse into structured command objects
    for l in body:gmatch("[^\r\n]+") do
        local clean = l:gsub("^%s+", ""):gsub("%s+$", "")
        if clean ~= "" then
            table.insert(lines, clean)
        end
    end

    local optimizedLines = {}
    local currentCmd = nil
    local buffer = {}

    local function flushBuffer()
        if currentCmd and #buffer > 0 then
            -- Consolidate buffer items
            local parts = {}
            for _, item in ipairs(buffer) do
                for part in item:gmatch("[^;]+") do
                    local rest = part:match("^%s*(.-)%s*$")
                    local cond, spell = rest:match("^(%[.*%])%s*(.-)$")
                    if not cond then
                        spell = rest
                        cond = ""
                    end
                    if spell and spell ~= "" then
                        table.insert(parts, {cond = cond, spell = spell})
                    end
                end
            end
            
            -- Merge consecutive segments targeting the same spell
            local mergedParts = {}
            for _, p in ipairs(parts) do
                if #mergedParts > 0 and mergedParts[#mergedParts].spell:lower() == p.spell:lower() then
                    -- If the target is the same, merge the conditions (WoW syntax: [cond1][cond2] means OR)
                    local addition = p.cond
                    if addition == "" then
                        -- When merging an unconditional fallback into a conditional action, preserve it as []
                        if mergedParts[#mergedParts].cond ~= "" and not mergedParts[#mergedParts].cond:find("%[%]$") then
                            addition = "[]"
                        end
                    end
                    mergedParts[#mergedParts].cond = mergedParts[#mergedParts].cond .. addition
                else
                    table.insert(mergedParts, {cond = p.cond, spell = p.spell})
                end
            end
            
            -- Strip redundant [nomod] if it's the final fallback in a modified sequence
            if #mergedParts > 1 then
                local lastPart = mergedParts[#mergedParts]
                if lastPart.cond:lower() == "[nomod]" then
                    lastPart.cond = ""
                elseif lastPart.cond:find("nomod") then
                    lastPart.cond = lastPart.cond:gsub(",%s*nomod", ""):gsub("nomod%s*,", ""):gsub("%[nomod%]", "")
                end
            end

            local outputParts = {}
            for _, p in ipairs(mergedParts) do
                if p.cond ~= "" then
                    table.insert(outputParts, p.cond .. " " .. p.spell)
                else
                    table.insert(outputParts, p.spell)
                end
            end
            
            local merged = currentCmd .. " " .. table.concat(outputParts, ";")
            table.insert(optimizedLines, merged)
        end
        currentCmd = nil
        buffer = {}
    end

    for _, line in ipairs(lines) do
        -- If line starts with #, it's a meta command (stop), flush immediately.
        if line:sub(1,1) == "#" then
            flushBuffer()
            -- Optimize #showtooltip / #show
            local metaCmd, metaRest = line:match("^(%S+)%s*(.*)")
            if metaCmd then
                local lMeta = metaCmd:lower()
                if (lMeta == "#showtooltip" or lMeta == "#show") and metaRest ~= "" then
                    -- Strip superfluous target= and modifier words in meta conditions
                    metaRest = metaRest:gsub("target=", "@")
                    metaRest = metaRest:gsub("%[(.-)%]", function(b)
                        b = b:gsub("modifier", "mod")
                        b = b:gsub("button", "btn")
                        b = b:gsub("equipped", "worn")
                        b = b:gsub("stance", "form")
                        b = b:gsub("%s+", "")
                        return "[" .. b .. "]"
                    end)
                    metaRest = metaRest:gsub("%]%s+", "]")
                    table.insert(optimizedLines, metaCmd .. " " .. metaRest)
                else
                    table.insert(optimizedLines, line)
                end
            else
                table.insert(optimizedLines, line)
            end
        else
            -- Normalize command
            local cmd, rest = line:match("^(%S+)%s*(.*)")
            if not cmd then cmd = line rest = "" end
            
            local lowerCmd = cmd:lower()
            -- Normalize aliases to shortest equivalent
            if lowerCmd == "/cast" then lowerCmd = "/use" end
            if lowerCmd == "/spell" then lowerCmd = "/use" end
            
            -- Check if mergeable
            local isMergeable = (lowerCmd == "/use" or lowerCmd == "/cast")
            
            if isMergeable then
                -- basic cleanup of the rest (args)
                rest = rest:gsub("%]%s+", "]")
                rest = rest:gsub("target=", "@")
                
                -- Abbreviate condition names
                rest = rest:gsub("%[(.-)%]", function(b)
                    b = b:gsub("modifier", "mod")
                    b = b:gsub("button", "btn")
                    b = b:gsub("equipped", "worn")
                    b = b:gsub("stance", "form")
                    -- Strip internal whitespace within bracket conditions
                    b = b:gsub("%s+", "")
                    return "[" .. b .. "]"
                end)
                
                if currentCmd == lowerCmd then
                    -- Same command, add to buffer
                    table.insert(buffer, rest)
                else
                    -- Different command, flush and start new
                    flushBuffer()
                    currentCmd = lowerCmd
                    table.insert(buffer, rest)
                end
            else
                -- Not mergeable, flush and add
                flushBuffer()
                -- Minor cleanup for standard commands
                line = line:gsub("target=", "@")
                table.insert(optimizedLines, line)
            end
        end
    end
    flushBuffer() -- Final flush
    
    -- Trim redundant #showtooltip if it matches the first spell
    if #optimizedLines >= 2 then
        local firstLine = optimizedLines[1]
        local metaCmd, stTarget = firstLine:match("^(#%S+)%s+(.*)")
        if metaCmd and (metaCmd:lower() == "#showtooltip" or metaCmd:lower() == "#show") and stTarget and not stTarget:find("%[") and not stTarget:find(";") then
            local cleanTarget = stTarget:match("^%s*(.-)%s*$"):lower()
            local l2 = optimizedLines[2]
            if l2 and (l2:find("^/use%s+") or l2:find("^/cast%s+")) then
                local l2Spells = l2:gsub("^/%w+%s+", "")
                local matches = false
                if l2Spells:lower() == cleanTarget then
                    matches = true
                elseif l2Spells:lower():find(";%s*" .. cleanTarget:gsub("%-", "%%-") .. "$") or l2Spells:lower():find(" " .. cleanTarget:gsub("%-", "%%-") .. "$") then
                    matches = true
                end
                if matches then
                    optimizedLines[1] = metaCmd
                end
            end
        end
    end

    return table.concat(optimizedLines, "\n")
end

--- Calculates character savings from optimization.
--- @param body string Macro text
--- @return number originalLen, number optimizedLen, number savedChars, number savedPercent, string optimizedText
function MM.Optimizer:GetSavings(body)
    if not body or body == "" then
        return 0, 0, 0, 0, ""
    end
    local originalLen = #body
    local optimizedText = self:OptimizeBody(body)
    local optimizedLen = #optimizedText
    local savedChars = math.max(0, originalLen - optimizedLen)
    local savedPercent = (originalLen > 0 and savedChars > 0) and math.floor((savedChars / originalLen) * 100) or 0
    return originalLen, optimizedLen, savedChars, savedPercent, optimizedText
end
