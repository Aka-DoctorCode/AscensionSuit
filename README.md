# **Ascension Suit**

***

Is the main hub for my add ons. This will help the add ons communicate between them if they need to share any information.

The main reason for this add on is to the libraries for my add ons in just one place that why they all fall under it. That way less space is use for the same thing on your machines.

I am now working on transforming this add on also on library for the UI styles that all my other add ons will be using.

More coming soon...

***

Es el centro principal de mis complementos. Esto ayudará a que los complementos se comuniquen entre sí si necesitan compartir información.

La razón principal de este complemento es reunir las bibliotecas de mis complementos en un solo lugar, por lo que todos se incluyen en él. De esta forma, se utiliza menos espacio para lo mismo en tus equipos.

Ahora estoy trabajando en transformar este complemento para que sea una biblioteca para los estilos de UI que todos mis otros complementos utilizaran.

Próximamente más información...

***


# Ascension Suit

**Shared UI/UX Library for World of Warcraft Addons**

Ascension Suit centralises common widget creation, styling, and user‑experience helpers so that multiple addons can reuse the same code, saving memory and ensuring a consistent look.  
It is built on **LibStub** and provides a complete design system, factory methods for all standard UI controls, an automatic layout model, and a collection of UX utilities.

---

## Table of Contents

1. [Installation](#installation)
2. [Getting Started](#getting-started)
3. [Design System (Styles)](#design-system-styles)
   - [Colors](#colors)
   - [Files](#files)
   - [Dimensions](#dimensions)
   - [Fonts](#fonts)
   - [Textures](#textures)
4. [UI Factory Components](#ui-factory-components)
   - [createHeader](#createheader)
   - [createLabel](#createlabel)
   - [createStepButton](#createstepbutton)
   - [createCheckbox](#createcheckbox)
   - [createSlider](#createslider)
   - [createStepper](#createstepper)
   - [createColorPicker](#createcolorpicker)
   - [createDropdown](#createdropdown)
   - [createScrollPanel](#createscrollpanel)
   - [createInput](#createinput)
   - [createButton](#createbutton)
   - [createCloseButton](#createclosebutton)
   - [createTabbedInterface](#createtabbedinterface)
   - [createMainFrame](#createmainframe)
5. [Layout Model](#layout-model)
   - [Obtaining a Layout Model](#obtaining-a-layout-model)
   - [Methods](#methods)
   - [Sections](#sections)
   - [Manual Positioning Note](#manual-positioning-note)
6. [UX Utilities](#ux-utilities)
7. [Blizzard Options Integration](#blizzard-options-integration)
8. [Full Example: Settings Window](#full-example-settings-window)
9. [Dependencies and Load Order](#dependencies-and-load-order)
10. [Additional Notes](#additional-notes)

---

## Installation

1. Place the `AscensionSuit` folder inside your `World of Warcraft\_retail_\Interface\AddOns\` directory.
2. The library will be available to any addon that loads `LibStub` and requests `"AscensionSuit-UI"`.

> **Note:** The `.toc` file also loads several Ace3 libraries. They are bundled for convenience but **are not required** by the UI library itself.

---

## Getting Started

Retrieve the library and create a UI **Context**. The context holds all styling information (pulled directly from the library's global defaults) and provides methods to build interface elements.

lua
local lib = LibStub:GetLibrary("AscensionSuit-UI")
if not lib then return end

-- Create a context (automatically inherits global DefaultStyles)
local ctx = lib:CreateContext()


Every UI component is created by calling a method on this context (e.g. `ctx:createHeader(...)`). Most methods return two values: the created frame and the next available vertical offset (`widget, nextY`), allowing you to chain elements manually.

---

## Design System (Styles)

The entire visual appearance is controlled by a table of design tokens stored in `ctx.styles`.  
The default values (defined in `Context.lua`) are shown below. Pass a partial table to `CreateContext` to override only what you need.

### Colors
All colour values are RGBA arrays with values between `0` and `1`.

| Key              | Default                             | Description                     |
| ---------------- | ----------------------------------- | ------------------------------- |
| `primary`        | `{ 0.300, 0.000, 0.400, 1.0 }`    | Main accent colour (Purple)     |
| `purple`         | `{ 0.400, 0.075, 0.925, 1.0 }`    | Bright purple detail            |
| `gold`           | `{ 1.000, 0.800, 0.200, 1.0 }`    | Header / highlight colour       |
| `backgroundDark` | `{ 0.020, 0.020, 0.031, 0.95 }`    | Deep background                 |
| `surfaceDark`    | `{ 0.047, 0.039, 0.082, 1.0 }`    | Panel / section background      |
| `surfaceHighlight`| `{ 0.165, 0.141, 0.239, 1.0 }`    | Hover and border highlight      |
| `blackDetail`    | `{ 0.0, 0.0, 0.0, 1.0 }`          | Solid black borders             |
| `whiteDetail`    | `{ 1.0, 1.0, 1.0, 1.0 }`          | Pure white accents              |
| `textLight`      | `{ 0.886, 0.910, 0.941, 1.0 }`    | Primary text                    |
| `textDim`        | `{ 0.580, 0.640, 0.720, 1.0 }`    | Secondary / dimmed text         |
| `sidebarBg`      | `{ 0.10, 0.10, 0.10, 0.95 }`      | Sidebar background              |
| `sidebarHover`   | `{ 0.20, 0.20, 0.20, 0.5 }`       | Sidebar tab hover               |
| `sidebarAccent`  | `{ 0.00, 0.48, 1.00, 0.95 }`      | Sidebar accent                  |
| `sidebarActive`  | `{ 0.00, 0.40, 1.00, 0.2 }`       | Active tab background           |
| `success`        | `{ 0.062, 0.725, 0.505, 1.0 }`    | Success / Positive action       |
| `warning`        | `{ 0.960, 0.619, 0.043, 1.0 }`    | Warning / Caution               |
| `error`          | `{ 0.937, 0.266, 0.266, 1.0 }`    | Error / Negative action         |

### Files
Texture paths used for backdrops and edges.

| Key       | Default                                                                 |
| --------- | ----------------------------------------------------------------------- |
| `bgFile`  | `"Interface\\ChatFrame\\ChatFrameBackground"`                           |
| `edgeFile`| `"Interface\\Tooltips\\UI-Tooltip-Border"`                              |
| `arrow`   | `"Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Up"`                |

### Dimensions
All sizes are in pixels (px).

| Key                  | Default | Used by                         |
| -------------------- | ------- | ------------------------------- |
| `sidebarWidth`       | 160     | Tabbed interface                |
| `sidebarAccentWidth` | 3       | Tab accent line                 |
| `contentPadding`     | 16      | Horizontal margin for content   |
| `checkboxSize`       | 28      | Checkbox box size               |
| `checkboxSpacing`    | 36      | Vertical space after checkbox   |
| `sliderWidth`        | 160     | Slider track width              |
| `dropdownWidth`      | 160     | Dropdown button width           |
| `dropdownHeight`     | 44      | Total dropdown frame height     |
| `tabWidth`           | 144     | Sidebar tab width               |
| `tabHeight`          | 30      | Sidebar tab height              |
| `tabSpacing`         | 6       | Gap between tabs                |
| `editBoxHeight`      | 28      | EditBox / step button height    |
| `colorPickerSize`    | 22      | Colour picker button size       |
| `colorPickerSpacing` | 28      | Vertical space after colour picker|
| `headerSpacing`      | 32      | Gap between headers             |
| `labelSpacing`       | 16      | Vertical space after label      |
| `sliderSpacing`      | 64      | Vertical space for slider block |
| `titleTop`           | -16     | Page title top offset           |
| `titleLeft`          | 16      | Page title left offset          |
| `backdropEdgeSize`   | 8       | Border thickness                |

### Fonts
Standard WoW font objects used by the components.

| Key     | Default Object Name          |
| ------- | ---------------------------- |
| `header`| `"GameFontNormalHuge"`       |
| `label` | `"GameFontHighlightLarge"`   |
| `desc`  | `"GameFontHighlightMedium"`  |

### Textures
| Key    | Default                                                |
| ------ | ------------------------------------------------------ |
| `bar`  | `"Interface\\Buttons\\WHITE8X8"`                       |
| `spark`| `"Interface\\CastingBar\\UI-CastingBar-Spark"`         |

---

## UI Factory Components

All methods are called on a **Context** instance. They return `(createdFrame, nextY)` where `nextY` is the new vertical position for the next element.

### `createHeader`
Creates a large, stylised header text.

**Parameters** (table `args`):

| Parameter | Type    | Required | Default                      | Description                                       |
| --------- | ------- | -------- | ---------------------------- | ------------------------------------------------- |
| `parent`  | Frame   | Yes      | –                            | Parent frame                                      |
| `text`    | string  | Yes      | –                            | Header text                                       |
| `yOffset` | number  | Yes      | –                            | Vertical anchor offset (negative from top)        |
| `color`   | table   | No       | `styles.colors.gold`         | Text colour `{r,g,b,a}`                           |
| `leftPadding`| number| No      | `styles.dimensions.contentPadding` | Left margin                               |

**Returns**: `fontString, nextY` – the created font string and the Y offset after the header (header height + 8px gap).

---

### `createLabel`
Creates a simple text label.

**Parameters**:

| Parameter     | Type   | Required | Default                          | Description                                    |
| ------------- | ------ | -------- | -------------------------------- | ---------------------------------------------- |
| `parent`      | Frame  | Yes      | –                                | Parent frame                                   |
| `text`        | string | Yes      | –                                | Label text                                     |
| `yOffset`     | number | Yes      | –                                | Vertical offset                                |
| `xOffset`     | number | No       | `styles.dimensions.contentPadding` | Horizontal left offset                         |
| `anchorFrame` | Frame  | No       | `parent`                         | Frame to anchor to                             |
| `color`       | table  | No       | `styles.colors.textLight`        | Text colour `{r,g,b,a}`                        |

**Returns**: `fontString, nextY` – the label and `yOffset - labelSpacing` (default 16).

---

### `createStepButton`
Tiny button used by sliders and steppers (can be used standalone). Shows a "+" or "–" symbol.

**Parameters**:

| Parameter | Type     | Required | Default           | Description                                |
| --------- | -------- | -------- | ----------------- | ------------------------------------------ |
| `parent`  | Frame    | Yes      | –                 | Parent frame                               |
| `symbol`  | string   | Yes      | –                 | `"+"` or `"-"`                             |
| `size`    | number   | Yes      | –                 | Button width and height (square)           |
| `onClick` | function | Yes      | –                 | Callback on click (also called on hold)    |
| `styles`  | table    | No       | `ctx.styles`      | Style table to use (defaults to context)   |

The button includes press‑and‑hold repeat functionality.

**Returns**: `button` – the created `Button` frame. (No `nextY` returned – it is not part of the flow.)

---

### `createCheckbox`
A labled checkbox with integrated tooltip support.

**Parameters**:

| Parameter | Type     | Required | Default                          | Description                                      |
| --------- | -------- | -------- | -------------------------------- | ------------------------------------------------ |
| `parent`  | Frame    | Yes      | –                                | Parent frame                                     |
| `text`    | string   | No       | `""`                             | Label text                                       |
| `tooltip` | string   | No       | `nil`                            | Tooltip text (requires `lib.UX`)                 |
| `getter`  | function | No       | `nil`                            | Must return `true`/`false` for initial state     |
| `setter`  | function | No       | `nil`                            | Called with `true`/`false` on click              |
| `yOffset` | number   | No       | `-16`                            | Vertical offset                                  |
| `xOffset` | number   | No       | `styles.dimensions.contentPadding` | Left margin                                   |

**Returns**: `checkButton, nextY` – the checkbox and `yOffset - checkboxSpacing` (default 40).

---

### `createSlider`
Premium slider with an edit box, plus/minus step buttons, a label, and dynamic step precision formatting.

**Parameters**:

| Parameter | Type     | Required | Default                          | Description                                      |
| --------- | -------- | -------- | -------------------------------- | ------------------------------------------------ |
| `parent`  | Frame    | Yes      | –                                | Parent frame                                     |
| `text`    | string   | No       | `""`                             | Label text above slider                          |
| `minVal`  | number   | No       | `0`                              | Minimum value                                    |
| `maxVal`  | number   | No       | `100`                            | Maximum value                                    |
| `step`    | number   | No       | `1`                              | Increment step                                   |
| `getter`  | function | No       | `nil`                            | Returns current value                            |
| `setter`  | function | No       | `nil`                            | Called with new value on mouse up                |
| `tooltip` | string   | No       | `nil`                            | Tooltip text                                     |
| `width`   | number   | No       | `styles.dimensions.sliderWidth`  | Slider width                                     |
| `yOffset` | number   | No       | `-16`                            | Vertical offset                                  |
| `xOffset` | number   | No       | `styles.dimensions.contentPadding` | Left margin                                   |

**Returns**: `sliderFrame, nextY` – the container frame holding the slider and its integrated **Stepper** (EditBox + step buttons), and the calculated next Y position (`yOffset - 85`).

---

### `createStepper`
A numeric input with a label, edit box, +/- buttons, and dynamic step precision formatting. No slider track.

**Parameters**:

| Parameter | Type     | Required | Default                          | Description                                      |
| --------- | -------- | -------- | -------------------------------- | ------------------------------------------------ |
| `parent`  | Frame    | Yes      | –                                | Parent frame                                     |
| `text`    | string   | No       | `""`                             | Label text                                       |
| `minVal`  | number   | No       | `0`                              | Minimum value                                    |
| `maxVal`  | number   | No       | `100`                            | Maximum value                                    |
| `step`    | number   | No       | `1`                              | Increment step                                   |
| `getter`  | function | No       | `nil`                            | Returns current value                            |
| `setter`  | function | No       | `nil`                            | Called with new value after change               |
| `tooltip` | string   | No       | `nil`                            | Tooltip text                                     |
| `width`   | number   | No       | `120`                            | Controls frame width                             |
| `yOffset` | number   | No       | `0`                              | Vertical offset                                  |
| `xOffset` | number   | No       | `styles.dimensions.contentPadding` | Left margin                                   |

**Returns**: `controlsFrame, nextY` – the frame containing the edit box and buttons, and the next Y offset.

---

### `createColorPicker`
A small button that displays the current colour and opens the standard Blizzard colour picker.

**Parameters**:

| Parameter | Type     | Required | Default                          | Description                                      |
| --------- | -------- | -------- | -------------------------------- | ------------------------------------------------ |
| `parent`  | Frame    | Yes      | –                                | Parent frame                                     |
| `text`    | string   | No       | `""`                             | Label text beside the swatch                     |
| `getter`  | function | No       | `nil`                            | Returns `r, g, b, a` (alpha optional)            |
| `setter`  | function | No       | `nil`                            | Called with `r, g, b, a` after selection         |
| `tooltip` | string   | No       | `nil`                            | Tooltip text                                     |
| `yOffset` | number   | No       | `0`                              | Vertical offset                                  |
| `xOffset` | number   | No       | `styles.dimensions.contentPadding` | Left margin                                   |
| `hasAlpha`| boolean  | No       | `false`                          | Enable opacity/alpha slider in colour picker     |

**Returns**: `button, nextY` – the colour swatch button and next Y (`yOffset - colorPickerSpacing`, default 32).

---

### `createDropdown`
A dropdown list with a click‑to‑open menu. Automatically closes when clicking outside (uses a global blocker).

**Parameters**:

| Parameter | Type     | Required | Default                          | Description                                      |
| --------- | -------- | -------- | -------------------------------- | ------------------------------------------------ |
| `parent`  | Frame    | Yes      | –                                | Parent frame                                     |
| `text`    | string   | No       | `""`                             | Label text                                       |
| `options` | table    | No       | `{}`                             | Array of `{ label = "string", value = any }`     |
| `getter`  | function | No       | `nil`                            | Returns current selected value                   |
| `setter`  | function | No       | `nil`                            | Called with the new value                        |
| `width`   | number   | No       | `styles.dimensions.dropdownWidth`| Dropdown button width                            |
| `yOffset` | number   | No       | `0`                              | Vertical offset                                  |
| `xOffset` | number   | No       | `styles.dimensions.contentPadding` | Left margin                                   |
| `tooltip` | string   | No       | `nil`                            | Tooltip text                                     |

**Returns**: `frame, nextY` – the container frame (label + dropdown button) and next Y offset.

---

### `createScrollPanel`
Creates a `ScrollFrame` with a customised scrollbar. The returned `content` frame is where you place child elements.

**Parameters**:

| Parameter | Type  | Required | Default | Description     |
| --------- | ----- | -------- | ------- | --------------- |
| `parent`  | Frame | Yes      | –       | Parent frame    |

**Returns**: `scrollFrame, contentFrame` – the scrollable frame and its inner content area. Set the content’s height when needed.

---

### `createInput`
An edit box with a label. Automatically triggers the enter callback when focus is lost (clicking away).

**Parameters**:

| Parameter        | Type     | Required | Default                          | Description                                      |
| ---------------- | -------- | -------- | -------------------------------- | ------------------------------------------------ |
| `parent`         | Frame    | Yes      | –                                | Parent frame                                     |
| `text`           | string   | No       | `""`                             | Label text                                       |
| `tooltip`        | string   | No       | `nil`                            | Tooltip text                                     |
| `onEnterPressed` | function | No       | `nil`                            | Called with the editbox text when Enter is pressed|
| `width`          | number   | No       | `200`                            | Input frame width                                |
| `yOffset`        | number   | No       | `0`                              | Vertical offset                                  |
| `xOffset`        | number   | No       | `styles.dimensions.contentPadding` | Left margin                                   |

**Returns**: `frame, nextY` – the container frame (label + editbox) and next Y offset (current Y – 50).

---

### `createButton`
A standard clickable button with hover and press effects.

**Parameters**:

| Parameter | Type     | Required | Default                          | Description                                      |
| --------- | -------- | -------- | -------------------------------- | ------------------------------------------------ |
| `parent`  | Frame    | Yes      | –                                | Parent frame                                     |
| `text`    | string   | No       | `""`                             | Button text                                      |
| `onClick` | function | No       | `nil`                            | Click callback                                   |
| `tooltip` | string   | No       | `nil`                            | Tooltip text                                     |
| `width`   | number   | No       | `120`                            | Button width                                     |
| `height`  | number   | No       | `28`                             | Button height                                    |
| `yOffset` | number   | No       | `0`                              | Vertical offset                                  |
| `xOffset` | number   | No       | `styles.dimensions.contentPadding` | Left margin                                   |

**Returns**: `button, nextY` – the button and next Y (`yOffset - height - 10`).

---

### `createCloseButton`
A small 24×24 button with an X symbol. Turns red on hover.

**Parameters**:

| Parameter | Type     | Required | Default | Description                        |
| --------- | -------- | -------- | ------- | ---------------------------------- |
| `parent`  | Frame    | Yes      | –       | Parent frame                       |
| `onClick` | function | No       | `nil`   | Called when clicked (e.g. hide frame)|

**Returns**: `button` – the close button. No `nextY` returned.

---

### `createTabbedInterface`
Builds a complete configuration window with a sidebar and tab panels. Each panel is a full‑size content area with a built‑in scroll frame.

**Parameters**:

| Parameter       | Type     | Required | Default | Description                                                                 |
| --------------- | -------- | -------- | ------- | --------------------------------------------------------------------------- |
| `parent`        | Frame    | Yes      | –       | Container frame (usually the main window)                                   |
| `tabNames`      | table    | Yes      | –       | Array of strings for tab labels                                             |
| `buildFuncs`    | table    | Yes      | –       | Array of functions, one per tab. Each receives the **panel frame** as argument. |
| `initialIndex`  | number   | No       | `1`     | Which tab to show by default                                                |

The **panel frame** provided to each `buildFunc` has two important sub‑frames:
- `panel.scrollFrame` – the scrollable container.
- `panel.content` – the inner frame where you should place your widgets.

**Returns**: `tabInterface` – a table with:
- `panels` – array of panel frames.
- `selectTab(index)` – function to switch tabs.
- `getActiveTab()` – returns the current active index.

---

### `createMainFrame`
Creates a standardized main application window for the suite. This method encapsulates the frame creation, styling, UX behaviors (movable, resizable, ESC-to-close), title header, close button, and tabbed sidebar navigation into a single call.

**Parameters** (table `options`):

| Parameter    | Type    | Required | Default              | Description                                  |
| ------------ | ------- | -------- | -------------------- | -------------------------------------------- |
| `name`       | string  | Yes      | –                    | Global name for the frame (e.g. "MyAddonFrame")|
| `title`      | string  | No       | "Ascension Window"   | Header text shown at top-left                |
| `width`      | number  | No       | 850                  | Default window width                         |
| `height`     | number  | No       | 500                  | Default window height                        |
| `tabNames`   | table   | Yes      | –                    | Array of strings for sidebar tab labels      |
| `tabFuncs`   | table   | Yes      | –                    | Array of functions to build each tab         |
| `initialTab` | number  | No       | 1                    | Which tab to show on first open              |

**Returns**: `frame` – the created main window frame. You can access the tabbed UI via `frame.tabbedUI`.

---

## Layout Model

The **Layout Model** automatically tracks the vertical position (`yOffset`) as you add elements, eliminating the need for manual `nextY` calculations.  
A pre‑created instance is available directly on the context.

### Obtaining a Layout Model

lua
-- Use the context’s built-in model (recommended)
local layout = ctx.layoutModel

-- Or create a new one manually
local layout = lib.LayoutModel:new(ctx, startY)  -- startY is optional, defaults to -15


Point it to a parent frame and set the starting Y offset:

lua
layout:reset(myFrame, -20)  -- first element will be placed at y = -20 from the top


### Methods

Every method returns the created widget(s) and updates the internal cursor automatically.

| Method         | Description                                                                                      |
| -------------- | ------------------------------------------------------------------------------------------------ |
| `header(text)` | Adds a header using `createHeader`. Requires only `text`.                                        |
| `label(text, xOffset, color)` | Adds a label. Optional `xOffset` and `color`.                                      |
| `checkbox(text, tooltip, getter, setter, xOffset)` | Adds a checkbox. See `createCheckbox` for parameters.                     |
| `slider(text, tooltip, min, max, step, getter, setter, width, xOffset)` | Adds a slider.                   |
| `stepper(text, tooltip, min, max, step, getter, setter, width, xOffset)` | Adds a stepper.                 |
| `colorPicker(text, tooltip, getter, setter, xOffset, hasAlpha)` | Adds a colour picker.                    |
| `dropdown(text, tooltip, options, getter, setter, width, xOffset)` | Adds a dropdown.                      |
| `input(text, tooltip, width, xOffset, onEnterPressed)` | Adds an input field.                                   |
| `button(text, tooltip, width, height, xOffset, onClick)` | Adds a button.                                     |
| `beginSection(xOffset, width)` | Starts a bordered section. Elements added afterward belong to this section. |
| `endSection()` | Ends the current section, automatically sets the section height.                                |

The first argument (`elementID`) shown in some earlier documentation is **not required** – these methods accept the parameters listed above. (Internally, the first argument is ignored for most methods, but you can safely pass `nil` or a string as seen in examples.)

### Advanced Columns (Parallel Grids)

The `LayoutModel` now supports parallel columns. Elements added inside a column will automatically respect the column's width and offset.

lua
layout:beginColumn(10, 200) -- Offset 10, Width 200
    layout:header("Column 1")
    layout:checkbox("Option 1", nil, getter, setter)
layout:endColumn()

layout:beginColumn(220, 200) -- Offset 220, Width 200
    layout:header("Column 2")
    layout:slider("Slider 1", nil, 0, 100, 1, getter, setter)
layout:endColumn()

-- Finalize aligns the cursor to the bottom of the deepest column
-- and optionally resizes the content container.
layout:columnsFinalize(panel.content, 20)


### Sections

Group related controls inside a bordered box. Elements added inside a section respect the section's width.

lua
layout:beginSection(20, 360)    -- left offset and width
    layout:checkbox("Enable", "Tooltip", getter, setter)
    layout:slider("Scale", "Tooltip", 0.5, 2, 0.1, getter, setter)
layout:endSection()


After `endSection()`, the `y` cursor moves below the section with additional spacing.

### Manual Positioning Note

If you prefer to build the UI without the Layout Model, simply use the context factory methods directly and chain the returned `nextY`:

lua
local btn1, nextY = ctx:createButton({ parent = f, text = "One", yOffset = -20 })
local btn2, nextY = ctx:createButton({ parent = f, text = "Two", yOffset = nextY })


---

## UX Utilities

All utility functions are accessed via `lib.UX`. They are lightweight helpers for common interaction patterns.

### High-Level Helpers

| Method | Description |
| ------ | ----------- |
| `showContextMenu(parent, options, config)` | Shows a context menu at the cursor. If `config` is provided, it automatically adds **Lock/Unlock** and **Reset Position** buttons. |
| `attachTooltip(frame, title, description)` | Shows a premium **custom tooltip frame** (100% opaque, larger fonts) on mouse enter. Wraps existing OnEnter/OnLeave scripts. |
| `makeMovable(frame, config)` | Enables dragging with the left mouse button, saving/loading coordinates from a persistent config table. |
| `makeResizable(frame, minWidth, minHeight)` | Adds a resize grip at the bottom‑right corner. |
| `makeClosableWithEscape(frame)` | Hides the frame when Escape is pressed. |
| `registerClickOutside(frame, callback)` | Closes the frame when clicking elsewhere. |

### Manual Menu Building
If building custom context menus, you can use these helpers to add standard buttons:
- `UX:addLockButton(optionsTable, parent, config)`
- `UX:addResetPositionButton(optionsTable, parent, config)`
- `UX:addOptionsButton(optionsTable, onClick)`

---

## Global Helpers & Persistence

The library provides helpers for standardising position storage and themes.

lua
-- Initialize position storage for an addon module
local config = lib:initPositionStorage("MyAddon", { point = "CENTER", x = 0, y = 0 })

-- Update position table from a frame manually
lib:updatePositionFromFrame(myFrame, config)


---

Register a panel in the standard Interface → AddOns menu. The panel will display a message guiding users to your custom UI.

lua
lib.Integration:registerBlizzardPanel(
    "MyAddon",               -- Unique addon key
    "My Addon Settings",     -- Display name
    function()               -- Called when the "OPEN SETTINGS" button is clicked
        MyAddonConfigFrame:Show()
    end
)


---

## Full Example: Settings Window

A complete, working example that creates a movable, closable, resizable configuration window with two tabs.

lua
local lib = LibStub:GetLibrary("AscensionSuit-UI")
local ctx = lib:CreateContext()

-- 1. Define Tab Content Functions
local buildFuncs = {
    function(panel) -- General Tab
        local layout = lib.LayoutModel:new(ctx)
        layout:reset(panel.content, -15)
        layout:header("General Settings")
        layout:checkbox("Enable Addon", "Toggles the core functionality",
            function() return MyAddonDB.enabled end,
            function(v) MyAddonDB.enabled = v end
        )
        layout:slider("Master Scale", "Adjusts the UI scale", 0.5, 2, 0.05,
            function() return MyAddonDB.scale end,
            function(v) MyAddonDB.scale = v end
        )
    end,
    function(panel) -- Advanced Tab
        local layout = lib.LayoutModel:new(ctx)
        layout:reset(panel.content, -15)
        layout:header("Advanced Options")
        layout:dropdown("Theme", "Select a colour theme",
            { {label="Dark", value="dark"}, {label="Light", value="light"} },
            function() return MyAddonDB.theme end,
            function(v) MyAddonDB.theme = v end
        )
        layout:colorPicker("Accent", "Choose your brand colour",
            function() return MyAddonDB.accent[1], MyAddonDB.accent[2], MyAddonDB.accent[3], MyAddonDB.accent[4] end,
            function(r,g,b,a) MyAddonDB.accent = {r,g,b,a} end,
            nil, true  -- hasAlpha = true
        )
    end,
}

-- 2. Create the main frame with one call
local f = ctx:createMainFrame({
    name     = "MyAddonConfig",
    title    = "My Addon Configuration",
    tabNames = { "General", "Advanced" },
    tabFuncs = buildFuncs,
    width    = 600,
    height   = 450
})

-- 3. Show command
SLASH_MYADDON1 = "/myaddon"
SlashCmdList["MYADDON"] = function() f:Show() end


---

## Dependencies and Load Order

- **LibStub** must be loaded before any other file (it is included in the `.toc`).
- `AscensionSuit.lua` registers `"AscensionSuit-UI"` with LibStub and must be loaded before all UI/UX modules.
- All other `.lua` files under `UI/`, `UX/`, and `Integration/` can be loaded in any order.
- The `.toc` also includes several Ace3 libraries (`AceAddon-3.0`, `AceEvent-3.0`, etc.). These are available for other addons that share this directory but are **not required** by Ascension Suit.

---

## Additional Notes

- **Colours**: Always RGBA tables `{r, g, b, a}` with values `0–1`.
- **Vertical coordinates**: `yOffset` parameters are negative values measured from the **top** of the parent. For example, `-20` places the element 20 pixels down from the top edge.
- **Dropdown blocking**: The library uses a shared frame (`AscensionSuitDropdownBlocker`) to close dropdown lists when clicking outside. This works globally; you do not need to manage it manually.
- **Tooltips**: The `attachTooltip` method requires `lib.UX` to be loaded. Many factory methods will automatically call it if the `tooltip` parameter is provided and `lib.UX` exists.

---

*Happy addon building!*
