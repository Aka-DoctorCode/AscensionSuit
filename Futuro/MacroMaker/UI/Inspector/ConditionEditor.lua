--------------------------------------------------------------------------------
-- Macro Maker - Condition Editor Module
-- Version: 1.0
-- Author: Satyros
--
-- Description:
--   Manages the Condition Editor panel for toggling macro conditionals.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

--------------------------------------------------------------------------------
-- Condition Editor
--------------------------------------------------------------------------------

--- Creates the Condition Editor interface for toggling macro conditionals.
function MM:CreateConditionEditor()
    local f = CreateFrame("Frame", "MM_ConditionEditor", MM.InspectorPanel)
    f:SetPoint("TOPLEFT", MM.InspectorPanel, "TOPLEFT", 0, -56)
    f:SetPoint("BOTTOMRIGHT", MM.InspectorPanel, "BOTTOMRIGHT", 0, 0)
    
    -- Exclusive Visibility Logic: Hide other sub-panels when shown
    f:HookScript("OnShow", function(self)
        if MM.CloseInspectorPanels then MM:CloseInspectorPanels(self) end
        if MM.UpdateInspectorTabHighlight then MM:UpdateInspectorTabHighlight("conditions") end
    end)
    
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 15, -8)
    title:SetText(L["Conditions"])
    
    -- Active target / row indicator
    local subtitle = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    subtitle:SetPoint("TOPLEFT", 15, -26)
    subtitle:SetTextColor(0.7, 0.7, 0.7)
    subtitle:SetText(L["Select conditions for current line:"] or "Select conditions for current line:")
    f.subtitle = subtitle

    -- Clear Conditions Button
    local btnClear = CreateFrame("Button", nil, f, "GameMenuButtonTemplate, BackdropTemplate")
    btnClear:SetPoint("TOPRIGHT", -15, -6)
    btnClear:SetSize(75, 20)
    btnClear:SetText(L["Clear All"] or "Clear All")
    MM:StyleButtonToModern(btnClear)
    btnClear:SetScript("OnClick", function()
        if MM.currentRow and MM.ConditionEditor and MM.ConditionEditor.checkboxes then
            for _, chk in pairs(MM.ConditionEditor.checkboxes) do
                chk:SetChecked(false)
            end
            MM:UpdateRowConditions()
        end
    end)

    -- ScrollFrame Container for Conditions
    local scrollFrame = CreateFrame("ScrollFrame", "$parent_Scroll", f, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 10, -48)
    scrollFrame:SetPoint("BOTTOMRIGHT", -28, 10)
    MM:SkinScrollBar(scrollFrame)
    
    local scrollChild = CreateFrame("Frame")
    scrollChild:SetSize(290, 1)
    scrollFrame:SetScrollChild(scrollChild)
    f.scrollChild = scrollChild
    
    f:SetScript("OnHide", function()
        MM.currentRow = nil
    end)
    
    f.checkboxes = {}
    
    local conditionGroups = {
        {
            category = L["Targeting"] or "Targeting",
            items = {
                { label = L["Target: Player (@player)"], tag = "@player" },
                { label = L["Target: Mouseover (@mouseover)"], tag = "@mouseover" },
                { label = L["Target: Cursor (@cursor)"], tag = "@cursor" },
                { label = L["Target: Focus (@focus)"], tag = "@focus" }, 
                { label = L["Target: Target (@target)"], tag = "@target" },
                { label = L["Target: TargetTarget (@targettarget)"], tag = "@targettarget" },
            }
        },
        {
            category = L["Target State"] or "Target State",
            items = {
                { label = L["Help (Friend)"], tag = "help" },
                { label = L["Harm (Enemy)"], tag = "harm" },
                { label = L["Dead"], tag = "dead" },
                { label = L["Nodead (Alive)"], tag = "nodead" },
                { label = L["Exists"], tag = "exists" },
            }
        },
        {
            category = L["Mouse Buttons"] or "Mouse Buttons",
            items = {
                { label = L["Left Button (btn:1)"] or "Left Click (btn:1)", tag = "btn:1" },
                { label = L["Right Button (btn:2)"] or "Right Click (btn:2)", tag = "btn:2" },
                { label = L["Middle Button (btn:3)"] or "Middle Click (btn:3)", tag = "btn:3" },
            }
        },
        {
            category = L["Player & Environment"] or "Player & Environment",
            items = {
                { label = L["Combat"], tag = "combat" },
                { label = L["No Combat"], tag = "nocombat" },
                { label = L["Stealth"], tag = "stealth" },
                { label = L["Channeling"], tag = "channeling" },
                { label = L["No Channeling (nochanneling)"] or "No Channeling (nochanneling)", tag = "nochanneling" },
                { label = L["Mounted"], tag = "mounted" },
                { label = L["Not Mounted (nomounted)"] or "Not Mounted (nomounted)", tag = "nomounted" },
                { label = L["Swimming"], tag = "swimming" },
                { label = L["Flyable"], tag = "flyable" },
                { label = L["Indoors"], tag = "indoors" },
                { label = L["Outdoors"], tag = "outdoors" },
            }
        },
        {
            category = L["Forms & Stances"] or "Forms & Stances",
            items = {
                { label = L["Form / Stance 1 (form:1)"] or "Form / Stance 1", tag = "form:1" },
                { label = L["Form / Stance 2 (form:2)"] or "Form / Stance 2", tag = "form:2" },
                { label = L["Form / Stance 3 (form:3)"] or "Form / Stance 3", tag = "form:3" },
                { label = L["Form / Stance 4 (form:4)"] or "Form / Stance 4", tag = "form:4" },
            }
        },
        {
            category = L["Specialization"] or "Specialization",
            items = {
                { label = L["Specialization 1 (spec:1)"] or "Specialization 1", tag = "spec:1" },
                { label = L["Specialization 2 (spec:2)"] or "Specialization 2", tag = "spec:2" },
                { label = L["Specialization 3 (spec:3)"] or "Specialization 3", tag = "spec:3" },
            }
        },
        {
            category = L["Group & Pet"] or "Group & Pet",
            items = {
                { label = L["In Group (Any)"], tag = "group" },
                { label = L["In Party"], tag = "group:party" },
                { label = L["In Raid"], tag = "group:raid" },
                { label = L["Have Pet"], tag = "pet" },
                { label = L["No Pet"], tag = "nopet" },
            }
        }
    }
    
    local yOff = -4
    for _, group in ipairs(conditionGroups) do
        local catHeader = scrollChild:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        catHeader:SetPoint("TOPLEFT", 6, yOff)
        catHeader:SetText("|cffffd100" .. group.category .. "|r")
        yOff = yOff - 18
        
        for _, data in ipairs(group.items) do
            local row, chk = MM:CreateInspectorCheckRow(scrollChild, data.label)
            row:SetPoint("TOPLEFT", 10, yOff)
            
            chk.tag = data.tag
            chk:SetScript("OnClick", function(self)
                MM:UpdateRowConditions()
            end)
            
            f.checkboxes[data.tag] = chk
            yOff = yOff - 24
        end
        yOff = yOff - 6
    end
    
    scrollChild:SetHeight(math.abs(yOff) + 20)
    
    MM.ConditionEditor = f
    f:Hide()
