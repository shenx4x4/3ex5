# 3ex5 - A Modern Glassmorphism UI Library for Roblox

## Overview

3ex5 is a non-OOP (Object-Oriented Programming) UI library designed for Roblox, focusing on a modern, minimalist aesthetic with smooth glassmorphism effects. It provides a set of core UI components and utilities to help developers create beautiful and interactive user interfaces in their Roblox games.

## Features

- **Non-OOP Design**: Simple and straightforward to use, without the complexities of object-oriented patterns.
- **Glassmorphism Style**: Modern UI design with frosted glass effects, blurring backgrounds, and subtle transparency.
- **Smooth Animations**: Utilizes Roblox's TweenService for fluid and responsive UI interactions.
- **7 Themes**: Comes with 7 pre-defined themes (Default, Light, Blue, Green, Red, Purple, Orange) to easily customize the look and feel of your UI.
- **Minimizable Windows**: Windows can be minimized to save screen space.
- **Loadstring Support**: Designed to be easily loaded and used via `loadstring` for quick integration into projects.

## Installation

To use 3ex5 in your Roblox project, you can either download the source directly or use the `loadstring` method.

### Via Loadstring (Recommended for quick use)

To load the latest version of 3ex5, simply execute the following code in your game:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/shenx4x4/3ex5/refs/heads/master/main_example.lua"))()
```

**Note**: Replace `your-username` with the actual GitHub username where the repository will be hosted.

### Manual Installation

1. Clone this repository or download the source code.
2. Place the `src` folder into `ReplicatedStorage` in your Roblox Studio project.
3. Ensure your `default.project.json` is configured correctly for Rojo, or manually place the files.
4. Add `main.client.lua` to `StarterPlayerScripts` to initialize the UI.

## Usage

After installation, you can initialize the library and create UI elements. Here's a basic example:

```lua
-- In a LocalScript (e.g., in StarterPlayerScripts)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local _3ex5_Library = ReplicatedStorage:WaitForChild("3ex5")

local Core = require(_3ex5_Library.src.Core.init)
local Components = require(_3ex5_Library.src.Components.init)
local Themes = require(_3ex5_Library.src.Themes.init)

-- Initialize the library (creates a default window with some examples)
local mainWindow = Core.createWindow("My Custom UI", UDim2.new(0, 400, 0, 300))
mainWindow.Position = UDim2.new(0.5, -200, 0.5, -150) -- Center the window

local myTab = Core.createTab(mainWindow, "My Tab")

Components.createButton(myTab, "Hello World", function()
    print("Hello from 3ex5!")
end)

Components.createTextInput(myTab, "Enter text here...", "", function(text)
    print("Input: " .. text)
end)

Components.createToggle(myTab, "Toggle Feature", true, function(state)
    print("Feature state: " .. tostring(state))
end)

-- Switching themes dynamically
local themeNames = Themes.getAvailableThemes()
local currentThemeIndex = 1

Components.createButton(myTab, "Next Theme", function()
    currentThemeIndex = (currentThemeIndex % #themeNames) + 1
    local newTheme = themeNames[currentThemeIndex]
    Themes.loadTheme(newTheme)
    print("Switched to " .. newTheme .. " theme.")
    -- For existing UI elements to fully reflect the new theme, you might need to re-create them
    -- or implement a more advanced theme application system.
end)
```

For more detailed examples, refer to `Example.lua` and `main_example.lua`.

## API Reference

(To be expanded in the `docs` folder)

### `Core`

- `createWindow(title: string, size: UDim2)`: Creates a new draggable UI window.
- `createTab(parentWindow: Instance, tabName: string)`: Creates a new tab within a window.

### `Components`

- `createButton(parent: Instance, text: string, callback: function)`: Creates a clickable button.
- `createTextInput(parent: Instance, placeholderText: string, initialText: string, callback: function)`: Creates a text input field.
- `createToggle(parent: Instance, labelText: string, initialState: boolean, callback: function)`: Creates a toggle switch.

### `Themes`

- `loadTheme(themeName: string)`: Sets the active theme.
- `getCurrentTheme()`: Returns the currently active theme's color palette.
- `getAvailableThemes()`: Returns a list of all available theme names.

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues on the GitHub repository.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Changelog

See [changelog.md](changelog.md) for a history of changes.
