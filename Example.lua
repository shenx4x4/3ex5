--!strict

-- This file demonstrates how to use the 3ex5 UI library.

-- To run this example, you would typically have a script in StarterPlayerScripts
-- that loads the library and then requires this example file.

-- Example of a loader script (e.g., in main.client.lua):
-- local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- local _3ex5_Library = ReplicatedStorage:WaitForChild("3ex5")
-- require(_3ex5_Library.Example)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local _3ex5_Library = ReplicatedStorage:WaitForChild("3ex5")

local Core = require(_3ex5_Library.src.Core.init)
local Components = require(_3ex5_Library.src.Components.init)
local Themes = require(_3ex5_Library.src.Themes.init)

-- Create the main window
local mainWindow = Core.createWindow("3ex5 Showcase", UDim2.new(0, 500, 0, 400))
mainWindow.Position = UDim2.new(0.5, -250, 0.5, -200)

-- Create tabs
local mainTab = Core.createTab(mainWindow, "Main")
local settingsTab = Core.createTab(mainWindow, "Settings")

-- Initially hide the settings tab
settingsTab.Visible = false

-- Add components to the main tab
Components.createButton(mainTab, "Click Me!", function()
    print("3ex5 button clicked!")
end)

Components.createTextInput(mainTab, "Enter your message...", "", function(text)
    print("User entered: " .. text)
end)

Components.createToggle(mainTab, "Enable Awesome Feature", false, function(isEnabled)
    print("Awesome Feature is now: " .. (isEnabled and "ON" or "OFF"))
end)

-- Add components to the settings tab
local themeNames = Themes.getAvailableThemes()
local currentThemeIndex = 1

local themeLabel = Components.createLabel(settingsTab, "Current Theme: " .. themeNames[currentThemeIndex])

Components.createButton(settingsTab, "Switch Theme", function()
    currentThemeIndex = (currentThemeIndex % #themeNames) + 1
    local newTheme = themeNames[currentThemeIndex]
    Themes.loadTheme(newTheme)
    themeLabel.Text = "Current Theme: " .. newTheme
    print("Switched to " .. newTheme .. " theme.")
    -- Note: A full implementation would require re-styling existing elements.
end)
