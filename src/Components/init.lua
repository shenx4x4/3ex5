--!strict

local Components = {}
local Utils = require(script.Parent.Parent.Utils.init)
local Themes = require(script.Parent.Parent.Themes.init)

-- Function to create a generic button
function Components.createButton(parent, text, callback)
    local theme = Themes.getCurrentTheme()
    local button = Utils.createButton(parent, text .. "Button", text, UDim2.new(1, -20, 0, 30), UDim2.new(0, 10, 0, 10), theme.ButtonBackgroundColor, theme.ButtonTextColor, 16, callback)
    Utils.applyGlassmorphism(button)

    -- Add hover effects for smoothness
    local originalBgColor = button.BackgroundColor3
    local originalBgTransparency = button.BackgroundTransparency

    button.MouseEnter:Connect(function()
        Utils.tween(button, {BackgroundColor3 = originalBgColor:Lerp(Color3.new(1,1,1), 0.2), BackgroundTransparency = originalBgTransparency - 0.1}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    end)

    button.MouseLeave:Connect(function()
        Utils.tween(button, {BackgroundColor3 = originalBgColor, BackgroundTransparency = originalBgTransparency}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    end)

    return button
end

-- Function to create a text input field
function Components.createTextInput(parent, placeholderText, initialText, callback)
    local theme = Themes.getCurrentTheme()
    local textBox = Instance.new("TextBox")
    textBox.Name = "TextInput"
    textBox.Size = UDim2.new(1, -20, 0, 30)
    textBox.Position = UDim2.new(0, 10, 0, 50)
    textBox.PlaceholderText = placeholderText or "Enter text..."
    textBox.Text = initialText or ""
    textBox.BackgroundColor3 = theme.ButtonBackgroundColor
    textBox.BackgroundTransparency = theme.ButtonBackgroundTransparency
    textBox.TextColor3 = theme.ButtonTextColor
    textBox.TextSize = 16
    textBox.Font = Enum.Font.Gotham
    textBox.BorderSizePixel = 0
    textBox.Parent = parent
    Utils.applyGlassmorphism(textBox)

    if callback then
        textBox.FocusLost:Connect(function(enterPressed)
            if enterPressed then
                callback(textBox.Text)
            end
        end)
    end

    return textBox
end

-- Function to create a toggle switch
function Components.createToggle(parent, labelText, initialState, callback)
    local theme = Themes.getCurrentTheme()
    local frame = Utils.createFrame(parent, "ToggleFrame", UDim2.new(1, -20, 0, 30), UDim2.new(0, 10, 0, 90), theme.TabBackgroundColor, theme.TabBackgroundTransparency)
    Utils.applyGlassmorphism(frame)

    local label = Utils.createLabel(frame, "ToggleLabel", labelText, UDim2.new(1, -40, 1, 0), UDim2.new(0, 0, 0, 0), theme.TitleTextColor, 16, Enum.TextXAlignment.Left)

    local toggleButton = Utils.createButton(frame, "ToggleButton", "", UDim2.new(0, 30, 0, 20), UDim2.new(1, -35, 0.5, -10), theme.ButtonBackgroundColor, Color3.new(1,1,1), 16)
    toggleButton.BackgroundTransparency = 0.5
    toggleButton.Text = initialState and "ON" or "OFF"
    toggleButton.TextColor3 = initialState and Color3.new(0,1,0) or Color3.new(1,0,0)

    local currentState = initialState or false

    toggleButton.MouseButton1Click:Connect(function()
        currentState = not currentState
        toggleButton.Text = currentState and "ON" or "OFF"
        toggleButton.TextColor3 = currentState and Color3.new(0,1,0) or Color3.new(1,0,0)
        if callback then
            callback(currentState)
        end
    end)

    return frame
end

return Components
