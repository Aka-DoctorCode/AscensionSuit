--------------------------------------------------------------------------------
-- Macro Maker - Guided Tour & Tutorial Module
-- Version: 2.0 (Interactive Step-by-Step Tour)
-- Author: Satyros
--
-- Description:
--   Provides an interactive, step-by-step guided tour explaining all 4 main
--   areas of Macro Maker with glowing spotlights and navigation controls.
--------------------------------------------------------------------------------

local AddOnName, MM = ...
local L = MM.L

--------------------------------------------------------------------------------
-- Tour State & Steps Definition
--------------------------------------------------------------------------------

MM.currentTourStep = 1

local TOUR_STEPS = {
    {
        title = L["1. Macro Manager"] or "1. Macro Manager",
        desc = L["Manage your entire macro collection here. Switch between Account and Character macros, create new ones (+ New Macro), duplicate, or import/export macros."] or "Verwalte hier deine gesamte Makro-Sammlung. Wechsle zwischen Account- und Charakter-Makros, erstelle neue (+ Neues Makro), dupliziere oder importiere/exportiere Makros.",
        getTarget = function() return MM.ManagerPanel end,
        point = "TOPLEFT",
        relativePoint = "TOPRIGHT",
        offsetX = 12,
        offsetY = -30
    },
    {
        title = L["2. Action Source"] or "2. Aktions-Quelle",
        desc = L["Browse spells, equipped gear, bag items, mounts, and toys. Simply drag and drop any icon into the Builder slots to assign actions!"] or "Browse spells, equipped gear, bag items, mounts, and toys. Simply drag and drop any icon into the Builder slots to assign actions!",
        getTarget = function() return MM.SourcePanel end,
        point = "TOPLEFT",
        relativePoint = "TOPRIGHT",
        offsetX = 12,
        offsetY = -30
    },
    {
        title = L["3. Builder Workbench"] or "3. Makro-Werkbank",
        desc = L["The main assembly area! Assign spells to modifiers (Nomod, Shift, Ctrl, Alt), edit names, optimize code size with 'Optimize Code', and save to WoW."] or "The main assembly area! Assign spells to modifiers (Nomod, Shift, Ctrl, Alt), edit names, optimize code size with 'Optimize Code', and save to WoW.",
        getTarget = function() return MM.BuilderPanel end,
        point = "TOPRIGHT",
        relativePoint = "TOPLEFT",
        offsetX = -12,
        offsetY = -30
    },
    {
        title = L["4. Inspector Tools"] or "4. Inspector Werkzeuge",
        desc = L["Specialized power tools: Configure smart targeting in 'Conditions' ([@mouseover], [@cursor]), build sequences in 'Sequence Studio', pick icons, or browse pre-built class macros in 'Library'."] or "Specialized power tools: Configure smart targeting in 'Conditions' ([@mouseover], [@cursor]), build sequences in 'Sequence Studio', pick icons, or browse pre-built class macros in 'Library'.",
        getTarget = function() return MM.InspectorPanel end,
        point = "TOPRIGHT",
        relativePoint = "TOPLEFT",
        offsetX = -12,
        offsetY = -30
    },
}

--------------------------------------------------------------------------------
-- Tour Initialization
--------------------------------------------------------------------------------

function MM:InitTutorial()
    if not MM.MainFrame then return end
    
    -- 1. Create Help/Info Button (Top Header, right of Portrait)
    local btnInfo = CreateFrame("Button", "$parent_HelpButton", MM.MainFrame)
    btnInfo:SetSize(22, 22)
    btnInfo:SetPoint("TOPLEFT", 60, -4)
    btnInfo:SetFrameStrata("FULLSCREEN_DIALOG")
    btnInfo:SetFrameLevel(9000)
    
    local iTex = btnInfo:CreateTexture(nil, "OVERLAY")
    iTex:SetAllPoints()
    iTex:SetTexture("Interface\\FriendsFrame\\InformationIcon")
    
    btnInfo:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")
    
    btnInfo:SetScript("OnClick", function()
        MM:ToggleTutorialMode()
    end)
    
    btnInfo:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Start Guided Tour"] or "Interaktive Tour starten", 1, 0.82, 0)
        GameTooltip:AddLine(L["Click to start an interactive step-by-step tour explaining all Macro Maker features."] or "Click to start an interactive step-by-step tour explaining all Macro Maker features.", 1, 1, 1, true)
        GameTooltip:Show()
    end)
    btnInfo:SetScript("OnLeave", GameTooltip_Hide)
    MM.TutorialButton = btnInfo

    -- 2. Create Spotlight Highlight Box
    local spotlight = CreateFrame("Frame", nil, MM.MainFrame, "BackdropTemplate")
    spotlight:SetFrameStrata("DIALOG")
    spotlight:SetFrameLevel(200)
    spotlight:SetBackdrop({
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    spotlight:SetBackdropBorderColor(1, 0.82, 0, 1) -- Gold Glow
    spotlight:Hide()
    MM.TourSpotlight = spotlight

    -- 3. Create Tour Dialog Card
    local tourCard = CreateFrame("Frame", nil, MM.MainFrame, "BackdropTemplate")
    tourCard:SetSize(320, 165)
    tourCard:SetFrameStrata("FULLSCREEN_DIALOG")
    tourCard:SetFrameLevel(300)
    tourCard:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = false, edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 }
    })
    tourCard:SetBackdropColor(0.08, 0.08, 0.12, 0.96)
    tourCard:SetBackdropBorderColor(1, 0.82, 0, 0.9)
    tourCard:Hide()
    tourCard:EnableMouse(true)
    MM.TourCard = tourCard

    -- Tour Step Header / Badge
    local stepBadge = tourCard:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    stepBadge:SetPoint("TOPLEFT", 12, -10)
    stepBadge:SetTextColor(0.4, 0.8, 1.0)
    tourCard.stepBadge = stepBadge

    -- Title
    local tourTitle = tourCard:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    tourTitle:SetPoint("TOPLEFT", 12, -26)
    tourCard.tourTitle = tourTitle

    -- Close Button (✖)
    local closeBtn = CreateFrame("Button", nil, tourCard, "UIPanelCloseButton")
    closeBtn:SetSize(20, 20)
    closeBtn:SetPoint("TOPRIGHT", -4, -4)
    closeBtn:SetScript("OnClick", function()
        MM:EndTutorial()
    end)

    -- Description Body
    local tourDesc = tourCard:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    tourDesc:SetPoint("TOPLEFT", 12, -48)
    tourDesc:SetPoint("BOTTOMRIGHT", -12, 38)
    tourDesc:SetJustifyH("LEFT")
    tourDesc:SetJustifyV("TOP")
    tourCard.tourDesc = tourDesc

    -- Navigation Buttons
    local btnPrev = CreateFrame("Button", nil, tourCard, "GameMenuButtonTemplate, BackdropTemplate")
    btnPrev:SetSize(80, 22)
    btnPrev:SetPoint("BOTTOMLEFT", 12, 8)
    btnPrev:SetText(L["Back"] or "Back")
    MM:StyleButtonToModern(btnPrev)
    btnPrev:SetScript("OnClick", function()
        MM:PrevTourStep()
    end)
    tourCard.btnPrev = btnPrev

    local btnNext = CreateFrame("Button", nil, tourCard, "GameMenuButtonTemplate, BackdropTemplate")
    btnNext:SetSize(90, 22)
    btnNext:SetPoint("BOTTOMRIGHT", -12, 8)
    btnNext:SetText(L["Next"] or "Next")
    MM:StyleButtonToModern(btnNext)
    btnNext:SetScript("OnClick", function()
        MM:NextTourStep()
    end)
    tourCard.btnNext = btnNext
