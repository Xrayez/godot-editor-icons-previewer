# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/).

## [Unreleased][1.2] - 2019-XX-XX

### Changed

- Make icons integration in C++ code easier by using double quotes in snippet 
  template by default:
    - `get_icon("Add", "EditorIcons")`

### Fixed

- Icon previews are automatically updated whenever Godot theme is changed (Dark/Light).
- Invalid icons with no name are skipped which could cause error spam, severely impacting editor startup times in Godot 3.2.

## [1.1] - 2019-08-05

### Added

- Ability to copy icon's name wrapped into a code snippet on right clicking:
    - `get_icon('Add', 'EditorIcons')`
- Display editor icons window by pressing a keyboard shortcut <kbd>Alt</kbd>+<kbd>I</kbd>.
- Partial compatibility with Godot 3.0.

### Changed

- Removed `editor_plugin_utils.gd` dependency.

### Fixed

- Editor icons aligned to fit container on resize.

## Compare versions
[Unreleased] 1.2: https://github.com/Xrayez/godot-editor-icons-previewer/compare/v1.1..HEAD

1.1: https://github.com/Xrayez/godot-editor-icons-previewer/compare/v1.0...v1.1

1.0: https://github.com/Xrayez/godot-editor-icons-previewer/releases/tag/v1.0