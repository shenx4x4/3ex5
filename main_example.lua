--!strict
loadstring(game:HttpGet("https://raw.githubusercontent.com/shenx4x4/3ex5/refs/heads/master/main.client.lua"))()


local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local _3ex5 = {}
local themes = {
    Default = {bg = Color3.fromRGB(25, 25, 25), accent = Color3.fromRGB(200, 200, 200), text = Color3.fromRGB(255, 255, 255)},
    Light = {bg = Color3.fromRGB(240, 240, 240), accent = Color3.fromRGB(50, 50, 50), text = Color3.fromRGB(0, 0, 0)},
    Blue = {bg = Color3.fromRGB(20, 30, 50), accent = Color3.fromRGB(100, 150, 255), text = Color3.fromRGB(255, 255, 255)},
    Green = {bg = Color3.fromRGB(20, 40, 20), accent = Color3.fromRGB(100, 255, 100), text = Color3.fromRGB(255, 255, 255)},
    Red = {bg = Color3.fromRGB(40, 20, 20), accent = Color3.fromRGB(255, 100, 100), text = Color3.fromRGB(255, 255, 255)},
    Purple = {bg = Color3.fromRGB(30, 20, 40), accent = Color3.fromRGB(200, 100, 255), text = Color3.fromRGB(255, 255, 255)},
    Orange = {bg = Color3.fromRGB(40, 30, 20), accent = Color3.fromRGB(255, 150, 50), text = Color3.fromRGB(255, 255, 255)}
}
local currentTheme = themes.Default
function _3ex5.createWindow(title)
    local sg = Instance.new("ScreenGui", playerGui)
    sg.Name = "3ex5_Demo"
    local main = Instance.new("Frame", sg)
    main.Size = UDim2.new(0, 400, 0, 300)
    main.Position = UDim2.new(0.5, -200, 0.5, -150)
    main.BackgroundColor3 = currentTheme.bg
    main.BackgroundTransparency = 0.3
    main.BorderSizePixel = 0
    local corner = Instance.new("UICorner", main)
    corner.CornerRadius = UDim.new(0, 10)
    local stroke = Instance.new("UIStroke", main)
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Transparency = 0.8
    stroke.Thickness = 1
    local titleBar = Instance.new("Frame", main)
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundTransparency = 1
    local titleLabel = Instance.new("TextLabel", titleBar)
    titleLabel.Size = UDim2.new(1, -80, 1, 0)
    titleLabel.Position = UDim2.new(0, 15, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = currentTheme.text
    titleLabel.TextSize = 18
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    local minimizeBtn = Instance.new("TextButton", titleBar)
    minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
    minimizeBtn.Position = UDim2.new(1, -40, 0, 5)
    minimizeBtn.BackgroundTransparency = 1
    minimizeBtn.Text = "-"
    minimizeBtn.TextColor3 = currentTheme.text
    minimizeBtn.TextSize = 24
    local content = Instance.new("ScrollingFrame", main)
    content.Size = UDim2.new(1, -20, 1, -50)
    content.Position = UDim2.new(0, 10, 0, 45)
    content.BackgroundTransparency = 1
    content.BorderSizePixel = 0
    content.ScrollBarThickness = 2
    local layout = Instance.new("UIListLayout", content)
    layout.Padding = UDim.new(0, 10)
    local dragging, dragInput, dragStart, startPos
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    titleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    local minimized = false
    minimizeBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        local targetSize = minimized and UDim2.new(0, 400, 0, 40) or UDim2.new(0, 400, 0, 300)
        TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = targetSize}):Play()
        content.Visible = not minimized
    end)
    return content
end
local container = _3ex5.createWindow("3ex5 Library Demo")
local function createButton(text, callback)
    local btn = Instance.new("TextButton", container)
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundTransparency = 0.9
    btn.Text = text
    btn.TextColor3 = currentTheme.text
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(callback)
end
createButton("Welcome to 3ex5!", function() print("Hello!") end)
createButton("Glassmorphism Style", function() end)
createButton("Smooth Animations", function() end)
createButton("Non-OOP Structure", function() end)
print("3ex5 Demo Loaded Successfully!")
