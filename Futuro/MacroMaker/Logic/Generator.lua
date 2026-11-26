--------------------------------------------------------------------------------
-- Macro Maker - Generator Module
-- Version: 1.0
-- Author: Satyros
--
-- Description:
--   Core logic module responsible for:
--   1. Generating valid WoW macro strings from builder data (GenerateMacroText).
--   2. Executing enhanced slash command actions (ExecuteMacroAction).
--------------------------------------------------------------------------------

local AddOnName, MM = ...

--------------------------------------------------------------------------------
-- Macro Execution (Advanced Actions)
--------------------------------------------------------------------------------

--- Executes specialized actions for a given macro (e.g., Chat, Ping, Lua).
--- Triggered via Slash Command: /mm [MacroName]
--- @param msg string The name of the macro to execute.
function MM:ExecuteMacroAction(msg)
    local macroName = msg
    local macroData = nil
    
    -- Find Macro Data
    if MM.db and MM.db.macros then
        for _, m in ipairs(MM.db.macros) do
            if m.name == macroName then
                macroData = m
                break
            end
        end
    end
    
    if macroData then
        -- 1. Chat Messages
        if macroData.chatMsg and macroData.chatMsg ~= "" then
            local channel = macroData.chatChannel or "SAY"
            SendChatMessage(macroData.chatMsg, channel)
        end
        
        -- 2. Smart Ping
        if macroData.pingTarget then
            -- Note: SetRaidTarget is protected in combat in many contexts. 
            print("MacroMaker Ping: " .. macroData.name)
        end
        
        -- 3. Custom Lua Script
        if macroData.luaScript and macroData.luaScript ~= "" then
            RunScript(macroData.luaScript)
        end
    end
end

--------------------------------------------------------------------------------
-- Text Generation
--------------------------------------------------------------------------------

--- Generates the final macro body text based on the Builder's state.
--- Compiles lines, conditions, and commands into a WoW-compatible string.
function MM:GenerateMacroText()
    if MM.isParsingMacro then return end
    
    local action = "/use"
    local spellChain = {}
    local macroLines = {}
    local modifiers = {"shift", "ctrl", "alt", "nomod"} -- 'nomod' processed last for cleaner logic
    
    -- 1. Compile Modifier Rows
    for _, mod in ipairs(modifiers) do
        local row = MM.rows[mod]
        if row and row.lines then
            for _, line in ipairs(row.lines) do
                local text = line.spellInput:GetText()
                if not text then text = "" end
                
                -- Append Argument
                if line.argInput and line.argInput:GetText() ~= "" then
                    text = text .. " " .. line.argInput:GetText()
                end
                
                -- Process if valid text or if we need to preserve structural gap (empty mod)
                if (text and text ~= "") or (mod ~= "nomod") then
                    -- Build [conditions] string
                    local parts = {}
                    if mod ~= "nomod" then table.insert(parts, "mod:"..mod) end
                    
                    if line.conditions then
                        local condList = {}
                        for tag, active in pairs(line.conditions) do
                            if active then table.insert(condList, tag) end
                        end
                        table.sort(condList, function(a, b)
                            local function getPriority(tag)
                                if tag:sub(1,1) == "@" or tag:find("^target=") then return 1 end
                                if tag == "help" or tag == "harm" then return 2 end
                                if tag == "nodead" or tag == "dead" or tag == "exists" then return 3 end
                                return 4
                            end
                            local prioA = getPriority(a)
                            local prioB = getPriority(b)
                            if prioA ~= prioB then return prioA < prioB end
                            return a < b
                        end)
                        for _, tag in ipairs(condList) do
                            table.insert(parts, tag)
                        end
                    end
                    
                    local conditionStr = ""
                    if #parts > 0 then
                        conditionStr = "[" .. table.concat(parts, ", ") .. "]"
                    end

                    -- Check for Command vs Spell
                    -- Treat /cast and /use as spells for standardized output if desired, or keep specific logic
                    -- We will simply prepend /use for things that don't start with /
                    
                    local fullLine = ""
                    local isCommand = text:match("^/")
                    
                    -- Normalize: If it's a cast command, strip it to handle cleanly with condition logic
                    if text:match("^/cast%s") or text:match("^/use%s") or text == "/cast" or text == "/use" then
                        isCommand = false
                        text = text:gsub("^/cast%s*", ""):gsub("^/use%s*", "")
                    end
                    
                    if isCommand then
                         local cmdWord, args = text:match("^(%S+)%s*(.*)")
                         if not cmdWord then cmdWord = text args = "" end
                         
                         fullLine = cmdWord
                         if conditionStr ~= "" then
                             fullLine = fullLine .. " " .. conditionStr
                         end
                         if args and args ~= "" then
                             fullLine = fullLine .. " " .. args
                         end
                    else
                         -- Spell / Item
                         if isCast and text == "" then 
                             -- Empty cast logic? Skip
                         else
                             local actionCmd = "/use"
                             fullLine = actionCmd
                             if conditionStr ~= "" then
                                 fullLine = fullLine .. " " .. conditionStr
                             end
                             if text ~= "" then
                                 fullLine = fullLine .. " " .. text
                             end
                         end
                    end
                    
                    if fullLine ~= "" then
                        table.insert(macroLines, fullLine)
                    end
                end
            end
        end
    end
    
    -- 2. Assemble Final String
    local finalMacro = ""
    
    -- A. #showtooltip
    if MM.useShowTooltip then
            if MM.tooltipSource and MM.tooltipSource ~= "" then
                finalMacro = "#showtooltip " .. MM.tooltipSource .. "\n"
            else
                finalMacro = "#showtooltip\n"
            end
    end
    
    -- B. Body
    if #macroLines > 0 then
        finalMacro = finalMacro .. table.concat(macroLines, "\n")
    end
    
    -- 3. Output & Updates
    if MM.outputBox then MM.outputBox:SetText(finalMacro) end
    
    -- Character Count
    local len = string.len(finalMacro)
    if MM.UpdateCharCount then
        MM:UpdateCharCount(len)
    elseif MM.charCount then
        MM.charCount:SetText(len .. " / 255")
    end
    
    -- Refresh Overview Dashboard if active
    if MM.UpdateOverviewPanel then MM:UpdateOverviewPanel() end
    
    -- Update Preview Icon
    if MM.UpdateMacroPreviewIcon then MM:UpdateMacroPreviewIcon() end
end
