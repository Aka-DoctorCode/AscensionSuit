-------------------------------------------------------------------------------
-- Project: AscensionSuit
-- Author: Aka-DoctorCode
-- File: MockUI.lua
-------------------------------------------------------------------------------
---@diagnostic disable: undefined-global, undefined-field, inject-field

local addonName, addonTable = ...
local AscensionUI = LibStub:GetLibrary("AscensionSuit-UI")
if not AscensionUI then return end

-------------------------------------------------------------------------------
-- 1. CONTEXT INITIALIZATION
-------------------------------------------------------------------------------
local ctx = AscensionUI:CreateContext()

-- Global adjustments for the gallery layout
ctx.styles.dimensions.tabHeight = 26
ctx.styles.dimensions.tabSpacing = 4
local styles = ctx.styles

-------------------------------------------------------------------------------
-- 2. MOCK DATA
-------------------------------------------------------------------------------
--- Database for simulating state changes in the gallery.
local mockDB = {
    check = true,
    slider = 50,
    stepper = 5,
    color = styles.colors.primary,
    dropdown = "opt1",
    input = "Mock Text",
    counter = 0
}

-------------------------------------------------------------------------------
-- 3. UTILITIES
-------------------------------------------------------------------------------
--- Displays which colors are impacting a specific component tab.
local function showComponentColors(panel, colors)
    local py = -280 -- Offset to accommodate blueprint visuals
    ctx:createHeader({ parent = panel.content, text = "Color Usage Details:", yOffset = py })
    py = py - 30

    for _, info in ipairs(colors) do
        local key = info.key
        local color = styles.colors[key]
        if color then
            local swatch = CreateFrame("Frame", nil, panel.content)
            swatch:SetSize(14, 14) swatch:SetPoint("TOPLEFT", 20, py)
            local tex = swatch:CreateTexture(nil, "OVERLAY") tex:SetAllPoints() tex:SetColorTexture(unpack(color))

            ctx:createLabel({ 
                parent = panel.content, 
                text = string.format("|cff00ff00%s|r: %s", key, info.usage), 
                yOffset = py, xOffset = 45 
            })
            py = py - 20
        end
    end
    panel.content:SetHeight(math.abs(py) + 50)
end

