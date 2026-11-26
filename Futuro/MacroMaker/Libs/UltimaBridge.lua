--[[
    UltimaBridge.lua (formerly GnomiesBridge.lua)
    Ultra-lightweight, decoupled pub/sub event, service bus and master dashboard for the Ultima AddOn Suite.
    World of Warcraft Retail (12.x / Midnight 12.1)
    
    GUARANTEE:
    - 100% Standalone-Safe: If loaded in isolation, functions as a local registry with zero errors.
    - Zero Hard Dependencies: No AddOn requires another AddOn in .toc.
    - Safe Execution: All event triggers and service calls are protected against Lua errors and UI-Taint.
    - Backward Compatibility: Fully aliases both _G.UltimaBridge and _G.GnomiesBridge.
]]

local AddOnName, ns = ...

_G.UltimaBridge = _G.UltimaBridge or _G.GnomiesBridge or {}
_G.GnomiesBridge = _G.UltimaBridge
local Bridge = _G.UltimaBridge

if not Bridge._version or Bridge._version < 16 then
    Bridge._version = 16
    if _G["UltimaSuiteToastFrame"] then
        _G["UltimaSuiteToastFrame"]:ClearAllPoints()
        if Bridge.Mover and Bridge.Mover.RestorePosition then
            Bridge.Mover:RestorePosition(_G["UltimaSuiteToastFrame"], "UltimaSuiteToastFrame", "TOP", 0, -165)
        else
            _G["UltimaSuiteToastFrame"]:SetPoint("TOP", UIParent, "TOP", 0, -165)
        end
    end
    Bridge.services = Bridge.services or {}
    Bridge.listeners = Bridge.listeners or {}
    Bridge.launcherItems = Bridge.launcherItems or {}

    -- Canonical Localization Table (English is Standard / Default, 11 Client Languages)
    local clientLocale = (GetLocale and GetLocale()) or "enUS"
    local LOCALES = {
        enUS = {
            MOVER_MODE = "Mover Mode",
            MOVER_DRAG_HINT = "(Drag to move)",
            RESET = "Reset",
            DONE = "Done",
            MOVER_ACTIVE = "Mover mode active. Drag frames to reposition.",
            MOVER_SAVED = "Mover mode closed. Positions saved.",
            MOVER_RESET_DONE = "All window positions reset to default.",
            MOVER_COMBAT_ERR = "Mover cannot be opened during combat.",
            TOAST_NOTIFS = "Toast Notifications",
            DIGEST_BATCH = "%d notifications received while loading.",
            ACTION_SUCCESS = "Action Successful",
            NOTICE = "Notice",
            ERROR = "Error",
            NOTIFICATION = "Notification",
            EVENT = "Event",
            UI_MOVER = "UI Mover",
        },
        deDE = {
            MOVER_MODE = "Mover-Modus",
            MOVER_DRAG_HINT = "(Ziehen zum Verschieben)",
            RESET = "Zurücksetzen",
            DONE = "Fertig",
            MOVER_ACTIVE = "Mover-Modus aktiv. Ziehe die Boxen an die gewünschte Position.",
            MOVER_SAVED = "Mover-Modus beendet. Positionen gespeichert.",
            MOVER_RESET_DONE = "Alle Fenster-Positionen auf Standard zurückgesetzt.",
            MOVER_COMBAT_ERR = "Mover kann während des Kampfes nicht geöffnet werden.",
            TOAST_NOTIFS = "Toast-Benachrichtigungen",
            DIGEST_BATCH = "%d Benachrichtigungen während des Ladens empfangen.",
            ACTION_SUCCESS = "Aktion erfolgreich",
            NOTICE = "Hinweis",
            ERROR = "Fehler",
            NOTIFICATION = "Benachrichtigung",
            EVENT = "Ereignis",
            UI_MOVER = "UI Mover",
        },
        esES = {
            MOVER_MODE = "Modo Movimiento",
            MOVER_DRAG_HINT = "(Arrastrar para mover)",
            RESET = "Restablecer",
            DONE = "Listo",
            MOVER_ACTIVE = "Modo movimiento activo. Arrastra los marcos para reposicionarlos.",
            MOVER_SAVED = "Modo movimiento cerrado. Posiciones guardadas.",
            MOVER_RESET_DONE = "Todas las posiciones de las ventanas se han restablecido.",
            MOVER_COMBAT_ERR = "El organizador no se puede abrir durante el combate.",
            TOAST_NOTIFS = "Notificaciones emergentes",
            DIGEST_BATCH = "%d notificaciones recibidas durante la carga.",
            ACTION_SUCCESS = "Acción exitosa",
            NOTICE = "Aviso",
            ERROR = "Error",
            NOTIFICATION = "Notificación",
            EVENT = "Evento",
            UI_MOVER = "Mover interfaz",
        },
        esMX = {
            MOVER_MODE = "Modo Movimiento",
            MOVER_DRAG_HINT = "(Arrastrar para mover)",
            RESET = "Restablecer",
            DONE = "Listo",
            MOVER_ACTIVE = "Modo movimiento activo. Arrastra los marcos para reposicionarlos.",
            MOVER_SAVED = "Modo movimiento cerrado. Posiciones guardadas.",
            MOVER_RESET_DONE = "Todas las posiciones de las ventanas se han restablecido.",
            MOVER_COMBAT_ERR = "El organizador no se puede abrir durante el combate.",
            TOAST_NOTIFS = "Notificaciones emergentes",
            DIGEST_BATCH = "%d notificaciones recibidas durante la carga.",
            ACTION_SUCCESS = "Acción exitosa",
            NOTICE = "Aviso",
            ERROR = "Error",
            NOTIFICATION = "Notificación",
            EVENT = "Evento",
            UI_MOVER = "Mover interfaz",
        },
        frFR = {
            MOVER_MODE = "Mode Déplacement",
            MOVER_DRAG_HINT = "(Glisser pour déplacer)",
            RESET = "Réinitialiser",
            DONE = "Terminé",
            MOVER_ACTIVE = "Mode déplacement actif. Faites glisser les fenêtres pour les repositionner.",
            MOVER_SAVED = "Mode déplacement fermé. Positions enregistrées.",
            MOVER_RESET_DONE = "Toutes les positions des fenêtres ont été réinitialisées.",
            MOVER_COMBAT_ERR = "Le gestionnaire ne peut pas être ouvert en combat.",
            TOAST_NOTIFS = "Notifications toast",
            DIGEST_BATCH = "%d notifications reçues pendant le chargement.",
            ACTION_SUCCESS = "Action réussie",
            NOTICE = "Avis",
            ERROR = "Erreur",
            NOTIFICATION = "Notification",
            EVENT = "Événement",
            UI_MOVER = "Déplacer l'IU",
        },
        itIT = {
            MOVER_MODE = "Modalità Sposta",
            MOVER_DRAG_HINT = "(Trascina per spostare)",
            RESET = "Reimposta",
            DONE = "Fatto",
            MOVER_ACTIVE = "Modalità spostamento attiva. Trascina i riquadri per riposizionarli.",
            MOVER_SAVED = "Modalità spostamento chiusa. Posizioni salvate.",
            MOVER_RESET_DONE = "Tutte le posizioni delle finestre sono state ripristinate.",
            MOVER_COMBAT_ERR = "Il gestore non può essere aperto durante il combattimento.",
            TOAST_NOTIFS = "Notifiche toast",
            DIGEST_BATCH = "%d notifiche ricevute durante il caricamento.",
            ACTION_SUCCESS = "Azione riuscita",
            NOTICE = "Avviso",
            ERROR = "Errore",
            NOTIFICATION = "Notifica",
            EVENT = "Evento",
            UI_MOVER = "Sposta UI",
        },
        koKR = {
            MOVER_MODE = "이동 모드",
            MOVER_DRAG_HINT = "(드래그하여 이동)",
            RESET = "초기화",
            DONE = "완료",
            MOVER_ACTIVE = "이동 모드 활성화. 프레임을 드래그하여 위치를 조정하세요.",
            MOVER_SAVED = "이동 모드 종료. 위치가 저장되었습니다.",
            MOVER_RESET_DONE = "모든 창 위치가 기본값으로 초기화되었습니다.",
            MOVER_COMBAT_ERR = "전투 중에는 이동 모드를 열 수 없습니다.",
            TOAST_NOTIFS = "토스트 알림",
            DIGEST_BATCH = "로딩 중 %d개의 알림을 받았습니다.",
            ACTION_SUCCESS = "작업 성공",
            NOTICE = "알림",
            ERROR = "오류",
            NOTIFICATION = "알림",
            EVENT = "이벤트",
            UI_MOVER = "UI 이동",
        },
        ptBR = {
            MOVER_MODE = "Modo Mover",
            MOVER_DRAG_HINT = "(Arraste para mover)",
            RESET = "Redefinir",
            DONE = "Concluir",
            MOVER_ACTIVE = "Modo mover ativo. Arraste os quadros para reposicionar.",
            MOVER_SAVED = "Modo mover fechado. Posições salvas.",
            MOVER_RESET_DONE = "Todas as posições das janelas foram redefinidas para o padrão.",
            MOVER_COMBAT_ERR = "O organizador não pode ser aberto durante o combate.",
            TOAST_NOTIFS = "Notificações Toast",
            DIGEST_BATCH = "%d notificações recebidas durante o carregamento.",
            ACTION_SUCCESS = "Ação bem-sucedida",
            NOTICE = "Aviso",
            ERROR = "Erro",
            NOTIFICATION = "Notificação",
            EVENT = "Evento",
            UI_MOVER = "Mover IU",
        },
        ruRU = {
            MOVER_MODE = "Режим перемещения",
            MOVER_DRAG_HINT = "(Перетащите)",
            RESET = "Сброс",
            DONE = "Готово",
            MOVER_ACTIVE = "Режим перемещения активен. Перетащите панели на нужное место.",
            MOVER_SAVED = "Режим перемещения закрыт. Позиции сохранены.",
            MOVER_RESET_DONE = "Все позиции окон сброшены по умолчанию.",
            MOVER_COMBAT_ERR = "Нельзя открывать режим перемещения в бою.",
            TOAST_NOTIFS = "Всплывающие уведомления",
            DIGEST_BATCH = "Получено %d уведомлений во время загрузки.",
            ACTION_SUCCESS = "Действие успешно",
            NOTICE = "Уведомление",
            ERROR = "Ошибка",
            NOTIFICATION = "Оповещение",
            EVENT = "Событие",
            UI_MOVER = "Перемещение интерфейса",
        },
        zhCN = {
            MOVER_MODE = "移动模式",
            MOVER_DRAG_HINT = "(拖动以移动)",
            RESET = "重置",
            DONE = "完成",
            MOVER_ACTIVE = "移动模式已激活。拖动框架以重新定位。",
            MOVER_SAVED = "移动模式已关闭。位置已保存。",
            MOVER_RESET_DONE = "所有窗口位置均已重置为默认值。",
            MOVER_COMBAT_ERR = "战斗中无法打开移动模式。",
            TOAST_NOTIFS = "浮动通知",
            DIGEST_BATCH = "加载时收到 %d 条通知。",
            ACTION_SUCCESS = "操作成功",
            NOTICE = "提示",
            ERROR = "错误",
            NOTIFICATION = "通知",
            EVENT = "事件",
            UI_MOVER = "移动界面",
        },
        zhTW = {
            MOVER_MODE = "移動模式",
            MOVER_DRAG_HINT = "(拖曳以移動)",
            RESET = "重設",
            DONE = "完成",
            MOVER_ACTIVE = "移動模式已啟用。拖曳框架以重新定位。",
            MOVER_SAVED = "移動模式已關閉。位置已儲存。",
            MOVER_RESET_DONE = "所有視窗位置已重設為預設值。",
            MOVER_COMBAT_ERR = "戰鬥中無法開啟移動模式。",
            TOAST_NOTIFS = "浮動通知",
            DIGEST_BATCH = "載入時收到 %d 則通知。",
            ACTION_SUCCESS = "操作成功",
            NOTICE = "提示",
            ERROR = "錯誤",
            NOTIFICATION = "通知",
            EVENT = "事件",
            UI_MOVER = "移動介面",
        },
    }

    Bridge.L = setmetatable(LOCALES[clientLocale] or LOCALES.enUS, {
        __index = function(t, k)
            return (LOCALES.enUS and LOCALES.enUS[k]) or k
        end
    })
    local BL = Bridge.L
    
    -- Canonical Suite Events
    Bridge.Events = {
        ULTIMA_THEME_CHANGED = "ULTIMA_THEME_CHANGED",
        WUE_LOOT_DETECTED = "WUE_LOOT_DETECTED",
        HOUSING_SHOPPING_LIST_UPDATED = "HOUSING_SHOPPING_LIST_UPDATED",
        HOUSING_BLUEPRINT_SAVED = "HOUSING_BLUEPRINT_SAVED",
        HOUSING_GUESTBOOK_UPDATED = "HOUSING_GUESTBOOK_UPDATED",
        LORE_BOOK_DISCOVERED = "LORE_BOOK_DISCOVERED",
        RAID_BREAK_TRIGGERED = "RAID_BREAK_TRIGGERED",
        ROSTER_KEYS_UPDATED = "ROSTER_KEYS_UPDATED",
        DEFENSIVE_CD_TRIGGERED = "DEFENSIVE_CD_TRIGGERED",
        ENCOUNTER_PHASE_CHANGED = "ENCOUNTER_PHASE_CHANGED",
        GGC_OPPONENT_MOVE = "GGC_OPPONENT_MOVE",
        GUILD_ARCADE_SCORE_SYNC = "GUILD_ARCADE_SCORE_SYNC",
        TOAST_TRIGGERED = "TOAST_TRIGGERED",
    }

    -- Default Catalog of Suite AddOns (Ensures dashboard always has full visibility for all 16 modules)
    Bridge.DEFAULT_ITEMS = {
        { id = "ChampionCompanion", name = "Champion Companion", category = "Combat & Gear", icon = 132623, slash = "/cc", desc = "Smart Gear, Stats, Inventory Optimization & Great Vault Predictor." },
        { id = "MacroMaker", name = "Macro Maker", category = "Combat & Gear", icon = 134400, slash = "/mm", desc = "Visual Drag & Drop Macro Studio, Spec Starter-Kits & Sequence Lab." },
        { id = "BattleSentinel", name = "Battle Sentinel", category = "Combat & Gear", icon = 4638734, slash = "/battle", desc = "Live Group Buff Audit, Keystones, Equipment Surveillance & Teammate Dossier." },
        { id = "ActionRing", name = "Action Ring", category = "Combat & Gear", icon = 132623, slash = "/ar", desc = "Radial Quick-Action Engine & Pie Menu Suite." },
        { id = "RoutineAssistant", name = "Routine Assistant", category = "QoL & Management", icon = 136243, slash = "/ra", desc = "Auto-Repair, Auto-Sell, Mythic+ Forces HUD & DamageMeter/InfoBar Suite." },
        { id = "GuildSteward", name = "Guild Steward", category = "QoL & Management", icon = 236415, slash = "/gs", desc = "Activity & Audit Logging, Officer Tools, Recruitment & Arcade Hall of Fame." },
        { id = "VaultMaster", name = "Vault Master", category = "QoL & Management", icon = 133644, slash = "/vm", desc = "All-in-One Inventory, Bank & Warband Vault Suite." },
        { id = "CommerceHub", name = "Commerce Hub", category = "QoL & Management", icon = 133785, slash = "/ch", desc = "Auction House, Market Intelligence & Shopping Suite." },
        { id = "DebugConsole", name = "Debug Console", category = "QoL & Management", icon = 136243, slash = "/dc", desc = "Real-time Lua Error & Performance Monitor." },
        { id = "LoreArchive", name = "Lore Archive", category = "World & Story", icon = 134427, slash = "/lore", desc = "Living Warcraft Encyclopedia, TTS Storyteller, Interactive Timeline & Cutscenes." },
        { id = "HomeDesigner", name = "Home Designer", category = "World & Story", icon = 4549141, slash = "/hd", desc = "Player Housing 3D Catalog, Blueprint Sharing & Daily Treasure Radar." },
        { id = "MenagerieKeeper", name = "Menagerie Keeper", category = "World & Story", icon = 646379, slash = "/zoo", desc = "Battle Pet Safari Radar, 120+ Trainer Counters & Family Familiar Matrix." },
        { id = "DialogueNarrator", name = "Dialogue Narrator", category = "World & Story", icon = 134427, slash = "/dn", desc = "Cinematic Dialogue Experience, TTS Voice Acting & Immersive Interaction." },
        { id = "TrophyHunter", name = "Trophy Hunter", category = "World & Story", icon = 133878, slash = "/th", desc = "Rare Entity, Vignette & Treasure Radar with Audio-Visual Alerts." },
        { id = "CameraDirector", name = "Camera Director", category = "World & Story", icon = 134440, slash = "/cd", desc = "Dynamic Cinematic Camera & Perspective Suite." },
        { id = "GameConsole", name = "Game Console", category = "Arcade", icon = 133878, slash = "/gc", desc = "Master Arcade Hub with 17 Integrated Minigames, Jukebox & Cross-Game Cog-Credits." },
    }
    
    --- Registers a service provider table under a unique key.
    --- @param serviceName string Name of the service (e.g. "ChampionCompanion", "MacroMaker")
    --- @param serviceTable table The table containing public methods
    function Bridge:RegisterService(serviceName, serviceTable)
        if not serviceName or not serviceTable then return end
        self.services[serviceName] = serviceTable
        self:Trigger("SERVICE_REGISTERED", serviceName, serviceTable)
    end
    
    --- Retrieves a registered service table, or nil if not loaded.
    --- @param serviceName string
    --- @return table|nil
    function Bridge:GetService(serviceName)
        return self.services[serviceName]
    end
    
    --- Checks if a specific service is registered and available.
    --- @param serviceName string
    --- @return boolean
    function Bridge:HasService(serviceName)
        return self.services[serviceName] ~= nil
    end

    --- Registers launcher metadata for an AddOn.
    --- @param addonID string|table
    --- @param info table|nil { name, category, icon, slash, desc, callback, statusFunc }
    function Bridge:RegisterLauncherItem(addonID, info)
        if type(addonID) == "table" and not info then
            info = addonID
            addonID = info.id
        end
        if not addonID or not info then return end

        -- Normalize legacy / alternative IDs
        if addonID == "ZooManager" or addonID == "GnomiesZOOManager" then addonID = "MenagerieKeeper" end
        if addonID == "RaidSupport" or addonID == "GnomiesRaidSupport" or addonID == "RaidSentinel" or addonID == "GroupSentinel" then addonID = "BattleSentinel" end
        if addonID == "GuildHelper" or addonID == "GnomiesGuildManager" then addonID = "GuildSteward" end
        if addonID == "debugconsole" then addonID = "DebugConsole" end

        self.launcherItems[addonID] = self.launcherItems[addonID] or {}
        for k, v in pairs(info) do
            self.launcherItems[addonID][k] = v
        end
        self.launcherItems[addonID].id = addonID
    end

    function Bridge:GetLauncherItems()
        local list = {}
        local seen = {}
        for _, def in ipairs(self.DEFAULT_ITEMS) do
            local item = CopyTable(def)
            if self.launcherItems[def.id] then
                for k, v in pairs(self.launcherItems[def.id]) do
                    item[k] = v
                end
            end
            item.isLoaded = (C_AddOns and C_AddOns.IsAddOnLoaded and C_AddOns.IsAddOnLoaded(def.id)) or (_G[def.id] ~= nil)
            table.insert(list, item)
            seen[def.id] = true
        end
        for id, itemData in pairs(self.launcherItems) do
            if not seen[id] then
                local item = CopyTable(itemData)
                item.name = item.name or id
                item.category = item.category or "QoL & Management"
                item.desc = item.desc or item.tooltip or ""
                item.slash = item.slash or ""
                item.isLoaded = (C_AddOns and C_AddOns.IsAddOnLoaded and C_AddOns.IsAddOnLoaded(id)) or (_G[id] ~= nil)
                table.insert(list, item)
                seen[id] = true
            end
        end
        return list
    end
    
    --- Registers a callback for a specific suite event.
    --- @param event string Event name
    --- @param callback function
    function Bridge:RegisterCallback(event, callback)
        if not event or type(callback) ~= "function" then return end
        self.listeners[event] = self.listeners[event] or {}
        table.insert(self.listeners[event], callback)
    end
    
    --- Unregisters a callback for a specific suite event.
    --- @param event string
    --- @param callback function
    function Bridge:UnregisterCallback(event, callback)
        local cbs = self.listeners[event]
        if not cbs then return end
        for i = #cbs, 1, -1 do
            if cbs[i] == callback then
                table.remove(cbs, i)
            end
        end
    end
    
    --- Triggers a suite event, executing all registered callbacks safely.
    --- @param event string
    --- @param ... any Arguments passed to the callback
    function Bridge:Trigger(event, ...)
        local cbs = self.listeners[event]
        if cbs then
            for _, cb in ipairs(cbs) do
                pcall(cb, ...)
            end
        end
    end

    Bridge.TriggerEvent = Bridge.Trigger
    Bridge.RegisterEvent = Bridge.RegisterCallback

    ----------------------------------------------------------------------------
    -- UltimaTheme: Universal Theme Engine & Window Skinner
    -- Seamlessly toggles between "BLIZZARD" (Classic Portrait) and "MINIMALIST" (Modern Dark)
    ----------------------------------------------------------------------------
    Bridge.Theme = Bridge.Theme or {}
    local Theme = Bridge.Theme
    _G.UltimaTheme = Theme

    Theme.THEMES = {
        BLIZZARD = "BLIZZARD",
        MINIMALIST = "MINIMALIST",
    }

    Theme.currentTheme = "BLIZZARD"
    Theme.registeredWindows = Theme.registeredWindows or {}

    function Theme:Init()
        _G.UltimaSuiteDB = _G.UltimaSuiteDB or {}
        if _G.UltimaSuiteDB.theme then
            self.currentTheme = _G.UltimaSuiteDB.theme
        else
            self.currentTheme = "BLIZZARD"
        end
    end

    function Theme:GetTheme()
        if not self.currentTheme then self:Init() end
        return self.currentTheme or "BLIZZARD"
    end

    function Theme:SetTheme(newTheme, sourceAddon)
        if newTheme ~= "BLIZZARD" and newTheme ~= "MINIMALIST" then return end
        self.currentTheme = newTheme
        _G.UltimaSuiteDB = _G.UltimaSuiteDB or {}
        _G.UltimaSuiteDB.theme = newTheme
        for frame, winData in pairs(self.registeredWindows) do
            self:ApplyThemeToWindow(winData, newTheme)
        end
        if Bridge.Trigger then
            Bridge:Trigger(Bridge.Events.ULTIMA_THEME_CHANGED, newTheme, sourceAddon)
        end
    end

    function Theme:ToggleTheme()
        local nextTheme = (self:GetTheme() == "MINIMALIST") and "BLIZZARD" or "MINIMALIST"
        self:SetTheme(nextTheme)
        return nextTheme
    end

    function Theme:ApplyThemeToWindow(winData, themeID)
        themeID = themeID or self:GetTheme()
        if winData and winData.onApplyTheme then
            pcall(winData.onApplyTheme, themeID)
        end
    end

    ----------------------------------------------------------------------------
    -- UltimaWindowManager: Suite-wide Window Coordination & Mutual Exclusivity
    ----------------------------------------------------------------------------
    Bridge.WindowManager = Bridge.WindowManager or {}
    local WM = Bridge.WindowManager
    _G.UltimaWindowManager = WM

    WM.majorWindows = WM.majorWindows or {}

    --- Registers a major suite window for coordination (mutual exclusivity & combat close).
    --- @param frame Frame The window frame
    --- @param config table (optional: { isMajor = true, autoCloseOnCombat = true })
    function WM:RegisterMajorWindow(frame, config)
        if not frame then return end
        config = config or {}
        local isMajor = (config.isMajor == true)
        local autoCloseCombat = (config.autoCloseOnCombat ~= false)

        WM.majorWindows[frame] = {
            frame = frame,
            isMajor = isMajor,
            autoCloseOnCombat = autoCloseCombat,
        }

        if not frame._wmHooked then
            frame._wmHooked = true
            frame:HookScript("OnShow", function(shownFrame)
                local cur = WM.majorWindows[shownFrame]
                if not shownFrame or not cur or not cur.isMajor then
                    return
                end
                -- Close other major suite windows to avoid screen clutter and stacking
                for otherFrame, data in pairs(WM.majorWindows) do
                    if otherFrame ~= shownFrame and data.isMajor and otherFrame:IsShown() then
                        otherFrame:Hide()
                    end
                end
            end)
        end
    end

    function WM:Init()
        if self._initialized then return end
        self._initialized = true

        -- Auto-close non-combat major windows on combat start to protect combat view
        local eventFrame = CreateFrame("Frame")
        eventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
        eventFrame:SetScript("OnEvent", function(_, event)
            if event == "PLAYER_REGEN_DISABLED" then
                for frame, data in pairs(WM.majorWindows) do
                    if data.autoCloseOnCombat and frame:IsShown() then
                        frame:Hide()
                    end
                end
            end
        end)

        -- Close major suite windows when Blizzard full UI panels open
        if hooksecurefunc then
            hooksecurefunc("ShowUIPanel", function(panel)
                if panel then
                    local pName = panel.GetName and panel:GetName()
                    if pName == "BankFrame" or pName == "GuildBankFrame" or pName == "ContainerFrameCombinedBags" then
                        return
                    end
                    for frame, data in pairs(WM.majorWindows) do
                        if frame ~= panel and data.isMajor and frame:IsShown() then
                            frame:Hide()
                        end
                    end
                end
            end)
        end
    end
    WM:Init()

    function Theme:RegisterWindow(frame, options)
        if not frame then return end
        options = options or {}
        local winData = {
            frame = frame,
            id = options.id or (frame.GetName and frame:GetName()) or "UnknownWindow",
            title = options.title or (frame.GetTitle and frame:GetTitle()) or "",
            icon = options.icon or 132623,
            isPortraitTemplate = options.isPortraitTemplate == true,
            header = options.header,
            closeBtn = options.closeBtn,
            onApplyTheme = options.onApplyTheme,
        }
        self.registeredWindows[frame] = winData

        -- 1. Ensure a standard Close Button exists on the frame!
        local closeBtn = frame.CloseButton or frame._blizzardCloseBtn or winData.closeBtn
        if not closeBtn then
            closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
            closeBtn:SetSize(22, 22)
            closeBtn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -3, -1)
            closeBtn:SetScript("OnClick", function() frame:Hide() end)
            frame.CloseButton = closeBtn
            frame._blizzardCloseBtn = closeBtn
        end
        closeBtn:Show()

        local function ElevateTitleButtons(f)
            if not f then return end
            local topLevel = f:GetFrameLevel() + 30
            if f.NineSlice and f.NineSlice.GetFrameLevel then
                topLevel = math.max(topLevel, f.NineSlice:GetFrameLevel() + 20)
            end
            if f.TitleContainer and f.TitleContainer.GetFrameLevel then
                topLevel = math.max(topLevel, f.TitleContainer:GetFrameLevel() + 20)
            end
            topLevel = math.max(topLevel, 200)

            local cBtn = f.CloseButton or f._blizzardCloseBtn
            if cBtn then
                cBtn:SetFrameLevel(topLevel)
                if cBtn.Raise then cBtn:Raise() end
            end

            local sBtn = f.settingsBtn or f.SettingsBtn or f.SettingsButton or f.optBtn
            if sBtn and sBtn.SetFrameLevel then
                sBtn:SetFrameLevel(topLevel + 1)
                if sBtn.Raise then sBtn:Raise() end
            end
        end

        ElevateTitleButtons(frame)

        if not frame._titleBtnsHooked then
            frame._titleBtnsHooked = true
            frame:HookScript("OnShow", ElevateTitleButtons)
        end

        -- 2. Automatically register into UISpecialFrames so ESC key always closes the frame!
        local fName = (frame.GetName and frame:GetName()) or options.id
        if fName and type(fName) == "string" and fName ~= "" and _G[fName] then
            local found = false
            for _, name in ipairs(UISpecialFrames) do
                if name == fName then found = true; break end
            end
            if not found then
                tinsert(UISpecialFrames, fName)
            end
        end

        -- 3. Register with WindowManager for mutual exclusivity & combat auto-close
        if WM and WM.RegisterMajorWindow then
            WM:RegisterMajorWindow(frame, {
                isMajor = (options.isMajor == true),
                autoCloseOnCombat = (options.autoCloseOnCombat ~= false),
            })
        end

        if winData.onApplyTheme then
            pcall(winData.onApplyTheme, self:GetTheme())
        end
    end

    --- Returns standardized backdrop configuration and colors for UI elements.
    --- @param kind string "WINDOW"|"INSET"|"TAB"|"BUTTON"|"PILL"|"CARD"|"ROW"|"EMPTY_ROW"|"BADGE"|"TILE"|"ICON_BOX"
    --- @param isSelected boolean (optional)
    --- @param themeID string (optional) "BLIZZARD" or "MINIMALIST"
    --- @return table backdropTable, table bgColor, table borderColor
    function Theme:GetBackdrop(kind, isSelected, themeID)
        themeID = themeID or self:GetTheme()
        local isMinimal = (themeID == "MINIMALIST")
        kind = kind or "CARD"

        if kind == "INSET" then
            if isMinimal then
                return {
                    bgFile = "Interface\\Buttons\\WHITE8x8",
                    edgeFile = "Interface\\Buttons\\WHITE8x8",
                    edgeSize = 1,
                    insets = { left = 0, right = 0, top = 0, bottom = 0 }
                }, { 0.05, 0.05, 0.07, 0.90 }, { 0.18, 0.20, 0.25, 0.80 }
            else
                return {
                    bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
                    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                    tile = true, tileSize = 12, edgeSize = 12,
                    insets = { left = 3, right = 3, top = 3, bottom = 3 }
                }, { 0.06, 0.06, 0.08, 0.70 }, { 0.18, 0.18, 0.20, 0.80 }
            end
        elseif kind == "TAB" then
            if isMinimal then
                local bg = isSelected and { 0.16, 0.16, 0.20, 0.98 } or { 0.10, 0.10, 0.13, 0.90 }
                local border = isSelected and { 1.0, 0.82, 0.0, 1.0 } or { 0.20, 0.22, 0.26, 0.80 }
                return {
                    bgFile = "Interface\\Buttons\\WHITE8x8",
                    edgeFile = "Interface\\Buttons\\WHITE8x8",
                    edgeSize = 1,
                    insets = { left = 0, right = 0, top = 0, bottom = 0 }
                }, bg, border
            else
                local bg = isSelected and { 0.20, 0.20, 0.24, 0.95 } or { 0.16, 0.16, 0.18, 0.90 }
                local border = isSelected and { 0.78, 0.61, 0.43, 1.0 } or { 0.30, 0.30, 0.30, 0.80 }
                return {
                    bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
                    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                    tile = true, tileSize = 12, edgeSize = 12,
                    insets = { left = 3, right = 3, top = 3, bottom = 3 }
                }, bg, border
            end
        elseif kind == "BUTTON" then
            if isMinimal then
                return {
                    bgFile = "Interface\\Buttons\\WHITE8x8",
                    edgeFile = "Interface\\Buttons\\WHITE8x8",
                    edgeSize = 1,
                    insets = { left = 0, right = 0, top = 0, bottom = 0 }
                }, { 0.11, 0.12, 0.15, 0.95 }, { 0.24, 0.26, 0.32, 0.90 }
            else
                return {
                    bgFile = "Interface\\Buttons\\WHITE8x8",
                    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                    tile = false, tileSize = 8, edgeSize = 8,
                    insets = { left = 2, right = 2, top = 2, bottom = 2 }
                }, { 0.14, 0.14, 0.17, 0.95 }, { 0.35, 0.32, 0.28, 0.80 }
            end
        elseif kind == "PILL" then
            if isMinimal then
                local bg = isSelected and { 0.20, 0.18, 0.13, 0.95 } or { 0.10, 0.10, 0.13, 0.90 }
                local border = isSelected and { 0.85, 0.70, 0.25, 1.0 } or { 0.20, 0.22, 0.26, 0.80 }
                return {
                    bgFile = "Interface\\Buttons\\WHITE8x8",
                    edgeFile = "Interface\\Buttons\\WHITE8x8",
                    edgeSize = 1,
                    insets = { left = 0, right = 0, top = 0, bottom = 0 }
                }, bg, border
            else
                local bg = isSelected and { 0.20, 0.18, 0.13, 0.95 } or { 0.12, 0.12, 0.14, 0.90 }
                local border = isSelected and { 0.85, 0.70, 0.25, 1.0 } or { 0.24, 0.24, 0.28, 0.80 }
                return {
                    bgFile = "Interface\\Buttons\\WHITE8x8",
                    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                    tile = false, tileSize = 8, edgeSize = 8,
                    insets = { left = 2, right = 2, top = 2, bottom = 2 }
                }, bg, border
            end
        elseif kind == "CARD" then
            if isMinimal then
                return {
                    bgFile = "Interface\\Buttons\\WHITE8x8",
                    edgeFile = "Interface\\Buttons\\WHITE8x8",
                    edgeSize = 1,
                    insets = { left = 0, right = 0, top = 0, bottom = 0 }
                }, { 0.07, 0.07, 0.09, 0.92 }, { 0.18, 0.20, 0.25, 0.80 }
            else
                return {
                    bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
                    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                    tile = true, tileSize = 12, edgeSize = 12,
                    insets = { left = 3, right = 3, top = 3, bottom = 3 }
                }, { 0.09, 0.09, 0.11, 0.85 }, { 0.24, 0.24, 0.28, 0.70 }
            end
        elseif kind == "ROW" then
            if isMinimal then
                return {
                    bgFile = "Interface\\Buttons\\WHITE8x8",
                    edgeFile = "Interface\\Buttons\\WHITE8x8",
                    edgeSize = 1,
                    insets = { left = 0, right = 0, top = 0, bottom = 0 }
                }, { 0.08, 0.08, 0.10, 0.85 }, { 0.18, 0.20, 0.24, 0.80 }
            else
                return {
                    bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
                    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                    tile = true, tileSize = 8, edgeSize = 8,
                    insets = { left = 2, right = 2, top = 2, bottom = 2 }
                }, { 0.10, 0.10, 0.13, 0.75 }, { 0.22, 0.22, 0.26, 0.70 }
            end
        elseif kind == "EMPTY_ROW" then
            if isMinimal then
                return {
                    bgFile = "Interface\\Buttons\\WHITE8x8",
                    edgeFile = "Interface\\Buttons\\WHITE8x8",
                    edgeSize = 1,
                    insets = { left = 0, right = 0, top = 0, bottom = 0 }
                }, { 0.06, 0.06, 0.08, 0.60 }, { 0.14, 0.14, 0.18, 0.60 }
            else
                return {
                    bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
                    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                    tile = true, tileSize = 8, edgeSize = 8,
                    insets = { left = 2, right = 2, top = 2, bottom = 2 }
                }, { 0.08, 0.08, 0.10, 0.50 }, { 0.18, 0.18, 0.22, 0.50 }
            end
        elseif kind == "BADGE" then
            if isMinimal then
                return {
                    bgFile = "Interface\\Buttons\\WHITE8x8",
                    edgeFile = "Interface\\Buttons\\WHITE8x8",
                    edgeSize = 1,
                    insets = { left = 0, right = 0, top = 0, bottom = 0 }
                }, { 0.06, 0.18, 0.09, 0.90 }, { 0.20, 0.65, 0.30, 0.90 }
            else
                return {
                    bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
                    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                    tile = true, tileSize = 8, edgeSize = 10,
                    insets = { left = 2, right = 2, top = 2, bottom = 2 }
                }, { 0.08, 0.22, 0.12, 0.90 }, { 0.20, 0.65, 0.30, 0.80 }
            end
        elseif kind == "TILE" then
            if isMinimal then
                return {
                    bgFile = "Interface\\Buttons\\WHITE8x8",
                    edgeFile = "Interface\\Buttons\\WHITE8x8",
                    edgeSize = 1,
                    insets = { left = 0, right = 0, top = 0, bottom = 0 }
                }, { 0.09, 0.09, 0.11, 0.70 }, { 0.18, 0.20, 0.24, 0.80 }
            else
                return {
                    bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
                    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                    tile = true, tileSize = 8, edgeSize = 8,
                    insets = { left = 2, right = 2, top = 2, bottom = 2 }
                }, { 0.10, 0.10, 0.12, 0.60 }, { 0.22, 0.22, 0.26, 0.70 }
            end
        elseif kind == "ICON_BOX" then
            return {
                edgeFile = "Interface\\Buttons\\WHITE8X8",
                edgeSize = 1,
                insets = { left = 0, right = 0, top = 0, bottom = 0 }
            }, { 0, 0, 0, 0 }, { 0.40, 0.35, 0.25, 0.80 }
        end

        return nil, nil, nil
    end

    --- Automatically applies standardized backdrop and colors to any frame.
    --- @param frame Frame
    --- @param kind string "WINDOW"|"INSET"|"TAB"|"BUTTON"|"PILL"|"CARD"|"ROW"|"EMPTY_ROW"|"BADGE"|"TILE"|"ICON_BOX"
    --- @param isSelected boolean (optional)
    --- @param themeID string (optional) "BLIZZARD" or "MINIMALIST"
    function Theme:ApplyBackdrop(frame, kind, isSelected, themeID)
        if not frame or not frame.SetBackdrop then return end
        local bd, bg, border = self:GetBackdrop(kind, isSelected, themeID)
        if bd then
            frame:SetBackdrop(bd)
            if bg and frame.SetBackdropColor then
                frame:SetBackdropColor(unpack(bg))
            end
            if border and frame.SetBackdropBorderColor then
                frame:SetBackdropBorderColor(unpack(border))
            end
        end
    end

    local themeInitFrame = CreateFrame("Frame")
    themeInitFrame:RegisterEvent("PLAYER_LOGIN")
    themeInitFrame:SetScript("OnEvent", function()
        Theme:Init()
    end)

    ----------------------------------------------------------------------------
    -- UltimaLogger: Standardized Suite Chat & Console Logging
    ----------------------------------------------------------------------------
    Bridge.Logger = Bridge.Logger or {}
    local Logger = Bridge.Logger

    Logger.LEVEL_COLORS = {
        info    = nil,
        success = "|cff00ff00",
        warning = "|cffffaa00",
        error   = "|cffff4444",
        cli     = "|cffffffff",
        cmd     = "|cffffffff",
        force   = nil,
    }

    --- Prints a standardized, formatted message to the default chat frame.
    --- Format: |cffffd100[AddOnName]|r Message
    --- Policy: Routine notifications are routed to Toasts or In-Frame UI. Chat is strictly reserved
    --- for CLI command feedback, fatal errors, or explicit opt-in (Bridge.enableSuiteChat == true).
    --- @param addonTag string (e.g. "Routine Assistant", "Guild Steward", etc.)
    --- @param msg string
    --- @param level string|nil "info"|"success"|"warning"|"error"|"cli"|"cmd"|"force"
    function Bridge:Print(addonTag, msg, level)
        if not (level == "error" or level == "cli" or level == "cmd" or level == "force" or Bridge.enableSuiteChat) then
            return
        end
        local tag = addonTag or "Ultima Suite"
        local color = Logger.LEVEL_COLORS[level]
        local body = tostring(msg or "")
        if color then
            body = color .. body .. "|r"
        end
        if DEFAULT_CHAT_FRAME and DEFAULT_CHAT_FRAME.AddMessage then
            DEFAULT_CHAT_FRAME:AddMessage(string.format("|cffffd100[%s]|r %s", tag, body))
        end
    end

    --- Prints an unformatted/raw message to the default chat frame.
    --- @param msg string
    function Bridge:RawPrint(msg)
        DEFAULT_CHAT_FRAME:AddMessage(tostring(msg or ""))
    end

    ----------------------------------------------------------------------------
    -- UltimaToast: Universal Suite-wide Toast Notification Engine
    -- Floating popups with animation, queue, hover-pause, audio, and click callbacks
    ----------------------------------------------------------------------------
    Bridge.Toast = Bridge.Toast or {
        queue = {},
        isShowing = false,
        frame = nil,
        history = {},
        loginGraceUntil = 0,
    }
    local Toast = Bridge.Toast
    Toast.frame = nil -- Ensure re-initialization with the 2.0 layout

    local toastLoginWatcher = CreateFrame("Frame")
    toastLoginWatcher:RegisterEvent("PLAYER_ENTERING_WORLD")
    toastLoginWatcher:SetScript("OnEvent", function()
        Toast.loginGraceUntil = GetTime() + 6.0
    end)

    Toast.TOAST_TYPES = {
        info    = { r = 0.25, g = 0.78, b = 1.00, sound = 31578 }, -- Sky / Blizzard Blue
        success = { r = 0.20, g = 0.90, b = 0.40, sound = 31578 }, -- Emerald Green
        warning = { r = 1.00, g = 0.65, b = 0.00, sound = 8959 },  -- Amber
        error   = { r = 1.00, g = 0.25, b = 0.25, sound = 8959 },  -- Coral Red
        upgrade = { r = 0.64, g = 0.21, b = 0.93, sound = 31578 }, -- Epic Violet
    }

    local KNOWN_ADDON_CATEGORIES = {
        ["Guild Steward"] = "GILDE",
        ["Vault Master"] = "INVENTAR",
        ["Routine Assistant"] = "ROUTINE",
        ["Champion Companion"] = "CHAMPION",
        ["Game Console"] = "ARCADE",
        ["Home Designer"] = "HOUSING",
        ["Lore Archive"] = "LORE",
        ["Battle Sentinel"] = "SENTINEL",
        ["Commerce Hub"] = "HANDEL",
        ["Menagerie Keeper"] = "SAFARI",
        ["Dialogue Narrator"] = "STORY",
        ["Macro Maker"] = "MAKRO",
        ["Action Ring"] = "ACTION",
        ["Debug Console"] = "DEBUG",
        ["Ultima Suite"] = "SYSTEM",
    }

    function Toast:Init()
        if self.frame then return end

        local f = _G["UltimaSuiteToastFrame"] or CreateFrame("Button", "UltimaSuiteToastFrame", UIParent, "BackdropTemplate")
        f:SetSize(340, 68)
        f:ClearAllPoints()
        if Bridge.Mover and Bridge.Mover.RestorePosition then
            Bridge.Mover:RestorePosition(f, "UltimaSuiteToastFrame", "TOP", 0, -165)
        else
            f:SetPoint("TOP", UIParent, "TOP", 0, -165)
        end
        f:SetFrameStrata("TOOLTIP")
        f:SetClampedToScreen(true)
        f:EnableMouse(true)
        f:SetMovable(true)
        f:RegisterForDrag("LeftButton")
        f:SetScript("OnDragStart", f.StartMoving)
        f:SetScript("OnDragStop", function(selfFrame)
            selfFrame:StopMovingOrSizing()
            if Bridge.Mover and Bridge.Mover.SavePosition then
                Bridge.Mover:SavePosition(selfFrame, "UltimaSuiteToastFrame")
            end
        end)

        if Bridge.Mover and Bridge.Mover.RegisterFrame then
            Bridge.Mover:RegisterFrame(f, "UltimaSuiteToastFrame", "Ultima " .. (BL.TOAST_NOTIFS or "Toast Notifications"), "TOP", 0, -165, 340, 68)
        end

        f:SetBackdrop({
            bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 14, edgeSize = 12,
            insets = { left = 3, right = 3, top = 3, bottom = 3 }
        })
        f:SetBackdropColor(0.06, 0.06, 0.08, 0.95)
        f:SetBackdropBorderColor(0.25, 0.28, 0.35, 0.9)
        f:Hide()

        -- Left Vertical Accent Bar (Glowing status indicator)
        if not f.accentBar then
            local bar = f:CreateTexture(nil, "OVERLAY")
            bar:SetWidth(3)
            bar:SetPoint("TOPLEFT", f, "TOPLEFT", 4, -4)
            bar:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 4, 4)
            bar:SetColorTexture(0.20, 0.90, 0.40, 1.0)
            f.accentBar = bar
        end

        -- Icon Box
        local iconBox = f.iconBox or CreateFrame("Frame", nil, f, "BackdropTemplate")
        iconBox:SetSize(44, 44)
        iconBox:ClearAllPoints()
        iconBox:SetPoint("LEFT", 12, 0)
        iconBox:SetBackdrop({
            edgeFile = "Interface\\Buttons\\WHITE8X8",
            edgeSize = 1,
            insets = { left = 0, right = 0, top = 0, bottom = 0 }
        })
        iconBox:SetBackdropBorderColor(0.20, 0.90, 0.40, 0.8)
        f.iconBox = iconBox

        local icon = f.icon or iconBox:CreateTexture(nil, "ARTWORK")
        icon:SetAllPoints()
        icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
        icon:SetTexture(132623)
        f.icon = icon

        -- Category Micro-Tag / Badge (Top right)
        local badge = f.badge
        if not badge then
            badge = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
            f.badge = badge
        end
        badge:ClearAllPoints()
        badge:SetPoint("TOPRIGHT", f, "TOPRIGHT", -26, -7)
        badge:SetJustifyH("RIGHT")

        -- Title / Headline
        local title = f.title
        if not title then
            title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            f.title = title
        end
        title:ClearAllPoints()
        title:SetPoint("TOPLEFT", iconBox, "TOPRIGHT", 10, -4)
        title:SetPoint("RIGHT", badge, "LEFT", -6, 0)
        title:SetJustifyH("LEFT")
        title:SetWordWrap(false)
        title:SetText(BL.EVENT or "Event")

        -- Message / Body
        local msg = f.msg
        if not msg then
            msg = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            f.msg = msg
        end
        msg:ClearAllPoints()
        msg:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)
        msg:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -12, 8)
        msg:SetJustifyH("LEFT")
        msg:SetJustifyV("TOP")
        msg:SetWordWrap(true)

        -- Bottom Progress Countdown Bar
        if not f.progressBg then
            local pBg = f:CreateTexture(nil, "BACKGROUND")
            pBg:SetHeight(2)
            pBg:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 4, 3)
            pBg:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -4, 3)
            pBg:SetColorTexture(0.2, 0.2, 0.25, 0.5)
            f.progressBg = pBg
        end

        if not f.progressBar then
            local pBar = f:CreateTexture(nil, "ARTWORK")
            pBar:SetHeight(2)
            pBar:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 4, 3)
            pBar:SetWidth(332)
            pBar:SetColorTexture(0.20, 0.90, 0.40, 0.85)
            f.progressBar = pBar
        end

        -- Dismiss / Close Button
        local closeBtn = f.closeBtn or CreateFrame("Button", nil, f, "UIPanelCloseButton")
        closeBtn:SetSize(18, 18)
        closeBtn:ClearAllPoints()
        closeBtn:SetPoint("TOPRIGHT", -4, -4)
        closeBtn:SetScript("OnClick", function()
            Toast:DismissCurrent()
        end)
        f.closeBtn = closeBtn

        -- Click handler
        f:SetScript("OnClick", function()
            if f.onClick then
                pcall(f.onClick)
            end
            Toast:DismissCurrent()
        end)

        -- Animations
        local animGroup = f.animGroup or f:CreateAnimationGroup()
        if not f.animGroup then
            local fadeIn = animGroup:CreateAnimation("Alpha")
            fadeIn:SetFromAlpha(0)
            fadeIn:SetToAlpha(1)
            fadeIn:SetDuration(0.20)
            fadeIn:SetOrder(1)

            local hold = animGroup:CreateAnimation("Sleep")
            hold:SetDuration(3.5)
            hold:SetOrder(2)
            f.holdAnim = hold

            local fadeOut = animGroup:CreateAnimation("Alpha")
            fadeOut:SetFromAlpha(1)
            fadeOut:SetToAlpha(0)
            fadeOut:SetDuration(0.30)
            fadeOut:SetOrder(3)

            animGroup:SetScript("OnFinished", function()
                f:Hide()
                f:SetAlpha(1)
                Toast.isShowing = false
                Toast:ProcessQueue()
            end)

            f.animGroup = animGroup
        end

        -- Progress bar ticker
        f:SetScript("OnUpdate", function(self, elapsed)
            if not Toast.isShowing or not Toast.currentItem then return end
            if animGroup:IsPlaying() and not animGroup:IsPaused() then
                local dur = Toast.currentItem.duration or 3.5
                local elapsedTotal = (Toast.currentItem.startTime and (GetTime() - Toast.currentItem.startTime)) or 0
                local rem = math.max(0, dur - elapsedTotal)
                local pct = rem / dur
                local maxW = math.max(1, f:GetWidth() - 8)
                if f.progressBar then
                    f.progressBar:SetWidth(math.max(1, maxW * pct))
                end
            end
        end)

        -- Pause on hover so player can comfortably read or click
        f:HookScript("OnEnter", function()
            if animGroup:IsPlaying() then
                animGroup:Pause()
            end
        end)
        f:HookScript("OnLeave", function()
            if animGroup:IsPaused() then
                animGroup:Play()
            end
        end)

        self.frame = f
    end

    function Toast:Show(titleText, messageText, iconTexture, onClick, playSound, soundKit, duration, toastType, category)
        self:Init()

        local title, msg, icon, tType, dur, pSound, sKit, onClk, cat
        if type(titleText) == "table" then
            local t = titleText
            title = t.headline or t.title
            msg = t.message or t.msg or ""
            icon = t.icon
            tType = t.toastType or t.type or "info"
            dur = t.duration or 3.5
            pSound = (t.playSound ~= false) and (t.sound ~= false)
            sKit = t.soundKit
            onClk = t.onClick
            cat = t.category or t.tag
        else
            title = titleText
            msg = messageText or ""
            icon = iconTexture
            tType = toastType or "info"
            dur = duration or 3.5
            pSound = (playSound ~= false)
            sKit = soundKit
            onClk = onClick
            cat = category
        end

        -- Smart Heuristic: Clean up legacy AddOn name passed as title
        if KNOWN_ADDON_CATEGORIES[title] then
            if not cat then
                cat = KNOWN_ADDON_CATEGORIES[title]
            end
            local colonHead, colonDetail = msg:match("^([^:]+):%s*(.+)$")
            if colonHead and colonDetail and #colonHead < 35 then
                title = colonHead
                msg = colonDetail
            else
                if tType == "success" then
                    title = BL.ACTION_SUCCESS or "Action Successful"
                elseif tType == "warning" then
                    title = BL.NOTICE or "Notice"
                elseif tType == "error" then
                    title = BL.ERROR or "Error"
                else
                    title = BL.NOTIFICATION or "Notification"
                end
            end
        end

        local cfg = self.TOAST_TYPES[tType] or self.TOAST_TYPES.info

        local item = {
            title = title or BL.NOTIFICATION or "Notification",
            msg = msg or "",
            category = cat,
            icon = icon or 132623,
            onClick = onClk,
            sound = pSound,
            soundKit = sKit or cfg.sound,
            duration = dur or 3.5,
            toastType = tType,
            cfg = cfg,
        }

        table.insert(self.queue, item)

        -- Record history entry (last 100 items)
        table.insert(self.history, {
            timestamp = time(),
            dateStr = date("%H:%M:%S"),
            title = item.title,
            msg = item.msg,
            category = item.category,
            icon = item.icon,
            toastType = tType,
        })
        if #self.history > 100 then
            table.remove(self.history, 1)
        end

        if Bridge.Trigger then
            Bridge:Trigger(Bridge.Events.TOAST_TRIGGERED, item.title, item.msg, tType)
        end

        -- Anti-Spam Login Buffer: Hold toasts during initial login
        if Toast.loginGraceUntil and GetTime() < Toast.loginGraceUntil then
            if not Toast._loginBufferTimer then
                local remaining = math.max(0.5, Toast.loginGraceUntil - GetTime())
                Toast._loginBufferTimer = C_Timer.After(remaining, function()
                    Toast._loginBufferTimer = nil
                    Toast.loginGraceUntil = 0
                    if #Toast.queue >= 3 then
                        local count = #Toast.queue
                        Toast.queue = {}
                        Toast:Show({
                            headline = "Ultima Suite Digest",
                            message = string.format(BL.DIGEST_BATCH or "%d notifications received while loading.", count),
                            icon = 132623,
                            category = "SYSTEM",
                            type = "info",
                            duration = 4.5,
                        })
                    else
                        Toast:ProcessQueue()
                    end
                end)
            end
            return
        end

        if not self.isShowing then
            self:ProcessQueue()
        end
    end

    function Toast:ProcessQueue()
        if #self.queue == 0 then
            self.isShowing = false
            self.currentItem = nil
            return
        end

        local item = table.remove(self.queue, 1)
        self.isShowing = true
        item.startTime = GetTime()
        self.currentItem = item

        local f = self.frame
        local cfg = item.cfg or self.TOAST_TYPES.info

        f:SetBackdropBorderColor(0.25, 0.28, 0.35, 0.9)
        if f.accentBar then
            f.accentBar:SetColorTexture(cfg.r, cfg.g, cfg.b, 1.0)
        end
        if f.iconBox then
            f.iconBox:SetBackdropBorderColor(cfg.r, cfg.g, cfg.b, 0.8)
        end
        if f.progressBar then
            f.progressBar:SetColorTexture(cfg.r, cfg.g, cfg.b, 0.85)
            f.progressBar:SetWidth(math.max(1, f:GetWidth() - 8))
        end

        if f.badge then
            local cat = item.category
            if cat and cat ~= "" then
                local catUpper = string.upper(cat)
                local catMap = {
                    ["AUKTION"] = "AUCTION",
                    ["GILDE"] = "GUILD",
                    ["EINKAUF"] = "SHOP",
                    ["POST"] = "MAIL",
                    ["TIEFEN"] = "DELVES",
                    ["INVENTAR"] = "INVENTORY",
                }
                local displayCat = catMap[catUpper] or catUpper
                f.badge:SetText(string.format("|cff888888[%s]|r", displayCat))
                f.badge:Show()
            else
                f.badge:SetText("")
                f.badge:Hide()
            end
        end

        f.title:SetText(string.format("|cff%02x%02x%02x%s|r", math.floor(cfg.r * 255), math.floor(cfg.g * 255), math.floor(cfg.b * 255), item.title))
        f.msg:SetText(item.msg)

        if type(item.icon) == "number" or (type(item.icon) == "string" and item.icon ~= "") then
            f.icon:SetTexture(item.icon)
            local curTex = f.icon:GetTexture()
            if not curTex or curTex == 0 then
                f.icon:SetTexture("Interface\\Icons\\inv_misc_treasurechest04c")
            end
        else
            f.icon:SetTexture(132623)
        end

        f.onClick = item.onClick

        if f.holdAnim then
            f.holdAnim:SetDuration(item.duration or 3.5)
        end

        if item.sound and item.soundKit and PlaySound then
            pcall(PlaySound, item.soundKit)
        end

        f:Show()
        f.animGroup:Stop()
        f.animGroup:Play()
    end

    function Toast:DismissCurrent()
        if self.frame and self.isShowing then
            self.frame.animGroup:Stop()
            self.frame:Hide()
            self.frame:SetAlpha(1)
            self.isShowing = false
            self.currentItem = nil
            self:ProcessQueue()
        end
    end

    function Toast:ClearQueue()
        wipe(self.queue)
        if self.frame and self.isShowing then
            self.frame.animGroup:Stop()
            self.frame:Hide()
            self.frame:SetAlpha(1)
            self.isShowing = false
            self.currentItem = nil
        end
    end

    function Toast:GetHistory()
        return self.history
    end

    --- Public Helper on UltimaBridge for invoking toasts from any addon.
    --- Supports both positional arguments and modern options table:
    --- Bridge:ShowToast({ headline = "...", message = "...", category = "...", type = "success", ... })
    --- Bridge:ShowToast(headline, message, icon, onClick, playSound, soundKit, duration, toastType, category)
    function Bridge:ShowToast(...)
        Toast:Show(...)
    end

    ----------------------------------------------------------------------------
    -- Native Window Position & Dragging Helpers (Replaces LibWindow-1.1)
    ----------------------------------------------------------------------------
    function Bridge:SaveWindowPosition(frame, config)
        if not frame or not config then return end
        local point, _, relPoint, x, y = frame:GetPoint()
        config.point = point
        config.relativePoint = relPoint
        config.x = x
        config.y = y
    end

    function Bridge:RestoreWindowPosition(frame, config, defaultPoint, defaultX, defaultY)
        if not frame then return false end
        if config and config.point then
            frame:ClearAllPoints()
            frame:SetPoint(config.point, UIParent, config.relativePoint or config.point, config.x or 0, config.y or 0)
            return true
        end
        if defaultPoint then
            frame:ClearAllPoints()
            frame:SetPoint(defaultPoint, UIParent, defaultPoint, defaultX or 0, defaultY or 0)
        end
        return false
    end

    function Bridge:MakeWindowDraggable(frame, config)
        if not frame then return end
        frame:SetMovable(true)
        frame:EnableMouse(true)
        frame:RegisterForDrag("LeftButton")
        frame:SetScript("OnDragStart", frame.StartMoving)
        frame:SetScript("OnDragStop", function(self)
            self:StopMovingOrSizing()
            if config then
                Bridge:SaveWindowPosition(self, config)
            end
        end)
    end

    ----------------------------------------------------------------------------
    -- Suite-wide Layout Mover & Edit Mode Integration
    ----------------------------------------------------------------------------
    Bridge.Mover = Bridge.Mover or {
        registeredFrames = {},
        moverFrames = {},
        isActive = false,
    }
    local Mover = Bridge.Mover

    function Mover:GetDB()
        _G.UltimaSuiteDB = _G.UltimaSuiteDB or {}
        _G.UltimaSuiteDB.positions = _G.UltimaSuiteDB.positions or {}
        return _G.UltimaSuiteDB.positions
    end

    function Mover:RegisterFrame(frame, id, label, defaultPoint, defaultX, defaultY, width, height)
        if not frame or not id then return end
        self.registeredFrames[id] = {
            frame = frame,
            id = id,
            label = label or id,
            defaultPoint = defaultPoint or "CENTER",
            defaultX = defaultX or 0,
            defaultY = defaultY or 0,
            width = width,
            height = height,
        }
        self:RestorePosition(frame, id, defaultPoint, defaultX, defaultY)
    end

    function Mover:SavePosition(frame, id)
        if not frame or not id then return end
        local db = self:GetDB()
        local point, _, relPoint, x, y = frame:GetPoint()
        db[id] = {
            point = point,
            relativePoint = relPoint,
            x = x,
            y = y,
        }
    end

    function Mover:RestorePosition(frame, id, defaultPoint, defaultX, defaultY)
        if not frame or not id then return end
        local db = self:GetDB()
        local pos = db[id]
        if pos and pos.point then
            frame:ClearAllPoints()
            frame:SetPoint(pos.point, UIParent, pos.relativePoint or pos.point, pos.x or 0, pos.y or 0)
            return true
        elseif defaultPoint then
            frame:ClearAllPoints()
            frame:SetPoint(defaultPoint, UIParent, defaultPoint, defaultX or 0, defaultY or 0)
            return false
        end
    end

    function Mover:ResetPositions()
        local db = self:GetDB()
        for id, info in pairs(self.registeredFrames) do
            db[id] = nil
            if info.frame then
                info.frame:ClearAllPoints()
                info.frame:SetPoint(info.defaultPoint, UIParent, info.defaultPoint, info.defaultX, info.defaultY)
            end
        end
        if self.isActive then
            self:HideMovers()
            self:ShowMovers()
        end
        Bridge:Print("Ultima Suite", BL.MOVER_RESET_DONE or "All window positions reset to default.", "cli")
    end

    function Mover:ShowMovers()
        if InCombatLockdown and InCombatLockdown() then
            Bridge:Print("Ultima Suite", BL.MOVER_COMBAT_ERR or "Mover cannot be opened during combat.", "cli")
            return
        end
        self.isActive = true

        -- Create Top Control Bar if not existing
        if not self.controlBar then
            local bar = CreateFrame("Frame", "UltimaSuiteMoverBar", UIParent, "BackdropTemplate")
            bar:SetSize(400, 44)
            bar:SetPoint("TOP", UIParent, "TOP", 0, -20)
            bar:SetFrameStrata("TOOLTIP")
            bar:SetBackdrop({
                bgFile = "Interface\\Buttons\\WHITE8x8",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                tile = false, tileSize = 12, edgeSize = 12,
                insets = { left = 3, right = 3, top = 3, bottom = 3 }
            })
            bar:SetBackdropColor(0.08, 0.08, 0.12, 0.95)
            bar:SetBackdropBorderColor(0.20, 0.70, 1.0, 1.0)
            bar:EnableMouse(true)
            bar:SetMovable(true)
            bar:RegisterForDrag("LeftButton")
            bar:SetScript("OnDragStart", bar.StartMoving)
            bar:SetScript("OnDragStop", bar.StopMovingOrSizing)

            local title = bar:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            title:SetPoint("LEFT", 14, 0)
            title:SetText("|cff33ccffUltima Suite|r |cffffffff" .. (BL.MOVER_MODE or "Mover Mode") .. "|r")

            -- Reset Button
            local resetBtn = CreateFrame("Button", nil, bar, "BackdropTemplate")
            resetBtn:SetSize(86, 24)
            resetBtn:SetPoint("RIGHT", -86, 0)
            resetBtn:SetBackdrop({
                bgFile = "Interface\\Buttons\\WHITE8x8",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                tile = false, tileSize = 8, edgeSize = 8,
                insets = { left = 2, right = 2, top = 2, bottom = 2 }
            })
            resetBtn:SetBackdropColor(0.25, 0.1, 0.1, 0.9)
            resetBtn:SetBackdropBorderColor(0.8, 0.3, 0.3, 1.0)
            local rText = resetBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            rText:SetPoint("CENTER", 0, 0)
            rText:SetText(BL.RESET or "Reset")
            resetBtn:SetScript("OnClick", function() Mover:ResetPositions() end)

            -- Close Button
            local closeBtn = CreateFrame("Button", nil, bar, "BackdropTemplate")
            closeBtn:SetSize(72, 24)
            closeBtn:SetPoint("RIGHT", -8, 0)
            closeBtn:SetBackdrop({
                bgFile = "Interface\\Buttons\\WHITE8x8",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                tile = false, tileSize = 8, edgeSize = 8,
                insets = { left = 2, right = 2, top = 2, bottom = 2 }
            })
            closeBtn:SetBackdropColor(0.1, 0.25, 0.15, 0.9)
            closeBtn:SetBackdropBorderColor(0.3, 0.8, 0.4, 1.0)
            local cText = closeBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            cText:SetPoint("CENTER", 0, 0)
            cText:SetText(BL.DONE or "Done")
            closeBtn:SetScript("OnClick", function() Mover:HideMovers() end)

            self.controlBar = bar
        end
        self.controlBar:Show()

        for id, info in pairs(self.registeredFrames) do
            local targetFrame = info.frame
            if targetFrame then
                local mover = self.moverFrames[id]
                if not mover then
                    mover = CreateFrame("Button", "UltimaMover_" .. id, UIParent, "BackdropTemplate")
                    mover:SetFrameStrata("TOOLTIP")
                    mover:SetBackdrop({
                        bgFile = "Interface\\Buttons\\WHITE8x8",
                        edgeFile = "Interface\\Buttons\\WHITE8x8",
                        edgeSize = 2,
                    })
                    mover:SetBackdropColor(0.10, 0.35, 0.65, 0.65)
                    mover:SetBackdropBorderColor(0.20, 0.70, 1.00, 1.00)
                    mover:EnableMouse(true)
                    mover:SetMovable(true)
                    mover:RegisterForDrag("LeftButton")
                    mover:SetClampedToScreen(true)

                    local lbl = mover:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                    lbl:SetPoint("CENTER", 0, 4)
                    lbl:SetText(info.label)
                    lbl:SetTextColor(1, 1, 1, 1)

                    local sub = mover:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
                    sub:SetPoint("TOP", lbl, "BOTTOM", 0, -2)
                    sub:SetText(BL.MOVER_DRAG_HINT or "(Drag to move)")

                    mover:SetScript("OnDragStart", function(selfMover)
                        targetFrame:StartMoving()
                        selfMover:StartMoving()
                    end)
                    mover:SetScript("OnDragStop", function(selfMover)
                        targetFrame:StopMovingOrSizing()
                        selfMover:StopMovingOrSizing()
                        Mover:SavePosition(targetFrame, id)
                    end)
                    self.moverFrames[id] = mover
                end

                local w = info.width or targetFrame:GetWidth()
                local h = info.height or targetFrame:GetHeight()
                if not w or w < 50 then w = 240 end
                if not h or h < 30 then h = 50 end
                mover:SetSize(w, h)

                mover:ClearAllPoints()
                mover:SetPoint("CENTER", targetFrame, "CENTER", 0, 0)
                mover:Show()
            end
        end
        Bridge:Print("Ultima Suite", BL.MOVER_ACTIVE or "Mover mode active. Drag frames to reposition.", "cli")
    end

    function Mover:HideMovers()
        self.isActive = false
        if self.controlBar then
            self.controlBar:Hide()
        end
        for _, mover in pairs(self.moverFrames) do
            mover:Hide()
        end
        Bridge:Print("Ultima Suite", BL.MOVER_SAVED or "Mover mode closed. Positions saved.", "cli")
    end

    function Mover:Toggle()
        if self.isActive then
            self:HideMovers()
        else
            self:ShowMovers()
        end
    end

    local function SetupEditModeIntegration()
        if EventRegistry and EventRegistry.RegisterCallback then
            pcall(function()
                EventRegistry:RegisterCallback("EditMode.Enter", function()
                    Mover:ShowMovers()
                end, Mover)
                EventRegistry:RegisterCallback("EditMode.Exit", function()
                    Mover:HideMovers()
                end, Mover)
            end)
        end
        if EditModeManagerFrame then
            pcall(function()
                hooksecurefunc(EditModeManagerFrame, "Show", function()
                    Mover:ShowMovers()
                end)
                hooksecurefunc(EditModeManagerFrame, "Hide", function()
                    Mover:HideMovers()
                end)
            end)
        end
    end

    local moverInitFrame = CreateFrame("Frame")
    moverInitFrame:RegisterEvent("PLAYER_LOGIN")
    moverInitFrame:SetScript("OnEvent", function()
        Mover:GetDB()
        SetupEditModeIntegration()
    end)

    ----------------------------------------------------------------------------
    -- Native Confirmation Dialog Helper (Replaces LibDialog-1.0)
    ----------------------------------------------------------------------------
    function Bridge:ShowConfirmDialog(text, onAccept, onCancel, acceptText, cancelText)
        local key = "ULTIMA_CONFIRM_GENERIC"
        StaticPopupDialogs[key] = {
            text = text or "Bist du sicher? / Are you sure?",
            button1 = acceptText or YES,
            button2 = cancelText or NO,
            OnAccept = function()
                if onAccept then onAccept() end
            end,
            OnCancel = function()
                if onCancel then onCancel() end
            end,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3,
        }
        StaticPopup_Show(key)
    end

    ----------------------------------------------------------------------------
    -- Item Power Search Engine (Native LibItemSearch replacement)
    -- Fast, taint-free multi-filter search syntax for items.
    -- Supports: ilvl comparisons (>610, <=600, 600..630), quality (q:epic, q:rare, q:selten, etc.),
    -- bind types (b:boe, b:bop, b:warbound, etc.), item types/slots (t:armor, t:weapon, etc.),
    -- and substring text matching. Whitespace separated tokens are evaluated with AND logic.
    ----------------------------------------------------------------------------
    local QUALITY_NAMES = {
        ["0"] = 0, ["poor"] = 0, ["schlecht"] = 0, ["grau"] = 0, ["gray"] = 0, ["grey"] = 0, ["junk"] = 0,
        ["1"] = 1, ["common"] = 1, ["gewöhnlich"] = 1, ["gewoehnlich"] = 1, ["weiß"] = 1, ["weiss"] = 1, ["white"] = 1,
        ["2"] = 2, ["uncommon"] = 2, ["ungewöhnlich"] = 2, ["ungewoehnlich"] = 2, ["grün"] = 2, ["gruen"] = 2, ["green"] = 2,
        ["3"] = 3, ["rare"] = 3, ["selten"] = 3, ["blau"] = 3, ["blue"] = 3,
        ["4"] = 4, ["epic"] = 4, ["episch"] = 4, ["lila"] = 4, ["purple"] = 4, ["violett"] = 4,
        ["5"] = 5, ["legendary"] = 5, ["legendär"] = 5, ["legendaer"] = 5, ["orange"] = 5,
        ["6"] = 6, ["artifact"] = 6, ["artefakt"] = 6, ["gold"] = 6,
        ["7"] = 7, ["heirloom"] = 7, ["erbstück"] = 7, ["erbstueck"] = 7,
    }

    local SLOT_SYNONYMS = {
        ["head"] = "INVTYPE_HEAD", ["kopf"] = "INVTYPE_HEAD",
        ["neck"] = "INVTYPE_NECK", ["hals"] = "INVTYPE_NECK",
        ["shoulder"] = "INVTYPE_SHOULDER", ["schulter"] = "INVTYPE_SHOULDER",
        ["chest"] = "INVTYPE_CHEST", ["brust"] = "INVTYPE_CHEST", ["robe"] = "INVTYPE_ROBE",
        ["waist"] = "INVTYPE_WAIST", ["gürtel"] = "INVTYPE_WAIST", ["guertel"] = "INVTYPE_WAIST",
        ["legs"] = "INVTYPE_LEGS", ["beine"] = "INVTYPE_LEGS", ["hose"] = "INVTYPE_LEGS",
        ["feet"] = "INVTYPE_FEET", ["füße"] = "INVTYPE_FEET", ["fuesse"] = "INVTYPE_FEET", ["stiefel"] = "INVTYPE_FEET",
        ["wrist"] = "INVTYPE_WRIST", ["handgelenke"] = "INVTYPE_WRIST",
        ["hands"] = "INVTYPE_HAND", ["hände"] = "INVTYPE_HAND", ["haende"] = "INVTYPE_HAND",
        ["ring"] = "INVTYPE_FINGER", ["finger"] = "INVTYPE_FINGER",
        ["trinket"] = "INVTYPE_TRINKET", ["schmuck"] = "INVTYPE_TRINKET",
        ["cloak"] = "INVTYPE_CLOAK", ["back"] = "INVTYPE_CLOAK", ["umhang"] = "INVTYPE_CLOAK", ["rücken"] = "INVTYPE_CLOAK",
        ["weapon"] = "INVTYPE_WEAPON", ["waffe"] = "INVTYPE_WEAPON",
        ["shield"] = "INVTYPE_SHIELD", ["schild"] = "INVTYPE_SHIELD",
        ["tabard"] = "INVTYPE_TABARD", ["wappenrock"] = "INVTYPE_TABARD",
    }

    function Bridge:MatchesItemSearch(itemLinkOrID, query)
        if not query or query == "" then return true end
        if not itemLinkOrID then return false end

        local strQuery = strtrim(tostring(query)):lower()
        if strQuery == "" then return true end

        -- Fetch Item Info
        local itemName, itemLink, itemQuality, itemLevel, _, itemType, itemSubType, _, itemEquipLoc, _, _, _, _, bindType
        if type(itemLinkOrID) == "number" or (type(itemLinkOrID) == "string" and not itemLinkOrID:find("|Hitem:")) then
            local itemID = type(itemLinkOrID) == "number" and itemLinkOrID or tonumber(tostring(itemLinkOrID):match("item:(%d+)") or itemLinkOrID)
            if itemID and C_Item and C_Item.GetItemInfo then
                itemName, itemLink, itemQuality, itemLevel, _, itemType, itemSubType, _, itemEquipLoc, _, _, _, _, bindType = C_Item.GetItemInfo(itemID)
                if not itemName and C_Item.GetItemInfoInstant then
                    local instantName, _, instantQuality, instantEquipLoc = C_Item.GetItemInfoInstant(itemID)
                    itemName = instantName
                    itemQuality = instantQuality
                    itemEquipLoc = instantEquipLoc
                end
            end
        else
            if C_Item and C_Item.GetItemInfo then
                itemName, itemLink, itemQuality, itemLevel, _, itemType, itemSubType, _, itemEquipLoc, _, _, _, _, bindType = C_Item.GetItemInfo(itemLinkOrID)
            end
            if not itemName and type(itemLinkOrID) == "string" then
                itemName = itemLinkOrID:match("%[(.-)%]")
                local itemID = tonumber(itemLinkOrID:match("item:(%d+)"))
                if itemID and C_Item and C_Item.GetItemInfoInstant then
                    local instantName, _, instantQuality, instantEquipLoc = C_Item.GetItemInfoInstant(itemID)
                    itemName = itemName or instantName
                    itemQuality = itemQuality or instantQuality
                    itemEquipLoc = itemEquipLoc or instantEquipLoc
                end
            end
        end

        local effectiveILvl = itemLevel
        if C_Item and C_Item.GetDetailedItemLevelInfo and (itemLink or itemLinkOrID) then
            local eff = C_Item.GetDetailedItemLevelInfo(itemLink or itemLinkOrID)
            if eff and eff > 0 then effectiveILvl = eff end
        end
        effectiveILvl = effectiveILvl or itemLevel or 0
        itemQuality = itemQuality or 1
        itemName = itemName or ""
        local nameLower = itemName:lower()
        local typeLower = (itemType or ""):lower()
        local subTypeLower = (itemSubType or ""):lower()
        local equipLocUpper = (itemEquipLoc or ""):upper()

        -- Evaluate each whitespace-delimited search token (AND logic)
        for token in strQuery:gmatch("%S+") do
            local matched = false

            -- 1. Explicit ilvl prefix: ilvl:>600, ilvl:600..630, ilvl:>=610
            local ilvlOp, ilvlVal = token:match("^ilvl:([><=]+)(%d+)$")
            if not ilvlOp then
                ilvlVal = token:match("^ilvl:(%d+)$")
                if ilvlVal then ilvlOp = "=" end
            end
            if not ilvlOp then
                local minL, maxL = token:match("^ilvl:(%d+)%.%.(%d+)$")
                if minL and maxL then
                    local nMin, nMax = tonumber(minL), tonumber(maxL)
                    matched = (effectiveILvl >= nMin and effectiveILvl <= nMax)
                end
            end
            if ilvlOp and ilvlVal then
                local target = tonumber(ilvlVal)
                if ilvlOp == ">" then matched = (effectiveILvl > target)
                elseif ilvlOp == ">=" then matched = (effectiveILvl >= target)
                elseif ilvlOp == "<" then matched = (effectiveILvl < target)
                elseif ilvlOp == "<=" then matched = (effectiveILvl <= target)
                elseif ilvlOp == "=" or ilvlOp == "==" then matched = (effectiveILvl == target)
                end
            end

            -- 2. Standalone comparison operators: >610, >=600, <580, <=600, 600..630
            if not matched and not token:find(":") then
                local op, val = token:match("^([><=]+)(%d+)$")
                if op and val then
                    local target = tonumber(val)
                    if op == ">" then matched = (effectiveILvl > target)
                    elseif op == ">=" then matched = (effectiveILvl >= target)
                    elseif op == "<" then matched = (effectiveILvl < target)
                    elseif op == "<=" then matched = (effectiveILvl <= target)
                    elseif op == "=" or op == "==" then matched = (effectiveILvl == target)
                    end
                else
                    local minL, maxL = token:match("^(%d+)%.%.(%d+)$")
                    if minL and maxL then
                        local nMin, nMax = tonumber(minL), tonumber(maxL)
                        matched = (effectiveILvl >= nMin and effectiveILvl <= nMax)
                    end
                end
            end

            -- 3. Quality prefix: q:epic, q:4, quality:selten
            if not matched then
                local qVal = token:match("^q:(.+)$") or token:match("^quality:(.+)$") or token:match("^qualit[aä]t:(.+)$")
                if qVal then
                    local targetQ = QUALITY_NAMES[qVal]
                    if targetQ ~= nil then
                        matched = (itemQuality == targetQ)
                    end
                end
            end

            -- 4. Binding prefix: b:boe, b:bop, b:warbound, bind:equip
            if not matched then
                local bVal = token:match("^b:(.+)$") or token:match("^bind:(.+)$")
                if bVal then
                    if bVal == "boe" or bVal == "equip" or bVal == "anlegen" then
                        matched = (bindType == 2)
                    elseif bVal == "bop" or bVal == "bound" or bVal == "soulbound" or bVal == "aufheben" or bVal == "seelengebunden" then
                        matched = (bindType == 1)
                    elseif bVal == "bou" or bVal == "use" or bVal == "benutzen" then
                        matched = (bindType == 3)
                    elseif bVal == "warbound" or bVal == "wuie" or bVal == "kriegsmeute" or bVal == "account" then
                        if bindType == 8 or bindType == 7 then
                            matched = true
                        elseif C_TooltipInfo and (itemLink or itemLinkOrID) then
                            local tip = C_TooltipInfo.GetHyperlink(itemLink or itemLinkOrID)
                            if tip and tip.lines then
                                for _, line in ipairs(tip.lines) do
                                    local lt = line.leftText and line.leftText:lower()
                                    if lt and (lt:find("warbound") or lt:find("kriegsmeute") or lt:find("account") or lt:find("until equipped") or lt:find("bis zum anlegen")) then
                                        matched = true
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
            end

            -- 5. Type / Subtype / Slot prefix: t:armor, t:weapon, slot:trinket
            if not matched then
                local tVal = token:match("^t:(.+)$") or token:match("^type:(.+)$") or token:match("^slot:(.+)$")
                if tVal then
                    local targetSlot = SLOT_SYNONYMS[tVal]
                    if targetSlot and equipLocUpper == targetSlot then
                        matched = true
                    elseif typeLower:find(tVal, 1, true) or subTypeLower:find(tVal, 1, true) then
                        matched = true
                    end
                end
            end

            -- 6. Standalone Quality Keyword: typing "epic", "selten", etc. directly
            if not matched and QUALITY_NAMES[token] ~= nil and not token:match("^%d+$") then
                if itemQuality == QUALITY_NAMES[token] or nameLower:find(token, 1, true) then
                    matched = true
                end
            end

            -- 7. Standalone Slot Keyword: typing "trinket", "schmuck", "waffe", etc. directly
            if not matched and SLOT_SYNONYMS[token] then
                if equipLocUpper == SLOT_SYNONYMS[token] or nameLower:find(token, 1, true) then
                    matched = true
                end
            end

            -- 8. General Substring Match (Item Name, Type, Subtype)
            if not matched then
                if nameLower:find(token, 1, true) or subTypeLower:find(token, 1, true) or typeLower:find(token, 1, true) then
                    matched = true
                end
            end

            if not matched then
                return false
            end
        end

        return true
    end

    ----------------------------------------------------------------------------
    -- Spec-based Profile Auto-Switching Engine (Modern LibDualSpec replacement)
    -- Automatically switches AceDB-3.0 profiles based on active character talent specialization.
    ----------------------------------------------------------------------------
    Bridge.dualSpecDBs = Bridge.dualSpecDBs or {}

    function Bridge:EnableDualSpec(db, appName)
        if not db or type(db.SetProfile) ~= "function" then return nil end
        appName = appName or "UnknownAddOn"

        -- Ensure character storage exists
        db.char = db.char or {}
        db.char.specProfiles = db.char.specProfiles or {}
        if db.char.specProfilesEnabled == nil then
            db.char.specProfilesEnabled = true
        end

        local controller = {
            db = db,
            appName = appName,
        }

        function controller:IsEnabled()
            return db.char and db.char.specProfilesEnabled ~= false
        end

        function controller:SetEnabled(enabled)
            if db.char then
                db.char.specProfilesEnabled = (enabled == true)
                if enabled then
                    self:CheckSpec()
                end
            end
        end

        function controller:GetSpecProfile(specIndex)
            specIndex = specIndex or (GetSpecialization and GetSpecialization())
            if not specIndex or specIndex <= 0 then return nil end
            return db.char and db.char.specProfiles and db.char.specProfiles[specIndex]
        end

        function controller:SetSpecProfile(specIndex, profileName)
            if not specIndex or specIndex <= 0 or not profileName then return end
            if db.char then
                db.char.specProfiles = db.char.specProfiles or {}
                db.char.specProfiles[specIndex] = profileName
            end
        end

        function controller:CheckSpec()
            if not self:IsEnabled() then return end
            local specIndex = GetSpecialization and GetSpecialization()
            if not specIndex or specIndex <= 0 then return end

            local targetProfile = db.char.specProfiles and db.char.specProfiles[specIndex]
            local currentProfile = db:GetCurrentProfile()

            if targetProfile and targetProfile ~= "" and targetProfile ~= currentProfile then
                local profiles = db:GetProfiles()
                local exists = false
                if profiles then
                    for _, p in ipairs(profiles) do
                        if p == targetProfile then
                            exists = true
                            break
                        end
                    end
                end
                if exists then
                    controller._isSwitching = true
                    pcall(function() db:SetProfile(targetProfile) end)
                    controller._isSwitching = false
                end
            elseif not targetProfile or targetProfile == "" then
                db.char.specProfiles[specIndex] = currentProfile
            end
        end

        -- Automatically track manual profile switches
        if db.RegisterCallback then
            db.RegisterCallback(controller, "OnProfileChanged", function(evt, database, newProfile)
                if controller._isSwitching then return end
                if not controller:IsEnabled() then return end
                local specIndex = GetSpecialization and GetSpecialization()
                if specIndex and specIndex > 0 and db.char then
                    db.char.specProfiles = db.char.specProfiles or {}
                    db.char.specProfiles[specIndex] = newProfile or db:GetCurrentProfile()
                end
            end)
        end

        table.insert(Bridge.dualSpecDBs, controller)

        if not Bridge._dualSpecFrame then
            local f = CreateFrame("Frame")
            f:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
            f:RegisterEvent("PLAYER_ENTERING_WORLD")
            f:RegisterEvent("TRAIT_CONFIG_UPDATED")
            f:SetScript("OnEvent", function(_, event, unit)
                if event == "PLAYER_SPECIALIZATION_CHANGED" and unit and unit ~= "player" then
                    return
                end
                for _, ctrl in ipairs(Bridge.dualSpecDBs) do
                    pcall(ctrl.CheckSpec, ctrl)
                end
            end)
            Bridge._dualSpecFrame = f
        end

        if C_Timer and C_Timer.After then
            C_Timer.After(0.5, function()
                pcall(controller.CheckSpec, controller)
            end)
        end

        return controller
    end

    ----------------------------------------------------------------------------
    -- Accurate Dispel Detection Engine (Modern LibDispel replacement)
    -- Dynamically checks player class, spec, and learned abilities to determine
    -- which harmful debuff types the player can currently dispel.
    ----------------------------------------------------------------------------
    Bridge._dispelCache = Bridge._dispelCache or {}

    local DISPEL_SYNONYMS = {
        ["magic"]       = "Magic",
        ["magie"]       = "Magic",
        ["curse"]       = "Curse",
        ["fluch"]       = "Curse",
        ["poison"]      = "Poison",
        ["gift"]        = "Poison",
        ["disease"]     = "Disease",
        ["krankheit"]   = "Disease",
        ["bleed"]       = "Bleed",
        ["blutung"]     = "Bleed",
        ["enrage"]      = "Enrage",
        ["wutanfall"]   = "Enrage",
        ["wut"]         = "Enrage",
    }

    local function SafeIsSpellKnown(spellID)
        if not spellID then return false end
        if C_Spell and C_Spell.DoesSpellExist and not C_Spell.DoesSpellExist(spellID) then return false end
        if IsSpellKnownOrOverrides and IsSpellKnownOrOverrides(spellID) then return true end
        if IsPlayerSpell and IsPlayerSpell(spellID) then return true end
        return false
    end

    function Bridge:UpdateDispelCapabilities()
        local _, class = UnitClass("player")
        local specIndex = (GetSpecialization and GetSpecialization()) or 0
        local cache = {
            Magic = false,
            Curse = false,
            Poison = false,
            Disease = false,
            Bleed = false,
            Enrage = false,
        }

        if class == "PRIEST" then
            if specIndex == 1 or specIndex == 2 or SafeIsSpellKnown(527) then
                cache.Magic = true
                cache.Disease = true
            elseif specIndex == 3 or SafeIsSpellKnown(213634) then
                cache.Disease = true
            end
            if SafeIsSpellKnown(32375) then
                cache.Magic = true
            end
        elseif class == "PALADIN" then
            if specIndex == 1 or SafeIsSpellKnown(4987) then
                cache.Magic = true
                cache.Poison = true
                cache.Disease = true
            else
                cache.Poison = true
                cache.Disease = true
            end
        elseif class == "DRUID" then
            if specIndex == 4 or SafeIsSpellKnown(88423) then
                cache.Magic = true
                cache.Curse = true
                cache.Poison = true
            else
                cache.Curse = true
                cache.Poison = true
            end
            if SafeIsSpellKnown(2908) then
                cache.Enrage = true
            end
        elseif class == "SHAMAN" then
            if specIndex == 3 or SafeIsSpellKnown(77130) then
                cache.Magic = true
                cache.Curse = true
            else
                cache.Curse = true
            end
            if SafeIsSpellKnown(383013) then
                cache.Poison = true
            end
        elseif class == "MONK" then
            if specIndex == 2 or SafeIsSpellKnown(115450) then
                cache.Magic = true
                cache.Poison = true
                cache.Disease = true
            else
                cache.Poison = true
                cache.Disease = true
            end
        elseif class == "MAGE" then
            if SafeIsSpellKnown(475) then
                cache.Curse = true
            end
        elseif class == "EVOKER" then
            if specIndex == 2 or SafeIsSpellKnown(360823) then
                cache.Magic = true
                cache.Poison = true
            else
                cache.Poison = true
            end
            if SafeIsSpellKnown(374251) then
                cache.Bleed = true
                cache.Poison = true
                cache.Curse = true
                cache.Disease = true
            end
        elseif class == "HUNTER" then
            if SafeIsSpellKnown(19801) then
                cache.Enrage = true
            end
        elseif class == "ROGUE" then
            if SafeIsSpellKnown(5938) then
                cache.Enrage = true
            end
        end

        self._dispelCache = cache
        return cache
    end

    function Bridge:CanPlayerDispelType(dispelType)
        if not dispelType or dispelType == "" or dispelType == "none" or dispelType == "None" then
            return false
        end
        if not self._dispelCache or not next(self._dispelCache) then
            self:UpdateDispelCapabilities()
        end
        local canonical = DISPEL_SYNONYMS[dispelType:lower()] or dispelType
        return self._dispelCache[canonical] == true
    end

    function Bridge:GetPlayerDispelCapabilities()
        if not self._dispelCache or not next(self._dispelCache) then
            self:UpdateDispelCapabilities()
        end
        return self._dispelCache
    end

    if not Bridge._dispelFrame then
        local f = CreateFrame("Frame")
        f:RegisterEvent("PLAYER_ENTERING_WORLD")
        f:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
        f:RegisterEvent("SPELLS_CHANGED")
        if C_EventUtils and C_EventUtils.IsEventValid and C_EventUtils.IsEventValid("LEARNED_SPELL_IN_TAB") then
            f:RegisterEvent("LEARNED_SPELL_IN_TAB")
        end
        f:RegisterEvent("TRAIT_CONFIG_UPDATED")
        f:SetScript("OnEvent", function(_, event, unit)
            if event == "PLAYER_SPECIALIZATION_CHANGED" and unit and unit ~= "player" then
                return
            end
            pcall(Bridge.UpdateDispelCapabilities, Bridge)
        end)
        Bridge._dispelFrame = f
    end

    ----------------------------------------------------------------------------
    -- Master Dashboard UI (Two-Tier Design System)
    ----------------------------------------------------------------------------
    local dashboardFrame = nil

    function Bridge:CreateDashboard()
        if dashboardFrame then return dashboardFrame end

        local f = CreateFrame("Frame", "UltimaSuiteMasterDashboard", UIParent, "PortraitFrameTemplate")
        f:SetSize(720, 560)
        f:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
        f:SetFrameStrata("DIALOG")
        f:EnableMouse(true)
        f:SetMovable(true)
        f:RegisterForDrag("LeftButton")
        f:SetScript("OnDragStart", f.StartMoving)
        f:SetScript("OnDragStop", f.StopMovingOrSizing)
        f:SetClampedToScreen(true)

        f:SetTitle("|cffffd100Ultima Suite|r Master Dashboard")
        f:SetPortraitToAsset(132623)

        local foundUISpecial = false
        for _, name in ipairs(UISpecialFrames) do
            if name == "UltimaSuiteMasterDashboard" then foundUISpecial = true; break end
        end
        if not foundUISpecial then
            table.insert(UISpecialFrames, "UltimaSuiteMasterDashboard")
        end

        -- Smart Daily Digest Card (Header Area)
        local digestCard = CreateFrame("Frame", nil, f, "BackdropTemplate")
        digestCard:SetPoint("TOPLEFT", f, "TOPLEFT", 16, -60)
        digestCard:SetPoint("TOPRIGHT", f, "TOPRIGHT", -16, -60)
        digestCard:SetHeight(76)
        digestCard:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Buttons\\WHITE8x8",
            edgeSize = 1,
        })
        digestCard:SetBackdropColor(0.14, 0.14, 0.17, 0.90)
        digestCard:SetBackdropBorderColor(0.28, 0.28, 0.34, 0.8)

        local digestTitle = digestCard:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        digestTitle:SetPoint("TOPLEFT", digestCard, "TOPLEFT", 10, -8)
        digestTitle:SetText("|cffffd700Smart Daily Digest|r")

        local digestText = digestCard:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        digestText:SetPoint("TOPLEFT", digestTitle, "BOTTOMLEFT", 0, -4)
        digestText:SetPoint("BOTTOMRIGHT", digestCard, "BOTTOMRIGHT", -10, 6)
        digestText:SetJustifyH("LEFT")
        digestText:SetJustifyV("TOP")
        f.digestText = digestText

        -- Tier 2 Filter Pills
        local selectedCategory = "ALL"
        local pillButtons = {}
        local categories = {
            { key = "ALL", label = "All Modules" },
            { key = "Combat & Gear", label = "Combat & Gear" },
            { key = "World & Story", label = "World & Story" },
            { key = "QoL & Management", label = "QoL & Social" },
            { key = "Arcade", label = "Arcade (17)" },
        }

        local pillContainer = CreateFrame("Frame", nil, f)
        pillContainer:SetPoint("TOPLEFT", digestCard, "BOTTOMLEFT", 0, -10)
        pillContainer:SetPoint("TOPRIGHT", digestCard, "BOTTOMRIGHT", 0, -10)
        pillContainer:SetHeight(28)

        local function UpdatePills()
            for _, btn in ipairs(pillButtons) do
                if btn.catKey == selectedCategory then
                    btn:SetBackdropColor(0.20, 0.18, 0.13, 0.95)
                    btn:SetBackdropBorderColor(0.85, 0.70, 0.25, 1.0)
                    btn.text:SetTextColor(1.0, 0.88, 0.45, 1.0)
                else
                    btn:SetBackdropColor(0.12, 0.12, 0.14, 0.90)
                    btn:SetBackdropBorderColor(0.24, 0.24, 0.28, 0.80)
                    btn.text:SetTextColor(0.85, 0.85, 0.85, 1.0)
                end
            end
        end

        local prevPill = nil
        for _, cat in ipairs(categories) do
            local pill = CreateFrame("Button", nil, pillContainer, "BackdropTemplate")
            pill:SetHeight(24)
            pill:SetBackdrop({
                bgFile = "Interface\\Buttons\\WHITE8x8",
                edgeFile = "Interface\\Buttons\\WHITE8x8",
                edgeSize = 1,
            })
            local pText = pill:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            pText:SetPoint("CENTER", pill, "CENTER", 0, 0)
            pText:SetText(cat.label)
            pill.text = pText
            pill.catKey = cat.key
            pill:SetWidth(pText:GetStringWidth() + 20)

            if not prevPill then
                pill:SetPoint("LEFT", pillContainer, "LEFT", 0, 0)
            else
                pill:SetPoint("LEFT", prevPill, "RIGHT", 6, 0)
            end
            prevPill = pill

            pill:SetScript("OnClick", function()
                selectedCategory = cat.key
                UpdatePills()
                f:RefreshList()
            end)
            pill:SetScript("OnEnter", function()
                if selectedCategory == cat.key then
                    pill:SetBackdropColor(0.25, 0.22, 0.15, 1.0)
                    pill:SetBackdropBorderColor(1.0, 0.88, 0.50, 1.0)
                    pill.text:SetTextColor(1.0, 0.95, 0.65, 1.0)
                else
                    pill:SetBackdropColor(0.18, 0.17, 0.20, 0.95)
                    pill:SetBackdropBorderColor(0.78, 0.61, 0.43, 1.0)
                    pill.text:SetTextColor(1.0, 0.85, 0.5, 1.0)
                end
            end)
            pill:SetScript("OnLeave", function()
                UpdatePills()
            end)

            table.insert(pillButtons, pill)
        end
        UpdatePills()

        -- ScrollFrame for AddOn Cards
        local scrollFrame = CreateFrame("ScrollFrame", "UltimaDashboardScrollFrame", f, "UIPanelScrollFrameTemplate")
        scrollFrame:SetPoint("TOPLEFT", pillContainer, "BOTTOMLEFT", 0, -8)
        scrollFrame:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -30, 40)

        local content = CreateFrame("Frame", nil, scrollFrame)
        content:SetSize(650, 600)
        scrollFrame:SetScrollChild(content)
        f.content = content

        -- Bottom Status / Info Bar
        local footer = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
        footer:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 16, 14)
        footer:SetText("Tip: Click 'Open' or type the Slash Command. Press /ultima to toggle this Master Dashboard.")

        local perfBtn = CreateFrame("Button", nil, f, "BackdropTemplate")
        perfBtn:SetSize(110, 22)
        perfBtn:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -16, 10)
        perfBtn:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Buttons\\WHITE8x8",
            edgeSize = 1,
        })
        perfBtn:SetBackdropColor(0.13, 0.13, 0.16, 0.9)
        perfBtn:SetBackdropBorderColor(0.24, 0.24, 0.28, 0.8)
        local perfText = perfBtn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        perfText:SetPoint("CENTER", perfBtn, "CENTER", 0, 0)
        perfText:SetText("Performance")
        perfBtn:SetScript("OnClick", function()
            if Bridge.ToggleProfiler then
                Bridge:ToggleProfiler()
            else
                print("|cffffd100[Ultima Suite]|r Type |cffffffff/ultima perf|r to inspect memory.")
            end
        end)

        local moverBtn = CreateFrame("Button", nil, f, "BackdropTemplate")
        moverBtn:SetSize(100, 22)
        moverBtn:SetPoint("RIGHT", perfBtn, "LEFT", -8, 0)
        moverBtn:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = false, tileSize = 6, edgeSize = 6,
            insets = { left = 1, right = 1, top = 1, bottom = 1 }
        })
        moverBtn:SetBackdropColor(0.12, 0.20, 0.30, 0.9)
        moverBtn:SetBackdropBorderColor(0.30, 0.70, 1.0, 0.9)
        local moverText = moverBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        moverText:SetPoint("CENTER", 0, 0)
        moverText:SetText(BL.UI_MOVER or "UI Mover")
        moverBtn:SetScript("OnClick", function()
            if Bridge.Mover then
                Bridge.Mover:Toggle()
            end
        end)

        -- Refresh Content Method
        local cardPool = {}
        function f:RefreshList()
            for _, card in ipairs(cardPool) do
                card:Hide()
            end

            -- Update Digest Text
            local digestLines = {}
            if Bridge:HasService("ChampionCompanion") then
                table.insert(digestLines, "|cff66ccff[ChampionCompanion]|r Vault & Upgrades analyzed.")
            end
            if Bridge:HasService("LoreArchive") then
                local zone = GetZoneText() or "Azeroth"
                table.insert(digestLines, string.format("|cffffcc00[LoreArchive]|r Current zone: |cffffffff%s|r.", zone))
            end
            if Bridge:HasService("HomeDesigner") or Bridge:HasService("GnomiesHOMEDesigner") then
                table.insert(digestLines, "|cff99ff99[Housing]|r Daily Decor & Endeavours tracking active.")
            end
            if Bridge:HasService("MenagerieKeeper") or Bridge:HasService("ZooManager") or Bridge:HasService("GnomiesZOOManager") then
                table.insert(digestLines, "|cff33ff99[MenagerieKeeper]|r Safari Radar & Battle Advisor active.")
            end
            if Bridge:HasService("GameConsole") or Bridge:HasService("GnomiesGAMEConsole") then
                table.insert(digestLines, "|cffffcc00[Arcade]|r Game Console & 17 Minigames available.")
            end
            if #digestLines == 0 then
                f.digestText:SetText("Welcome to Midnight 12.1! Load suite modules to view real-time Great Vault, Safari, Housing and Raid alerts here.")
            else
                f.digestText:SetText(table.concat(digestLines, "\n"))
            end

            local items = Bridge:GetLauncherItems()
            local yOffset = 0
            local cardIndex = 1

            for _, item in ipairs(items) do
                if selectedCategory == "ALL" or item.category == selectedCategory then
                    local card = cardPool[cardIndex]
                    if not card then
                        card = CreateFrame("Frame", nil, content, "BackdropTemplate")
                        card:SetSize(640, 46)
                        card:SetBackdrop({
                            bgFile = "Interface\\Buttons\\WHITE8x8",
                            edgeFile = "Interface\\Buttons\\WHITE8x8",
                            edgeSize = 1,
                        })
                        card:SetBackdropColor(0.13, 0.13, 0.16, 0.90)
                        card:SetBackdropBorderColor(0.24, 0.24, 0.28, 0.80)

                        local icon = card:CreateTexture(nil, "ARTWORK")
                        icon:SetSize(32, 32)
                        icon:SetPoint("LEFT", card, "LEFT", 8, 0)
                        icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
                        card.icon = icon

                        local name = card:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
                        name:SetPoint("TOPLEFT", icon, "TOPRIGHT", 10, -2)
                        card.name = name

                        local badge = card:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
                        badge:SetPoint("LEFT", name, "RIGHT", 8, 0)
                        card.badge = badge

                        local desc = card:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
                        desc:SetPoint("TOPLEFT", name, "BOTTOMLEFT", 0, -2)
                        desc:SetPoint("RIGHT", card, "RIGHT", -90, 0)
                        desc:SetJustifyH("LEFT")
                        card.desc = desc

                        local openBtn = CreateFrame("Button", nil, card, "BackdropTemplate")
                        openBtn:SetSize(72, 24)
                        openBtn:SetPoint("RIGHT", card, "RIGHT", -8, 0)
                        openBtn:SetBackdrop({
                            bgFile = "Interface\\Buttons\\WHITE8x8",
                            edgeFile = "Interface\\Buttons\\WHITE8x8",
                            edgeSize = 1,
                        })
                        openBtn:SetBackdropColor(0.18, 0.17, 0.20, 0.95)
                        openBtn:SetBackdropBorderColor(0.78, 0.61, 0.43, 1.0)
                        local obText = openBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
                        obText:SetPoint("CENTER", openBtn, "CENTER", 0, 0)
                        obText:SetText("Open")
                        openBtn.text = obText
                        card.openBtn = openBtn

                        cardPool[cardIndex] = card
                    end

                    card:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -yOffset)
                    card.icon:SetTexture(item.icon or 134400)
                    card.name:SetText(item.name or item.id or "Module")
                    card.desc:SetText(item.desc or item.tooltip or "")

                    local slashStr = (item.slash and item.slash ~= "") and (" |cff888888(" .. item.slash .. ")|r") or ""
                    if item.isLoaded then
                        card.badge:SetText("|cff00ff00[Active]|r" .. slashStr)
                        card.openBtn:SetScript("OnClick", function()
                            if item.callback then
                                pcall(item.callback)
                            elseif item.onClick then
                                pcall(item.onClick)
                            elseif item.slash and item.slash ~= "" then
                                ChatFrame_OpenChat(item.slash)
                            end
                        end)
                        card.openBtn:Enable()
                        card.openBtn.text:SetTextColor(1.0, 0.85, 0.5)
                    else
                        card.badge:SetText("|cff888888[Not Loaded]|r" .. slashStr)
                        card.openBtn:SetScript("OnClick", function()
                            local loaded, reason = C_AddOns.LoadAddOn(item.id)
                            if loaded then
                                f:RefreshList()
                            else
                                print("|cffff4040[Ultima Suite]|r Could not load " .. tostring(item.name or item.id) .. ": " .. tostring(reason))
                            end
                        end)
                        card.openBtn:Enable()
                        card.openBtn.text:SetTextColor(0.75, 0.75, 0.75)
                    end

                    card:Show()
                    yOffset = yOffset + 50
                    cardIndex = cardIndex + 1
                end
            end
            content:SetHeight(math.max(yOffset + 10, 360))
        end

        f:SetScript("OnShow", function() f:RefreshList() end)
        dashboardFrame = f
        return f
    end

    function Bridge:ToggleDashboard()
        local f = self:CreateDashboard()
        if f:IsShown() then
            f:Hide()
        else
            f:Show()
            f:RefreshList()
        end
    end

    ----------------------------------------------------------------------------
    -- In-Game Performance Profiler (/ultima perf)
    ----------------------------------------------------------------------------
    local profilerFrame = nil

    function Bridge:CreateProfiler()
        if profilerFrame then return profilerFrame end

        local f = CreateFrame("Frame", "UltimaSuiteProfilerFrame", UIParent, "BackdropTemplate")
        f:SetSize(360, 380)
        f:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
        f:SetFrameStrata("DIALOG")
        f:EnableMouse(true)
        f:SetMovable(true)
        f:RegisterForDrag("LeftButton")
        f:SetScript("OnDragStart", f.StartMoving)
        f:SetScript("OnDragStop", f.StopMovingOrSizing)
        f:SetClampedToScreen(true)

        f:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Buttons\\WHITE8x8",
            edgeSize = 1,
        })
        f:SetBackdropColor(0.10, 0.10, 0.12, 0.95)
        f:SetBackdropBorderColor(0.78, 0.61, 0.43, 1.0)

        local title = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        title:SetPoint("TOPLEFT", 14, -12)
        title:SetText("|cffffd100Ultima Suite|r  |cffffffffPerformance Profiler|r")

        local foundUISpecial = false
        for _, name in ipairs(UISpecialFrames) do
            if name == "UltimaSuiteProfilerFrame" then foundUISpecial = true; break end
        end
        if not foundUISpecial then
            table.insert(UISpecialFrames, "UltimaSuiteProfilerFrame")
        end

        local closeBtn = CreateFrame("Button", nil, f, "UIPanelCloseButton")
        closeBtn:SetSize(22, 22)
        closeBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", -3, -1)
        closeBtn:SetScript("OnClick", function() f:Hide() end)
        closeBtn:SetFrameLevel(math.max((f:GetFrameLevel() or 1) + 30, 200))
        if closeBtn.Raise then closeBtn:Raise() end

        local statsHeader = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        statsHeader:SetPoint("TOPLEFT", 14, -36)
        statsHeader:SetText("FPS: -- | Total Memory: -- KB | Churn: -- KB/s")
        f.statsHeader = statsHeader

        local scrollFrame = CreateFrame("ScrollFrame", "UltimaProfilerScrollFrame", f, "UIPanelScrollFrameTemplate")
        scrollFrame:SetPoint("TOPLEFT", 12, -58)
        scrollFrame:SetPoint("BOTTOMRIGHT", -28, 42)

        local content = CreateFrame("Frame", nil, scrollFrame)
        content:SetSize(310, 360)
        scrollFrame:SetScrollChild(content)

        local rowPool = {}
        local lastUpdate = 0
        local lastMem = 0

        function f:RefreshProfiler()
            UpdateAddOnMemoryUsage()
            local curMem = collectgarbage("count")
            local churn = (lastMem > 0 and (curMem - lastMem)) or 0
            lastMem = curMem

            local framerate = math.floor(GetFramerate() + 0.5)
            f.statsHeader:SetText(string.format("FPS: |cff00ff00%d|r  •  Lua: |cffffffff%.1f MB|r  •  Churn: |cff%s%.1f KB/s|r",
                framerate, curMem / 1024, churn > 50 and "ff4444" or "00ccff", math.max(0, churn)))

            local y = 0
            local profilerList = {}
            for _, item in ipairs(Bridge.DEFAULT_ITEMS) do
                table.insert(profilerList, item)
            end
            table.insert(profilerList, { id = "RoutineAssistant_DamageMeter", name = "  ↳ Damage Meter" })
            table.insert(profilerList, { id = "RoutineAssistant_InfoBar", name = "  ↳ Info Bar" })
            table.insert(profilerList, { id = "RoutineAssistant_UnitFrames", name = "  ↳ Unit Frames" })

            for _, item in ipairs(profilerList) do
                local mem = GetAddOnMemoryUsage(item.id)
                local row = rowPool[idx]
                if not row then
                    row = CreateFrame("Frame", nil, content, "BackdropTemplate")
                    row:SetSize(306, 26)
                    row:SetBackdrop({
                        bgFile = "Interface\\Buttons\\WHITE8x8",
                        edgeFile = "Interface\\Buttons\\WHITE8x8",
                        edgeSize = 1,
                    })
                    row:SetBackdropColor(0.14, 0.14, 0.16, 0.8)
                    row:SetBackdropBorderColor(0.24, 0.24, 0.28, 0.6)

                    local name = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
                    name:SetPoint("LEFT", 8, 0)
                    row.name = name

                    local memText = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
                    memText:SetPoint("RIGHT", -8, 0)
                    row.memText = memText

                    rowPool[idx] = row
                end

                row:SetPoint("TOPLEFT", 0, -y)
                row.name:SetText(item.name)
                if mem and mem > 0 then
                    row.memText:SetText(string.format("|cff00ff00%.1f KB|r", mem))
                else
                    row.memText:SetText("|cff777777Inactive|r")
                end
                row:Show()
                y = y + 28
                idx = idx + 1
            end
            content:SetHeight(math.max(1, y))
        end

        local gcBtn = CreateFrame("Button", nil, f, "BackdropTemplate")
        gcBtn:SetSize(140, 24)
        gcBtn:SetPoint("BOTTOMLEFT", 12, 10)
        gcBtn:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Buttons\\WHITE8x8",
            edgeSize = 1,
        })
        gcBtn:SetBackdropColor(0.18, 0.17, 0.20, 0.95)
        gcBtn:SetBackdropBorderColor(0.78, 0.61, 0.43, 1.0)
        local gcText = gcBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        gcText:SetPoint("CENTER", 0, 0)
        gcText:SetText("Run Garbage Collect")
        gcBtn:SetScript("OnClick", function()
            collectgarbage("collect")
            f:RefreshProfiler()
            if Bridge.ShowToast then
                Bridge:ShowToast("Ultima Suite", "Lua Garbage Collection executed.", 132623, nil, false, nil, 2.5, "info")
            end
        end)

        f:SetScript("OnUpdate", function(self, elapsed)
            lastUpdate = lastUpdate + elapsed
            if lastUpdate > 1.0 then
                lastUpdate = 0
                f:RefreshProfiler()
            end
        end)

        profilerFrame = f
        return f
    end

    function Bridge:ToggleProfiler()
        local p = self:CreateProfiler()
        if p:IsShown() then
            p:Hide()
        else
            p:Show()
            p:RefreshProfiler()
        end
    end

    -- Global Slash Commands
    SLASH_ULTIMASUITE1 = "/ultima"
    SLASH_ULTIMASUITE2 = "/us"
    SlashCmdList["ULTIMASUITE"] = function(msg)
        local raw = (msg or ""):trim()
        local cmd, arg = raw:match("^(%S+)%s*(.*)$")
        cmd = (cmd or ""):lower()
        if cmd == "perf" then
            if Bridge.ToggleProfiler then
                Bridge:ToggleProfiler()
            else
                Bridge:Print("Ultima Suite", "Performance monitoring active.", "cli")
            end
        elseif cmd == "theme" then
            local target = (arg or ""):upper():trim()
            if target == "BLIZZARD" or target == "PORTRAIT" or target == "CLASSIC" then
                Bridge.Theme:SetTheme("BLIZZARD")
                Bridge:Print("Ultima Suite", "Window Theme set to Blizzard Portrait (Classic).", "cli")
            elseif target == "MINIMALIST" or target == "DARK" or target == "MODERN" then
                Bridge.Theme:SetTheme("MINIMALIST")
                Bridge:Print("Ultima Suite", "Window Theme set to Modern Dark (Minimalist).", "cli")
            else
                local nextTheme = Bridge.Theme:ToggleTheme()
                Bridge:Print("Ultima Suite", string.format("Window Theme toggled to %s.", nextTheme == "BLIZZARD" and "Blizzard Portrait (Classic)" or "Modern Dark (Minimalist)"), "cli")
            end
        elseif cmd == "toast" then
            Bridge:ShowToast("Ultima Suite", "Toast Notification System online & operational!", 132623, function()
                Bridge:ToggleDashboard()
            end, true, nil, 3.5, "success")
            Bridge:Print("Ultima Suite", "Test toast triggered (click to open Master Dashboard).", "cli")
        elseif cmd == "move" or cmd == "mover" then
            if Bridge.Mover then
                Bridge.Mover:Toggle()
            end
        elseif cmd == "resetpos" then
            if Bridge.Mover then
                Bridge.Mover:ResetPositions()
            end
        elseif cmd == "help" then
            Bridge:Print("Ultima Suite", "Commands:", "cli")
            Bridge:RawPrint("  |cffffd100/ultima|r - Open Master Dashboard")
            Bridge:RawPrint("  |cffffd100/ultima move|r - Toggle UI Mover Mode (reposition frames)")
            Bridge:RawPrint("  |cffffd100/ultima resetpos|r - Reset window positions to default")
            Bridge:RawPrint("  |cffffd100/ultima toast|r - Trigger test toast notification")
            Bridge:RawPrint("  |cffffd100/ultima theme [blizzard|dark]|r - Switch window theme")
            Bridge:RawPrint("  |cffffd100/ultima perf|r - Toggle real-time memory profiler")
        else
            Bridge:ToggleDashboard()
        end
    end
end

if Bridge and Bridge.RegisterCallback and not Bridge.RegisterEvent then
    Bridge.RegisterEvent = Bridge.RegisterCallback
end

if ns then
    ns.UltimaBridge = Bridge
    ns.GnomiesBridge = Bridge
end
