# 📜 Macro Maker `v3.6.0`

> **Part of the Ultima Suite • The Advanced Visual Macro Development & Management Studio for World of Warcraft (Retail & Midnight-Ready)**

![Suite](https://img.shields.io/badge/Suite-Ultima-gold?style=flat-square)
![WoW Version](https://img.shields.io/badge/WoW-Retail%20%7C%20Midnight%2012.1.5-blue?style=flat-square)
![Languages](https://img.shields.io/badge/Locales-10%2F10-brightgreen?style=flat-square)
![Author](https://img.shields.io/badge/Author-Satyros-purple?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-orange?style=flat-square)

---

## 🌟 Overview

> *Part of the **Ultima Suite** — engineered to operate 100% standalone with zero mandatory cross-addon dependencies, while providing seamless inter-addon synergies via UltimaBridge when other suite modules are installed.*

**Macro Maker** is a comprehensive, modern addon designed to simplify the creation and management of macros in World of Warcraft. It provides an intuitive, visual drag-and-drop workspace where players can build complex, reliable macros without needing deep knowledge of macro syntax commands.

---

## ✨ Key Features

### 🗂️ 1. Macro Manager Hub
* **Unified Management:** View and manage Account Macros, Character Macros, and your Personal Library in one window.
* **Full CRUD Operations:** Create, Delete, Duplicate, and Rename macros effortlessly.
* **Favorites & Instant Search:** Filter favorite macros with a single click and clear searches instantly.
* **Unlimited Macro Library:** Store an unlimited number of macros in your library without consuming limited Blizzard macro slots.
* **Library Snapshots & Backups:** Create point-in-time library backups with one-click right-click restoration.

### 🎒 2. Action Source Explorer
* **Complete Action Library:** Browse Class Spells, General Spells, Pet Abilities, Equipped Gear, Bag Items, Mounts, Companion Pets, and Toys.
* **Drag & Drop & Quick Context Menu:** Drag any action directly into builder slots or right-click to immediately assign to Nomod, Shift, Ctrl, Alt, or Sequence Studio.
* **Instant Filtering:** Real-time search with instant filter reset.

### 🔨 3. Builder Workbench
* **Visual Assembly:** Drag icons or right-click actions into specific modifier slots (Nomod, Shift, Ctrl, Alt).
* **Live Code Generation & Diagnostics:** Real-time syntax validation, Global Cooldown (GCD) conflict warnings, CastSequence lockup hazards (missing `reset=` triggers), `#showtooltip` advice, and character limits.
* **Automatic Code Optimization:** Condenses macro text automatically to save precious character space with detailed savings reports.
* **Dynamic Action Bar Icons:** Full dynamic icon swapping support with `#showtooltip`.

### 🔍 4. Inspector Studio & Power Tools
* **Cast Sequence Studio:** Drag-and-drop sequence builder with step badges, cooldown warnings, reordering controls, duration timeline, and instant `/castsequence` code generation.
* **Class Macro Library & Spec Starter Kits:** Dynamic 1-click generator for essential spec starter kits (Burst, Focus CC, Mouseover Utility, Defensives) plus curated pre-built macros for all 13 classes and 39 specializations updated for Midnight (12.1.0).
* **Conditions Studio:** Visually configure smart targeting conditions (`[@mouseover]`, `[@cursor]`, `[@focus]`, combat, stealth, harm/help).
* **Icon Studio:** Search over 100,000 textures, semantic tag/keyword search (`heal`, `fire`, `mount`, `shield`), class ability filtering, active icon highlighting, and persistent recents.
* **Interactive Guided Tour:** 4-step interactive walkthrough with spotlights to master all features (`/mm tour`).

---

## ⌨️ Slash Commands

| Command | Action |
| :--- | :--- |
| `/macromaker` | Toggle the Macro Maker main window |
| `/mm` | Short command to toggle the Macro Maker window |
| `/mm tour` | Start the interactive guided tutorial tour |
| `/mm help` | Display available chat commands and shortcuts |

---

## 🚀 What's New in `v3.6.0` (Patch 12.1.5 / Midnight)

* **Patch 12.1.5 Spec Macro Library:** Added new class templates in `Data/Library.lua` (including *12.1.5 Protection Magic Defense + Demo Shout* and *12.1.5 Marksmanship AoE Cursor Volley*) and updated `MacroLocales.lua`.
* **Generator, Optimizer & Builder Upgrades:** Enhanced `Logic/Generator.lua`, `Logic/Optimizer.lua`, and `UI/Builder.lua` for smarter condition compaction and live syntax diagnostics.
* **Patch 12.1.5 (`120105`) & 10/10 Locales:** Updated TOC metadata and synchronized all 1,256 localization keys across all 10 client languages.

---

## 🌐 Supported Languages

Full localization for all 10 official World of Warcraft client locales:

* 🇬🇧 **English** (`enUS`)
* 🇩🇪 **German** (`deDE`)
* 🇪🇸 **Spanish** (`esES` / `esMX`)
* 🇫🇷 **French** (`frFR`)
* 🇮🇹 **Italian** (`itIT`)
* 🇧🇷 **Portuguese** (`ptBR`)
* 🇷🇺 **Russian** (`ruRU`)
* 🇰🇷 **Korean** (`koKR`)
* 🇨🇳 **Simplified Chinese** (`zhCN`)
* 🇹🇼 **Traditional Chinese** (`zhTW`)

---

## 📝 Changelog

### Version 3.5.0 (Ultima Suite Standardization & Library Modernization)
* **Ultima Suite Bridge Standardization:** Full migration to the unified `UltimaBridge` architecture with standalone fallback.
* **Complete 10-Locale Translation Engine:** Multi-locale coverage for German, French, Spanish, Italian, Portuguese, Russian, Korean, and Chinese client locales.
* **TOC Metadata & Category Alignment:** Fully aligned with official WoW 12.1 Midnight category specifications.
* **Streamlined Embedded Libraries:** Removed legacy dependencies for optimal memory footprint and zero-churn execution.

### Version 3.4.1 (Spec Starter Kits & Sequence Hazard Diagnostics)
* **Dynamic Spec Starter Kits:** 1-Click generation of essential, role-specific macros (Burst / CD stacks, Focus CC, Mouseover Healing/Utility, and Emergency Defensives) for all 13 classes and 39 specializations.
* **CastSequence Lockup & Hazard Diagnostics:** Intelligent validator detects missing `reset=` triggers on sequence macros (preventing deadlocks when abilities fail or targets die) and warns about off-GCD sequencing delays.
* **Ultima Suite Dashboard Integration:** Registered with `UltimaBridge` dynamic launcher ecosystem.

### Version 3.4.0 (Community Libraries & Network Suite)
* **Interactive Hover Keybinding (`LibKeyBound-1.0`):** Fast, intuitive keybinding by simply hovering over any macro in the list and pressing any key, mouse button, or mouse wheel. Modernized for Retail and Midnight (`UICheckButtonTemplate`, `UIPanelButtonTemplate`, `BackdropTemplate`).
* **Direct Player-to-Player Sharing (`AceComm-3.0`):** 1-Click transfer of macros to targeted players or active group/raid with priority queuing, traffic throttling via `ChatThrottleLib`, and incoming confirmation dialogs.
* **Smart Window Persistence & Clamping (`LibWindow-1.1`):** Seamless saving and restoration of window position, scale, and screen clamping across logins, resolution changes, and UI scaling.
* **Typographic Font & Audio Dropdowns (`AceGUI-3.0-SharedMediaWidgets`):** Visual font rendering directly in the Options dropdown and configurable sound effects with one-click preview auditioning.

### Version 3.2.0 (Multi-Locale Translation, Compression & Studio Polish)
* **Multi-Locale Translation Engine:** Seamless translation of macro snippets, template titles, and spell names across all 10 official WoW client locales powered by local Game Data API dictionaries.
* **High-Efficiency Compression:** Integrated `LibDeflate` and `LibSerialize` for ultra-compact, print-safe macro and library import/export strings (`!MM:...`).
* **Library Snapshot & Backup System:** Quick snapshot creation and interactive right-click restore menu to protect your custom macro library.
* **Editor Font Customization:** Choose your favorite monospace or UI font via `LibSharedMedia-3.0` directly from the Options panel.
* **Macro List Rich Previews & Glow Highlight:** View detailed 8-line macro code previews via `LibQTip-1.0` and active macro glow highlighting powered by `LibCustomGlow-1.0`.
* **Sequence Studio Additions:** Live estimated sequence duration timeline (`~0.0s GCD`), reset condition tooltips, and seamless right-click "Add to Sequence" integration.
* **Icon Studio Tag Searching:** Search textures and icons intuitively using semantic keywords (`heal`, `fire`, `frost`, `shadow`, `nature`, `tank`, `shield`, `mount`, `pet`, `buff`, etc.).
* **Audio Feedback:** Optional sound cues on save, duplicate, delete, and validation error events.

### Version 3.1.0 (Retail & Midnight 12.1.0 Update)
* **Cast Sequence Studio:** Modernized sequence builder with drag-and-drop step ordering, cooldown alerts, reset triggers, and live preview.
* **Class Macro Library Overhaul:** Expanded library covering all 13 classes, 39 specializations, Warband utilities, and 12.1.0 Midnight abilities.
* **Smart Macro Diagnostics:** Real-time GCD conflict detection, missing `#showtooltip` advice, and character truncation protection.
* **Interactive Guided Tour:** Integrated step-by-step tutorial with spotlights across all 4 UI columns (`/mm tour`).
* **Icon Studio Upgrades:** Class spellbook filtering, live `#showtooltip` drag-and-drop preview slot, gold active borders, and mousewheel scrolling.
* **Action Source Context Menu:** Right-click any spell, item, or mount to instantly insert into standard, modifier, or sequence slots.

---

## 📦 Installation

1. Download the latest release.
2. Extract into your World of Warcraft AddOns directory:  
   `World of Warcraft\_retail_\Interface\AddOns\MacroMaker`
3. Launch World of Warcraft and type `/mm` to open Macro Maker.

---

## 📜 Credits & License

Developed with ❤️ by **Satyros**. Designed for World of Warcraft Retail (Patch 12.1.5 / *Midnight*).  
Licensed under the **MIT License**. Part of the **Ultima Suite**.

### Acknowledgements & Inspirations:
* Built for the **Ultima Suite** ecosystem (`UltimaBridge`) with embedded community libraries (`LibDeflate`, `LibSerialize`, `LibSharedMedia-3.0`, `LibCustomGlow-1.0`, `LibDialog-1.0`, `LibQTip-1.0`, `LibWindow-1.1`, `LibKeyBound-1.0`).
* Special thanks to **Macro Toolkit** (*Deepac*) for pioneering extended macro limits, syntax highlighting, and accessible macro engineering in World of Warcraft.


