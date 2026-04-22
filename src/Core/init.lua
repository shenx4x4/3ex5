--!strict

local Core = {}
local Utils = require(script.Parent.Parent.Utils.init)
local Themes = require(script.Parent.Parent.Themes.init)

-- Function to create a draggable window
function Core.createWindow(title, size)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "_3ex5_ScreenGui"
    screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    local windowFrame = Utils.createFrame(screenGui, "Window", size, nil, Themes.getCurrentTheme().WindowBackgroundColor, Themes.getCurrentTheme().WindowBackgroundTransparency)
    Utils.applyGlassmorphism(windowFrame)

    local titleBar = Utils.createFrame(windowFrame, "TitleBar", UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 0), Themes.getCurrentTheme().TitleBarBackgroundColor, Themes.getCurrentTheme().TitleBarBackgroundTransparency)
    Utils.applyGlassmorphism(titleBar)

    local titleLabel = Utils.createLabel(titleBar, "TitleLabel", title, UDim2.new(1, -60, 1, 0), UDim2.new(0, 5, 0, 0), Themes.getCurrentTheme().TitleTextColor, 18, Enum.TextXAlignment.Left)

    -- Draggable functionality
    local dragging
    local dragInput
    local initialPosition

    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragInput = input
            initialPosition = UDim2.new(windowFrame.Position.X.Scale, windowFrame.Position.X.Offset, windowFrame.Position.Y.Scale, windowFrame.Position.Y.Offset) - UDim2.new(0, input.Position.X, 0, input.Position.Y)
        end
    end)

    titleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            dragInput = nil
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local newX = input.Position.X + initialPosition.X.Offset
            local newY = input.Position.Y + initialPosition.Y.Offset
            windowFrame.Position = UDim2.new(0, newX, 0, newY)
        end
    end)

    -- Minimize button
    local minimizeButton = Utils.createButton(titleBar, "MinimizeButton", "_", UDim2.new(0, 30, 1, 0), UDim2.new(1, -30, 0, 0), Themes.getCurrentTheme().MinimizeButtonBackgroundColor, Themes.getCurrentTheme().MinimizeButtonTextColor, 18)
    minimizeButton.TextXAlignment = Enum.TextXAlignment.Center
    minimizeButton.TextYAlignment = Enum.TextYAlignment.Center

    local isMinimized = false
    local originalSize = windowFrame.Size
    local originalPosition = windowFrame.Position

    minimizeButton.MouseButton1Click:Connect(function()
        if not isMinimized then
            Utils.tween(windowFrame, {Size = UDim2.new(0, windowFrame.AbsoluteSize.X, 0, titleBar.AbsoluteSize.Y)}, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            isMinimized = true
        else
            Utils.tween(windowFrame, {Size = originalSize}, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            isMinimized = false
        end
    end)

    return windowFrame
end

-- Function to create a tab container
function Core.createTab(parentWindow, tabName)
    local tabFrame = Utils.createFrame(parentWindow, tabName .. "Tab", UDim2.new(1, 0, 1, -30), UDim2.new(0, 0, 0, 30), Themes.getCurrentTheme().TabBackgroundColor, Themes.getCurrentTheme().TabBackgroundTransparency)
    Utils.applyGlassmorphism(tabFrame)

    -- Placeholder for tab button (to be implemented in Components)
    local tabButton = Utils.createButton(parentWindow, tabName .. "TabButton", tabName, UDim2.new(0, 100, 0, 30), UDim2.new(0, 0, 0, 0), Themes.getCurrentTheme().TabButtonBackgroundColor, Themes.getCurrentTheme().TabButtonTextColor, 16)
    tabButton.Parent = parentWindow.TitleBar -- Attach to title bar for now, proper tab system later

    tabButton.MouseButton1Click:Connect(function()
        -- Logic to switch tabs (hide/show tabFrame)
        for _, child in ipairs(parentWindow:GetChildren()) do
            if child:IsA("Frame") and string.find(child.Name, "Tab") and child ~= tabFrame then
                child.Visible = false
            end
        end
        tabFrame.Visible = true
    end)

    return tabFrame
end

-- Function to create a simple button
function Core.createButton(parent, text, callback)
    local button = Utils.createButton(parent, text .. "Button", text, UDim2.new(1, -20, 0, 30), UDim2.new(0, 10, 0, 10), Themes.getCurrentTheme().ButtonBackgroundColor, Themes.getCurrentTheme().ButtonTextColor, 16, callback)
    Utils.applyGlassmorphism(button)
    return button
end

return Core
