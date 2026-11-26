--------------------------------------------------------------------------------
-- Macro Maker - Import/Export Module
-- Version: 1.0
-- Author: Satyros
--
-- Description:
--   Manages the Import/Export window UI.
--   Allow users to copy macro strings (Export) or paste them (Import) to
--   create new macros from shared data strings.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L


--------------------------------------------------------------------------------
-- Window Management
--------------------------------------------------------------------------------

--- Opens the Import/Export window in the specified mode.
--- @param mode string "import" or "export"
--- @param initialText string (Optional) Text to pre-fill (for export)
function MM:ShowImportExportWindow(mode, initialText)
    if not MM.ImportExportWindow then
        MM:CreateImportExportWindow()
    end
    
    local f = MM.ImportExportWindow
    f.mode = mode
    f.initialExportText = initialText or ""
    
    f:Show()
    f.editBox:SetText(initialText or "")
    f.editBox:SetFocus()
    
    if mode == "export" then
        f.editBox:HighlightText()
        f.title:SetText(L["Export Macro"])
        f.btnAction:Hide()
        if f.formatBar then f.formatBar:Show() end
        f.lblInfo:SetText(L["Press Ctrl+C to copy the code below."])
    elseif mode == "import_backup" then
        f.title:SetText(L["Restore Backup"])
        f.btnAction:SetText(L["Restore"])
        f.btnAction:Show()
        if f.formatBar then f.formatBar:Hide() end
        f.lblInfo:SetText(L["Paste the Backup Code below. WARNING: This overwrites current data!"])
    else
        f.title:SetText(L["Import Macro"])
        f.btnAction:SetText(L["Import"])
        f.btnAction:Show()
        if f.formatBar then f.formatBar:Hide() end
        f.lblInfo:SetText(L["Paste (Ctrl+V) Macro or Library Code below."])
    end
end

