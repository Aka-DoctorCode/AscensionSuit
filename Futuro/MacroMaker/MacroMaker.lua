--------------------------------------------------------------------------------
-- Macro Maker
-- Version: 2.0
-- Author: Satyros
--
-- Description:
--   Core initialization and event handling.
--   Manages Slash Commands (/mm), Minimap Button, and Global Utils.
--------------------------------------------------------------------------------

local AddOnName, MM = ...

MM.version = (C_AddOns and C_AddOns.GetAddOnMetadata and C_AddOns.GetAddOnMetadata("MacroMaker", "Version")) or "3.6.0"
MM.Title = "MacroMaker"
_G["MacroMaker"] = MM

-- Version Comparison Helper
local function IsVersionNewer(currentVersion, incomingVersion)
    if not incomingVersion or incomingVersion == "" then return false end
    local cParts = {}
    for part in string.gmatch(currentVersion, "[^%.]+") do
        table.insert(cParts, tonumber(part) or 0)
    end
    local iParts = {}
    for part in string.gmatch(incomingVersion, "[^%.]+") do
        table.insert(iParts, tonumber(part) or 0)
    end
    for i = 1, math.max(#cParts, #iParts) do
        local cVal = cParts[i] or 0
        local iVal = iParts[i] or 0
        if iVal > cVal then
            return true
        elseif iVal < cVal then
            return false
        end
    end
    return false
end

-- Key Bindings category (AddOn Category)
_G["BINDING_HEADER_MACROMAKER"] = "Macro Maker"
_G["BINDING_CATEGORY_MACROMAKER"] = "Macro Maker"
_G["MACROMAKER"] = "Macro Maker"
_G["BINDING_CATEGORY_BINDING_HEADER_MACROMAKER"] = "Macro Maker"
_G["BINDING_CATEGORY_ULTIMA_SUITE"] = "Ultima Suite"
_G["ULTIMA_SUITE"] = "Ultima Suite"
_G["BINDING_HEADER_ULTIMA_MACROMAKER"] = "Macro Maker"

function MM:Print(msg, level)
    if UltimaBridge and UltimaBridge.Print then
        UltimaBridge:Print("Macro Maker", msg, level)
    else
        local prefix = "|cffffd100[Macro Maker]|r "
        print(prefix .. tostring(msg or ""))
    end
end


function MM:StyleButtonToModern(btn)
    if not btn then return end
    
    if btn.Left then btn.Left:Hide() end
    if btn.Right then btn.Right:Hide() end
    if btn.Middle then btn.Middle:Hide() end
    if btn.SetNormalTexture then btn:SetNormalTexture("") end
    if btn.SetHighlightTexture then btn:SetHighlightTexture("") end
    if btn.SetPushedTexture then btn:SetPushedTexture("") end
    if btn.SetDisabledTexture then btn:SetDisabledTexture("") end
    
    -- Retail NineSlice & sub-textures from GameMenuButtonTemplate / UIPanelButtonTemplate
    if btn.NineSlice then btn.NineSlice:Hide() end
    if btn.TopLeft then btn.TopLeft:Hide() end
    if btn.TopRight then btn.TopRight:Hide() end
    if btn.BottomLeft then btn.BottomLeft:Hide() end
    if btn.BottomRight then btn.BottomRight:Hide() end
    if btn.TopMiddle then btn.TopMiddle:Hide() end
    if btn.BottomMiddle then btn.BottomMiddle:Hide() end
    if btn.MiddleLeft then btn.MiddleLeft:Hide() end
    if btn.MiddleRight then btn.MiddleRight:Hide() end
    if not btn.SetBackdrop and BackdropTemplateMixin then
        Mixin(btn, BackdropTemplateMixin)
    end
    
    if btn.SetBackdrop then
        btn:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = false, tileSize = 16, edgeSize = 10,
            insets = { left = 2, right = 2, top = 2, bottom = 2 }
        })
        btn:SetBackdropColor(0.12, 0.12, 0.14, 0.9)
        btn:SetBackdropBorderColor(0.25, 0.25, 0.28, 1)
    end
    
    btn:HookScript("OnEnter", function(self)
        if self:IsEnabled() then
            self:SetBackdropBorderColor(0.85, 0.65, 0.2, 1)
            self:SetBackdropColor(0.18, 0.18, 0.2, 0.9)
        end
    end)
    btn:HookScript("OnLeave", function(self)
        if self:IsEnabled() then
            self:SetBackdropBorderColor(0.25, 0.25, 0.28, 1)
            self:SetBackdropColor(0.12, 0.12, 0.14, 0.9)
        end
    end)
    btn:HookScript("OnDisable", function(self)
        self:SetBackdropBorderColor(0.15, 0.15, 0.15, 0.5)
        self:SetBackdropColor(0.08, 0.08, 0.08, 0.6)
    end)
    btn:HookScript("OnEnable", function(self)
        self:SetBackdropBorderColor(0.25, 0.25, 0.28, 1)
        self:SetBackdropColor(0.12, 0.12, 0.14, 0.9)
    end)
