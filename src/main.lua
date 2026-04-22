--!strict

local _3ex5 = {}

-- Utility functions (non-OOP)
local Utils = require(script.Parent.Utils.init)

-- Core UI creation functions
local Core = require(script.Parent.Core.init)

-- Theme management
local Themes = require(script.Parent.Themes.init)

-- Components
local Components = require(script.Parent.Components.init)

-- Initialize the library
function _3ex5.init()
    -- Load default theme
    Themes.loadTheme("Default")

    -- Example usage (will be moved to Example.lua later)
    local window = Core.createWindow("3ex5 Library", UDim2.new(0, 400, 0, 300))
    window.Position = UDim2.new(0.5, -window.AbsoluteSize.X/2, 0.5, -window.AbsoluteSize.Y/2)

    local tab = Core.createTab(window, "Main Tab")
    Components.createButton(tab, "Click Me", function()
        print("Button Clicked!")
    end)

    Components.createTextInput(tab, "Type something here...", "", function(text)
        print("Text Input: " .. text)
    end)

    Components.createToggle(tab, "Toggle Feature", false, function(state)
        print("Toggle State: " .. tostring(state))
    end)

    -- Add theme switching example
    local themeNames = Themes.getAvailableThemes()
    local currentThemeIndex = 1

    local themeSwitchButton = Components.createButton(tab, "Next Theme", function()
        currentThemeIndex = currentThemeIndex % #themeNames + 1
        Themes.loadTheme(themeNames[currentThemeIndex])
        -- Re-apply theme to existing UI elements (this would require a more robust system in a real library)
        -- For now, it just changes the theme for newly created elements.
        print("Switched to theme: " .. themeNames[currentThemeIndex])
    end)
    themeSwitchButton.Position = UDim2.new(0, 10, 0, 200)
end

return _3ex5
