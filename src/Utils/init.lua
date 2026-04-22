--!strict

local Utils = {}

-- Function to apply glassmorphism effect (placeholder for now)
function Utils.applyGlassmorphism(uiElement, blurAmount, transparency)
    -- In Roblox, true glassmorphism with blur is complex without custom shaders.
    -- We'll simulate it with transparency, background color, and a slight border.
    uiElement.BackgroundTransparency = transparency or 0.7
    uiElement.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1) -- Darker background for contrast
    uiElement.BorderSizePixel = 1
    uiElement.BorderColor3 = Color3.new(1, 1, 1) * 0.5 -- Semi-transparent white border
end

-- Function for smooth tweening
function Utils.tween(instance, properties, duration, easingStyle, easingDirection)
    local tweenInfo = TweenInfo.new(duration, easingStyle, easingDirection)
    local tween = game:GetService("TweenService"):Create(instance, tweenInfo, properties)
    tween:Play()
    return tween
end

-- Function to create a basic frame
function Utils.createFrame(parent, name, size, position, backgroundColor, backgroundTransparency)
    local frame = Instance.new("Frame")
    frame.Name = name
    frame.Size = size or UDim2.new(0, 200, 0, 150)
    frame.Position = position or UDim2.new(0.5, -100, 0.5, -75)
    frame.BackgroundColor3 = backgroundColor or Color3.new(0.2, 0.2, 0.2)
    frame.BackgroundTransparency = backgroundTransparency or 0.5
    frame.BorderSizePixel = 0
    frame.Parent = parent
    return frame
end

-- Function to create a text label
function Utils.createLabel(parent, name, text, size, position, textColor, textSize, textXAlignment, textYAlignment)
    local label = Instance.new("TextLabel")
    label.Name = name
    label.Text = text
    label.Size = size or UDim2.new(1, 0, 0, 30)
    label.Position = position or UDim2.new(0, 0, 0, 0)
    label.TextColor3 = textColor or Color3.new(1, 1, 1)
    label.TextSize = textSize or 18
    label.Font = Enum.Font.GothamBold
    label.BackgroundTransparency = 1
    label.TextXAlignment = textXAlignment or Enum.TextXAlignment.Left
    label.TextYAlignment = textYAlignment or Enum.TextYAlignment.Center
    label.Parent = parent
    return label
end

-- Function to create a text button
function Utils.createButton(parent, name, text, size, position, backgroundColor, textColor, textSize, callback)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Text = text
    button.Size = size or UDim2.new(1, 0, 0, 30)
    button.Position = position or UDim2.new(0, 0, 0, 0)
    button.BackgroundColor3 = backgroundColor or Color3.new(0.3, 0.3, 0.3)
    button.BackgroundTransparency = 0.5
    button.TextColor3 = textColor or Color3.new(1, 1, 1)
    button.TextSize = textSize or 16
    button.Font = Enum.Font.Gotham
    button.BorderSizePixel = 0
    button.Parent = parent
    if callback then
        button.MouseButton1Click:Connect(callback)
    end
    return button
end

return Utils
