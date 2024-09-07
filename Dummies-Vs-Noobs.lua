-- Dummies Vs Noobs GUI - Original
local Gui;
game.CoreGui.ChildAdded:Once(function(v)
	Gui = v
end)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Dummies Vs Noobs", "DarkTheme")
local Main = Window:NewTab("🗿Main🗿")
local Scout = Window:NewTab("💀Scout💀")
local Medic = Window:NewTab("❤Medic❤")
local Recon = Window:NewTab("🔭Recon🔭")
local Assault = Window:NewTab("🔫Assault🔫")
local Engineer = Window:NewTab("🧰Engineer🧰")
local ScoutSection = Scout:NewSection("Scout")
local MainSection = Main:NewSection("Main")

MainSection:NewToggle("Fast Revive", "Fast Revive", function(state)
    _G.FastRevive = state
end)
MainSection:NewToggle("No Spread", "No Spread", function(state)
    _G.NoSpraed = state
end)
ScoutSection:NewToggle("Aerorig Kill", "Kill All Enemies Using Aerorig (Equip Needed)", function(state)
    _G.AerorigKill = state
end)
ScoutSection:NewToggle("Inf Jetpack", "Infinity Jetpack", function(state)
    _G.JetpackMod = state
end)

spawn(function()
    while task.wait(0.25) do
        if _G.StopAll == true then _G.JetpackMod = nil break end
        if _G.JetpackMod == true then
            local Jetpack = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Jetpack") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Terminal Velocity") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Aerorig") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Jetpack") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Terminal Velocity") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Aerorig")
            if Jetpack then
                Jetpack:SetAttribute("RefillRate",1000)
                Jetpack:SetAttribute("JetCooldown",0.1)
                Jetpack:SetAttribute("SlamCooldown",0)
                Jetpack:SetAttribute("FuelInSeconds", math.huge)
                Jetpack:SetAttribute("FuelRegenInSeconds", 0.1)
            end
        end
    end
end)

spawn(function()
    while task.wait(0.1) do
    if _G.StopAll == true then _G.AerorigKill = nil break end
    if _G.AerorigKill == true then
        if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool") then
            for i,v in pairs(workspace:GetChildren()) do
                if v:FindFirstChild("DeathFX") then
                        local Enemy = v
                        local HitPart = v.PrimaryPart or v:FindFirstChild("HumanoidRootPart")
                        local HitPart2;
                        if v.Name == "APU" then
                            HitPart = v:WaitForChild("Pilot",15):WaitForChild("PilotHitbox",15)
                        end
                        local Humanoid = v:FindFirstChildOfClass("Humanoid")
                        if Humanoid and HitPart then
                        local Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
                        if not Tool then return end
                        local Remote = Tool:WaitForChild("VerifyHit",15)
                        if Remote and Tool then else return end
                            repeat
                                task.wait()
                                if Tool.Name == "Aerorig" then
                                    Remote:FireServer(HitPart,1000)
                                elseif Tool:GetAttribute("Class") == "Melee" then
                                    if HitPart.Name ~= "Head" then if Enemy:FindFirstChild("Head") then HitPart = Enemy.Head end end
                                    Remote:FireServer(HitPart,1000)
                                    task.wait(0.5)
                                elseif Tool:GetAttribute("Class") == "Gun" then
                                    if HitPart.Name ~= "Head" then if Enemy:FindFirstChild("Head") then HitPart = Enemy.Head end end
                                    Remote:FireServer(HitPart,HitPart.Position,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position)
                                    task.wait(0.1)
                                end
                            until Humanoid.Health <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or Tool.Parent.Name == "Backpack"
                        end
                    end
                end
            end
        end
    end
end)

spawn(function()
    while task.wait(0.25) do
        if _G.StopAll == true then _G.FastRevive = nil break end
        if _G.FastRevive == true then
            if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool") and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"):GetAttribute("RegularReviveTime") ~= nil then
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"):SetAttribute("RegularReviveTime",0.1)
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"):SetAttribute("MangledReviveTime",0.1)
            end
        end
    end
end)

spawn(function()
    while task.wait(0.25) do
        if _G.StopAll == true then _G.NoSpread = nil break end
        if _G.NoSpread == true and game:GetService("Players").LocalPlayer:FindFirstChild("Backpack") then
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if v:GetAttribute("Spread") ~= nil then
                    v:SetAttribute("Spread",0)
                end
            end
        end
    end
end)

local Delay2 = false
local leftFrame = game:GetService("CoreGui").TopBarApp.TopBarFrame.LeftFrame
local chatIconSize = leftFrame.ChatIcon.Size
local camera = workspace.CurrentCamera
local screenSize = camera.ViewportSize
local imageButton = Instance.new("ImageButton")
imageButton.Size = chatIconSize
local chatIconPositionX = leftFrame.ChatIcon.Position.X.Offset
local middlePositionX = (screenSize.X - chatIconSize.X.Offset) / 2

imageButton.Position = UDim2.new(0, middlePositionX, 0.5, 0)
imageButton.AnchorPoint = Vector2.new(0, 0.5)
imageButton.Image = "rbxassetid://14420244942"
imageButton.BackgroundTransparency = 0
imageButton.ZIndex = 2
imageButton.Parent = leftFrame.Parent

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 15)
uiCorner.Parent = imageButton

imageButton.Activated:Connect(function()
    if Delay2 == false then
        Delay2 = true
        if Gui then
            Gui.Enabled = not Gui.Enabled
        end
        task.wait()
        Delay2 = false
    end
end)

Gui.Destroying:Once(function()
	imageButton:Destroy()
    _G.StopAll = true
    task.wait(3)
    _G.StopAll = nil
end)