end


--------------------------------------------------------------------------------
-- Database Configuration
--------------------------------------------------------------------------------

local DEFAULT_DB = {
    profile = {
        macros = {},
        library = {},
        profiles = {},
        backups = {},
        recentIcons = {},
        settings = {
            minimap = { hide = false, minimapPos = 220 },
            framePosition = nil,
            hideActionText = false,
            profilesEnabled = false,
            lastSpecKey = nil,
            favoriteOrder = {},
            soundFeedback = true,
            soundSave = "None",
            loadoutProfilesEnabled = true,
            editorFont = "Friz Quadrata TT",
            window = {},
        }
    }
}

--- Plays an audio cue if sound feedback is enabled in settings.
--- @param cueType string "save"|"copy"|"delete"|"error"
function MM:PlaySoundCue(cueType)
    if not MM.db or not MM.db.settings or MM.db.settings.soundFeedback == false then return end
    if cueType == "save" then
        local soundName = MM.db.settings.soundSave
        if soundName and soundName ~= "None" then
            if type(soundName) == "number" then
                PlaySound(soundName)
                return
            elseif type(soundName) == "string" and soundName:find("\\") then
                PlaySoundFile(soundName)
                return
            end
        end
        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or 856)
    elseif cueType == "copy" then
        PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN or 852)
    elseif cueType == "delete" then
        PlaySound(SOUNDKIT.IG_QUEST_LOG_ABANDON_QUEST or 847)
    elseif cueType == "error" then
        PlaySound(SOUNDKIT.IG_PLAYER_INVITE_DECLINE or 882)
    end
end

--------------------------------------------------------------------------------
-- Event Handling
--------------------------------------------------------------------------------

local MainFrame = CreateFrame("Frame", "MacroMaker_MainEventFrame")
MainFrame:RegisterEvent("ADDON_LOADED")
MainFrame:RegisterEvent("PLAYER_LOGIN")
MainFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
MainFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
MainFrame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
MainFrame:RegisterEvent("TRAIT_CONFIG_UPDATED")
MainFrame:RegisterEvent("ACTIONBAR_SLOT_CHANGED")
MainFrame:RegisterEvent("CHAT_MSG_ADDON")
MainFrame:RegisterEvent("GROUP_ROSTER_UPDATE")

MainFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local loadedAddOn = ...
        if loadedAddOn == AddOnName then
             -- Migrate old SavedVariables if present (non-profile based)
             if MacroMaker_DB and not MacroMaker_DB.profiles and not MacroMaker_DB.profile and (MacroMaker_DB.macros or MacroMaker_DB.settings or MacroMaker_DB.library) then
                 local oldDB = CopyTable(MacroMaker_DB)
                 MacroMaker_DB = nil -- Clear so AceDB initializes properly
                 
                 local db = LibStub("AceDB-3.0"):New("MacroMaker_DB", DEFAULT_DB, true)
                 MM.dbObj = db
                 for k, v in pairs(oldDB) do
                     if k == "macros" or k == "library" or k == "profiles" or k == "settings" then
                         db.profile[k] = v
                     end
                 end
             else
                 local db = LibStub("AceDB-3.0"):New("MacroMaker_DB", DEFAULT_DB, true)
                 MM.dbObj = db
             end

             MM.db = MM.dbObj.profile

             -- Enable Spec-based Profile Auto-Switching via UltimaBridge
             if UltimaBridge and UltimaBridge.EnableDualSpec then
                 MM.dualSpec = UltimaBridge:EnableDualSpec(MM.dbObj, "MacroMaker")
             end

              -- Handle Profile Change callbacks
              MM.dbObj.RegisterCallback(MM, "OnProfileChanged", function(evt, database)
                  MM.db = database.profile
                  if MM.UpdateMacroList then MM:UpdateMacroList() end
                  if MM.UpdateMinimapState then MM:UpdateMinimapState() end
                  MM:UpdateActionBarText()
                  if UltimaBridge and UltimaBridge.RestoreWindowPosition and MM.MainFrame and MM.db.settings and MM.db.settings.window then
                      UltimaBridge:RestoreWindowPosition(MM.MainFrame, MM.db.settings.window, "TOP", 0, -118)
                  end
              end)

              -- Global DB (Account-Wide Sync & Warband Vault)
              if not MacroMaker_GlobalDB then MacroMaker_GlobalDB = { syncMacros = {}, warbandMacros = {} } end
              if not MacroMaker_GlobalDB.warbandMacros then MacroMaker_GlobalDB.warbandMacros = {} end
              MM.globalDb = MacroMaker_GlobalDB
        end
    elseif event == "PLAYER_LOGIN" then
         MM:InitializeUI()
         MM:UpdateActionBarText()
         if MM.Interpreter then
             MM.Interpreter:Init()
         end
         -- Initial Sync: Merge Global into Local if new
         for name, data in pairs(MM.globalDb.syncMacros) do
             if not MM.db.macros[name] then
                 MM.db.macros[name] = data
             end
         end

         -- AceComm-3.0 Registration
         local AceComm = LibStub and LibStub:GetLibrary("AceComm-3.0", true)
         if AceComm then
             AceComm:Embed(MM)
             MM:RegisterComm("MacroMakerComm", "OnCommReceived")
         end

         -- Version Check Registration & Initial Broadcast
         C_ChatInfo.RegisterAddonMessagePrefix("MacroMakerVer")
         C_Timer.After(12, function() MM:SendVersionCheck() end)
    elseif event == "PLAYER_REGEN_DISABLED" then
        -- Combat Protection: Close UI to prevent taint
        if MM.MainFrame and MM.MainFrame:IsShown() then
            MM.MainFrame:Hide()
            MM.wasOpenBeforeCombat = true
        end
    elseif event == "PLAYER_REGEN_ENABLED" then
        -- Restore UI after combat
        if MM.wasOpenBeforeCombat then
            MM:ToggleUI()
            MM.wasOpenBeforeCombat = nil
        end
    elseif event == "ACTIVE_TALENT_GROUP_CHANGED" or event == "TRAIT_CONFIG_UPDATED" then
        -- Auto-switch profiles on spec or talent loadout change
        if MM.Profiles then
            MM.Profiles:OnSpecChanged()
        end
    elseif event == "ACTIONBAR_SLOT_CHANGED" then
        -- Debounce action bar slot indicator refresh to avoid rapid event spam on stance change or bar paging
        if MM.UpdateMacroList and MM.ManagerPanel and MM.ManagerPanel:IsShown() then
            if MM.actionBarUpdateTimer then
                MM.actionBarUpdateTimer:Cancel()
            end
            MM.actionBarUpdateTimer = C_Timer.NewTimer(0.15, function()
                if MM.ManagerPanel and MM.ManagerPanel:IsShown() then
                    MM:UpdateMacroList()
                end
                MM.actionBarUpdateTimer = nil
            end)
        end
    elseif event == "CHAT_MSG_ADDON" then
        local prefix, text, channel, sender = ...
        if prefix == "MacroMakerVer" then
            local incomingVersion = text
            local currentVersion = MM.version or "3.0"
            if not MM.versionOutdatedAlerted and IsVersionNewer(currentVersion, incomingVersion) then
                MM.versionOutdatedAlerted = true
                MM:Print("A newer version (|cff00ff00v" .. incomingVersion .. "|r) is available! Please update your addon.", "warning")
            end
        end
    elseif event == "GROUP_ROSTER_UPDATE" then
        MM:SendVersionCheck()
    end