-------------------------------------------------------------------------------
-- 4. PALETTE MENU LOGIC
-------------------------------------------------------------------------------
--- Creates a visual palette viewer showing all defined theme colors.
local function CreatePaletteFrame(parent)
    local pFrame = CreateFrame("Frame", "AscensionSuitPaletteFrame", parent or UIParent, "BackdropTemplate")
    pFrame:SetSize(200, 580)
    pFrame:SetFrameStrata("TOOLTIP")
    
    if parent then
        -- Integrated: Anchor to the main frame
        pFrame:SetPoint("TOPRIGHT", parent, "TOPLEFT", -5, 0)
    else
        -- Standalone: Anchor to center and enable UX behaviors
        pFrame:SetPoint("CENTER")
        if AscensionUI.UX then
            AscensionUI.UX:makeMovable(pFrame)
            AscensionUI.UX:makeClosableWithEscape(pFrame)
        end
    end

    pFrame:SetBackdrop({
        bgFile = styles.files.bgFile,
        edgeFile = styles.files.edgeFile,
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    local bg = styles.colors.mainBackground
    pFrame:SetBackdropColor(bg[1], bg[2], bg[3], 0.25)
    pFrame:SetBackdropBorderColor(unpack(styles.colors.surfaceLight))

    -- Header
    ctx:createHeader({ parent = pFrame, text = "Global Palette", yOffset = -15 })

    -- Add Close Button
    local closeBtn = ctx:createCloseButton(pFrame, function() pFrame:Hide() end)
    closeBtn:SetPoint("TOPRIGHT", 5, 5)

    local py = -45
    
    local colorKeys = {
        "mainBackground",
        "surfaceDark",
        "surfaceLight",
        "surfaceHover",
        "primary",
        "primaryAlpha",
        "sidebarAccent",
        "sidebarActive",
        "sidebarHover",
        "redDetail",
        "blackDetail",
        "gold",
        "textLight",
    }

    for _, key in ipairs(colorKeys) do
        local color = styles.colors[key]
        if color then
            local sw = CreateFrame("Frame", nil, pFrame)
            sw:SetSize(20, 20)
            sw:SetPoint("TOPLEFT", 10, py)
            
            -- Visual Swatch
            local tex = sw:CreateTexture(nil, "OVERLAY")
            tex:SetAllPoints()
            tex:SetColorTexture(1, 1, 1, 1)
            tex:SetVertexColor(unpack(color))

            local lbl = pFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
            lbl:SetPoint("LEFT", sw, "RIGHT", 8, 0)
            lbl:SetText(key)
            py = py - 28
        end
    end
    
    pFrame:SetHeight(math.abs(py) + 15)
    return pFrame
end

-------------------------------------------------------------------------------
-- 5. MAIN GALLERY CREATION
-------------------------------------------------------------------------------
--- Orchestrates the creation of the entire UI component gallery.
local function CreateMockUI()
    -- Navigation Tab Names
    local tabNames = {
        "Main Window",
        -- "Header", 
        -- "Label", 
        -- "Checkbox", 
        -- "Slider", 
        -- "Stepper", 
        -- "Dropdown", 
        -- "Input Field", 
        -- "Button", 
        -- "Close Button", 
        -- "Step Button", 
        -- "Color Picker", 
        -- "Scroll Panel", 
        -- "Tabbed UI", 
        -- "Layout Model", 
        -- "UX Utils", 
        -- "Integration & Storage", 
        "Full Palette"
    }

    -- Tab Content Builders
    local tabFuncs = {
        -- [ TAB 1: MAIN WINDOW ] ----------------------------------------------
        function(panel)
            ctx:createHeader({ parent = panel.content, text = "Main Window (createMainFrame)", yOffset = -20 })
            ctx:createLabel({ parent = panel.content, text = "Structural Blueprint:", yOffset = -50 })

            -- Mini Mock-up Diagram
            local mu = CreateFrame("Frame", nil, panel.content, "BackdropTemplate")
            mu:SetSize(240, 150)
            mu:SetPoint("TOPLEFT", 20, -75)
            mu:SetBackdrop({ bgFile = styles.files.bgFile, edgeFile = styles.files.edgeFile, edgeSize = 1 })
            mu:SetBackdropColor(0, 0, 0, 0.8) mu:SetBackdropBorderColor(unpack(styles.colors.surfaceLight))

            -- Diagram Components
            local mh = mu:CreateTexture(nil, "OVERLAY") mh:SetSize(80, 4) mh:SetPoint("TOPLEFT", 10, -10) mh:SetColorTexture(unpack(styles.colors.gold))
            local ms = mu:CreateTexture(nil, "OVERLAY") ms:SetSize(40, 120) ms:SetPoint("TOPLEFT", 0, -25) ms:SetColorTexture(0.1, 0.1, 0.1, 0.8)
            local ml = mu:CreateTexture(nil, "OVERLAY") ml:SetSize(1, 120) ml:SetPoint("LEFT", ms, "RIGHT", 0, 0) ml:SetColorTexture(unpack(styles.colors.surfaceLight))
            for i=1, 4 do local mt = mu:CreateTexture(nil, "OVERLAY") mt:SetSize(30, 4) mt:SetPoint("TOPLEFT", 5, -30 - (i*10)) mt:SetColorTexture(unpack(styles.colors.primary)) mt:SetAlpha(0.4) end
            local mc = mu:CreateTexture(nil, "OVERLAY") mc:SetSize(160, 100) mc:SetPoint("TOPLEFT", 50, -35) mc:SetColorTexture(unpack(styles.colors.surfaceDark))

            ctx:createLabel({ parent = panel.content, text = "ctx:createMainFrame(options)", yOffset = -130, xOffset = 280, color = {1,0,0,1} })
            ctx:createLabel({ parent = panel.content, text = "- Standardized Backdrop\n- Auto Header & Close Btn\n- Built-in Sidebar\n- Scrollable Content Area", yOffset = -150, xOffset = 280 })

            showComponentColors(panel, { 
                {key="mainBackground", usage="Window Main Background"}, 
                {key="surfaceLight", usage="Outer Border & Sidebar Separator"},
                {key="surfaceDark", usage="Inner Content Area Background"},
                {key="surfaceHover", usage="Hover Background"},
                {key="gold", usage="Primary Window Title Color"},
                {key="primary", usage="Sidebar Tab Selection Accent"},
                {key="redDetail", usage="Close Button Hover Color"}
            })

            -- Visual Composition Box
            local visualBox = CreateFrame("Frame", nil, panel.content, "BackdropTemplate")
            visualBox:SetSize(200, 200)
            visualBox:SetPoint("TOPLEFT", 20, -480)
            visualBox:SetBackdrop({
                bgFile = styles.files.bgFile,
                edgeFile = styles.files.edgeFile,
                edgeSize = 1,
            })
            visualBox:SetBackdropColor(unpack(styles.colors.surfaceDark))
            visualBox:SetBackdropBorderColor(unpack(styles.colors.surfaceLight))

            -- Corner Squares with interaction
            local offsets = {
                { x = 20,  y = -20 },
                { x = 140, y = -20 },
                { x = 20,  y = -140 },  
                { x = 140, y = -140 }
            }
            for _, pos in ipairs(offsets) do
                local border = CreateFrame("Frame", nil, visualBox)
                border:SetSize(44, 44)
                border:SetPoint("TOPLEFT", visualBox, "TOPLEFT", pos.x - 2, pos.y + 2)
                border:EnableMouse(true)
                
                local bTex = border:CreateTexture(nil, "BACKGROUND")
                bTex:SetAllPoints()
                bTex:SetColorTexture(unpack(styles.colors.blackDetail))

                local fill = border:CreateTexture(nil, "OVERLAY")
                fill:SetPoint("TOPLEFT", 2, -2)
                fill:SetPoint("BOTTOMRIGHT", -2, 2)
                fill:SetColorTexture(unpack(styles.colors.surfaceLight))

                border:SetScript("OnEnter", function()
                    fill:SetColorTexture(unpack(styles.colors.surfaceHover))
                end)
                border:SetScript("OnLeave", function()
                    fill:SetColorTexture(unpack(styles.colors.surfaceLight))
                end)
            end

            -- Restore labels next to mini-mockup
            ctx:createLabel({ parent = panel.content, text = "ctx:createMainFrame(options)", yOffset = -130, xOffset = 280, color = {1,0,0,1} })
            ctx:createLabel({ parent = panel.content, text = "- Standardized Backdrop\n- Auto Header & Close Btn\n- Built-in Sidebar\n- Scrollable Content Area", yOffset = -150, xOffset = 280 })

            -- Adjust content height
            panel.content:SetHeight(math.abs(-480 - 200) + 50)
        end,

        -- -- [ TAB 2: HEADER ] ---------------------------------------------------
        -- function(panel)
        --     ctx:createHeader({ parent = panel.content, text = "Header Example", yOffset = -20 })
        --     ctx:createLabel({ parent = panel.content, text = "createHeader", yOffset = -20, xOffset = 300, color = {1,0,0,1} })
        --     showComponentColors(panel, { {key="gold", usage="Title Text Color"} })
        -- end,

        -- -- [ TAB 3: LABEL ] ----------------------------------------------------
        -- function(panel)
        --     ctx:createLabel({ parent = panel.content, text = "Standard Text Label", yOffset = -20 })
        --     ctx:createLabel({ parent = panel.content, text = "createLabel", yOffset = -20, xOffset = 300, color = {1,0,0,1} })
        --     showComponentColors(panel, { {key="textLight", usage="Standard Text Color"} })
        -- end,

        -- -- [ TAB 4: CHECKBOX ] -------------------------------------------------
        -- function(panel)
        --     ctx:createCheckbox({ parent = panel.content, text = "Checkbox Element", yOffset = -30, getter = function() return mockDB.check end, setter = function(v) mockDB.check = v end })
        --     ctx:createLabel({ parent = panel.content, text = "createCheckbox", yOffset = -30, xOffset = 300, color = {1,0,0,1} })
        --     showComponentColors(panel, { {key="primary", usage="Checkmark & Hover Border"}, {key="surfaceLight", usage="Box BG"}, {key="textLight", usage="Label"} })
        -- end,

        -- -- [ TAB 5: SLIDER ] ---------------------------------------------------
        -- function(panel)
        --     ctx:createSlider({ parent = panel.content, text = "Slider Element", yOffset = -20, minVal = 0, maxVal = 100, step = 1, getter = function() return mockDB.slider end, setter = function(v) mockDB.slider = v end })
        --     ctx:createLabel({ parent = panel.content, text = "createSlider", yOffset = -44, xOffset = 300, color = {1,0,0,1} })
        --     showComponentColors(panel, { {key="primary", usage="Thumb Handle"}, {key="surfaceLight", usage="Track BG"} })
        -- end,

        -- -- [ TAB 6: STEPPER ] --------------------------------------------------
        -- function(panel)
        --     ctx:createStepper({ parent = panel.content, text = "Stepper Element", yOffset = -20, minVal = 0, maxVal = 10, step = 1, getter = function() return mockDB.stepper end, setter = function(v) mockDB.stepper = v end })
        --     ctx:createLabel({ parent = panel.content, text = "createStepper", yOffset = -20, xOffset = 300, color = {1,0,0,1} })
        --     showComponentColors(panel, { {key="surfaceLight", usage="Button BG"}, {key="blackDetail", usage="Button Borders"} })
        -- end,

        -- -- [ TAB 7: DROPDOWN ] -------------------------------------------------
        -- function(panel)
        --     ctx:createDropdown({ parent = panel.content, text = "Dropdown Element", yOffset = -20, options = { {label="Choice 1", value="opt1"}, {label="Choice 2", value="opt2"} }, getter = function() return mockDB.dropdown end, setter = function(v) mockDB.dropdown = v end })
        --     ctx:createLabel({ parent = panel.content, text = "createDropdown", yOffset = -24, xOffset = 300, color = {1,0,0,1} })
        --     showComponentColors(panel, { {key="surfaceDark", usage="List BG"}, {key="surfaceLight", usage="List Border"} })
        -- end,

        -- -- [ TAB 8: INPUT FIELD ] ----------------------------------------------
        -- function(panel)
        --     ctx:createInput({ parent = panel.content, text = "Input Field", yOffset = -20, onEnterPressed = function(v) end })
        --     ctx:createLabel({ parent = panel.content, text = "createInput", yOffset = -24, xOffset = 300, color = {1,0,0,1} })
        --     showComponentColors(panel, { {key="primary", usage="Focus Border"}, {key="surfaceDark", usage="Focus BG"} })
        -- end,

        -- -- [ TAB 9: BUTTON ] ---------------------------------------------------
        -- function(panel)
        --     ctx:createButton({ parent = panel.content, text = "Standard Button", yOffset = -20, onClick = function() end })
        --     ctx:createLabel({ parent = panel.content, text = "createButton", yOffset = -20, xOffset = 300, color = {1,0,0,1} })
        --     showComponentColors(panel, { {key="primary", usage="Hover BG"}, {key="surfaceLight", usage="Default BG"} })
        -- end,

        -- -- [ TAB 10: CLOSE BUTTON ] --------------------------------------------
        -- function(panel)
        --     local b = ctx:createCloseButton(panel.content, function() end) b:SetPoint("TOPLEFT", 20, -20)
        --     ctx:createLabel({ parent = panel.content, text = "createCloseButton", yOffset = -20, xOffset = 300, color = {1,0,0,1} })
        --     showComponentColors(panel, { {key="error", usage="Hover BG (Red)"}, {key="surfaceLight", usage="Default BG"} })
        -- end,

        -- -- [ TAB 11: STEP BUTTON ] ---------------------------------------------
        -- function(panel)
        --     local b = ctx:createStepButton({ parent = panel.content, symbol = "+", size = 30, onClick = function() end }) b:SetPoint("TOPLEFT", 20, -20)
        --     ctx:createLabel({ parent = panel.content, text = "createStepButton", yOffset = -25, xOffset = 300, color = {1,0,0,1} })
        --     showComponentColors(panel, { {key="surfaceLight", usage="Button BG"}, {key="blackDetail", usage="Border"} })
        -- end,

        -- -- [ TAB 12: COLOR PICKER ] --------------------------------------------
        -- function(panel)
        --     ctx:createColorPicker({ parent = panel.content, text = "Color Picker", yOffset = -20, getter = function() return unpack(mockDB.color) end, setter = function(r,g,b,a) end })
        --     ctx:createLabel({ parent = panel.content, text = "createColorPicker", yOffset = -20, xOffset = 300, color = {1,0,0,1} })
        --     showComponentColors(panel, { {key="whiteDetail", usage="Box Border"} })
        -- end,

        -- -- [ TAB 13: SCROLL PANEL ] --------------------------------------------
        -- function(panel)
        --     ctx:createHeader({ parent = panel.content, text = "Scroll Panel Demo", yOffset = -20 })
        --     ctx:createLabel({ parent = panel.content, text = "Every tab uses a scroll panel for content.", yOffset = -50 })
        --     ctx:createLabel({ parent = panel.content, text = "createScrollPanel", yOffset = -20, xOffset = 300, color = {1,0,0,1} })
        --     showComponentColors(panel, { {key="surfaceLight", usage="Scroll Thumb Color"} })
        -- end,

        -- -- [ TAB 14: TABBED UI ] -----------------------------------------------
        -- function(panel)
        --     local sub = CreateFrame("Frame", nil, panel.content, "BackdropTemplate") sub:SetSize(300, 100) sub:SetPoint("TOPLEFT", 10, -20)
        --     sub:SetBackdrop({ bgFile = styles.files.bgFile, edgeFile = styles.files.edgeFile, edgeSize = 1 })
        --     ctx:createTabbedInterface(sub, {"Tab A", "Tab B"}, { function(p) end, function(p) end }, 1)
        --     ctx:createLabel({ parent = panel.content, text = "createTabbedInterface", yOffset = -20, xOffset = 320, color = {1,0,0,1} })
        --     showComponentColors(panel, { {key="sidebarAccent", usage="Selection Bar"}, {key="sidebarActive", usage="Active BG"} })
        -- end,

        -- -- [ TAB 15: LAYOUT MODEL ] --------------------------------------------
        -- function(panel)
        --     local model = ctx:createLayoutModel(panel.content, -20)
        --     model:addHeader("Auto Layout Model")
        --     model:addLabel("Elements added via LayoutModel auto-calculate Y offsets.")
        --     model:addCheckbox("Enabled", function() return true end, function() end)
        --     ctx:createLabel({ parent = panel.content, text = "createLayoutModel", yOffset = -20, xOffset = 350, color = {1,0,0,1} })
        --     showComponentColors(panel, { {key="primary", usage="Applied to all added widgets"} })
        -- end,

        -- -- [ TAB 16: UX UTILS ] ------------------------------------------------
        -- function(panel)
        --     ctx:createHeader({ parent = panel.content, text = "UX Utilities", yOffset = -20 })
        --     ctx:createLabel({ parent = panel.content, text = "Interactive elements showing UX utility helpers.", yOffset = -50 })

        --     -- 1. Tooltip Demo
        --     local tooltipLabel = ctx:createLabel({ parent = panel.content, text = "Hover over me to see a Premium Tooltip", yOffset = -90, color = {1, 1, 1, 1} })
        --     if AscensionUI.UX then
        --         AscensionUI.UX:attachTooltip(tooltipLabel, "Premium Tooltip", "This is a custom, 100% opaque tooltip with larger fonts generated by AscensionUI.UX:attachTooltip().")
        --     end

        --     -- 2. Context Menu Demo
        --     local menuBtn = ctx:createButton({ parent = panel.content, text = "Right/Left Click Me", yOffset = -130, onClick = function()
        --         if AscensionUI.UX then
        --             local options = {
        --                 { text = "Action 1", func = function() print("Action 1 clicked") end },
        --                 { text = "Action 2", func = function() print("Action 2 clicked") end },
        --                 { text = "Disabled Action", func = function() end, disabled = true }
        --             }
        --             AscensionUI.UX:showContextMenu(menuBtn, options)
        --         end
        --     end })
            
        --     ctx:createLabel({ parent = panel.content, text = "attachTooltip / showContextMenu", yOffset = -135, xOffset = 180, color = {1,0,0,1} })

        --     showComponentColors(panel, { {key="surfaceDark", usage="Menu Background"}, {key="surfaceLight", usage="Menu Border & Hover"} })
        -- end,

        -- -- [ TAB 17: INTEGRATION & STORAGE ] -----------------------------------
        -- function(panel)
        --     ctx:createHeader({ parent = panel.content, text = "Addon Integration", yOffset = -20 })
        --     ctx:createLabel({ parent = panel.content, text = "Methods for system-level integration and data persistence.", yOffset = -50 })

        --     -- 1. Blizzard Panel
        --     ctx:createLabel({ parent = panel.content, text = "registerBlizzardPanel", yOffset = -90, color = {1, 0.8, 0.2, 1} })
        --     ctx:createLabel({ parent = panel.content, text = "Registers your addon in Game Menu -> Options -> AddOns.\nThis creates a bridge to open your custom high-performance UI.", yOffset = -110 })

        --     -- 2. Position Storage
        --     ctx:createLabel({ parent = panel.content, text = "initPositionStorage", yOffset = -160, color = {1, 0.8, 0.2, 1} })
        --     ctx:createLabel({ parent = panel.content, text = "Standardizes how frame positions are saved in the global namespace.", yOffset = -180 })
            
        --     -- Mock Position Data Table Preview
        --     local mu = CreateFrame("Frame", nil, panel.content, "BackdropTemplate")
        --     mu:SetSize(280, 80)
        --     mu:SetPoint("TOPLEFT", 20, -210)
        --     mu:SetBackdrop({ bgFile = styles.files.bgFile, edgeFile = styles.files.edgeFile, edgeSize = 1 })
        --     mu:SetBackdropColor(0,0,0,0.6) mu:SetBackdropBorderColor(unpack(styles.colors.surfaceLight))
            
        --     ctx:createLabel({ parent = mu, text = "_G.AscensionUIPositions = {", yOffset = -10, xOffset = 10, color = {0.6, 0.6, 1, 1} })
        --     ctx:createLabel({ parent = mu, text = "  ['MyAddon'] = { point = 'CENTER', x = 0, y = 0 }", yOffset = -30, xOffset = 10, color = {0.8, 0.8, 0.8, 1} })
        --     ctx:createLabel({ parent = mu, text = "}", yOffset = -50, xOffset = 10, color = {0.6, 0.6, 1, 1} })

        --     showComponentColors(panel, { {key="gold", usage="Method Highlighting"}, {key="surfaceLight", usage="Code Box Border"} })
        -- end,

        -- [ TAB 18: CONTEXT MENU ] --------------------------------------------
        

        -- [ TAB 19: FULL PALETTE ] --------------------------------------------
        function(panel)
            local py = -20
            ctx:createHeader({ parent = panel.content, text = "Used Colors", yOffset = py })
            py = py - 40
            local usedKeys = { 
                "mainBackground",
                "surfaceDark",
                "surfaceLight",
                "surfaceHover",
                "primary",
                "primaryAlpha",
                "sidebarAccent",
                "sidebarActive",
                "sidebarHover",
                "redDetail",
                "blackDetail",
                "gold",
                "textLight"
            }
            for _, k in ipairs(usedKeys) do
                local color = styles.colors[k]
                if color then
                    local sw = CreateFrame("Frame", nil, panel.content) sw:SetSize(18, 18) sw:SetPoint("TOPLEFT", 20, py)
                    local tx = sw:CreateTexture(nil, "OVERLAY") tx:SetAllPoints() tx:SetColorTexture(unpack(color))
                    ctx:createLabel({ parent = panel.content, text = k, yOffset = py, xOffset = 50 })
                    local hex = string.format("#%02X%02X%02X%02X", color[1]*255, color[2]*255, color[3]*255, (color[4] or 1)*255)
                    ctx:createLabel({ parent = panel.content, text = hex, yOffset = py, xOffset = 300, color = {0.7, 0.7, 0.7, 1} })
                else
                    ctx:createLabel({ parent = panel.content, text = k .. " (MISSING)", yOffset = py, xOffset = 50, color = {1, 0, 0, 1} })
                end
                py = py - 24
            end
            panel.content:SetHeight(math.abs(py) + 50)
        end
    }

    -- Main Gallery Frame
    local frame = ctx:createMainFrame({
        name     = "AscensionSuitMockFrame",
        title    = "AscensionSuit Component Gallery",
        tabNames = tabNames,
        tabFuncs = tabFuncs,
        width    = 850,
        height   = 650
    })

    -- Sidebar Palette
    CreatePaletteFrame(frame)
    frame:Show()
end

-------------------------------------------------------------------------------
-- 6. SLASH COMMANDS
-------------------------------------------------------------------------------
-- /mockui: Toggles the main component gallery
-- SLASH_MOCKUI1 = "/mockui"
-- SlashCmdList["MOCKUI"] = function()
--     if AscensionSuitMockFrame and AscensionSuitMockFrame:IsShown() then
--         AscensionSuitMockFrame:Hide()
--     else
--         CreateMockUI()
--     end
-- end

-- -- /palette: Opens the standalone color palette
-- SLASH_ASPALETTE1 = "/palette"
-- SlashCmdList["ASPALETTE"] = function()
--     if AscensionSuitPaletteFrame and not AscensionSuitPaletteFrame:GetParent() then
--         AscensionSuitPaletteFrame:SetShown(not AscensionSuitPaletteFrame:IsShown())
--     else
--         if AscensionSuitPaletteFrame then AscensionSuitPaletteFrame:Hide() end
--         local p = CreatePaletteFrame(nil)
--         p:Show()
--     end
-- end
