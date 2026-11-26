--------------------------------------------------------------------------------
-- Macro Maker - Manager Module
-- Version: 1.0
-- Author: Satyros
--
-- Description:
--   Manages the "Manager" panel.
--   Handles macro list display, scope selection, and management operations.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

--------------------------------------------------------------------------------
-- Panel Creation
--------------------------------------------------------------------------------

--- Creates the Manager Column UI, including list, search, and action buttons.
--- @param parent table The parent frame to attach the Manager panel to.
function MM:CreateManagerColumn(parent)
    local panel = CreateFrame("Frame", "$parent_Manager", parent, "BackdropTemplate")
    local PANEL_BACKDROP = {
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 10,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    }
    panel:SetBackdrop(PANEL_BACKDROP)
    panel:SetBackdropColor(0.06, 0.06, 0.08, 0.7)
    panel:SetBackdropBorderColor(0.18, 0.18, 0.2, 0.8)

    panel:SetPoint("TOPLEFT", 20, -50)
    panel:SetPoint("BOTTOMLEFT", 20, 10)
    panel:SetWidth(200)
    
    local label = panel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("TOP", 0, -10)
    label:SetText(L["Manager"])
    
    MM.ManagerPanel = panel
    
    -- 1. Scope Dropdown (Account vs Character Macros)
    local scopeDropdown = CreateFrame("DropdownButton", "MM_ScopeDropdown", panel, "WowStyle1DropdownTemplate")
    scopeDropdown:SetPoint("TOP", 0, -30)
    scopeDropdown:SetWidth(170)
    
    -- Label for custom dropdown text
    local lbl = scopeDropdown:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    lbl:SetPoint("LEFT", 10, 0)
    lbl:SetPoint("RIGHT", -25, 0)
    lbl:SetJustifyH("LEFT")
    lbl:SetWordWrap(false)
    lbl:SetText(L["Account Macros"])
    scopeDropdown.Label = lbl
    
    scopeDropdown:SetText(L["Account Macros"])
    
    MM.selectedScope = "account" 
    MM.ScopeDropdown = scopeDropdown

    scopeDropdown:SetupMenu(function(dropdown, rootDescription)
        rootDescription:CreateButton(L["Account Macros"], function()
            MM.selectedScope = "account"
            dropdown:SetText(L["Account Macros"])
            if dropdown.Label then dropdown.Label:SetText(L["Account Macros"]) end
            if MM.libCategoryDropdown then MM.libCategoryDropdown:Hide() end
            if MM.managerScrollFrame then MM.managerScrollFrame:SetPoint("TOPLEFT", 10, -90) end
            MM:UpdateMacroList()
        end)
        
        rootDescription:CreateButton(L["Character Macros"], function()
            MM.selectedScope = "character"
            dropdown:SetText(L["Character Macros"])
            if dropdown.Label then dropdown.Label:SetText(L["Character Macros"]) end
            if MM.libCategoryDropdown then MM.libCategoryDropdown:Hide() end
            if MM.managerScrollFrame then MM.managerScrollFrame:SetPoint("TOPLEFT", 10, -90) end
            MM:UpdateMacroList()
        end)

        rootDescription:CreateButton(L["Personal Library"], function()
            MM.selectedScope = "library"
            dropdown:SetText(L["Personal Library"])
            if dropdown.Label then dropdown.Label:SetText(L["Personal Library"]) end
            if MM.libCategoryDropdown then MM.libCategoryDropdown:Show() end
            if MM.managerScrollFrame then MM.managerScrollFrame:SetPoint("TOPLEFT", 10, -114) end
            MM:UpdateMacroList()
        end)

        rootDescription:CreateButton(L["Warband Vault"] or "Warband Vault", function()
            MM.selectedScope = "warband"
            dropdown:SetText(L["Warband Vault"] or "Warband Vault")
            if dropdown.Label then dropdown.Label:SetText(L["Warband Vault"] or "Warband Vault") end
            if MM.libCategoryDropdown then MM.libCategoryDropdown:Hide() end
            if MM.managerScrollFrame then MM.managerScrollFrame:SetPoint("TOPLEFT", 10, -90) end
            MM:UpdateMacroList()
        end)
    end)
    
    -- 2. Search Box & Favorites Filter Toggle
    local searchBox = CreateFrame("EditBox", "$parent_Search", panel, "InputBoxTemplate")
    searchBox:SetSize(142, 20)
    searchBox:SetPoint("TOPLEFT", 12, -60) 
    searchBox:SetAutoFocus(false)
    searchBox:SetFontObject("ChatFontNormal")
    searchBox:SetTextInsets(0, 0, 0, 0)
    
    local searchLabel = searchBox:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    searchLabel:SetPoint("LEFT", 4, 0)
    searchLabel:SetText(L["Search..."])
    
    local clearSearchBtn = CreateFrame("Button", nil, searchBox, "UIPanelCloseButton")
    clearSearchBtn:SetSize(16, 16)
    clearSearchBtn:SetPoint("RIGHT", 2, 0)
    clearSearchBtn:Hide()
    clearSearchBtn:SetScript("OnClick", function()
        searchBox:SetText("")
        searchBox:SetFocus()
    end)
    
    searchBox:HookScript("OnEditFocusGained", function() searchLabel:Hide() end)
    searchBox:HookScript("OnEditFocusLost", function(self) if self:GetText() == "" then searchLabel:Show() end end)
    searchBox:HookScript("OnTextChanged", function(self)
        local txt = self:GetText()
        if txt and txt ~= "" then clearSearchBtn:Show() else clearSearchBtn:Hide() end
        MM:UpdateMacroList()
    end)
    MM.ManagerSearch = searchBox
    
    -- Favorites Filter Toggle Button
    local favFilterBtn = CreateFrame("Button", nil, panel, "BackdropTemplate")
    favFilterBtn:SetSize(22, 22)
    favFilterBtn:SetPoint("LEFT", searchBox, "RIGHT", 6, 0)
    MM:StyleButtonToModern(favFilterBtn)
    
    local favStar = favFilterBtn:CreateTexture(nil, "OVERLAY")
    favStar:SetSize(14, 14)
    favStar:SetPoint("CENTER", 0, 0)
    favStar:SetTexture("Interface\\COMMON\\FavoritesIcon")
    favStar:SetDesaturated(true)
    favStar:SetAlpha(0.4)
    favFilterBtn.star = favStar
    
    local function UpdateFavFilterVisual()
        if MM.filterFavoritesOnly then
            favStar:SetDesaturated(false)
            favStar:SetAlpha(1.0)
            favFilterBtn:SetBackdropBorderColor(1, 0.82, 0, 1)
            favFilterBtn:SetBackdropColor(0.25, 0.2, 0.08, 0.9)
        else
            favStar:SetDesaturated(true)
            favStar:SetAlpha(0.4)
            favFilterBtn:SetBackdropBorderColor(0.25, 0.25, 0.28, 1)
            favFilterBtn:SetBackdropColor(0.12, 0.12, 0.14, 0.9)
        end
    end
    
    favFilterBtn:SetScript("OnClick", function()
        MM.filterFavoritesOnly = not MM.filterFavoritesOnly
        UpdateFavFilterVisual()
        MM:UpdateMacroList()
    end)
    
    favFilterBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Filter Favorites"] or "Filter Favorites", 1, 0.82, 0)
        GameTooltip:AddLine(L["Toggle showing only favorite macros."] or "Toggle showing only favorite macros.", 1, 1, 1, true)
        GameTooltip:Show()
    end)
    favFilterBtn:SetScript("OnLeave", GameTooltip_Hide)
    MM.favFilterBtn = favFilterBtn
    
    -- Library Category Filter Dropdown (shown only in library scope)
    local libCategoryDropdown = CreateFrame("DropdownButton", "MM_LibCategoryDropdown", panel, "WowStyle1DropdownTemplate")
    libCategoryDropdown:SetPoint("TOP", 0, -86)
    libCategoryDropdown:SetWidth(170)
    libCategoryDropdown:Hide()
    
    local libCatLbl = libCategoryDropdown:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    libCatLbl:SetPoint("LEFT", 10, 0)
    libCatLbl:SetPoint("RIGHT", -25, 0)
    libCatLbl:SetJustifyH("LEFT")
    libCatLbl:SetWordWrap(false)
    libCatLbl:SetText(L["Category: All"] or "Category: All")
    libCategoryDropdown.Label = libCatLbl
    libCategoryDropdown:SetText(L["Category: All"] or "Category: All")
    MM.selectedLibraryCategory = "ALL"
    MM.libCategoryDropdown = libCategoryDropdown

    libCategoryDropdown:SetupMenu(function(dropdown, rootDescription)
        local categories = {
            { id = "ALL", label = L["All Categories"] or "All Categories" },
            { id = "Raid", label = L["Raid & M+"] or "Raid & M+" },
            { id = "PvP", label = "PvP" },
            { id = "Utility", label = L["Utility"] or "Utility" },
            { id = "Class", label = L["Class Specific"] or "Class Specific" },
            { id = "General", label = L["General"] or "General" },
        }
        for _, cat in ipairs(categories) do
            rootDescription:CreateButton(cat.label, function()
                MM.selectedLibraryCategory = cat.id
                dropdown:SetText(cat.label)
                if dropdown.Label then dropdown.Label:SetText(cat.label) end
                MM:UpdateMacroList()
            end)
        end
    end)

    -- 3. Macro List ScrollFrame
    local scrollFrame = CreateFrame("ScrollFrame", "$parent_Scroll", panel, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 10, -90)
    MM.managerScrollFrame = scrollFrame
    
    MM:SkinScrollBar(scrollFrame)
    
    local scrollChild = CreateFrame("Frame")
    scrollChild:SetSize(160, 1) -- Height updated dynamically
    scrollFrame:SetScrollChild(scrollChild)
    
    panel.listContent = scrollChild
    MM.macroListButtons = {}

    -- Adjust ScrollFrame height to fill remaining space above toolbar
    scrollFrame:SetPoint("BOTTOMRIGHT", -30, 85)
    
    -- Usage Label / Status Area
    local usageLabel = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    usageLabel:SetPoint("BOTTOM", 0, 64)
    usageLabel:SetText("")
    MM.usageLabel = usageLabel
    
    -- 4. Action Toolbar
    -- Row 1: + New (58px), Copy/Duplicate (58px), Delete (58px)
    local btnNew = CreateFrame("Button", nil, panel, "GameMenuButtonTemplate, BackdropTemplate")
    btnNew:SetPoint("BOTTOMLEFT", 12, 36)
    btnNew:SetSize(56, 22)
    btnNew:SetText("+ " .. (L["New"] or "New"))
    MM:StyleButtonToModern(btnNew)
    btnNew:SetScript("OnClick", function()
        MM:ClearBuilder()
    end)
    btnNew:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["New Macro"] or "New Macro", 1, 1, 1)
        GameTooltip:AddLine(L["Clear the workbench and create a new macro (Ctrl+N)."] or "Clear the workbench and create a new macro (Ctrl+N).", 0.7, 0.7, 0.7, true)
        GameTooltip:Show()
    end)
    btnNew:SetScript("OnLeave", function() GameTooltip:Hide() end)
    panel.btnNew = btnNew
    
    local btnDup = CreateFrame("Button", nil, panel, "GameMenuButtonTemplate, BackdropTemplate")
    btnDup:SetPoint("LEFT", btnNew, "RIGHT", 4, 0)
    btnDup:SetSize(58, 22)
    btnDup:SetText(L["Duplicate"] or "Duplicate")
    MM:StyleButtonToModern(btnDup)
    btnDup:SetScript("OnClick", function()
        MM:DuplicateMacro()
    end)
    btnDup:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Duplicate Macro"] or "Duplicate Macro", 1, 1, 1)
        GameTooltip:AddLine(L["Duplicate the selected macro (Ctrl+D)."] or "Duplicate the selected macro (Ctrl+D).", 0.7, 0.7, 0.7, true)
        GameTooltip:Show()
    end)
    btnDup:SetScript("OnLeave", function() GameTooltip:Hide() end)
    panel.btnDup = btnDup

    local btnDel = CreateFrame("Button", nil, panel, "GameMenuButtonTemplate, BackdropTemplate")
    btnDel:SetPoint("LEFT", btnDup, "RIGHT", 4, 0)
    btnDel:SetSize(54, 22)
    btnDel:SetText(L["Delete"] or "Delete")
    MM:StyleButtonToModern(btnDel)
    btnDel:SetScript("OnClick", function()
        MM:DeleteMacro()
    end)
    btnDel:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Delete Macro"] or "Delete Macro", 1, 0.2, 0.2)
        GameTooltip:AddLine(L["Delete the currently selected macro."] or "Delete the currently selected macro.", 0.7, 0.7, 0.7, true)
        GameTooltip:Show()
    end)
    btnDel:SetScript("OnLeave", function() GameTooltip:Hide() end)
    panel.btnDel = btnDel

    -- Row 2: Export (56px), Import (56px), Backup (64px)
    local btnExport = CreateFrame("Button", nil, panel, "GameMenuButtonTemplate, BackdropTemplate")
    btnExport:SetPoint("BOTTOMLEFT", 12, 10)
    btnExport:SetSize(56, 22)
    btnExport:SetText(L["Export"] or "Export")
    MM:StyleButtonToModern(btnExport)
    btnExport:SetScript("OnClick", function()
        MM:ShowImportExportWindow("export")
    end)
    btnExport:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Export Macro"] or "Export Macro", 1, 1, 1)
        GameTooltip:AddLine(L["Export selected macro to text or share string."] or "Export selected macro to text or share string.", 0.7, 0.7, 0.7, true)
        GameTooltip:Show()
    end)
    btnExport:SetScript("OnLeave", function() GameTooltip:Hide() end)
    panel.btnExport = btnExport

    local btnImport = CreateFrame("Button", nil, panel, "GameMenuButtonTemplate, BackdropTemplate")
    btnImport:SetPoint("LEFT", btnExport, "RIGHT", 4, 0)
    btnImport:SetSize(56, 22)
    btnImport:SetText(L["Import"] or "Import")
    MM:StyleButtonToModern(btnImport)
    btnImport:SetScript("OnClick", function() 
        MM:ShowImportExportWindow("import")
    end)
    btnImport:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Import Macro"] or "Import Macro", 1, 1, 1)
        GameTooltip:AddLine(L["Import macro from text or string."] or "Import macro from text or string.", 0.7, 0.7, 0.7, true)
        GameTooltip:Show()
    end)
    btnImport:SetScript("OnLeave", function() GameTooltip:Hide() end)
    panel.btnImport = btnImport

    local btnBackup = CreateFrame("Button", nil, panel, "GameMenuButtonTemplate, BackdropTemplate")
    btnBackup:SetPoint("LEFT", btnImport, "RIGHT", 4, 0)
    btnBackup:SetSize(58, 22)
    btnBackup:SetText(L["Backup"] or "Backup")
    MM:StyleButtonToModern(btnBackup)
    btnBackup:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    btnBackup:SetScript("OnClick", function(self, button)
        if button == "RightButton" then
            if not MM.db or not MM.db.backups or #MM.db.backups == 0 then
                if MM.Notify then MM:Notify(L["No backups available yet."] or "Noch keine Backups vorhanden.", "info") end
                return
            end
            if MenuUtil then
                MenuUtil.CreateContextMenu(self, function(owner, rootDescription)
                    rootDescription:CreateTitle(L["Library Backups"] or "Library Backups")
                    for idx, snap in ipairs(MM.db.backups) do
                        local label = string.format("#%d: %s (%d) [%s]", idx, snap.dateStr or "?", snap.macroCount or 0, snap.reason or "Auto")
                        rootDescription:CreateButton(label, function()
                            if MM.Profiles then
                                MM.Profiles:RestoreBackup(idx)
                            end
                        end)
                    end
                end)
            end
        else
            if MM.Profiles then
                MM.Profiles:CreateBackup("Manual")
            end
        end
    end)
    btnBackup:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Library Backup"] or "Bibliothek-Backup", 1, 0.82, 0)
        GameTooltip:AddLine(L["Left-Click: Create new backup snapshot."] or "Linksklick: Neuen Schnappschuss erstellen.", 1, 1, 1, true)
        GameTooltip:AddLine(L["Right-Click: Restore from backup list."] or "Rechtsklick: Aus Backup-Liste wiederherstellen.", 0.4, 0.8, 1.0, true)
        if MM.db and MM.db.backups and #MM.db.backups > 0 then
            GameTooltip:AddLine(" ", 1, 1, 1)
            GameTooltip:AddLine(string.format(L["Available Backups: %d"] or "Available Backups: %d", #MM.db.backups), 0.4, 0.8, 1.0)
            GameTooltip:AddLine(string.format(L["Latest: %s (%s)"] or "Letztes: %s (%s)", MM.db.backups[1].dateStr, MM.db.backups[1].reason), 0.7, 0.7, 0.7)
        end
        GameTooltip:Show()
    end)
    btnBackup:SetScript("OnLeave", function() GameTooltip:Hide() end)
    panel.btnBackup = btnBackup

    MM:UpdateMacroList()
end

--------------------------------------------------------------------------------
-- End of Manager.lua
-- List and Operations logic moved to UI/Manager/MacroList.lua and Operations.lua
--------------------------------------------------------------------------------