end

--- Opens the Condition Editor for a specific builder row.
--- @param row table The builder row object to edit conditions for.
function MM:OpenConditionEditor(row)
    if not MM.ConditionEditor then
        MM:CreateConditionEditor()
    end
    
    -- If no row is given, try using currentEditLine or standard row
    if not row then
        if MM.currentEditLine then
            row = MM.currentEditLine
        elseif MM.rows and MM.rows["nomod"] and MM.rows["nomod"].lines and MM.rows["nomod"].lines[1] then
            row = MM.rows["nomod"].lines[1]
        end
    end
    
    if not row then
        MM:ShowInspectorTab("conditions")
        return
    end

    -- Toggle off if clicking the same row while open
    if MM.ConditionEditor:IsShown() and MM.currentRow and (MM.currentRow == row or (MM.currentRow.key and row.key and MM.currentRow.key == row.key)) then
        MM.currentRow = nil
        if MM.ShowInspectorTab then MM:ShowInspectorTab("overview") else MM.ConditionEditor:Hide() end
        return
    end
    
    MM.currentRow = row
    if MM.ConditionEditor.subtitle then
        local rowName = row.parentRow and row.parentRow.title or "Active Line"
        MM.ConditionEditor.subtitle:SetText((L["Editing: "] or "Editing: ") .. rowName)
    end

    local conditions = row.conditions or {}
    
    -- Populate checkboxes based on row state
    for tag, chk in pairs(MM.ConditionEditor.checkboxes) do
        chk:SetChecked(conditions[tag] == true)
    end
    
    if MM.ShowInspectorTab then
        MM:ShowInspectorTab("conditions")
    else
        MM.ConditionEditor:Show()
    end
end

--- Updates the active row's conditions based on checkbox state.
function MM:UpdateRowConditions()
    if not MM.currentRow then return end
    
    local row = MM.currentRow
    if not row.conditions then row.conditions = {} end
    
    local hasAny = false
    local count = 0
    
    for tag, chk in pairs(MM.ConditionEditor.checkboxes) do
        if chk:GetChecked() then
            row.conditions[tag] = true
            hasAny = true
            count = count + 1
        else
            row.conditions[tag] = nil
        end
    end
    
    -- Update "Conditions (n)" button text
    if row.condBtn then
        if count > 0 then
            row.condBtn:SetText(L["Conditions"].." ("..count..")")
        else
            row.condBtn:SetText(L["Conditions"])
        end
    end
    
    MM:GenerateMacroText()
end
