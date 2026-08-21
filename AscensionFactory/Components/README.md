# AscensionFactory - Components Index

Complete technical reference and index for all UI constructors in `Components/`.

---

## Quick Navigation Table

| File | Constructor | Description | Composite Sub-Elements | Key Options |
| :--- | :--- | :--- | :--- | :--- |
| [`01Frame.lua`](file:///Applications/World%20of%20Warcraft/_retail_/Interface/AddOns/AscensionFactory/Components/01Frame.lua) | `Context:createMainFrame(options)` | Top-level application window | Container `Frame`, Border `Texture`, Background `Texture`, `IconButton` (Close) | `name`, `width`, `height`, `anchor`, `strata`, `showCloseButton`, `onClose` |
| [`02TabbedInterface.lua`](file:///Applications/World%20of%20Warcraft/_retail_/Interface/AddOns/AscensionFactory/Components/02TabbedInterface.lua) | `Context:createTabbedInterface(options)` | Sidebar navigation with switching content panels | Sidebar `Frame`, `LayoutModel`, `Button[]` (Tabs), Accent `Texture[]`, `Frame[]` (Panels) | `parent`, `startY`, `tabs`, `initialIndex` |
| [`03TwoColumn.lua`](file:///Applications/World%20of%20Warcraft/_retail_/Interface/AddOns/AscensionFactory/Components/03TwoColumn.lua) | `Context:createTwoColumns(options)` | Side-by-side 50/50 split column layout | Left `Frame`, Right `Frame`, Optional Background `Texture` | `parent`, `yOffset`, `height`, `name`, `backgroundColor` |
| [`04Text.lua`](file:///Applications/World%20of%20Warcraft/_retail_/Interface/AddOns/AscensionFactory/Components/04Text.lua) | `Context:createHeader(options)` | Glowing section title | `FontString` | `parent`, `text`, `fontSize`, `spaceBelow`, `point`, `xOffset`, `yOffset` |
| [`04Text.lua`](file:///Applications/World%20of%20Warcraft/_retail_/Interface/AddOns/AscensionFactory/Components/04Text.lua) | `Context:createLabel(options)` | Single-line form label | `FontString` | `parent`, `text`, `fontSize`, `spaceBelow`, `point`, `xOffset`, `yOffset` |
| [`04Text.lua`](file:///Applications/World%20of%20Warcraft/_retail_/Interface/AddOns/AscensionFactory/Components/04Text.lua) | `Context:createParagraph(options)` | Multi-line wrapped text body | `FontString` | `parent`, `text`, `fontSize`, `rightOffset`, `spaceBelow`, `xOffset`, `yOffset` |
| [`05Button.lua`](file:///Applications/World%20of%20Warcraft/_retail_/Interface/AddOns/AscensionFactory/Components/05Button.lua) | `Context:createButton(options)` | Interactive styled push button | `Button`, Border `Texture`, Track `Texture`, `FontString` | `parent`, `name`, `width`, `height`, `text`, `onClick`, `tooltip`, `trackColors` |
| [`05Button.lua`](file:///Applications/World%20of%20Warcraft/_retail_/Interface/AddOns/AscensionFactory/Components/05Button.lua) | `Context:createIconButton(options)` | Square geometric vector icon button | `Button`, Geometric vector `Texture[]` (`close`, `plus`, `minus`, etc.) | `size`, `iconType`, `iconColor`, `onClick`, `tooltip` |
| [`05Button.lua`](file:///Applications/World%20of%20Warcraft/_retail_/Interface/AddOns/AscensionFactory/Components/05Button.lua) | `Context:createDialogButton(options)` | Semantic action button (`accept`/`cancel`/`neutral`) | `Button`, Border `Texture`, Track `Texture`, `FontString` | `variant`, `text`, `onClick`, `tooltip` |
| [`06Toggle.lua`](file:///Applications/World%20of%20Warcraft/_retail_/Interface/AddOns/AscensionFactory/Components/06Toggle.lua) | `Context:createToggle(options)` | Animated binary switch (on/off) | `Button`, Border `Texture`, Track `Texture`, Sliding Thumb `Texture` | `width`, `height`, `padding`, `getter`, `setter`, `onClick`, `tooltip` |
| [`07Checkbox.lua`](file:///Applications/World%20of%20Warcraft/_retail_/Interface/AddOns/AscensionFactory/Components/07Checkbox.lua) | `Context:createCheckbox(options)` | Checkbox row with vector checkmark | Row `Button`, Box Border `Texture`, Box Track `Texture`, Vector Check Leg `Texture[2]`, Label `FontString` | `text`, `checked`, `boxSize`, `getter`, `setter`, `onClick`, `tooltip` |
| [`08InputField.lua`](file:///Applications/World%20of%20Warcraft/_retail_/Interface/AddOns/AscensionFactory/Components/08InputField.lua) | `Context:createInputField(options)` | Single/Multi-line text input & scroll area | Container `Frame`, Border `Texture`, Track `Texture`, `ScrollFrame` (multi-line), `EditBox`, Placeholder `FontString`, `IconButton` (Clear), `Slider` (Scrollbar) | `width`, `height`, `multiLine`, `showScrollbar`, `showClear`, `placeholder`, `numeric`, `password`, `getter`, `setter` |
| [`09Slider.lua`](file:///Applications/World%20of%20Warcraft/_retail_/Interface/AddOns/AscensionFactory/Components/09Slider.lua) | `Context:createSlider(options)` | Horizontal/Vertical slider & meter | `Frame`, Border `Texture`, Track `Texture`, Fill `Texture`, Diamond Thumb `Button` (`Texture`) | `orientation`, `length`, `width`, `height`, `minValue`, `maxValue`, `step`, `showFill`, `inverted`, `getter`, `setter` |
| [`10Stepper.lua`](file:///Applications/World%20of%20Warcraft/_retail_/Interface/AddOns/AscensionFactory/Components/10Stepper.lua) | `Context:createStepper(options)` | Joined numeric stepper with repeat ticker | Container `Frame`, Minus `IconButton`, Middle `InputField`, Plus `IconButton` | `width`, `height`, `inputWidth`, `minValue`, `maxValue`, `step`, `decimals`, `getter`, `setter` |
| [`.PresetColorPicker.lua`](file:///Applications/World%20of%20Warcraft/_retail_/Interface/AddOns/AscensionFactory/Components/.PresetColorPicker.lua) | `Context:getOrCreateColorPickerDialog()` | RGBA color picker modal dialog | Modal `Frame`, Title `FontString`, Close `IconButton`, Preview `Texture[2]`, RGBA `Slider[4]`, Preset Swatches `Button[]`, `DialogButton[2]` | `initialColor`, `onAccept`, `onCancel`, `onColorChanged` |

---

## Component Detailed Specifications

### 1. `01Frame.lua`

#### `Context:createMainFrame(options)`
Creates the top-level window container styled with Obsidian metallic borders and background textures. Automatically registers Escape-to-close and window dragging behaviors.

- **Composite Elements**:
  - `frame` (`Frame`): Base window frame attached to `UIParent` or specified parent.
  - `frame.border` (`Texture`): Outer 1px frame border on layer `BACKGROUND` (-2).
  - `frame.background` (`Texture`): Inner surface fill on layer `BACKGROUND` (-1).
  - `frame.closeButton` (`Button` / `IconButton`): Top-right close button (optional).
- **Options Table (`options`)**:
  - `name` (`string`, required): Global identifier (`_G[name]`).
  - `width` (`number`, optional, default: `860`): Window pixel width.
  - `height` (`number`, optional, default: `500`): Window pixel height.
  - `anchor` (`string`, optional, default: `"CENTER"`): Screen anchor point.
  - `strata` (`string`, optional, default: `"DIALOG"`): Frame strata level.
  - `showCloseButton` (`boolean`, optional, default: `true`): Toggles close button creation.
  - `closeButtonSize` (`number`, optional, default: `24`): Pixel dimensions of close button.
  - `closeButtonXOffset` (`number`, optional, default: `-8`): Horizontal offset for close button.
  - `closeButtonYOffset` (`number`, optional, default: `-8`): Vertical offset for close button.
  - `onClose` (`function(frame)`, optional): Custom close button handler.
- **Instance Methods / Properties**:
  - Standard WoW `Frame` API (`Show()`, `Hide()`, `SetPoint()`, etc.).
  - `frame.globalName` (`string`).

---

### 2. `02TabbedInterface.lua`

#### `Context:createTabbedInterface(options)`
Constructs a vertical navigation sidebar and synchronized content panels.

- **Composite Elements**:
  - `sidebar` (`Frame`): Fixed 160px width navigation container.
  - `tabs` (`table[]`): Array of tab `Button` elements managed by `LayoutModel`.
  - `tab.accent` (`Texture`): 8px left indicator bar colored in `primary`.
  - `panels` (`table[]`): Array of content `Frame` panels matching tab order.
- **Options Table (`options`)**:
  - `parent` (`Frame`, required): Parent window.
  - `startY` (`number`, required): Vertical start coordinate for sidebar.
  - `tabs` (`string[]`, required): Array of tab titles (e.g. `{"Text", "Buttons", "Sliders"}`).
  - `initialIndex` (`number`, optional, default: `1`): Default active tab index.
- **Return Value**:
  - `{ sidebar = Frame, tabs = Button[], panels = Frame[] }`.

---

### 3. `03TwoColumn.lua`

#### `Context:createTwoColumns(options)`
Splits parent width equally into two side-by-side container columns with a 10px center gap.

- **Composite Elements**:
  - `leftColumn` (`Frame`): Left half container.
  - `rightColumn` (`Frame`): Right half container.
  - Optional `background` (`Texture`) on each column.
- **Options Table (`options`)**:
  - `parent` (`Frame`, optional, default: `UIParent`).
  - `yOffset` (`number`, optional, default: `0`): Vertical offset from parent top.
  - `height` (`number`, optional): Fixed height. If omitted, anchors to parent bottom.
  - `name` (`string`, optional, default: `"TwoColumnLayout"`): Global prefix name.
  - `backgroundColor` (`table` RGBA, optional): Background color applied to both columns.
  - `leftBackgroundColor` (`table` RGBA, optional): Left column background override.
  - `rightBackgroundColor` (`table` RGBA, optional): Right column background override.
- **Return Value**:
  - `leftColumn, rightColumn` (`Frame, Frame`).

---

### 4. `04Text.lua`

#### `Context:createHeader(options)`
Creates glowing section title header text.

- **Options Table (`options`)**:
  - `text` (`string`, required): Header label.
  - `parent` (`Frame`, optional, default: `UIParent`).
  - `fontSize` (`number`, optional, default: `24`).
  - `fontFamily` (`string`, optional, default: `"fonts/frizqt___cyr.ttf"`).
  - `shadowColor` (`table` RGBA, optional).
  - `wordWrap` (`boolean`, optional).
  - `justifyH` (`string`, optional, default: `"LEFT"`).
  - `point`, `anchorPoint`, `xOffset`, `yOffset`, `relativeTo`, `relativePoint`.
  - `width` / `rightOffset` (`number`, optional).
  - `spaceBelow` (`number`, optional, default: `0`).
- **Return Value**: `header, nextY` (`FontString, number`).

#### `Context:createLabel(options)`
Creates single-line UI form label.

- **Options Table (`options`)**:
  - `text` (`string`, required): Label string.
  - `parent` (`Frame`, optional, default: `UIParent`).
  - `fontSize` (`number`, optional, default: `18`).
  - `fontFamily` (`string`, optional).
  - `shadowColor` (`table` RGBA, optional).
  - `point`, `anchorPoint`, `xOffset`, `yOffset`, `relativeTo`, `relativePoint`, `spaceBelow`.
- **Return Value**: `label, nextY` (`FontString, number`).

#### `Context:createParagraph(options)`
Creates multi-line auto-wrapped descriptive text block.

- **Options Table (`options`)**:
  - `text` (`string`, required): Paragraph body text.
  - `parent` (`Frame`, optional, default: `UIParent`).
  - `fontSize` (`number`, optional, default: `12`).
  - `fontFamily` (`string`, optional).
  - `justifyH` (`string`, optional, default: `"LEFT"`).
  - `rightOffset` (`number`, optional, default: `-10`).
  - `spaceBelow` (`number`, optional, default: `0`).
  - `point`, `anchorPoint`, `xOffset`, `yOffset`, `relativeTo`, `relativePoint`.
- **Return Value**: `paragraph, nextY` (`FontString, number`).

---

### 5. `05Button.lua`

#### `Context:createButton(options)`
Creates standard interactive button with border, track, and text label.

- **Composite Elements**: `Button`, `border` (`Texture`), `track` (`Texture`), `label` (`FontString`).
- **Options Table (`options`)**:
  - `text` (`string`, optional): Button label.
  - `parent` (`Frame`, optional, default: `UIParent`).
  - `name` (`string`, optional): Global name.
  - `width` (`number`, optional, default: `60`).
  - `height` (`number`, optional, default: `25`).
  - `trackColors` (`table`, optional): `{ normal, hover, active, disabled }`.
  - `borderColors` (`table`, optional): `{ normal, hover, active, disabled }`.
  - `labelColors` (`table`, optional): `{ normal, hover, active, disabled }`.
  - `tooltip` (`string | function`, optional).
  - `clickTypes` (`string[]`, optional, default: `{"AnyUp"}`).
  - `onClick` (`function(self, buttonName, down)`, optional).
  - `point`, `anchorPoint`, `xOffset`, `yOffset`, `relativeTo`, `relativePoint`.
- **Return Value**: `button` (`Button`).

#### `Context:createIconButton(options)`
Creates square button with procedural geometric vector icon.

- **Icon Types (`iconType`)**: `"close"`, `"plus"`, `"minus"`, `"minimize"`, `"maximize"`, `"arrowdown"`.
- **Options Table (`options`)**:
  - `size` (`number`, optional, default: `24`): Width and height.
  - `iconType` (`string`, optional, default: `"close"`).
  - `iconColor` (`table` RGBA, optional, default: `styles.colors.white`).
  - All standard `createButton` options.
- **Return Value**: `button` (`Button`).

#### `Context:createDialogButton(options)`
Creates semantic dialog action button with automated width and theme colors.

- **Variants (`variant`)**:
  - `"accept"` / `"confirm"` / `"success"`: Green accent theme.
  - `"cancel"` / `"decline"` / `"danger"`: Red laser theme.
  - `"neutral"`: Standard metallic theme.
- **Options Table (`options`)**:
  - `variant` (`string`, optional, default: `"neutral"`).
  - `text` (`string`, optional): Defaults based on variant ("Accept", "Cancel", etc.).
  - All standard `createButton` options.
- **Return Value**: `button` (`Button`).

---

### 6. `06Toggle.lua`

#### `Context:createToggle(options)`
Creates an animated binary switch toggle button.

- **Composite Elements**: `Button`, `border` (`Texture`), `track` (`Texture`), `thumb` (`Texture`).
- **Options Table (`options`)**:
  - `parent` (`Frame`, optional, default: `UIParent`).
  - `name` (`string`, optional).
  - `width` (`number`, optional, default: `52`).
  - `height` (`number`, optional, default: `24`).
  - `padding` (`number`, optional, default: `2`): Thumb inset gap.
  - `getter` (`function(): boolean`, optional): Returns initial state.
  - `setter` (`function(isOn: boolean)`, optional): Invoked on state change.
  - `onClick` (`function(self, isOn: boolean)`, optional).
  - `tooltip` (`string | function`, optional).
  - `point`, `anchorPoint`, `xOffset`, `yOffset`, `relativeTo`, `relativePoint`.
- **Instance Methods / Properties**:
  - `toggle.isOn` (`boolean`).
  - `toggle:setState(state)` (`function`): Programmatically sets state and triggers animation.

---

### 7. `07Checkbox.lua`

#### `Context:createCheckbox(options)`
Creates checkbox row containing a square box, vector checkmark legs, and adjacent label.

- **Composite Elements**: `Button` (row), `boxBorder` (`Texture`), `boxTrack` (`Texture`), `checkShortLeg` (`Texture`), `checkLongLeg` (`Texture`), `label` (`FontString`).
- **Options Table (`options`)**:
  - `text` (`string`, optional): Checkbox label string.
  - `checked` (`boolean`, optional, default: `false`).
  - `boxSize` / `size` (`number`, optional): Checkbox square box size.
  - `width` (`number`, optional): Auto-calculated from text if omitted.
  - `getter` (`function(): boolean`, optional).
  - `setter` (`function(checked: boolean)`, optional).
  - `onClick` (`function(self, checked, buttonName, down)`, optional).
  - `tooltip` (`string | function`, optional).
  - `point`, `anchorPoint`, `xOffset`, `yOffset`, `relativeTo`, `relativePoint`.
- **Instance Methods / Properties**:
  - `checkbox.isChecked` (`boolean`).
  - `checkbox:SetChecked(bool)`.

---

### 8. `08InputField.lua`

#### `Context:createInputField(options)`
Unified text input field supporting single-line inputs, multi-line scrollable text areas with clipping, numeric constraints, ghost placeholder text, focus glow, and clear/scrollbar attachments.

- **Composite Elements**:
  - `container` (`Frame`): Outer clipping frame with border and track.
  - `container.scrollFrame` (`ScrollFrame`): Child viewport when `multiLine = true`.
  - `container.editBox` (`EditBox`): Native text editing widget.
  - `container.placeholder` (`FontString`): Ghost text overlay.
  - `container.clearButton` (`IconButton`): Optional clear icon button (single-line).
  - `container.scrollbar` (`Slider`): Optional vertical slider (multi-line).
- **Options Table (`options`)**:
  - `width` (`number`, required): Total input width.
  - `height` (`number`, required): Total input height.
  - `multiLine` (`boolean`, optional, default: `false`): Enables multi-line ScrollFrame.
  - `showScrollbar` (`boolean`, optional, default: `false`): Attaches vertical scrollbar.
  - `showClear` / `clearButton` (`boolean`, optional, default: `false`): Adds clear button.
  - `placeholder` (`string`, optional): Text when empty.
  - `numeric` (`boolean`, optional, default: `false`): Numeric digits only.
  - `password` (`boolean`, optional, default: `false`): Password mask mode.
  - `maxLetters` / `maxLength` (`number`, optional, default: `0` / unlimited).
  - `autoFocus` (`boolean`, optional, default: `false`).
  - `font` (`string`, optional).
  - `text` / `getter` (`string | function`, optional): Initial value.
  - `setter` (`function(text: string)`, optional).
  - `onTextChanged` (`function(container, text, isUserInput)`, optional).
  - `onEnterPressed` (`function(container, text)`, optional).
  - `onEscapePressed` (`function(container)`, optional).
  - `onFocusGained` (`function(container)`, optional).
  - `onFocusLost` (`function(container)`, optional).
  - `point`, `anchorPoint`, `xOffset`, `yOffset`, `relativeTo`, `relativePoint`, `tooltip`.
- **Instance Methods (`container`)**:
  - `container:getText()` / `container:GetText()`: Returns current text.
  - `container:setText(text)` / `container:SetText(text)`: Updates text.
  - `container:clear()` / `container:Clear()`: Empties text.
  - `container:setPlaceholder(text)` / `container:SetPlaceholder(text)`.
  - `container:setNumeric(bool)` / `container:SetNumeric(bool)`.
  - `container:setMaxLetters(max)` / `container:SetMaxLetters(max)`.
  - `container:setFocus()` / `container:SetFocus()`.
  - `container:clearFocus()` / `container:ClearFocus()`.
  - `container:getEditBox()` / `container:GetEditBox()`.
  - `container:setEnabled(enabled)` / `container:SetEnabled(enabled)`.

---

### 9. `09Slider.lua`

#### `Context:createSlider(options)`
Precision slider and scrollbar supporting horizontal and vertical orientations, diamond thumb geometry, progress fill bar, step snapping, inverted meter direction, and mouse wheel navigation.

- **Composite Elements**:
  - `slider` (`Frame`): Base bounds, outer border, inner track.
  - `slider.fill` (`Texture`): Progress fill bar (`showFill = true`).
  - `slider.thumb` (`Button`): Drag handle button with rotated 45-degree diamond texture (`thumb.diamond`).
- **Options Table (`options`)**:
  - `orientation` (`string`, required): `"HORIZONTAL"` or `"VERTICAL"`.
  - `length` / `width` / `height` (`number`, required): Total slider track length.
  - `thickness` / `width` / `height` (`number`, optional, default: `16` horiz, `14` vert).
  - `minValue` / `min` (`number`, optional, default: `0`).
  - `maxValue` / `max` (`number`, optional, default: `100`).
  - `step` / `stepSize` (`number`, optional, default: `1`).
  - `value` / `defaultValue` / `getter` (`number | function`, optional).
  - `setter` (`function(val: number)`, optional).
  - `onValueChanged` (`function(slider, val, isUserInput)`, optional).
  - `showFill` / `fill` (`boolean`, optional, default: `false`).
  - `fillColor` (`table` RGBA, optional, default: `primary`).
  - `inverted` (`boolean`, optional, default: `false`): Reverses direction for meters/gauges.
  - `thumbSize` (`number`, optional, default: `thickness - 2`).
  - `tooltip` (`string | function`, optional).
  - `point`, `anchorPoint`, `xOffset`, `yOffset`, `relativeTo`, `relativePoint`.
- **Instance Methods (`slider`)**:
  - `slider:getValue()` / `slider:GetValue()`: Returns current value.
  - `slider:setValue(val, isSilent, isUserInput)` / `slider:SetValue(...)`.
  - `slider:setMinMaxValues(min, max)` / `slider:SetMinMaxValues(...)`.
  - `slider:getMinMaxValues()` / `slider:GetMinMaxValues()`.
  - `slider:setStep(step)` / `slider:SetStep(step)`.
  - `slider:setThumbSize(size)` / `slider:SetThumbSize(size)`.

---

### 10. `10Stepper.lua`

#### `Context:createStepper(options)`
Joined numeric stepper combining minus button, centered input field, and plus button in a unified layout with continuous repeat ticker acceleration.

- **Composite Elements**:
  - `stepper` (`Frame`): Outer wrapper frame.
  - `stepper.minusButton` (`IconButton`): Decrement button (`minus`).
  - `stepper.inputField` (`InputField`): Centered numerical input box (width: 2/5 of available space).
  - `stepper.plusButton` (`IconButton`): Increment button (`plus`).
- **Options Table (`options`)**:
  - `width` (`number`, required): Stepper width allocation.
  - `height` (`number`, required): Stepper height and button size.
  - `inputWidth` (`number`, optional): Middle input field width override.
  - `minValue` / `min` (`number`, optional, default: `0`).
  - `maxValue` / `max` (`number`, optional, default: `100`).
  - `step` / `stepSize` (`number`, optional, default: `1`).
  - `decimals` (`number`, optional): Decimal places (auto-detected from step).
  - `value` / `defaultValue` / `getter` (`number | function`, optional).
  - `allowNegative` (`boolean`, optional): Permits negative values.
  - `setter` (`function(val: number)`, optional).
  - `onValueChanged` (`function(stepper, val, isUserInput)`, optional).
  - `point`, `anchorPoint`, `xOffset`, `yOffset`, `relativeTo`, `relativePoint`.
- **Instance Methods (`stepper`)**:
  - `stepper:getValue()` / `stepper:GetValue()`: Returns numerical value.
  - `stepper:setValue(val, isSilent, isUserInput)` / `stepper:SetValue(...)`.
  - `stepper:setMinMaxValues(min, max)` / `stepper:SetMinMaxValues(...)`.
  - `stepper:getMinMaxValues()` / `stepper:GetMinMaxValues()`.
  - `stepper:setStep(step)` / `stepper:SetStep(step)`.
  - `stepper:setEnabled(enabled)` / `stepper:SetEnabled(enabled)`.
  - `stepper:enable()` / `stepper:Enable()`.
  - `stepper:disable()` / `stepper:Disable()`.

---

### 11. `.PresetColorPicker.lua`

#### `Context:getOrCreateColorPickerDialog()` / `Context:openColorPicker(options)`
Custom modal color picker dialog with live RGBA sliders, preview swatches, quick palette presets, and confirmation actions.

- **Composite Elements**:
  - `dialog` (`Frame`): Modal dialog window (`FULLSCREEN_DIALOG`).
  - `dialog.closeButton` (`IconButton`): Close button.
  - `dialog.previewOld`, `dialog.previewNew` (`Texture`): Color swatches.
  - `dialog.sliders` (`Slider[]`): 4 RGBA sliders (Red, Green, Blue, Alpha).
  - `dialog.paletteSwatches` (`Button[]`): Quick preset color buttons.
  - `dialog.acceptButton`, `dialog.cancelButton` (`DialogButton`).
- **Options Table for `openColorPicker(options)`**:
  - `initialColor` (`table` RGBA, optional, default: `{1, 1, 1, 1}`).
  - `onAccept` (`function(color: table)`, optional): Called when user accepts color.
  - `onCancel` (`function(originalColor: table)`, optional): Called when cancelled.
  - `onColorChanged` (`function(liveColor: table)`, optional): Called live on slider drag.
