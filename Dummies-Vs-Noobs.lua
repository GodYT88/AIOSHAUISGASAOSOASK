local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "Dummies Vs Noobs",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}
local MercuryGUI = GUI.core.AbsoluteObject.Parent
local Main = GUI:Tab{
	Name = "🗿Main🗿",
	Icon = "rbxassetid://8569322835"
}
local Scout = GUI:Tab{
	Name = "💀Scout💀",
	Icon = "rbxassetid://8569322835"
}
local Medic = GUI:Tab{
	Name = "❤Medic❤",
	Icon = "rbxassetid://8569322835"
}
local Recon = GUI:Tab{
	Name = "🔭Recon🔭",
	Icon = "rbxassetid://8569322835"
}
local Assault = GUI:Tab{
	Name = "🔫Assault🔫",
	Icon = "rbxassetid://8569322835"
}
local Engineer = GUI:Tab{
	Name = "🧰Engineer🧰",
	Icon = "rbxassetid://8569322835"
}

Scout:Toggle{
	Name = "Aerorig - Kill All",
	StartingState = false,
	Description = "Use Aerorig To Kill Enemies (Equip Require)",
	Callback = function(state)
        _G.AerorigKill = state
    end
}
Scout:Toggle{
	Name = "INF Jetpack",
	StartingState = false,
	Description = "Like The Function Name You Can Use Inf Jetpack/Terminal Velocity",
	Callback = function(state)
        _G.JetpackMod = state
    end
}

spawn(function()
    while task.wait() do
        if _G.JetpackMod == true then
            local Jetpack = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Jetpack") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Terminal Velocity") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Aerorig") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Jetpack") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Terminal Velocity") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Aerorig")
            if Jetpack and Jetpack.Name ~= "Aerorig" then
                Jetpack:SetAttribute("RefillRate",1000)
                Jetpack:SetAttribute("JetCooldown",0.1)
                Jetpack:SetAttribute("SlamCooldown",0)
            elseif Jetpack and Jetpack.Name == "Aerorig" then
                Jetpack:SetAttribute("FuelInSeconds", math.huge)
                Jetpack:SetAttribute("FuelRegenInSeconds", 0.1)
            end
        end
    end
end)

spawn(function()
    while task.wait() do
    if _G.AerorigKill == true then else return end
    if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool") then else return end
		for i,v in pairs(workspace:GetChildren()) do
			if v:FindFirstChild("DeathFX") then
					local HitPart = v.PrimaryPart or v:FindFirstChild("HumanoidRootPart")
					local HitPart2;
					if v.Name == "APU" then
						HitPart = v:WaitForChild("Pilot",15):WaitForChild("PilotHitbox",15)
					end
					local Humanoid = v:FindFirstChildOfClass("Humanoid")
					if Humanoid and HitPart then
					local Remote = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("VerifyHit")
						repeat task.wait(0.05)
							Remote:FireServer(HitPart,1000)
						until Humanoid.Health <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or A == nil or Remote.Parent.Parent.Name == "Backpack"
					end
			end
		end
    end
end)