end)

--------------------------------------------------------------------------------
-- Initialization
--------------------------------------------------------------------------------

--- Initializes core UI components.
function MM:InitializeUI()
    if MM.RegisterOptions then MM:RegisterOptions() end
    MM:CreateMinimapButton()
end

--- Updates the minimap icon visibility based on the database settings.
function MM:UpdateMinimapState()
    local icon = LibStub("LibDBIcon-1.0", true)
    if icon and MM.db.settings.minimap then
        if MM.db.settings.minimap.hide then
            icon:Hide("MacroMaker")
        else
            icon:Show("MacroMaker")
        end
    end
end

--- Creates the Minimap button using LibDBIcon.
function MM:CreateMinimapButton()
    local ldb = LibStub and LibStub("LibDataBroker-1.1", true)
    if not ldb then return end

    local MM_LDB = ldb:GetDataObjectByName("MacroMaker")
    if not MM_LDB then
        MM_LDB = ldb:NewDataObject("MacroMaker", {
            type = "launcher",
            text = "Macro Maker",
            icon = "Interface\\MacroFrame\\MacroFrame-Icon",
            OnClick = function(self, button)
                if button == "LeftButton" or not button then
                    MM:ToggleUI()
                elseif button == "RightButton" then
                    if MenuUtil and MenuUtil.CreateContextMenu then
                        MenuUtil.CreateContextMenu(self, function(owner, rootDescription)
                            rootDescription:CreateTitle("Macro Maker")
                            
                            rootDescription:CreateButton(MM.L["Toggle Window"], function()
                                MM:ToggleUI()
                            end)
                            
                            rootDescription:CreateDivider()
                            
                            rootDescription:CreateCheckbox(MM.L["Hide Macro Text on Action Bars"], function()
                                return MM.db.settings.hideActionText
                            end, function()
                                MM.db.settings.hideActionText = not MM.db.settings.hideActionText
                                MM:UpdateActionBarText()
                            end)
                            
                            rootDescription:CreateCheckbox(MM.L["Show Minimap Button"], function()
                                return not MM.db.settings.minimap.hide
                            end, function()
                                MM.db.settings.minimap.hide = not MM.db.settings.minimap.hide
                                MM:UpdateMinimapState()
                            end)
                            
                            rootDescription:CreateDivider()
                            
                            rootDescription:CreateButton(MM.L["Options"], function()
                                MM:OpenOptions()
                            end)
                        end)
                    else
                        -- Fallback to opening options directly if MenuUtil is not present
                        MM:OpenOptions()
                    end
                end
            end,
            OnTooltipShow = function(tooltip)
                tooltip:AddLine("Macro Maker", 1, 0.82, 0)
                tooltip:AddLine(MM.L["Left-Click: Toggle Main Window"], 1, 1, 1)
                tooltip:AddLine(MM.L["Right-Click: Open Quick Menu"], 1, 1, 1)
            end,
        })
    end

    local icon = LibStub("LibDBIcon-1.0", true)
    if icon then
        if not MM.db.settings.minimap then
            MM.db.settings.minimap = { hide = false }
        end
        if not icon:IsRegistered("MacroMaker") then
            icon:Register("MacroMaker", MM_LDB, MM.db.settings.minimap)
        end
        MM:UpdateMinimapState()
    end
end


