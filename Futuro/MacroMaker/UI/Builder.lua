--------------------------------------------------------------------------------
-- Macro Maker - Builder Module
-- Version: 2.0
-- Author: Satyros
--
-- Description:
--   Manages the "Builder Workbench" panel.
--   Handles macro construction, dynamic rows, and real-time generation.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

--------------------------------------------------------------------------------
-- Panel Creation
--------------------------------------------------------------------------------

--- Creates the Builder Column UI, including name input, slots, and preview.
function MM:CreateBuilderColumn(parent)
    local panel = CreateFrame("Frame", "$parent_Builder", parent, "BackdropTemplate")
    local PANEL_BACKDROP = {
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 10,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    }
    panel:SetBackdrop(PANEL_BACKDROP)
    panel:SetBackdropColor(0.06, 0.06, 0.08, 0.7)
    panel:SetBackdropBorderColor(0.18, 0.18, 0.2, 0.8)

    local RunValidation
    
    -- Layout: Anchored between Source (Left) and Inspector (Right)
    panel:SetPoint("TOPLEFT", MM.SourcePanel, "TOPRIGHT", 10, 0)
    panel:SetPoint("BOTTOMRIGHT", MM.InspectorPanel, "BOTTOMLEFT", -10, 0)
    
    local label = panel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("TOP", 0, -10)
    label:SetText(L["Builder Workbench"])
    
    -- 1. Header Container (Cleanly anchored to panel edges, no overflow)
    local headerRow = CreateFrame("Frame", nil, panel)
    headerRow:SetPoint("TOPLEFT", panel, "TOPLEFT", 12, -35)
    headerRow:SetPoint("TOPRIGHT", panel, "TOPRIGHT", -12, -35)
    headerRow:SetHeight(34)
    
    -- Icon Preview Button (Inside left edge)
    local iconBtn = CreateFrame("Button", nil, headerRow)
    iconBtn:SetSize(32, 32)
    iconBtn:SetPoint("LEFT", 0, 0)
    
    local iconPrev = iconBtn:CreateTexture(nil, "ARTWORK")
    iconPrev:SetAllPoints()
    iconPrev:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    MM.previewIcon = iconPrev
    
    iconBtn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    iconBtn:SetScript("OnClick", function(self, button)
        if button == "RightButton" then
            MM.selectedStaticIcon = nil
            MM.useShowTooltip = false
            MM.tooltipSource = ""
            if MM.OptionsWindow then
                 if MM.OptionsWindow.chkShowTooltip then MM.OptionsWindow.chkShowTooltip:SetChecked(false) end
                 if MM.OptionsWindow.tooltipSourceInput then 
                     MM.OptionsWindow.tooltipSourceInput:SetText("")
                     MM.OptionsWindow.tooltipSourceInput:Disable()
                 end
                 if MM.OptionsWindow.lblSource then MM.OptionsWindow.lblSource:SetTextColor(0.5, 0.5, 0.5) end
            end
            MM:GenerateMacroText()
            MM:UpdateMacroPreviewIcon()
            if MM.UpdateOverviewPanel then MM:UpdateOverviewPanel() end
        else
            MM:ShowInspectorTab("icons")
        end
    end)
    
    iconBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Macro Icon"] or "Macro Icon", 1, 1, 1)
        GameTooltip:AddLine(L["Left-click to choose an icon in Inspector."] or "Left-click to choose an icon in Inspector.", 0.8, 0.8, 0.8, true)
        GameTooltip:AddLine(L["Right-click to clear icon."] or "Right-click to clear icon.", 0.6, 0.6, 0.6, true)
        GameTooltip:Show()
    end)
    iconBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

    -- Label
    local nameLabel = headerRow:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    nameLabel:SetPoint("LEFT", iconBtn, "RIGHT", 8, 0)
    nameLabel:SetText(L["Macro Name:"])
    
    -- Drag to Action Bar Button (Anchored to right edge)
    local btnPickup = CreateFrame("Button", nil, headerRow, "GameMenuButtonTemplate, BackdropTemplate")
    btnPickup:SetPoint("RIGHT", 0, 0)
    btnPickup:SetSize(80, 22)
    btnPickup:SetText(L["Drag to Bar"] or "Drag to Bar")
    MM:StyleButtonToModern(btnPickup)
    btnPickup:SetScript("OnClick", function()
        MM:PickupCurrentMacro()
    end)
    btnPickup:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Drag to Action Bar"] or "Drag to Action Bar", 1, 1, 1)
        GameTooltip:AddLine(L["Pick up this macro to place it on an action bar slot."] or "Pick up this macro to place it on an action bar slot.", 0.2, 1.0, 0.4, true)
        GameTooltip:Show()
    end)
    btnPickup:SetScript("OnLeave", function() GameTooltip:Hide() end)

    -- Auto-Icon Button (Anchored to left of Drag to Bar)
    local btnAuto = CreateFrame("Button", nil, headerRow, "GameMenuButtonTemplate, BackdropTemplate")
    btnAuto:SetPoint("RIGHT", btnPickup, "LEFT", -6, 0)
    btnAuto:SetSize(74, 22)
    btnAuto:SetText(L["Auto-Icon"])
    MM:StyleButtonToModern(btnAuto)
    btnAuto:SetScript("OnClick", function()
        MM.useShowTooltip = true
        MM.tooltipSource = ""
        MM.useStaticIcon = false
        MM.selectedStaticIcon = nil
        
        if MM.OptionsWindow then
            if MM.OptionsWindow.chkShowTooltip then MM.OptionsWindow.chkShowTooltip:SetChecked(true) end
            if MM.OptionsWindow.tooltipSourceInput then 
                MM.OptionsWindow.tooltipSourceInput:SetText("")
                MM.OptionsWindow.tooltipSourceInput:Enable()
            end
            if MM.OptionsWindow.lblSource then MM.OptionsWindow.lblSource:SetTextColor(1, 1, 1) end
        end
        
        MM:GenerateMacroText()
        MM:UpdateMacroPreviewIcon()
        if MM.UpdateOverviewPanel then MM:UpdateOverviewPanel() end
    end)
    btnAuto:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Auto-Icon / Dynamic Icons"] or "Auto-Icon / Dynamic Icons", 1, 1, 1)
        GameTooltip:AddLine(L["Enables dynamic #showtooltip so the icon changes on your Action Bar when pressing Shift, Ctrl, or Alt."] or "Enables dynamic #showtooltip so the icon changes on your Action Bar when pressing Shift, Ctrl, or Alt.", 0.2, 1.0, 0.4, true)
        GameTooltip:Show()
    end)
    btnAuto:SetScript("OnLeave", function() GameTooltip:Hide() end)

    -- Input (Flexibly fills the space between label and buttons)
    local nameInput = CreateFrame("EditBox", "$parent_NameInput", headerRow, "InputBoxTemplate")
    nameInput:SetPoint("LEFT", nameLabel, "RIGHT", 6, 0)
    nameInput:SetPoint("RIGHT", btnAuto, "LEFT", -8, 0)
    nameInput:SetHeight(20)
    nameInput:SetAutoFocus(false)
    nameInput:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    nameInput:SetScript("OnTextChanged", function(self)
        if MM.UpdateOverviewPanel then MM:UpdateOverviewPanel() end
    end)
    MM.nameInput = nameInput
    
    MM.BuilderPanel = panel
    
    -- Background Click to Clear Focus
    panel:EnableMouse(true)
    panel:SetScript("OnMouseDown", function()
        if MM.nameInput then MM.nameInput:ClearFocus() end
        if MM.outputBox then MM.outputBox:ClearFocus() end
        if MM.currentEditLine and MM.currentEditLine.argInput then
             MM.currentEditLine.argInput:ClearFocus()
        end
    end)
    
    -- 3. Modifier Slots Container (Scrollable)
    local scrollFrame = CreateFrame("ScrollFrame", "$parent_SlotsScroll", panel, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 20, -78)
    scrollFrame:SetPoint("BOTTOMRIGHT", -31, 170)
    
    MM:SkinScrollBar(scrollFrame)
    
    local scrollChild = CreateFrame("Frame")
    scrollChild:SetSize(1, 1) -- Height updated by UpdateHeight()
    scrollFrame:SetScrollChild(scrollChild)
    panel.slotScroll = scrollChild
    
    -- Dynamic Width Logic
    scrollFrame:SetScript("OnSizeChanged", function(self, w, h)
        scrollChild:SetWidth(w)
    end)
    -- Initial set
    scrollChild:SetWidth(scrollFrame:GetWidth() or 400)
    
    local outputFrame = CreateFrame("Frame", nil, panel, "BackdropTemplate")
    outputFrame:SetPoint("BOTTOMLEFT", 20, 60)
    outputFrame:SetPoint("BOTTOMRIGHT", -20, 60)
    outputFrame:SetHeight(80)
    local INPUT_BACKDROP = {
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, tileSize = 16, edgeSize = 10,
        insets = { left = 2, right = 2, top = 2, bottom = 2 }
    }
    outputFrame:SetBackdrop(INPUT_BACKDROP)
    outputFrame:SetBackdropColor(0, 0, 0, 0.6)
    outputFrame:SetBackdropBorderColor(0.2, 0.25, 0.35, 0.8)
    
    local outputHeader = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    outputHeader:SetPoint("BOTTOMLEFT", outputFrame, "TOPLEFT", 0, 5)
    outputHeader:SetText(L["Generated Macro:"])
    
    -- ScrollFrame for Output
    local outputScroll = CreateFrame("ScrollFrame", "$parent_OutputScroll", outputFrame, "UIPanelScrollFrameTemplate")
    outputScroll:SetPoint("TOPLEFT", 8, -8)
    outputScroll:SetPoint("BOTTOMRIGHT", -28, 8) -- Room for scrollbar
    MM:SkinScrollBar(outputScroll)
    
    local outputBox = CreateFrame("EditBox", nil, outputScroll)
    outputBox:SetMultiLine(true)
    outputBox:SetFontObject("ChatFontNormal")
    outputBox:SetAutoFocus(false)
    outputBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    outputBox:SetWidth(outputScroll:GetWidth() > 0 and (outputScroll:GetWidth() - 20) or 400)
    outputBox:SetTextInsets(3, 3, 3, 3) 
    
    -- Dynamic width adjustment
    outputScroll:SetScript("OnSizeChanged", function(self, w)
        if w and w > 20 then
            outputBox:SetWidth(w - 20)
            if MM.syntaxPreview then MM.syntaxPreview:SetWidth(w - 20) end
        end
    end)
    
    -- Force update on show
    outputScroll:SetScript("OnShow", function(self)
        local w = self:GetWidth()
        if w and w > 20 then outputBox:SetWidth(w - 20) end
    end)
    

    outputScroll:SetScrollChild(outputBox)
    MM.outputBox = outputBox
    
    -- Syntax Preview (HTML for colors) - Re-implemented safely
    local syntaxPreview = CreateFrame("SimpleHTML", nil, outputBox) -- Parent is outputBox to scroll with it
    syntaxPreview:SetPoint("TOPLEFT", outputBox, "TOPLEFT", 0, 0)
    syntaxPreview:SetPoint("BOTTOMRIGHT", outputBox, "BOTTOMRIGHT", 0, 0) -- Anchor fully
    syntaxPreview:SetFontObject("p", ChatFontNormal)
    syntaxPreview:EnableMouse(false)
    syntaxPreview:Hide()
    MM.syntaxPreview = syntaxPreview
    
    function MM:ApplyEditorFont()
        if not MM.outputBox then return end
        MM.outputBox:SetFont(STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12, "")
    end
    MM:ApplyEditorFont()
    
    local clickCatch = CreateFrame("Button", nil, outputFrame)
    clickCatch:SetAllPoints(outputScroll) -- Cover entire scroll area
    clickCatch:SetFrameLevel(outputBox:GetFrameLevel() + 5)
    clickCatch:Hide()
    MM.clickCatch = clickCatch
    
    -- Helper to Colorize
    function MM:ColorizeMacroText(text, errorLines)
        if not text then return "" end
        local res = ""
        local lineNum = 0
        
        -- Split by line to handle line-specific coloring
        for line in text:gmatch("([^\n]*)\n?") do
            lineNum = lineNum + 1
            if line ~= "" then
                local lineContent = line
                
                -- Check for Error
                local isError = false
                if errorLines then
                    for _, errObj in ipairs(errorLines) do
                        if errObj.line == lineNum then
                            isError = true
                            break
                        end
                    end
                end
                
                if isError then
                     -- Highlight entire line red
                     lineContent = "|cffff0000" .. lineContent .. "|r"
                else
                     -- Standard Syntax Highlighting
                     lineContent = lineContent:gsub("(/%w+)", "|cff00ccff%1|r") -- Blue Commands
                     lineContent = lineContent:gsub("(%[.-%])", "|cff00ff00%1|r") -- Green Conditions
                     lineContent = lineContent:gsub("(%w+=)", "|cffeda55f%1|r") -- Orange params
                     lineContent = lineContent:gsub("(#%w+)", "|cffaaaaaa%1|r") -- Grey Meta
                end
                
                res = res .. lineContent .. "<br/>"
            else
                res = res .. "<br/>" -- Preserve empty lines
            end
        end
        return "<html><body><p>" .. res .. "</p></body></html>"
    end
    
    local function ShowPreview()
        local text = outputBox:GetText()
        if text and text ~= "" then
            -- Use TextColor to hide raw text (Alpha 0) so the child SyntaxPreview remains visible
            -- Note: SetAlpha(0) on parent would hide the child too.
            outputBox:SetTextColor(0, 0, 0, 0)
             
            -- Fetch current errors if any
            local errorLines = MM.currentErrors
             
            syntaxPreview:SetText(MM:ColorizeMacroText(text, errorLines))
            syntaxPreview:SetWidth(outputBox:GetWidth() - 5) -- Adjust for padding
            syntaxPreview:Show()
            clickCatch:Show()
        else
            -- Empty text, ensure edit mode
            outputBox:SetTextColor(1, 1, 1, 1)
            syntaxPreview:Hide()
            clickCatch:Hide()
        end
    end
    
    local function ActivateEditMode()
        if clickCatch then clickCatch:Hide() end
        if syntaxPreview then syntaxPreview:Hide() end
        outputBox:SetTextColor(1, 1, 1, 1)
        outputBox:SetFocus()
    end
    
    clickCatch:SetScript("OnClick", ActivateEditMode)

    outputBox:HookScript("OnEditFocusGained", function(self)
        if clickCatch then clickCatch:Hide() end
        if syntaxPreview then syntaxPreview:Hide() end
        self:SetTextColor(1, 1, 1, 1)
    end)

    outputBox:HookScript("OnMouseDown", function(self)
        if clickCatch then clickCatch:Hide() end
        if syntaxPreview then syntaxPreview:Hide() end
        self:SetTextColor(1, 1, 1, 1)
    end)

    outputBox:SetScript("OnEditFocusLost", function(self)
        self:HighlightText(0, 0)
        ShowPreview()
    end)
    
    -- Force initial state
    outputBox:HookScript("OnShow", function(self)
        if not self:HasFocus() then
            ShowPreview()
        end
    end)
    


    -- Action buttons declared here, instantiated in Section 6 below outputFrame
    local btnOptimize, btnSyncCode

    outputBox:HookScript("OnTextChanged", function(self)
         local text = self:GetText() or ""

         -- Auto-Preview if not focused (Handling programmatic updates)
         if not self:HasFocus() then
             ShowPreview()
         end
         
         if btnOptimize then
             -- Smart Check: Can we optimize further?
             if text == "" then
                 btnOptimize:SetEnabled(false)
             else
                 if MM.Optimizer then
                     local _, _, savedChars = MM.Optimizer:GetSavings(text)
                     if savedChars > 0 then
                         btnOptimize:SetEnabled(true)
                     else
                         btnOptimize:SetEnabled(false) -- Already optimized
                     end
                 else
                     btnOptimize:SetEnabled(true) -- Fallback
                 end
             end
         end
         
         -- Update Character Count (for manual edits)
         local len = string.len(text)
         if MM.UpdateCharCount then
             MM:UpdateCharCount(len)
         elseif MM.charCount then
             MM.charCount:SetText(len .. " / 255")
         end
         if MM.UpdateOverviewPanel then MM:UpdateOverviewPanel() end
         
         -- Trigger Validation
         if MM.Validator then
             local valid, errors = MM.Validator:ValidateBody(text)
             MM.currentErrors = errors
             if not valid then
                 -- Show error indicator or keep silent until hover?
                 -- Currently silent update for preview coloring
             end
         end
         if RunValidation then RunValidation() end
         
         -- Push undo state on manual edits
         if MM.History and self:HasFocus() then
             MM.History:Push()
         end
    end)
    
    -- Character Count Helper
    local charCount = panel:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    charCount:SetPoint("LEFT", outputHeader, "RIGHT", 8, 0)
    charCount:SetText("0 / 255")
    MM.charCount = charCount

    -- Live Diagnostics Badge (Anchored cleanly to top-right of outputFrame)
    local diagBtn = CreateFrame("Button", nil, panel)
    diagBtn:SetSize(140, 18)
    diagBtn:SetPoint("BOTTOMRIGHT", outputFrame, "TOPRIGHT", 0, 5)
    
    local diagText = diagBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    diagText:SetPoint("RIGHT", 0, 0)
    diagText:SetText("|cff20e060" .. (L["Syntax OK"] or "Syntax OK") .. "|r")
    diagBtn.diagText = diagText
    MM.diagBtn = diagBtn
    
    function MM:UpdateDiagnostics()
        local text = MM.outputBox and MM.outputBox:GetText() or ""
        if not MM.Validator or not MM.Validator.AnalyzeMacro then return end
        
        local diag = MM.Validator:AnalyzeMacro(text)
        MM.currentDiagnostics = diag
        
        if not text or text:match("^%s*$") then
            diagText:SetText("")
            diagBtn:Hide()
            return
        end
        
        diagBtn:Show()
        if diag.status == "error" then
            diagText:SetText(string.format("|cffff3030[%s: %d]|r", L["Error"] or "Error", #diag.issues))
        elseif diag.status == "warning" then
            diagText:SetText(string.format("|cffffcc00[%s: %d]|r", L["Tips"] or "Tips", #diag.issues))
        else
            diagText:SetText("|cff20e060" .. (L["Syntax OK"] or "Syntax OK") .. "|r")
        end
    end
    
    diagBtn:SetScript("OnEnter", function(self)
        local diag = MM.currentDiagnostics
        if not diag then return end
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(L["Macro Diagnostics & Tips"] or "Makro-Diagnose & Tipps", 1, 0.82, 0)
        
        if #diag.issues == 0 then
            GameTooltip:AddLine(L["No syntax errors or GCD conflicts detected."] or "Keine Syntaxfehler oder GCD-Konflikte erkannt.", 0.2, 1.0, 0.4, true)
        else
            for _, issue in ipairs(diag.issues) do
                local colorPrefix = (issue.type == "error") and "|cffff4040" or ((issue.type == "warning") and "|cffffcc00" or "|cff60c0ff")
                GameTooltip:AddLine(colorPrefix .. "- " .. issue.title .. "|r", 1, 1, 1)
                GameTooltip:AddLine("  " .. issue.desc, 0.85, 0.85, 0.85, true)
            end
        end
        GameTooltip:Show()
    end)
    diagBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
    
    function MM:UpdateCharCount(len)
        if not MM.charCount then return end
        len = len or 0
        local maxLen = 255
        if len > maxLen then
            local over = len - maxLen
            MM.charCount:SetText("|cffff2020" .. len .. " / " .. maxLen .. " (+" .. over .. " " .. (L["TRUNCATED"] or "TRUNCATED") .. ")|r")
        elseif len > 240 then
            MM.charCount:SetText("|cffff6600" .. len .. " / " .. maxLen .. "|r")
        elseif len > 200 then
            MM.charCount:SetText("|cffffcc00" .. len .. " / " .. maxLen .. "|r")
        else
            MM.charCount:SetText("|cff66ff66" .. len .. " / " .. maxLen .. "|r")
        end
        if MM.UpdateDiagnostics then MM:UpdateDiagnostics() end
    end
    
    -- 5. Initialize Modifier Rows
    MM.rows = {}
    local modifiers = {
        { label = L["Standard"], key = "nomod", isBase = true },
        { label = L["Shift"], key = "shift", isBase = false },
        { label = L["Ctrl"], key = "ctrl", isBase = false },
        { label = L["Alt"], key = "alt", isBase = false },
    }
    
    local prevRow = nil
    for _, modData in ipairs(modifiers) do
        local row = MM:CreateBuilderRow(scrollChild, modData.label, modData.key, modData.isBase)
        if prevRow then
            -- Divider
            local div = scrollChild:CreateTexture(nil, "ARTWORK")
            div:SetTexture("Interface\\Common\\UI-TooltipDivider-Transparent")
            div:SetPoint("TOPLEFT", prevRow, "BOTTOMLEFT", 10, -2)
            div:SetPoint("TOPRIGHT", prevRow, "BOTTOMRIGHT", -10, -2)
            div:SetHeight(8)
            
            row:SetPoint("TOPLEFT", prevRow, "BOTTOMLEFT", 0, -15)
        else
            row:SetPoint("TOPLEFT", 0, 0)
        end
        row:SetPoint("RIGHT", 0, 0)
        MM.rows[modData.key] = row
        prevRow = row
    end
    
    -- 6. Action Toolbar & Status Feedback
    local btnSave = CreateFrame("Button", nil, panel, "GameMenuButtonTemplate, BackdropTemplate")
    btnSave:SetPoint("TOPLEFT", outputFrame, "BOTTOMLEFT", 0, -8)
    btnSave:SetHeight(26)
    btnSave:SetText(L["Save Macro"])
    MM:StyleButtonToModern(btnSave)
    MM.btnSave = btnSave

    btnOptimize = CreateFrame("Button", nil, panel, "GameMenuButtonTemplate, BackdropTemplate")
    btnOptimize:SetPoint("TOPRIGHT", outputFrame, "BOTTOMRIGHT", 0, -8)
    btnOptimize:SetHeight(26)
    btnOptimize:SetText(L["Optimize Code"])
    MM:StyleButtonToModern(btnOptimize)
    btnOptimize:SetEnabled(false) -- Default disabled

    btnSyncCode = CreateFrame("Button", nil, panel, "GameMenuButtonTemplate, BackdropTemplate")
    btnSyncCode:SetPoint("TOPLEFT", btnSave, "TOPRIGHT", 6, 0)
    btnSyncCode:SetPoint("BOTTOMRIGHT", btnOptimize, "BOTTOMLEFT", -6, 0)
    btnSyncCode:SetHeight(26)
    btnSyncCode:SetText(L["Sync to Builder"] or "Sync to Builder")
    MM:StyleButtonToModern(btnSyncCode)

    local function LayoutToolbarButtons()
        local totalW = outputFrame:GetWidth()
        if totalW and totalW > 50 then
            local gap = 6
            local btnW = math.floor((totalW - (gap * 2)) / 3)
            btnSave:SetWidth(btnW)
            btnOptimize:SetWidth(btnW)
        else
            btnSave:SetWidth(114)
            btnOptimize:SetWidth(114)
        end
    end
    LayoutToolbarButtons()
    outputFrame:HookScript("OnSizeChanged", LayoutToolbarButtons)
    outputFrame:HookScript("OnShow", LayoutToolbarButtons)

    for _, btn in ipairs({ btnSave, btnSyncCode, btnOptimize }) do
        local fs = btn:GetFontString()
        if fs then
            fs:SetWordWrap(false)
        end
    end

    btnSyncCode:SetScript("OnClick", function()
        local text = MM.outputBox and MM.outputBox:GetText() or ""
        MM:ParseMacroToBuilder(text)
        if MM.Notify then
            MM:Notify(L["Code parsed into visual builder!"] or "Code in visuelle Zeilen eingelesen!", "success")
        end
    end)
    btnSyncCode:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(L["Sync Code to Visual Builder"] or "Sync Code to Visual Builder", 1, 0.82, 0)
        GameTooltip:AddLine(L["Parses the raw macro code below into the visual modifier slots above."] or "Liest den Makrocode unten in die interaktiven Modifikator-Zeilen oben ein.", 1, 1, 1, true)
        GameTooltip:Show()
    end)
    btnSyncCode:SetScript("OnLeave", function() GameTooltip:Hide() end)
    MM.btnSyncCode = btnSyncCode
    btnOptimize:SetScript("OnClick", function()
        if MM.Optimizer then
            local text = MM.outputBox:GetText()
            local origLen, optLen, savedChars, savedPct, optimized = MM.Optimizer:GetSavings(text)
            MM.outputBox:SetText(optimized)
            MM.outputBox:SetCursorPosition(0)
            -- Trigger manual validation/update
            if MM.outputBox:GetScript("OnTextChanged") then
                MM.outputBox:GetScript("OnTextChanged")(MM.outputBox) 
            end
            -- Force preview
            if not MM.outputBox:HasFocus() then
                 ShowPreview()
            end
            if MM.Notify and savedChars > 0 then
                MM:Notify(string.format(L["Macro optimized! Saved %d characters (%d%%)."] or "Makro optimiert! %d Zeichen (%d%%) gespart.", savedChars, savedPct), "success")
            end
        else
            print("Optimizer not loaded")
        end
    end)
    btnOptimize:SetScript("OnEnter", function(self)
        if not MM.Optimizer then return end
        local text = MM.outputBox and MM.outputBox:GetText() or ""
        local origLen, optLen, savedChars, savedPct = MM.Optimizer:GetSavings(text)
        
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(L["Code Optimizer"] or "Code-Optimierer", 1, 0.82, 0)
        if savedChars > 0 then
            GameTooltip:AddLine(string.format(L["Can reduce macro from %d to %d chars."] or "Can reduce macro from %d to %d chars.", origLen, optLen), 0.2, 1.0, 0.4)
            GameTooltip:AddLine(string.format(L["Potential savings: %d chars (%d%%)"] or "Potential savings: %d chars (%d%%)", savedChars, savedPct), 1, 1, 1)
            GameTooltip:AddLine(" ", 1, 1, 1)
            GameTooltip:AddLine(L["• Merges duplicate commands & shortens /cast to /use"] or "• Merges duplicate commands & shortens /cast to /use", 0.7, 0.7, 0.7)
            GameTooltip:AddLine(L["• Strips redundant spaces inside [conditions]"] or "• Strips redundant spaces inside [conditions]", 0.7, 0.7, 0.7)
            GameTooltip:AddLine(L["• Replaces target= with @ and modifier with mod"] or "• Ersetzt target= durch @ und modifier durch mod", 0.7, 0.7, 0.7)
        else
            if text == "" then
                GameTooltip:AddLine(L["Macro is empty."] or "Makro ist leer.", 0.7, 0.7, 0.7)
            else
                GameTooltip:AddLine(L["Macro is already fully optimized!"] or "Macro is already fully optimized!", 0.4, 0.8, 1.0)
            end
        end
        GameTooltip:Show()
    end)
    btnOptimize:SetScript("OnLeave", function() GameTooltip:Hide() end)
    MM.btnOptimize = btnOptimize

    -- Validation Status Label (Positioned below buttons on the left)
    local validLabel = panel:CreateFontString(nil, "OVERLAY", "GameFontRedSmall")
    validLabel:SetPoint("TOPLEFT", btnSave, "BOTTOMLEFT", 0, -5)
    validLabel:SetText("")
    MM.validLabel = validLabel

    RunValidation = function()
        if MM.Validator then
            local text = MM.outputBox:GetText() or ""
            local isValid, errors = MM.Validator:ValidateBody(text)
            
            MM.currentErrors = errors -- Store for Highlighter
            
            if not isValid and #errors > 0 then
                validLabel:SetText(L["Issues Detected: "] .. #errors)
                -- Tooltip on Hover
                validLabel:SetScript("OnEnter", function(self)
                    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                    GameTooltip:SetText(L["Macro Issues"], 1, 0, 0)
                    for _, errObj in ipairs(errors) do
                        GameTooltip:AddLine("Line " .. errObj.line .. ": " .. errObj.msg, 1, 1, 1, true)
                    end
                    GameTooltip:Show()
                end)
                validLabel:SetScript("OnLeave", function() GameTooltip:Hide() end)
                validLabel:EnableMouse(true)
            else
                validLabel:SetText("")
                validLabel:EnableMouse(false)
            end
            
            -- Force Preview Update to apply highlights if not focused
            if not outputBox:HasFocus() then
                ShowPreview()
            end
        end
    end
    
    -- Ensure validation runs when text is set programmatically (e.g. Generation, Optimization)
    hooksecurefunc(outputBox, "SetText", function()
        RunValidation()
    end)

    local statusLabel = panel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    -- Anchor Status Label on bottom-right below Optimize button
    statusLabel:SetPoint("TOPRIGHT", btnOptimize, "BOTTOMRIGHT", 0, -5)
    statusLabel:SetJustifyH("RIGHT")
    statusLabel:SetText("")
    
    function MM:ShowStatus(msg, isError)
        if not statusLabel then return end
        statusLabel:SetText(msg)
        if isError then
            statusLabel:SetTextColor(1, 0, 0)
        else
            statusLabel:SetTextColor(0, 1, 0)
        end
        statusLabel:Show()
        
        if panel.statusTimer and panel.statusTimer.Cancel then
            panel.statusTimer:Cancel()
        end
        panel.statusTimer = C_Timer.NewTimer(3, function()
            statusLabel:SetText("")
            panel.statusTimer = nil
        end)
    end
    MM.ShowBuilderStatus = MM.ShowStatus
    
    btnSave:SetScript("OnClick", function()
        MM:SaveMacro()
    end)


end

--- Assigns an action to a specific modifier row in the workbench.
--- @param modKey string "nomod"|"shift"|"ctrl"|"alt"
--- @param actionData table { name=..., icon=..., type=..., id=..., spellID=... }
function MM:AssignActionToModifier(modKey, actionData)
    if not modKey or not actionData then return end
    local row = MM.rows and MM.rows[modKey]
    if not row then return end
    
    if not row.lines or #row.lines == 0 then
        row:AddLine()
    end
    
    local line = row.lines[1]
    if line then
        line.spellInput:SetText(actionData.name or "")
        if line.iconBtn and line.iconBtn.icon then
            line.iconBtn.icon:SetTexture(actionData.icon or 134400)
        end
        line.actionData = actionData
        
        -- Auto-detect /use for items/toys vs /cast for spells/mounts
        if actionData.type == "item" or actionData.type == "toy" or actionData.type == "equipment" then
            line.cmdBtn:SetText("/use")
        else
            line.cmdBtn:SetText("/cast")
        end
        
        MM:GenerateMacroText()
        if MM.History then MM.History:Push() end
    end
end

--- Adds an action step to Sequence Studio.
--- @param actionData table { name=..., icon=..., type=..., id=..., spellID=... }
function MM:AddActionToSequence(actionData)
    if not actionData or not actionData.name then return end
    if not MM.SequenceSteps then MM.SequenceSteps = {} end
    table.insert(MM.SequenceSteps, {
        name = actionData.name,
        icon = actionData.icon or 134400,
        type = actionData.type or "spell",
        id = actionData.id or actionData.spellID
    })
    if MM.ShowInspectorTab then MM:ShowInspectorTab("sequence") end
    if MM.UpdateSequenceStudio then MM:UpdateSequenceStudio() end
end

--------------------------------------------------------------------------------
-- Modifier Row Logic
--------------------------------------------------------------------------------

--- Creates a single modifier row (e.g., Shift, Ctrl) containing dynamic action lines.
function MM:CreateBuilderRow(parent, labelText, key, isBase)
    local f = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    f:SetHeight(isBase and 90 or 120) 
    f.key = key
    f.isBase = isBase
    
    local lbl = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    lbl:SetPoint("TOPLEFT", 0, -5)
    lbl:SetText(labelText)
    
    f.headerText = labelText
    f.btnHeader = lbl
    
    -- Content Container
    local cFrame = CreateFrame("Frame", nil, f)
    cFrame:SetPoint("TOPLEFT", 0, -30)
    cFrame:SetPoint("TOPRIGHT", 0, -30)
    f.contentFrame = cFrame
    cFrame:SetHeight(1)
    
    -- [+] Button
    local btnAdd = CreateFrame("Button", nil, f)
    btnAdd:SetSize(26, 26) 
    btnAdd:SetPoint("LEFT", lbl, "RIGHT", 5, 0)
    
    btnAdd:SetNormalTexture("Interface\\Minimap\\UI-Minimap-ZoomInButton-Up")
    btnAdd:SetPushedTexture("Interface\\Minimap\\UI-Minimap-ZoomInButton-Down")
    btnAdd:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    btnAdd:SetDisabledTexture("Interface\\Minimap\\UI-Minimap-ZoomInButton-Disabled")
    
    btnAdd:SetScript("OnClick", function()
        f:AddLine()
    end)
    f.btnAdd = btnAdd
    
    -- [-] Button
    local btnRemHeader = CreateFrame("Button", nil, f)
    btnRemHeader:SetSize(26, 26) 
    btnRemHeader:SetPoint("LEFT", btnAdd, "RIGHT", 2, 0)
    
    btnRemHeader:SetNormalTexture("Interface\\Minimap\\UI-Minimap-ZoomOutButton-Up")
    btnRemHeader:SetPushedTexture("Interface\\Minimap\\UI-Minimap-ZoomOutButton-Down")
    btnRemHeader:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    btnRemHeader:SetDisabledTexture("Interface\\Minimap\\UI-Minimap-ZoomOutButton-Disabled")
    
    btnRemHeader:SetScript("OnClick", function()
        if f.lines and #f.lines > 0 then
            f:RemoveLine(f.lines[#f.lines])
        end
    end)
    f.btnRemHeader = btnRemHeader
    
    -- Function to refresh the overall layout height
    function MM:UpdateBuilderLayout()
        if not MM.rows then return end
        
        local totalH = 10 
        local modOrder = {"nomod", "shift", "ctrl", "alt"}
        
        for _, k in ipairs(modOrder) do
            local r = MM.rows[k]
             if r then
                 totalH = totalH + r:GetHeight() + 10 -- +10 gap
             end
        end
        
        if MM.BuilderPanel and MM.BuilderPanel.slotScroll then
            if totalH < 400 then totalH = 400 end
            MM.BuilderPanel.slotScroll:SetHeight(totalH)
        end
    end
    
    f.lines = {}
    
    -- --- Row Methods --- --

    function f:UpdateHeight()
         local numLines = #f.lines
         local totalH = 20 
         
         if numLines == 0 then
             totalH = totalH + 10 
         else
             for _, line in ipairs(f.lines) do
                 totalH = totalH + line:GetHeight()
             end
             totalH = totalH + 10 
         end
         
         if totalH < 30 then totalH = 30 end
         
         f:SetHeight(totalH)  
         f.contentFrame:SetHeight(totalH - 30) 
         
         MM:UpdateBuilderLayout()
         MM:GenerateMacroText()
         
         -- Visibility Logic
         if f.btnRemHeader then
             if f.isBase then
                 if numLines > 1 then f.btnRemHeader:Show() else f.btnRemHeader:Hide() end
             else
                 if numLines > 0 then 
                     f.btnRemHeader:Show() 
                     f.contentFrame:Show()
                     f.btnHeader:SetText(f.headerText)
                     f.isExpanded = true
                 else 
                     f.btnRemHeader:Hide() 
                 end
             end
         end
         if f.UpdateLineButtons then f:UpdateLineButtons() end
    end

    function f:RemoveLine(lineObj)
        -- Special Case: Do not remove the last line of the Standard row, just clear it.
        if f.isBase and #f.lines <= 1 then 
             lineObj.spellInput:SetText("")
             if lineObj.argInput then lineObj.argInput:SetText("") end
             
             if lineObj.iconBtn and lineObj.iconBtn.icon then
                 lineObj.iconBtn.icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
             end
             lineObj.conditions = {}
             if lineObj.condBtn then lineObj.condBtn:SetText(L["Conditions"]) end
             if lineObj.UpdateLineHeight then lineObj:UpdateLineHeight() end
             
             MM:GenerateMacroText()
             return 
        end
        
        local idx
        for i, l in ipairs(f.lines) do
            if l == lineObj then idx = i break end
        end
        
        if idx then
            table.remove(f.lines, idx)
            lineObj:Hide()
            lineObj:SetParent(nil)
        end
        
        -- Re-Anchor
        local prev = nil
        for i, l in ipairs(f.lines) do
             l:ClearAllPoints()
             if prev then
                 l:SetPoint("TOPLEFT", prev, "BOTTOMLEFT", 0, 0)
             else
                 l:SetPoint("TOPLEFT", 0, 0)
             end
             l:SetPoint("RIGHT", 0, 0)
             prev = l
        end
        
        f:UpdateHeight()
    end

    function f:UpdateLineButtons()
        local count = #f.lines
        for i, l in ipairs(f.lines) do
            if l.btnUp and l.btnDown then
                if count <= 1 then
                    l.btnUp:Hide()
                    l.btnDown:Hide()
                else
                    l.btnUp:Show()
                    l.btnDown:Show()
                    l.btnUp:SetEnabled(i > 1)
                    l.btnDown:SetEnabled(i < count)
                end
            end
        end
    end

    function f:MoveLine(lineObj, direction)
        local idx = nil
        for i, l in ipairs(f.lines) do
            if l == lineObj then idx = i break end
        end
        if not idx then return end
        
        local targetIdx = idx + direction
        if targetIdx < 1 or targetIdx > #f.lines then return end
        
        f.lines[idx], f.lines[targetIdx] = f.lines[targetIdx], f.lines[idx]
        
        local prev = nil
        for i, l in ipairs(f.lines) do
             l:ClearAllPoints()
             if prev then
                 l:SetPoint("TOPLEFT", prev, "BOTTOMLEFT", 0, 0)
             else
                 l:SetPoint("TOPLEFT", 0, 0)
             end
             l:SetPoint("RIGHT", 0, 0)
             prev = l
        end
        
        f:UpdateHeight()
        MM:GenerateMacroText()
        if MM.History then MM.History:Push() end
    end

    function f:AddLine(val, cond)
        f.contentFrame:Show() 
        local line = CreateFrame("Frame", nil, f.contentFrame, "BackdropTemplate")
        line:SetHeight(55) 
        
        local prev = f.lines[#f.lines]
        if prev then
             line:SetPoint("TOPLEFT", prev, "BOTTOMLEFT", 0, 0)
         else
             line:SetPoint("TOPLEFT", 0, 0)
         end
         line:SetPoint("RIGHT", 0, 0)
         
         -- Icon Slot
         local iconBtn = CreateFrame("Button", nil, line, "BackdropTemplate")
         iconBtn:SetSize(44, 44)
         iconBtn:SetPoint("TOPLEFT", 0, -5) 
         
         local borderInfo = iconBtn:CreateTexture(nil, "OVERLAY")
         borderInfo:SetTexture("Interface\\Buttons\\UI-Quickslot2")
         borderInfo:SetSize(44 * 1.6, 44 * 1.6)
         borderInfo:SetPoint("CENTER", 0, 0)
     
         local iconTex = iconBtn:CreateTexture(nil, "BACKGROUND")
         iconTex:SetAllPoints()
         iconTex:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
         iconBtn.icon = iconTex
         
         -- Spell Tooltip on Icon Hover
         iconBtn:SetScript("OnEnter", function(self)
             local spellName = line.spellInput and line.spellInput:GetText() or ""
             if spellName and spellName ~= "" then
                 GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                 -- Try to show spell tooltip
                 if C_Spell and C_Spell.GetSpellInfo then
                     local info = C_Spell.GetSpellInfo(spellName)
                     if info then
                         GameTooltip:SetSpellByID(info.spellID)
                         return
                     end
                 end
                 -- Fallback: just show name
                 GameTooltip:SetText(spellName, 1, 1, 1)
                 GameTooltip:AddLine(L["Drag a spell here"], 0.5, 0.5, 0.5)
                 GameTooltip:Show()
             else
                 GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                 GameTooltip:SetText(L["Spell Slot"], 1, 0.8, 0)
                 GameTooltip:AddLine(L["Drag a spell, item, or mount here"], 0.7, 0.7, 0.7)
                 GameTooltip:Show()
             end
         end)
         iconBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
         
          -- Command Type Button
          local cmdBtn = CreateFrame("Button", nil, line, "GameMenuButtonTemplate, BackdropTemplate")
          cmdBtn:SetSize(100, 22) 
          cmdBtn:SetPoint("TOPLEFT", iconBtn, "TOPRIGHT", 10, 0)
          cmdBtn:SetText(L["Command"]) 
          MM:StyleButtonToModern(cmdBtn)
          
          cmdBtn:SetScript("OnClick", function()
               MM:OpenCommandPanel(line)
          end)
          cmdBtn:SetScript("OnEnter", function(self)
               GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
               GameTooltip:SetText(L["Commands"] or "Commands", 1, 1, 1)
               GameTooltip:AddLine(L["Click to browse and insert macro commands."] or "Click to browse and insert macro commands.", 0.8, 0.8, 0.8, true)
               GameTooltip:Show()
          end)
          cmdBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
          
          -- Conditions Button
          local condBtn = CreateFrame("Button", nil, line, "GameMenuButtonTemplate, BackdropTemplate")
          condBtn:SetSize(100, 22)  
          condBtn:SetPoint("LEFT", cmdBtn, "RIGHT", 5, 0)
          condBtn:SetText(L["Conditions"])
          MM:StyleButtonToModern(condBtn)
          condBtn:SetScript("OnClick", function()
               MM:OpenConditionEditor(line) 
          end)
          condBtn:SetScript("OnEnter", function(self)
               GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
               GameTooltip:SetText(L["Conditions"] or "Conditions", 1, 1, 1)
               GameTooltip:AddLine(L["Click to configure macro conditions for this line."] or "Click to configure macro conditions for this line.", 0.8, 0.8, 0.8, true)
               GameTooltip:Show()
          end)
          condBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

          -- Line Reorder Buttons (▲ / ▼)
          local btnDown = CreateFrame("Button", nil, line, "GameMenuButtonTemplate, BackdropTemplate")
          btnDown:SetSize(22, 22)
          btnDown:SetPoint("TOPRIGHT", line, "TOPRIGHT", -30, -5)
          btnDown:SetText("v")
          btnDown:SetNormalFontObject("GameFontNormalSmall")
          MM:StyleButtonToModern(btnDown)
          btnDown:SetScript("OnClick", function()
              f:MoveLine(line, 1)
          end)
          btnDown:SetScript("OnEnter", function(self)
              GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
              GameTooltip:SetText(L["Move Down"] or "Move Down", 1, 0.82, 0)
              GameTooltip:AddLine(L["Moves this action down in execution priority."] or "Moves this action down in execution priority.", 1, 1, 1, true)
              GameTooltip:Show()
          end)
          btnDown:SetScript("OnLeave", function() GameTooltip:Hide() end)
          line.btnDown = btnDown

          local btnUp = CreateFrame("Button", nil, line, "GameMenuButtonTemplate, BackdropTemplate")
          btnUp:SetSize(22, 22)
          btnUp:SetPoint("RIGHT", btnDown, "LEFT", -3, 0)
          btnUp:SetText("^")
          btnUp:SetNormalFontObject("GameFontNormalSmall")
          MM:StyleButtonToModern(btnUp)
          btnUp:SetScript("OnClick", function()
              f:MoveLine(line, -1)
          end)
          btnUp:SetScript("OnEnter", function(self)
              GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
              GameTooltip:SetText(L["Move Up"] or "Move Up", 1, 0.82, 0)
              GameTooltip:AddLine(L["Moves this action up in execution priority."] or "Moves this action up in execution priority.", 1, 1, 1, true)
              GameTooltip:Show()
          end)
          btnUp:SetScript("OnLeave", function() GameTooltip:Hide() end)
          line.btnUp = btnUp

           
          -- Primary Input (Action/Spell)
          local dropBox = CreateFrame("Frame", nil, line, "BackdropTemplate")
          dropBox:SetPoint("TOPLEFT", cmdBtn, "BOTTOMLEFT", 0, -2) 
          dropBox:SetPoint("RIGHT", -30, 0) -- Adjusted to -30 to extend to scrollbar
          dropBox:SetHeight(20)
          
          local INPUT_BACKDROP = {
              bgFile = "Interface\\Buttons\\WHITE8x8",
              edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
              tile = false, tileSize = 16, edgeSize = 10,
              insets = { left = 2, right = 2, top = 2, bottom = 2 }
          }
          dropBox:SetBackdrop(INPUT_BACKDROP)
          dropBox:SetBackdropColor(0, 0, 0, 0.6)
          dropBox:SetBackdropBorderColor(0.2, 0.25, 0.35, 0.8)
          
          local dropText = dropBox:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
          dropText:SetPoint("LEFT", 6, 0)
          dropText:SetPoint("RIGHT", -6, 0)
          dropText:SetJustifyH("LEFT")
          dropText:SetText("")
          
          local placeholder = dropBox:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
          placeholder:SetPoint("LEFT", 6, 0)
          placeholder:SetPoint("RIGHT", -6, 0)
          placeholder:SetJustifyH("LEFT")
          placeholder:SetText(L["Drag action here or click Command"] or "Drag action here or click Command")
          dropBox.placeholder = placeholder
          
          -- Argument Input (Hidden by default)
          local argBox = CreateFrame("EditBox", nil, line, "BackdropTemplate")
          argBox:SetPoint("TOPLEFT", dropBox, "BOTTOMLEFT", 0, -5)
          argBox:SetPoint("RIGHT", -30, 0) -- Adjusted to -30
          argBox:SetHeight(20)
          argBox:SetAutoFocus(false)
          argBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
          argBox:Hide() 
          
          argBox:SetBackdrop(INPUT_BACKDROP)
          argBox:SetBackdropColor(0, 0, 0, 0.6)
          argBox:SetBackdropBorderColor(1, 0.8, 0, 1)
          
          argBox:SetFontObject("GameFontHighlight")
          argBox:SetTextInsets(5, 5, 0, 0)
          
          -- Mapping Helper Methods to emulate EditBox behavior on the Frame
          dropBox.SetText = function(self, t) 
              dropText:SetText(t or "")
              if t and t ~= "" then
                  placeholder:Hide()
              else
                  placeholder:Show()
              end
          end
          dropBox.GetText = function(self) return dropText:GetText() or "" end
          dropBox.ClearFocus = function() end
          dropBox.SetFocus = function() end
          
          line.cmdBtn = cmdBtn
          line.condBtn = condBtn
          line.iconBtn = iconBtn
          line.spellInput = dropBox
          line.argInput = argBox
          iconBtn.spellInput = dropBox
          line.conditions = cond or {}
          
          function line:UpdateLineHeight()
              if argBox:IsShown() then
                  line:SetHeight(85)
              else
                  line:SetHeight(55)
              end
              f:UpdateHeight()
          end
          
          -- Drag Handling (re-uses local function)
           local function HandleDropContent(self)
               local type, id, subType = GetCursorInfo()
               local name, texture
               
               -- Handle Stale Invisible Context (User picked invisible item, then picked visible item)
               if MM.DragContext and MM.DragContext.invisible and type then
                   MM.DragContext = nil
               end
               
               if MM.DragContext then
                   -- Priority: Use internal drag context from Source panel to avoid cursor ambiguity.
                   -- This ensures that if the user drags a specific Mount or Pet from the Source,
                   -- we use THAT specific ID, rather than guessing from what GetCursorInfo() thinks it is (which is often a journal index).
                   local d = MM.DragContext
                   name = d.name
                   texture = d.icon
                   MM.DragContext = nil
               elseif type == "spell" then
                   if subType then
                       if C_SpellBook and C_SpellBook.GetSpellBookItemName then
                           local bank = (subType == "pet") and Enum.SpellBookSpellBank.Pet or Enum.SpellBookSpellBank.Player
                           name = C_SpellBook.GetSpellBookItemName(id, bank)
                           texture = C_SpellBook.GetSpellBookItemTexture(id, bank)
                       else
                           name = GetSpellBookItemName(id, subType)
                           texture = GetSpellBookItemTexture(id, subType)
                       end
                   else
                       -- Raw SpellID
                       if C_Spell and C_Spell.GetSpellName then
                            name = C_Spell.GetSpellName(id)
                            texture = C_Spell.GetSpellTexture and C_Spell.GetSpellTexture(id)
                       elseif C_Spell and C_Spell.GetSpellInfo then
                            local info = C_Spell.GetSpellInfo(id)
                            name = info and info.name
                            texture = info and info.iconID
                       end
                   end
              elseif type == "item" then
                   name = C_Item.GetItemInfo(id)
                   _, _, _, _, _, _, _, _, _, texture = C_Item.GetItemInfo(id)
              elseif type == "mount" then
                   if C_MountJournal then 
                       name, _, texture = C_MountJournal.GetMountInfoByID(id) 
                   end
              elseif type == "companion" and subType == "MOUNT" then
                   -- Handle legacy 'companion' cursor type for mounts. ID is Journal Index (Filtered).
                   if C_MountJournal then 
                       name, _, texture = C_MountJournal.GetDisplayedMountInfo(id) 
                   end
              elseif type == "petaction" then
                   -- Class Pet Bar actions
                   -- GetPetActionInfo returns: name, texture, isToken, isActive, autoCastAllowed, autoCastEnabled, spellID
                   local pName, pSub, _, _, _, _, pSpellID = GetPetActionInfo(id)
                   
                   if pName then 
                       name = pName
                       -- pSub is often the texture (FileID). pSpellID requires modern client.
                       if pSpellID then
                          if C_Spell and C_Spell.GetSpellTexture then texture = C_Spell.GetSpellTexture(pSpellID) end
                       elseif pSub then 
                          -- If pSub is a number, it might be texture or spellID.
                          -- In the user's error, pSub was 236295 (SpellID for Threatening Presence).
                          -- So strict check:
                          if C_Spell and C_Spell.GetSpellTexture and C_Spell.GetSpellInfo and C_Spell.GetSpellInfo(pSub) then
                               texture = C_Spell.GetSpellTexture(pSub)
                          else
                               texture = pSub -- Assume it's a texture FileID
                          end
                       end 
                   end
              elseif type == "battlepet" then
                   if C_PetJournal then 
                       -- 1:petID, 2:speciesID, 3:owned, 4:customName, 5:level, 6:xp, 7:maxXp, 8:displayID, 9:isFavorite, 10:name(species), 11:icon
                       -- Wait, GetPetInfoByPetID returns: speciesID, customName, level, xp, maxXp, displayID, isFavorite, name, icon, petType, creatureID ...
                       -- The user used: local _, cName, _, _, _, _, _, _, iconSource = C_PetJournal.GetPetInfoByPetID(id)
                       -- Let's verify returns. 
                       -- Modern: speciesID, customName, level, xp, maxXp, displayID, isFavorite, name, icon, petType, creatureID, sourceText, description, isWild, canBattle, tradable, unique, obtainable
                       -- So Arg 2 = customName. Arg 8 = name (Species Name). Arg 9 = icon.
                       
                       local speciesID, customName, level, xp, maxXp, displayID, isFavorite, speciesName, iconSource = C_PetJournal.GetPetInfoByPetID(id)
                       name = customName or speciesName
                       texture = iconSource
                   end
              end
              
              if name then
                  -- FIX: Target the correct input for the text if explicit link exists (e.g. Icon -> InputBox)
                  if self.spellInput and self.spellInput.SetText then
                      self.spellInput:SetText(name)
                  elseif self.SetText then
                      self:SetText(name)
                  end
                  
                  if texture and self.iconBtn and self.iconBtn.icon then
                      self.iconBtn.icon:SetTexture(texture)
                  elseif self.icon then -- iconBtn context
                      self.icon:SetTexture(texture)
                  end
                  
                  if self.ClearFocus then self:ClearFocus() end
                  if self.spellInput and self.spellInput.ClearFocus then self.spellInput:ClearFocus() end
                  
                  ClearCursor()
                  MM:GenerateMacroText()
              end
          end

          dropBox:EnableMouse(true)
          dropBox:SetScript("OnReceiveDrag", HandleDropContent)
          dropBox:SetScript("OnMouseUp", function(self, button)
              if GetCursorInfo() or MM.DragContext then HandleDropContent(self) end 
          end)
          dropBox:SetScript("OnEnter", function(self)
              if GetCursorInfo() or MM.DragContext then
                  self:SetBackdropBorderColor(0, 1, 0, 1) -- Green highlight
              end
          end)
          dropBox:SetScript("OnLeave", function(self)
              self:SetBackdropBorderColor(0.2, 0.25, 0.35, 0.8)
          end)
          
          argBox.spellInput = argBox 
          argBox:EnableMouse(true)
          argBox:SetScript("OnReceiveDrag", HandleDropContent)
          argBox:SetScript("OnMouseUp", function(self, button) 
              if GetCursorInfo() or MM.DragContext then HandleDropContent(self) end 
          end)
          
          -- Text Update Logic & Arg Box Toggle
          local baseSetText = dropBox.SetText
          dropBox.SetText = function(self, txt)
              baseSetText(self, txt)
              
              local cmd = txt and txt:match("^(%S+)")
              if cmd then cmd = cmd:lower() end
              
              if cmd and (MM.CommandsWithArgs[cmd] or cmd:match("^/%d+$")) then
                  argBox:Show()
              else
                  argBox:Hide()
              end
              line:UpdateLineHeight()
              
              -- Update Icon from text if possible
              if not txt or txt == "" then 
                  iconTex:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
              else
                  local t
                  if C_Spell and C_Spell.GetSpellTexture then t = C_Spell.GetSpellTexture(txt) end
                  if not t then _, _, _, _, _, _, _, _, _, t = C_Item.GetItemInfo(txt) end
                  if t then iconTex:SetTexture(t) else iconTex:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark") end
              end
              if not MM.isParsingMacro then
                  MM:GenerateMacroText()
              end
              if line.Validate then line:Validate() end
          end
          
          argBox:HookScript("OnTextChanged", function()
              if not MM.isParsingMacro then
                  MM:GenerateMacroText()
              end
              if line.Validate then line:Validate() end
          end)
          
          iconBtn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
          iconBtn:RegisterForDrag("LeftButton")
          iconBtn:SetScript("OnReceiveDrag", HandleDropContent)
          
          iconBtn:SetScript("OnEnter", function(self)
              local txt = dropBox:GetText()
              if not txt or txt == "" then return end
              GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
              local textID
              if C_Spell and C_Spell.GetSpellInfo then
                   local info = C_Spell.GetSpellInfo(txt)
                   if info and info.spellID then textID = info.spellID end
              end
              
              if textID then
                  GameTooltip:SetSpellByID(textID)
              else
                  local _, link = C_Item.GetItemInfo(txt)
                  if link then GameTooltip:SetHyperlink(link) else GameTooltip:SetText(txt, 1, 1, 1) end
              end
              GameTooltip:Show()
          end)
          iconBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
          
          iconBtn:SetScript("OnClick", function(self, button)
               if button == "LeftButton" then
                   if GetCursorInfo() then HandleDropContent(self) else dropBox:SetText("") end
               end
          end)

           
           MM:InjectValidator(line)
           table.insert(f.lines, line)
           
           f:UpdateHeight()
       end
       
       if isBase then
           f:AddLine()
       end
       
       f:UpdateHeight()
       return f
end

-- Line Validation Injection
function MM:InjectValidator(line)
    function line:Validate()
         if not MM.Validator then return end
         
         local cmd = line.spellInput:GetText()
         local arg = line.argInput:IsShown() and line.argInput:GetText() or ""
         
         -- We construct a pseudo-line to validate the PARTS
         -- Actually, Validator checks brackets and keywords.
         -- Commands like /cast are safe. We care about [conditions].
         
         -- Reconstruct conditions string
         local condStr = ""
         if line.conditions then
             local parts = {}
             for tag, active in pairs(line.conditions) do
                 if active then table.insert(parts, tag) end
             end
             if #parts > 0 then
                 condStr = "[" .. table.concat(parts, ", ") .. "]"
             end
         end
         
         -- If user typed brackets in arg?
         local fullText = (cmd or "") .. " " .. condStr .. " " .. arg
         local valid, errors = MM.Validator:ValidateLine(fullText)
         
         if valid then

             -- ButtonTemplate doesn't allow easy border color change.
             -- Let's stick to text color or adding a border texture?
             if not line.errorBorder then
                 line.errorBorder = line:CreateTexture(nil, "OVERLAY")
                 line.errorBorder:SetAllPoints(line.condBtn)
                 line.errorBorder:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
                 line.errorBorder:SetBlendMode("ADD")
                 line.errorBorder:SetVertexColor(1, 0, 0, 1)
                 line.errorBorder:Hide()
             end
             line.errorBorder:Hide()
             line.errors = nil
         else
             if not line.errorBorder then
                 line.errorBorder = line:CreateTexture(nil, "OVERLAY")
                 line.errorBorder:SetAllPoints(line.condBtn)
                 line.errorBorder:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
                 line.errorBorder:SetBlendMode("ADD")
                 line.errorBorder:SetVertexColor(1, 0, 0, 1)
             end
             line.errorBorder:Show()
             line.errors = errors
         end
    end
    
    -- Hook Tooltip for Errors
    line.condBtn:HookScript("OnEnter", function(self)
        if line.errors then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(L["Syntax Error"], 1, 0, 0)
            for _, err in ipairs(line.errors) do
                GameTooltip:AddLine(err, 1, 1, 1)
            end
            GameTooltip:Show()
        end
    end)
    line.condBtn:HookScript("OnLeave", function() GameTooltip:Hide() end)
end

--------------------------------------------------------------------------------
-- Command Definitions & Helpers
--------------------------------------------------------------------------------

MM.CommandsWithArgs = {
    ["/cast"] = true, ["/use"] = true, ["/castrandom"] = true, ["/userandom"] = true, ["/castsequence"] = true,
    ["/cancelaura"] = true,
    ["/say"] = true, ["/yell"] = true, ["/whisper"] = true, ["/party"] = true, ["/raid"] = true, ["/instance"] = true, ["/guild"] = true, ["/rw"] = true, ["/bg"] = true, ["/emote"] = true, ["/e"] = true,
    ["/promote"] = true, ["/demote"] = true, ["/invite"] = true, ["/kick"] = true, ["/afk"] = true, ["/follow"] = true, ["/leave"] = true,
    ["/console"] = true, ["/run"] = true, ["/dump"] = true, ["/click"] = true,
    ["/target"] = true, ["/focus"] = true, ["/equip"] = true, ["/equipslot"] = true,
    ["/ping"] = true, ["/countdown"] = true,
}

--- Updates the Main Preview Icon based on user selection or dynamic content.
function MM:UpdateMacroPreviewIcon()
    if not MM.previewIcon then return end
    
    local iconToUse = MM.selectedStaticIcon or "Interface\\Icons\\INV_Misc_QuestionMark"
    
    if MM.useShowTooltip and not MM.selectedStaticIcon then
        local foundIcon = nil
        
        -- 1. Check Tooltip Source
        if MM.tooltipSource and MM.tooltipSource ~= "" then
             local txt = MM.tooltipSource
             if C_Spell and C_Spell.GetSpellInfo then
                 local info = C_Spell.GetSpellInfo(txt)
                 if info then foundIcon = info.iconID end
             end
             if not foundIcon then
                 local _, _, _, _, _, _, _, _, _, itemIcon = C_Item.GetItemInfo(txt)
                 foundIcon = itemIcon
             end
        end
        
        -- 2. Find first spell in macro
        if not foundIcon then
            local order = {"nomod", "shift", "ctrl", "alt"}
            for _, k in ipairs(order) do
                local row = MM.rows[k]
                if row and row.lines then 
                    for _, line in ipairs(row.lines) do
                        if line.spellInput then
                             local spellName = line.spellInput:GetText()
                             if spellName and spellName ~= "" then
                                 if C_Spell and C_Spell.GetSpellInfo then
                                    local info = C_Spell.GetSpellInfo(spellName)
                                    if info then foundIcon = info.iconID end
                                 end
                                 if not foundIcon then
                                       local _, _, _, _, _, _, _, _, _, itemIcon = C_Item.GetItemInfo(spellName)
                                       foundIcon = itemIcon
                                 end
                                if foundIcon then break end 
                            end
                        end
                    end
                    if foundIcon then break end
                end
            end
        end
        
        if foundIcon then
            iconToUse = foundIcon
        else
            iconToUse = "Interface\\Icons\\INV_Misc_QuestionMark"
        end
    end

    MM.previewIcon:SetTexture(iconToUse)
    
    if MM.OptionsWindow and MM.OptionsWindow.iconPreview then
        MM.OptionsWindow.iconPreview:SetTexture(iconToUse)
    end
end

--- Places the currently active macro onto the cursor to drag directly onto an action bar.
function MM:PickupCurrentMacro()
    if InCombatLockdown and InCombatLockdown() then
        if MM.Notify then MM:Notify(L["Cannot modify macros during combat!"] or "Cannot modify macros during combat!", "error") end
        return
    end
    
    if MM.selectedScope == "library" then
        if MM.Notify then MM:Notify(L["Cannot place Library macros directly on action bar. Equip to Account or Character first."] or "Cannot place Library macros directly on action bar. Equip to Account or Character first.", "warning") end
        return
    end
    
    local name = (MM.nameInput and MM.nameInput:GetText()) or MM.selectedMacroName
    if not name or name == "" then
        if MM.Notify then MM:Notify(L["Enter a macro name and save first."] or "Enter a macro name and save first.", "error") end
        return
    end
    
    -- If already selected with a valid index in the game client
    if MM.selectedMacroIndex and MM.selectedMacroIndex > 0 then
        PickupMacro(MM.selectedMacroIndex)
        return
    end
    
    -- If unsaved, try finding macro by name
    local global, perChar = GetNumMacros()
    local foundIdx = nil
    local maxIdx = (MM.selectedScope == "character") and (120 + perChar) or global
    local startIdx = (MM.selectedScope == "character") and 121 or 1
    
    for i = startIdx, maxIdx do
        local mName = GetMacroInfo(i)
        if mName and mName == name then
            foundIdx = i
            break
        end
    end
    
    if foundIdx then
        PickupMacro(foundIdx)
    else
        -- Save macro first then pickup
        MM:SaveMacro()
        if MM.selectedMacroIndex then
            PickupMacro(MM.selectedMacroIndex)
        end
    end
end

--- Parses a raw macro text body into visual modifier rows in the builder workbench.
function MM:ParseMacroToBuilder(text)
    if not text or not MM.rows then return end

    -- Reset lines in all existing rows
    for _, modKey in ipairs({"nomod", "shift", "ctrl", "alt"}) do
        local row = MM.rows[modKey]
        if row and row.lines then
            for i = #row.lines, 1, -1 do
                row:RemoveLine(row.lines[i])
            end
        end
    end

    local lines = {}
    for line in text:gmatch("[^\r\n]+") do
        local trimmed = line:match("^%s*(.-)%s*$")
        if trimmed and trimmed ~= "" and not trimmed:find("^#") then
            table.insert(lines, trimmed)
        end
    end

    for _, lineStr in ipairs(lines) do
        local cmd, rest = lineStr:match("^(%S+)%s*(.*)$")
        if cmd then
            cmd = cmd:lower()
            local modKey = "nomod"
            if rest:find("mod:shift") or rest:find("modifier:shift") then
                modKey = "shift"
            elseif rest:find("mod:ctrl") or rest:find("modifier:ctrl") then
                modKey = "ctrl"
            elseif rest:find("mod:alt") or rest:find("modifier:alt") then
                modKey = "alt"
            end

            local cleanName = rest:gsub("%b[]", ""):match("^%s*(.-)%s*$") or ""
            if cleanName:find(";") then
                cleanName = cleanName:match("^%s*([^;]+)") or cleanName
            end
            cleanName = cleanName:match("^%s*(.-)%s*$") or ""

            local row = MM.rows[modKey] or MM.rows["nomod"]
            if row then
                if not row.lines or #row.lines == 0 then
                    row:AddLine()
                end
                local lineObj = row.lines[#row.lines]
                if lineObj and lineObj.spellInput and lineObj.spellInput:GetText() ~= "" then
                    row:AddLine()
                    lineObj = row.lines[#row.lines]
                end

                if lineObj then
                    if lineObj.cmdBtn then lineObj.cmdBtn:SetText(cmd) end
                    if lineObj.spellInput then lineObj.spellInput:SetText(cleanName) end
                    if lineObj.UpdateLineHeight then lineObj:UpdateLineHeight() end
                end
            end
        end
    end

    MM:UpdateBuilderLayout()
    MM:GenerateMacroText()
end