--- Creates the reusable Import/Export UI frame.
function MM:CreateImportExportWindow()
    local f = CreateFrame("Frame", "MM_ImportExport", UIParent, "BackdropTemplate")
    f:SetSize(400, 300)
    f:SetPoint("CENTER")
    f:SetFrameStrata("FULLSCREEN_DIALOG")
    f:SetToplevel(true)
    
    -- Backdrop
    f:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    f:SetBackdropColor(0.1, 0.1, 0.1, 1)
    f:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)
    
    -- Title
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -16)
    title:SetText(L["Import/Export"])
    f.title = title
    
    -- Instruction Label
    local info = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    info:SetPoint("TOP", title, "BOTTOM", 0, -10)
    info:SetText("")
    f.lblInfo = info
    
    -- Scrollable EditBox
    local scroll = CreateFrame("ScrollFrame", "$parent_Scroll", f, "UIPanelScrollFrameTemplate")
    MM:SkinScrollBar(scroll)
    scroll:SetPoint("TOPLEFT", 25, -60)
    scroll:SetPoint("BOTTOMRIGHT", -35, 50)
    
    local editBox = CreateFrame("EditBox", nil, scroll)
    editBox:SetMultiLine(true)
    editBox:SetSize(340, 400) 
    editBox:SetFontObject("ChatFontNormal")
    editBox:SetAutoFocus(false)
    scroll:SetScrollChild(editBox)
    f.editBox = editBox
    
    editBox:SetScript("OnEscapePressed", function() f:Hide() end)
    
    -- Action Button (Import Only)
    local btn = CreateFrame("Button", nil, f, "GameMenuButtonTemplate, BackdropTemplate")
    btn:SetSize(120, 30)
    btn:SetPoint("BOTTOM", 0, 15)
    btn:SetText("Action")
    MM:StyleButtonToModern(btn)
    f.btnAction = btn
    
    -- Export Format Selector Bar (Shown during export)
    local formatBar = CreateFrame("Frame", nil, f)
    formatBar:SetPoint("BOTTOMLEFT", 25, 12)
    formatBar:SetPoint("BOTTOMRIGHT", -25, 12)
    formatBar:SetHeight(28)
    f.formatBar = formatBar
    
    local formats = {
        { id = "addon", label = L["Compressed Addon String"] or "Addon String" },
        { id = "discord", label = L["Discord Codeblock"] or "Discord" },
        { id = "plain", label = L["Plain Text / Markdown"] or "Markdown" },
    }
    
    local fWidth = 110
    local fStartX = 0
    for _, fmt in ipairs(formats) do
        local fmtBtn = CreateFrame("Button", nil, formatBar, "GameMenuButtonTemplate, BackdropTemplate")
        fmtBtn:SetPoint("LEFT", fStartX, 0)
        fmtBtn:SetSize(fWidth, 24)
        fmtBtn:SetText(fmt.label)
        fmtBtn:SetNormalFontObject("GameFontNormalSmall")
        MM:StyleButtonToModern(fmtBtn)
        
        fmtBtn:SetScript("OnClick", function()
            local mName = MM.selectedMacroName or "Macro"
            local rawBody = (MM.outputBox and MM.outputBox:GetText()) or f.initialExportText or ""
            if fmt.id == "addon" then
                f.editBox:SetText(f.initialExportText or rawBody)
            elseif fmt.id == "discord" then
                f.editBox:SetText(string.format("```lua\n-- [MacroMaker] %s\n%s\n```", mName, rawBody))
            elseif fmt.id == "plain" then
                f.editBox:SetText(string.format("# Macro: %s\n%s", mName, rawBody))
            end
            f.editBox:HighlightText()
        end)
        
        fStartX = fStartX + fWidth + 8
    end
    formatBar:Hide()
    
    btn:SetScript("OnClick", function()
        if f.mode == "export" then
             -- Nothing needed
        elseif f.mode == "import_backup" then
             local text = editBox:GetText()
             if not text or text == "" then
                 print(L["Invalid Backup format."])
                 return
             end
             
             local db, err, header = MM:DecodeCompressedPayload(text)
             if not db and MM.Serializer then
                 -- Fallback legacy check
                 local b64 = text:match("%[MacroMakerBackup::(.-)%]") or text
                 local serialized = MM:Base64Decode(b64)
                 if serialized and serialized ~= "" then
                     db, err = MM.Serializer:Deserialize(serialized)
                 end
             end
             
             if db and type(db) == "table" and (db.library or db.settings or db.macros) then
                 local function ApplyRestore()
                     if _G["MacroMaker_DB"] then
                         wipe(_G["MacroMaker_DB"])
                         for k, v in pairs(db) do _G["MacroMaker_DB"][k] = v end
                     else
                         _G["MacroMaker_DB"] = db
                     end
                     MM.db = _G["MacroMaker_DB"]
                     ReloadUI()
                 end

                 if UltimaBridge and UltimaBridge.ShowConfirmDialog then
                     UltimaBridge:ShowConfirmDialog(
                         L["Warning: Restoring a backup will overwrite your current library and settings. Do you wish to continue?"],
                         ApplyRestore
                     )
                 else
                     ApplyRestore()
                 end
             else
                 print(L["Backup data seems invalid (missing structure): "] .. (err or "Unknown"))
             end
             
        else 
             -- Check for Library or List Import (Compressed or Legacy)
             local text = editBox:GetText()
             local payloadData, err, header = MM:DecodeCompressedPayload(text)
             
             if payloadData and type(payloadData) == "table" then
                 if header == "Library" or header == "List" or header == "MacroMakerLibrary" or header == "MacroMakerList" or (#payloadData > 0 and payloadData[1] and payloadData[1].name) then
                     if not MM.db.library then MM.db.library = {} end
                     local count = 0
                     for _, m in ipairs(payloadData) do
                         if m.name and m.body then
                             table.insert(MM.db.library, m)
                             count = count + 1
                         end
                     end
                     print(string.format(L["Imported %d macros to Library."], count))
                     MM:UpdateMacroList()
                     f:Hide()
                     return
                 end
             end
             
             -- Default: Import Single Macro
             local data, err = MM:ImportMacroString(text)
            
             if data then
                  if MM.selectedScope == "library" then
                      -- Import directly to Library
                      if not MM.db.library then MM.db.library = {} end
                      table.insert(MM.db.library, {
                          name = data.name,
                          icon = data.icon,
                          body = data.body
                      })
                      print(L["Macro Imported to Library: "] .. data.name)
                      MM:UpdateMacroList()
                      f:Hide()
                  else
                      -- Macro Creation Logic (Game Macros)
                      local isPerChar = (MM.selectedScope == "character")
                      local index = CreateMacro(data.name, data.icon, data.body, isPerChar)
                      if index then
                          print(L["Macro Imported: "] .. data.name)
                          MM:UpdateMacroList()
                          f:Hide()
                      else
                          print(L["Error creating macro. Check limits or name conflict."])
                      end
                  end
             else
                 print(L["Import Failed: "] .. (err or "Unknown"))
             end
        end
    end)
    
    -- Close Button
    local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    close:SetSize(22, 22)
    close:SetPoint("TOPRIGHT", f, "TOPRIGHT", -3, -1)
    close:SetScript("OnClick", function() f:Hide() end)
    close:SetFrameLevel(f:GetFrameLevel() + 5)
    
    MM.ImportExportWindow = f
end
