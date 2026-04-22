--!strict

local Themes = {}

-- Define 7 modern and minimalist glassmorphism themes
local availableThemes = {
    -- Default Theme (Dark Glass)
    Default = {
        WindowBackgroundColor = Color3.new(0.1, 0.1, 0.1),
        WindowBackgroundTransparency = 0.7,
        TitleBarBackgroundColor = Color3.new(0.15, 0.15, 0.15),
        TitleBarBackgroundTransparency = 0.6,
        TitleTextColor = Color3.new(1, 1, 1),
        MinimizeButtonBackgroundColor = Color3.new(0.2, 0.2, 0.2),
        MinimizeButtonTextColor = Color3.new(1, 1, 1),
        TabBackgroundColor = Color3.new(0.1, 0.1, 0.1),
        TabBackgroundTransparency = 0.7,
        TabButtonBackgroundColor = Color3.new(0.2, 0.2, 0.2),
        TabButtonTextColor = Color3.new(0.8, 0.8, 0.8),
        ButtonBackgroundColor = Color3.new(0.25, 0.25, 0.25),
        ButtonTextColor = Color3.new(1, 1, 1),
        -- Add more component specific colors as needed
    },
    -- Light Glass
    Light = {
        WindowBackgroundColor = Color3.new(0.9, 0.9, 0.9),
        WindowBackgroundTransparency = 0.7,
        TitleBarBackgroundColor = Color3.new(0.85, 0.85, 0.85),
        TitleBarBackgroundTransparency = 0.6,
        TitleTextColor = Color3.new(0.1, 0.1, 0.1),
        MinimizeButtonBackgroundColor = Color3.new(0.7, 0.7, 0.7),
        MinimizeButtonTextColor = Color3.new(0.1, 0.1, 0.1),
        TabBackgroundColor = Color3.new(0.9, 0.9, 0.9),
        TabBackgroundTransparency = 0.7,
        TabButtonBackgroundColor = Color3.new(0.8, 0.8, 0.8),
        TabButtonTextColor = Color3.new(0.2, 0.2, 0.2),
        ButtonBackgroundColor = Color3.new(0.75, 0.75, 0.75),
        ButtonTextColor = Color3.new(0.1, 0.1, 0.1),
    },
    -- Blue Glass
    Blue = {
        WindowBackgroundColor = Color3.new(0.1, 0.1, 0.2),
        WindowBackgroundTransparency = 0.7,
        TitleBarBackgroundColor = Color3.new(0.15, 0.15, 0.25),
        TitleBarBackgroundTransparency = 0.6,
        TitleTextColor = Color3.new(1, 1, 1),
        MinimizeButtonBackgroundColor = Color3.new(0.2, 0.2, 0.3),
        MinimizeButtonTextColor = Color3.new(1, 1, 1),
        TabBackgroundColor = Color3.new(0.1, 0.1, 0.2),
        TabBackgroundTransparency = 0.7,
        TabButtonBackgroundColor = Color3.new(0.2, 0.2, 0.3),
        TabButtonTextColor = Color3.new(0.8, 0.8, 0.9),
        ButtonBackgroundColor = Color3.new(0.25, 0.25, 0.35),
        ButtonTextColor = Color3.new(1, 1, 1),
    },
    -- Green Glass
    Green = {
        WindowBackgroundColor = Color3.new(0.1, 0.2, 0.1),
        WindowBackgroundTransparency = 0.7,
        TitleBarBackgroundColor = Color3.new(0.15, 0.25, 0.15),
        TitleBarBackgroundTransparency = 0.6,
        TitleTextColor = Color3.new(1, 1, 1),
        MinimizeButtonBackgroundColor = Color3.new(0.2, 0.3, 0.2),
        MinimizeButtonTextColor = Color3.new(1, 1, 1),
        TabBackgroundColor = Color3.new(0.1, 0.2, 0.1),
        TabBackgroundTransparency = 0.7,
        TabButtonBackgroundColor = Color3.new(0.2, 0.3, 0.2),
        TabButtonTextColor = Color3.new(0.8, 0.9, 0.8),
        ButtonBackgroundColor = Color3.new(0.25, 0.35, 0.25),
        ButtonTextColor = Color3.new(1, 1, 1),
    },
    -- Red Glass
    Red = {
        WindowBackgroundColor = Color3.new(0.2, 0.1, 0.1),
        WindowBackgroundTransparency = 0.7,
        TitleBarBackgroundColor = Color3.new(0.25, 0.15, 0.15),
        TitleBarBackgroundTransparency = 0.6,
        TitleTextColor = Color3.new(1, 1, 1),
        MinimizeButtonBackgroundColor = Color3.new(0.3, 0.2, 0.2),
        MinimizeButtonTextColor = Color3.new(1, 1, 1),
        TabBackgroundColor = Color3.new(0.2, 0.1, 0.1),
        TabBackgroundTransparency = 0.7,
        TabButtonBackgroundColor = Color3.new(0.3, 0.2, 0.2),
        TabButtonTextColor = Color3.new(0.9, 0.8, 0.8),
        ButtonBackgroundColor = Color3.new(0.35, 0.25, 0.25),
        ButtonTextColor = Color3.new(1, 1, 1),
    },
    -- Purple Glass
    Purple = {
        WindowBackgroundColor = Color3.new(0.2, 0.1, 0.2),
        WindowBackgroundTransparency = 0.7,
        TitleBarBackgroundColor = Color3.new(0.25, 0.15, 0.25),
        TitleBarBackgroundTransparency = 0.6,
        TitleTextColor = Color3.new(1, 1, 1),
        MinimizeButtonBackgroundColor = Color3.new(0.3, 0.2, 0.3),
        MinimizeButtonTextColor = Color3.new(1, 1, 1),
        TabBackgroundColor = Color3.new(0.2, 0.1, 0.2),
        TabBackgroundTransparency = 0.7,
        TabButtonBackgroundColor = Color3.new(0.3, 0.2, 0.3),
        TabButtonTextColor = Color3.new(0.9, 0.8, 0.9),
        ButtonBackgroundColor = Color3.new(0.35, 0.25, 0.35),
        ButtonTextColor = Color3.new(1, 1, 1),
    },
    -- Orange Glass
    Orange = {
        WindowBackgroundColor = Color3.new(0.2, 0.15, 0.1),
        WindowBackgroundTransparency = 0.7,
        TitleBarBackgroundColor = Color3.new(0.25, 0.2, 0.15),
        TitleBarBackgroundTransparency = 0.6,
        TitleTextColor = Color3.new(1, 1, 1),
        MinimizeButtonBackgroundColor = Color3.new(0.3, 0.25, 0.2),
        MinimizeButtonTextColor = Color3.new(1, 1, 1),
        TabBackgroundColor = Color3.new(0.2, 0.15, 0.1),
        TabBackgroundTransparency = 0.7,
        TabButtonBackgroundColor = Color3.new(0.3, 0.25, 0.2),
        TabButtonTextColor = Color3.new(0.9, 0.85, 0.8),
        ButtonBackgroundColor = Color3.new(0.35, 0.3, 0.25),
        ButtonTextColor = Color3.new(1, 1, 1),
    },
}

local currentThemeName = "Default"

function Themes.loadTheme(themeName)
    if availableThemes[themeName] then
        currentThemeName = themeName
        print("Theme set to: " .. themeName)
    else
        warn("Theme '" .. themeName .. "' not found. Loading default theme.")
        currentThemeName = "Default"
    end
end

function Themes.getCurrentTheme()
    return availableThemes[currentThemeName]
end

function Themes.getAvailableThemes()
    local themesList = {}
    for name, _ in pairs(availableThemes) do
        table.insert(themesList, name)
    end
    return themesList
end

return Themes
