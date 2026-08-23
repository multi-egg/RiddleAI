local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AIRiddler"
gui.ResetOnSpawn = false
gui.Parent = player.PlayerGui

local enabled = true

-- Toggle button
local button = Instance.new("TextButton")
button.Size = UDim2.new(0,170,0,55)
button.Position = UDim2.new(0.5,-85,0,20)
button.BackgroundColor3 = Color3.fromRGB(0,200,0)
button.Text = "RIDDLE SOLVER: ON"
button.TextScaled = true
button.Parent = gui

-- Dragging
button.Active = true
button.Draggable = true

-- Toggle ON/OFF
button.MouseButton1Click:Connect(function()
    enabled = not enabled

    if enabled then
        button.Text = "RIDDLE SOLVER: ON"
        button.BackgroundColor3 = Color3.fromRGB(0,200,0)
    else
        button.Text = "RIDDLE SOLVER: OFF"
        button.BackgroundColor3 = Color3.fromRGB(200,0,0)
    end
end)

-- Example function
local function solveRiddle(question)
    question = question:lower()

    if question:find("creepers") then
        return "Minecraft"
    elseif question:find("steve") then
        return "Minecraft"
    elseif question:find("mario") then
        return "Mario"
    end

    return nil
end

-- Read your game's top message
local announcement = player.PlayerGui.RiddleGui.TopMessage -- Change to your TextLabel
local answerBox = player.PlayerGui.RiddleGui.AnswerBox     -- Change to your TextBox

announcement:GetPropertyChangedSignal("Text"):Connect(function()
    if not enabled then return end

    local answer = solveRiddle(announcement.Text)
    if answer then
        answerBox.Text = answer
    end
end)