end

--------------------------------------------------------------------------------
-- Tour Navigation & Display
--------------------------------------------------------------------------------

function MM:ShowTourStep(stepIndex)
    if not MM.TourCard or not MM.TourSpotlight then return end
    
    if stepIndex < 1 then stepIndex = 1 end
    if stepIndex > #TOUR_STEPS then
        MM:EndTutorial()
        return
    end
    
    MM.currentTourStep = stepIndex
    local stepData = TOUR_STEPS[stepIndex]
    local targetFrame = stepData.getTarget()
    
    if not targetFrame or not targetFrame:IsShown() then
        -- If target not visible, try to show relevant parts or fallback
        if stepIndex == 4 and MM.ShowInspectorTab then
            MM:ShowInspectorTab("overview")
        end
    end
    
    -- Update Texts
    MM.TourCard.stepBadge:SetText(format(L["Tour: Step %d of %d"] or "Tour: Step %d of %d", stepIndex, #TOUR_STEPS))
    MM.TourCard.tourTitle:SetText(stepData.title)
    MM.TourCard.tourDesc:SetText(stepData.desc)
    
    -- Update Prev / Next Buttons
    if stepIndex == 1 then
        MM.TourCard.btnPrev:Disable()
        MM.TourCard.btnPrev:SetAlpha(0.3)
    else
        MM.TourCard.btnPrev:Enable()
        MM.TourCard.btnPrev:SetAlpha(1.0)
    end
    
    if stepIndex == #TOUR_STEPS then
        MM.TourCard.btnNext:SetText(L["Finish"] or "Finish")
    else
        MM.TourCard.btnNext:SetText(L["Next"] or "Next")
    end
    
    -- Snap Spotlight around target frame
    if targetFrame then
        MM.TourSpotlight:ClearAllPoints()
        MM.TourSpotlight:SetPoint("TOPLEFT", targetFrame, "TOPLEFT", -6, 6)
        MM.TourSpotlight:SetPoint("BOTTOMRIGHT", targetFrame, "BOTTOMRIGHT", 6, -6)
        MM.TourSpotlight:Show()
        
        -- Position Tour Card dynamically
        MM.TourCard:ClearAllPoints()
        MM.TourCard:SetPoint(stepData.point, targetFrame, stepData.relativePoint, stepData.offsetX, stepData.offsetY)
        MM.TourCard:Show()
    else
        MM.TourCard:ClearAllPoints()
        MM.TourCard:SetPoint("CENTER", MM.MainFrame, "CENTER", 0, 0)
        MM.TourCard:Show()
    end
end

function MM:NextTourStep()
    if MM.currentTourStep >= #TOUR_STEPS then
        MM:EndTutorial()
    else
        MM:ShowTourStep(MM.currentTourStep + 1)
    end
end

function MM:PrevTourStep()
    if MM.currentTourStep > 1 then
        MM:ShowTourStep(MM.currentTourStep - 1)
    end
end

function MM:ToggleTutorialMode()
    if MM.inTutorialMode then
        MM:EndTutorial()
    else
        MM.inTutorialMode = true
        MM:ShowTourStep(1)
    end
end

function MM:EndTutorial()
    MM.inTutorialMode = false
    if MM.TourCard then MM.TourCard:Hide() end
    if MM.TourSpotlight then MM.TourSpotlight:Hide() end
end