--------------------------------------------------------------------------------
-- Utilities: Base64 & Hyperlinks
--------------------------------------------------------------------------------

local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local b64map = {}
for i = 1, 64 do b64map[string.byte(b64chars, i, i)] = i - 1 end

function MM:Base64Encode(data)
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b64chars:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

function MM:Base64Decode(data)
    data = string.gsub(data, '[^'..b64chars..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,b='',b64map[x:byte()]
        for i=6,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

-- Link Handler
hooksecurefunc("SetItemRef", function(link, text, button)
    if string.sub(link, 1, 11) == "macromaker:" then
        local content = string.sub(link, 12)
        if content and content ~= "" then
            local decoded = MM:Base64Decode(content)
            if decoded then
                if MM.ShowImportExportWindow then
                    MM:ShowImportExportWindow("import", decoded)
                else
                    print("MacroMaker: " .. decoded)
                end
            end
        end
    end
end)

-- Chat Filter for [MacroMaker] tags
local function MacroMakerFilter(self, event, msg, ...)
    if msg then
        local newMsg = string.gsub(msg, "%[MacroMaker: (.-)::(.-)%]", function(name, data)
             return "|cff00ccff|Hmacromaker:"..data.."|h[Macro: "..name.."]|h|r"
        end)
        
        if newMsg ~= msg then
            return false, newMsg, ...
        end
    end
    return false
end

local chatEvents = {
    "CHAT_MSG_SAY", "CHAT_MSG_YELL", "CHAT_MSG_GUILD", "CHAT_MSG_OFFICER", "CHAT_MSG_PARTY",
    "CHAT_MSG_PARTY_LEADER", "CHAT_MSG_RAID", "CHAT_MSG_RAID_LEADER", "CHAT_MSG_WHISPER",
    "CHAT_MSG_WHISPER_INFORM", "CHAT_MSG_BN_WHISPER", "CHAT_MSG_BN_WHISPER_INFORM",
    "CHAT_MSG_INSTANCE_CHAT", "CHAT_MSG_INSTANCE_CHAT_LEADER", "CHAT_MSG_CHANNEL"
}
for _, e in ipairs(chatEvents) do ChatFrame_AddMessageEventFilter(e, MacroMakerFilter) end


--------------------------------------------------------------------------------
-- Global UI Helpers
--------------------------------------------------------------------------------

--- Skins a ScrollFrame to match the modern interface.
function MM:SkinScrollBar(scrollFrame)
    if not scrollFrame then return end
    
    local name = scrollFrame.GetName and scrollFrame:GetName()
    local oldSB = scrollFrame.ScrollBar 
        or (name and _G[name .. "ScrollBar"]) 
        or (scrollFrame.GetVerticalScrollbar and scrollFrame:GetVerticalScrollbar())
    
    if oldSB then
        oldSB:Hide()
        oldSB:SetAlpha(0)
        oldSB:EnableMouse(false)
        oldSB:SetScript("OnShow", function(self) self:Hide() end)
        oldSB:ClearAllPoints() 
        oldSB:SetPoint("CENTER", UIParent, "CENTER", 10000, 10000)

        local oldSBName = oldSB.GetName and oldSB:GetName()
        local upBtn = oldSB.ScrollUpButton or (oldSBName and _G[oldSBName .. "ScrollUpButton"]) or (name and _G[name .. "ScrollBarScrollUpButton"])
        local downBtn = oldSB.ScrollDownButton or (oldSBName and _G[oldSBName .. "ScrollDownButton"]) or (name and _G[name .. "ScrollBarScrollDownButton"])
        local thumb = oldSB.ThumbTexture or (oldSBName and _G[oldSBName .. "ThumbTexture"]) or (name and _G[name .. "ScrollBarThumbTexture"])
        if upBtn then upBtn:Hide(); upBtn:SetAlpha(0); upBtn:EnableMouse(false) end
        if downBtn then downBtn:Hide(); downBtn:SetAlpha(0); downBtn:EnableMouse(false) end
        if thumb then thumb:Hide(); thumb:SetAlpha(0) end
    end

    if not scrollFrame.NewStandardScrollBar then
        local newSB = CreateFrame("Slider", nil, scrollFrame, "UIPanelScrollBarTemplate")
        scrollFrame.NewStandardScrollBar = newSB
        
        newSB:SetPoint("TOPRIGHT", scrollFrame, "TOPRIGHT", 26, -16)
        newSB:SetPoint("BOTTOMRIGHT", scrollFrame, "BOTTOMRIGHT", 26, 16)
        
        local bg = newSB:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints()
        bg:SetColorTexture(0, 0, 0, 0.25) 
        
        scrollFrame:HookScript("OnScrollRangeChanged", function(self, xrange, yrange)
            newSB:SetMinMaxValues(0, yrange)
            local val = self:GetVerticalScroll()
            if val > yrange then val = yrange end
            newSB:SetValue(val)
            if yrange <= 0.005 then newSB:Hide() else newSB:Show() end
        end)
        
        scrollFrame:HookScript("OnVerticalScroll", function(self, offset)
            newSB:SetValue(offset)
        end)
        
        newSB:SetScript("OnValueChanged", function(self, value)
            scrollFrame:SetVerticalScroll(value)
        end)
        
        scrollFrame:EnableMouseWheel(true)
        scrollFrame:SetScript("OnMouseWheel", function(self, delta)
            local current = newSB:GetValue()
            if delta > 0 then newSB:SetValue(current - 20) else newSB:SetValue(current + 20) end
        end)
    end
end

--------------------------------------------------------------------------------
-- Slash Commands
--------------------------------------------------------------------------------

function MacroMaker_OnAddonCompartmentClick()
    MM:ToggleUI()
end

SLASH_MACROMAKER1 = "/mm"
MM_SLASH_COMMAND_INFO = "|cff00ccffMacro Maker|r: Type |cffffd100/mm|r to toggle the window."

SlashCmdList["MACROMAKER"] = function(msg)
    MM:HandleSlashCommand(msg)
end

function MM:HandleSlashCommand(msg)
    local command = msg:match("^(%S*)")
    
    if command == "" or command == nil then
        MM:ToggleUI()
    elseif command == "options" or command == "config" or command == "opt" then
        MM:OpenOptions()
    elseif command == "tour" or command == "help" then
        if not MM.MainFrame or not MM.MainFrame:IsShown() then
            MM:ToggleUI()
        end
        if MM.ToggleTutorialMode then
            MM:ToggleTutorialMode()
        end
    elseif command == "bind" or command == "kb" or command == "keybind" then
        local LibKeyBound = LibStub and LibStub:GetLibrary("LibKeyBound-1.0", true)
        if LibKeyBound then
            LibKeyBound:Toggle()
        end
    elseif command == "reset" then
        if self.dbObj and self.dbObj.ResetProfile then
            self.dbObj:ResetProfile()
            self.db = self.dbObj.profile
        else
            self.db = CopyTable(DEFAULT_DB)
        end
        MM:Print("Configuration database reset to defaults.", "info")
        MM:UpdateMacroList() 
    else
        if MM.ExecuteMacroAction then MM:ExecuteMacroAction(msg) end
    end
end

function MM:UpdateActionBarText()
    if InCombatLockdown and InCombatLockdown() then return end
    if not MM.db or not MM.db.settings then return end
    local hide = MM.db.settings.hideActionText
    local alpha = hide and 0 or 1
    
    -- Iterate known Action Bar button names
    local regions = {"MultiBarBottomLeft", "MultiBarBottomRight", "Action", "MultiBarLeft", "MultiBarRight", "MultiBar5", "MultiBar6", "MultiBar7"} 
    for b=1,#regions do 
        for i=1,12 do 
            local btnName = regions[b].."Button"..i.."Name"
            if _G[btnName] then _G[btnName]:SetAlpha(alpha) end
        end 
    end
end

local lastBroadcast = 0
function MM:SendVersionCheck()
    local now = GetTime()
    if now - lastBroadcast < 10 then return end
    lastBroadcast = now

    local version = MM.version or "3.6.0"
    if IsInGuild() then
        C_ChatInfo.SendAddonMessage("MacroMakerVer", version, "GUILD")
        if MM.SendCommMessage then MM:SendCommMessage("MacroMakerComm", "VER:" .. version, "GUILD", nil, "BULK") end
    end
    if IsInRaid() then
        local channel = IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and "INSTANCE_CHAT" or "RAID"
        C_ChatInfo.SendAddonMessage("MacroMakerVer", version, channel)
        if MM.SendCommMessage then MM:SendCommMessage("MacroMakerComm", "VER:" .. version, channel, nil, "BULK") end
    elseif IsInGroup() then
        local channel = IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and "INSTANCE_CHAT" or "PARTY"
        C_ChatInfo.SendAddonMessage("MacroMakerVer", version, channel)
        if MM.SendCommMessage then MM:SendCommMessage("MacroMakerComm", "VER:" .. version, channel, nil, "BULK") end
    end
end

--------------------------------------------------------------------------------
-- AceComm-3.0 Message Processing & Macro Sharing
--------------------------------------------------------------------------------

function MM:OnCommReceived(prefix, message, distribution, sender)
    if prefix ~= "MacroMakerComm" then return end
    local cleanSender = sender and sender:match("([^%-]+)") or sender or "Unknown"
    local myName = UnitName("player")
    if cleanSender == myName then return end -- ignore echo

    local cmd, payload = message:match("^([%w_]+):?(.*)$")
    if cmd == "VER" then
        local incomingVersion = payload
        local currentVersion = MM.version or "3.6.0"
        if not MM.versionOutdatedAlerted and IsVersionNewer(currentVersion, incomingVersion) then
            MM.versionOutdatedAlerted = true
            MM:Print("A newer version (|cff00ff00v" .. incomingVersion .. "|r) is available! Please update your addon.", "warning")
        end
    elseif cmd == "SHARE" then
        local macroData, err = MM:DecodeCompressedPayload(payload)
        if macroData and type(macroData) == "table" and macroData.body then
            local prompt = string.format(MM.L["Player '%s' sent you macro '%s'. Import to Personal Library?"] or "Player '%s' sent you macro '%s'. Import to Personal Library?", cleanSender, macroData.name or "Macro")
            local bridge = _G.UltimaBridge
            local onAccept = function()
                local mName = macroData.name or "SharedMacro"
                if not MM.db.library then MM.db.library = {} end
                MM.db.library[mName] = macroData
                MM:PlaySoundCue("copy")
                if MM.Notify then
                    MM:Notify(string.format(MM.L["Imported macro '%s' from %s!"] or "Imported '%s' from %s!", mName, cleanSender), "success")
                end
                if MM.UpdateMacroList then MM:UpdateMacroList() end
            end

            if bridge and bridge.ShowConfirmDialog then
                bridge:ShowConfirmDialog(prompt, onAccept, nil, MM.L["Import"] or "Import", CANCEL or "Cancel")
            else
                local key = "MACROMAKER_RECEIVE_MACRO"
                StaticPopupDialogs[key] = {
                    text = prompt,
                    button1 = MM.L["Import"] or "Import",
                    button2 = CANCEL or "Cancel",
                    OnAccept = onAccept,
                    timeout = 0,
                    whileDead = true,
                    hideOnEscape = true,
                    preferredIndex = 3,
                }
                StaticPopup_Show(key)
            end
        end
    end
end

--- Sends a macro to a specific player via AceComm-3.0 whisper.
--- @param targetName string
--- @param macroData table
function MM:SendMacroToPlayer(targetName, macroData)
    if not targetName or targetName == "" or not macroData then return false end
    local payload = MM:EncodeCompressedPayload(macroData, "Macro")
    if not payload then return false end
    if MM.SendCommMessage then
        MM:SendCommMessage("MacroMakerComm", "SHARE:" .. payload, "WHISPER", targetName, "NORMAL")
        if MM.Notify then
            MM:Notify(string.format(MM.L["Sent macro '%s' to %s."] or "Sent macro '%s' to %s.", macroData.name or "Macro", targetName), "info")
        end
        return true
    end
    return false
end

--- Broadcasts a macro to the active party/raid group via AceComm-3.0.
--- @param macroData table
function MM:SendMacroToGroup(macroData)
    if not macroData then return false end
    local channel = IsInRaid() and (IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and "INSTANCE_CHAT" or "RAID") or (IsInGroup() and "PARTY") or nil
    if not channel then
        if MM.Notify then MM:Notify(MM.L["You are not in a group or raid."] or "You are not in a group.", "error") end
        return false
    end
    local payload = MM:EncodeCompressedPayload(macroData, "Macro")
    if payload and MM.SendCommMessage then
        MM:SendCommMessage("MacroMakerComm", "SHARE:" .. payload, channel, nil, "NORMAL")
        if MM.Notify then
            MM:Notify(string.format(MM.L["Shared macro '%s' with group!"] or "Shared '%s' with group!", macroData.name or "Macro"), "info")
        end
        return true
    end
    return false
end

--- Cross-AddOn Synergy: Allows external AddOns (like Home Designer or Menagerie Keeper)
--- to open and edit generated macros directly in Macro Maker's visual IDE.
function MM:OpenWithMacro(macroName, macroBody, macroIcon)
    if not self.MainFrame or not self.MainFrame:IsShown() then
        self:ToggleUI()
    end
    if self.outputBox then
        self.outputBox:SetText(macroBody or "")
        self.outputBox:SetCursorPosition(0)
    end
    if self.nameInput then
        self.nameInput:SetText(macroName or "")
    end
    if self.ParseMacroToBuilder then
        self:ParseMacroToBuilder(macroBody or "")
    end
    if self.Notify then
        self:Notify(string.format(self.L["Loaded macro '%s' into editor!"] or "Loaded macro '%s' into editor!", macroName or "Macro"), "success")
    end
end

--- Creates or updates a macro programmatically outside of combat.
function MM:CreateOrUpdateMacro(macroName, macroBody, macroIcon, isPerChar)
    if not macroName or not macroBody then return nil, "Missing parameters" end
    if InCombatLockdown and InCombatLockdown() then
        return nil, "InCombatLockdown"
    end
    local icon = macroIcon or "INV_MISC_QUESTIONMARK"
    local idx = GetMacroIndexByName(macroName)
    if idx and idx > 0 then
        EditMacro(idx, macroName, icon, macroBody)
        if self.Notify then
            self:Notify(string.format(self.L["Updated macro '%s'!"] or "Updated macro '%s'!", macroName), "success")
        end
        return idx, "updated"
    else
        local isChar = isPerChar or false
        local newIdx = CreateMacro(macroName, icon, macroBody, isChar)
        if self.Notify then
            self:Notify(string.format(self.L["Created macro '%s'!"] or "Created macro '%s'!", macroName), "success")
        end
        return newIdx, "created"
    end
end

-- Standalone-Safe Public API & Decoupled UltimaBridge Registration
local bridge = _G.UltimaBridge or _G.GnomiesBridge
if bridge and bridge.RegisterService then
    bridge:RegisterService("MacroMaker", {
        CreateOrUpdateMacro = function(macroName, macroBody, macroIcon, isPerChar)
            return MM:CreateOrUpdateMacro(macroName, macroBody, macroIcon, isPerChar)
        end,
        OpenWithMacro = function(macroName, macroBody, macroIcon)
            return MM:OpenWithMacro(macroName, macroBody, macroIcon)
        end,
    })
end

if bridge and bridge.RegisterLauncherItem then
    bridge:RegisterLauncherItem("MacroMaker", {
        callback = function()
            if MM.ToggleUI then MM:ToggleUI() end
        end,
        statusFunc = function()
            return "Macro Studio Ready"
        end,
    })
end



