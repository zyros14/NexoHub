local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local LogService = game:GetService("LogService")
local TeleportService = game:GetService("TeleportService")
local Workspace = game:GetService("Workspace")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HRP = Character:WaitForChild("HumanoidRootPart")

Player.CharacterAdded:Connect(function(char)
	Character = char
	Humanoid = char:WaitForChild("Humanoid")
	HRP = char:WaitForChild("HumanoidRootPart")
end)

local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF_ = Remotes:WaitForChild("CommF_")
local CommE_ = Remotes:WaitForChild("CommE_")
local CommF = Remotes:WaitForChild("CommF")
local RigControllerEvent = Remotes:WaitForChild("RigControllerEvent")
local Validator = Remotes:WaitForChild("Validator")
local Validator2 = Remotes:WaitForChild("Validator2")
local NetModule = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
local RegisterAttack = NetModule:WaitForChild("RE"):WaitForChild("RegisterAttack")
local RegisterHit = NetModule:WaitForChild("RE"):WaitForChild("RegisterHit")
local ReadPlayerData = NetModule:WaitForChild("RF"):WaitForChild("ReadPlayerData")
local ParryRemote = Remotes:WaitForChild("ParrySuccess")
local ParrySuccessAll = Remotes:WaitForChild("ParrySuccessAll")
local QuestUpdate = Remotes:WaitForChild("QuestUpdate")
local RefreshQuestPro = Remotes:WaitForChild("RefreshQuestPro")
local RefreshBartiloQuestPro = Remotes:WaitForChild("RefreshBartiloQuestPro")
local RefreshDressrosaQuestPro = Remotes:WaitForChild("RefreshDressrosaQuestPro")
local RefreshZQuestPro = Remotes:WaitForChild("RefreshZQuestPro")
local RefreshCitizenQuestPro = Remotes:WaitForChild("RefreshCitizenQuestPro")
local RefreshHauntedPuzzlePro = Remotes:WaitForChild("RefreshHauntedPuzzlePro")
local ChestRemote = Remotes:WaitForChild("Chest")
local BreakTree = Remotes:WaitForChild("BreakTree")
local SendMoney = Remotes:WaitForChild("SendMoney")
local TradeFunction = Remotes:WaitForChild("TradeFunction")
local SalesFunction = Remotes:WaitForChild("SalesFunction")
local Crew = Remotes:WaitForChild("Crew")
local FriendFinder = Remotes:WaitForChild("FriendFinder")
local Raids = Remotes:WaitForChild("Raids")
local Redeem = Remotes:WaitForChild("Redeem")
local ChangeSetting = Remotes:WaitForChild("ChangeSetting")
local StatsRemote = Remotes:WaitForChild("Stats")
local FX = Remotes:WaitForChild("FX")
local Sound = Remotes:WaitForChild("Sound")
local TeleportVip = Remotes:WaitForChild("TeleportVip")
local CheckTeleportGlitchFix = Remotes:WaitForChild("CheckTeleportGlitchFix")
local RoomManager = Remotes:WaitForChild("RoomManager")
local Location = Remotes:WaitForChild("Location")
local Ship = Remotes:WaitForChild("Ship")
local ShipServiceEvent = Remotes:WaitForChild("ShipServiceEvent")
local ShipServiceUnreliableEvent = Remotes:WaitForChild("ShipServiceUnreliableEvent")
local BlockPart = Remotes:WaitForChild("BlockPart")
local Leviathan = Remotes:WaitForChild("Leviathan")
local DangerDistance = Remotes:WaitForChild("DangerDistance")

local CombatFramework = Player.PlayerScripts:WaitForChild("CombatFramework")
local CFRig = ReplicatedStorage:WaitForChild("CombatFramework")
local RigLib = CFRig:WaitForChild("RigLib")
local CombatModule = getupvalue(require(CombatFramework), 2)
local LibModule = require(RigLib)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("NexoHub - Zyros", "Sentinel")

getgenv().Settings = {
	AutoFarmLevel = false,
	AutoFarmMastery = false,
	AutoFarmNearest = false,
	AutoFarmBosses = false,
	AutoChest = false,
	AutoSeaBeast = false,
	AutoStoreFruit = false,
	AutoSetTeam = false,
	SelectedTeam = "Pirates",
	FastAttack = true,
	BringMobs = true,
	BringDistance = 500,
	AttackDistance = 60,
	TweenSpeed = 300,
	SelectWeapon = "Melee",
	SelectStat = "Melee",
	StatPoints = 1,
	SelectSea = "Sea 1",
}

local FruitCodes = {
	"Rocket-Rocket", "Spin-Spin", "Chop-Chop", "Spring-Spring",
	"Bomb-Bomb", "Smoke-Smoke", "Spike-Spike", "Flame-Flame",
	"Falcon-Falcon", "Ice-Ice", "Sand-Sand", "Dark-Dark",
	"Light-Light", "Rubber-Rubber", "Barrier-Barrier", "Magma-Magma",
	"Quake-Quake", "Buddha-Buddha", "Love-Love", "Spider-Spider",
	"Sound-Sound", "Phoenix-Phoenix", "Portal-Portal", "Rumble-Rumble",
	"Pain-Pain", "Blizzard-Blizzard", "Gravity-Gravity", "Mammoth-Mammoth",
	"T-Rex-T-Rex", "Dough-Dough", "Shadow-Shadow", "Venom-Venom",
	"Control-Control", "Spirit-Spirit", "Dragon-Dragon", "Leopard-Leopard",
	"Kitsune-Kitsune", "Ghost-Ghost", "Diamond-Diamond",
}

local Utils = {}

function Utils.IsAlive(char)
	if not char then return false end
	local hum = char:FindFirstChildOfClass("Humanoid")
	return hum and hum.Health > 0
end

function Utils.FireRemote(...)
	return CommF_:InvokeServer(...)
end

function Utils.GetLevel()
	local data = Player:FindFirstChild("Data")
	if data and data:FindFirstChild("Level") then
		return data.Level.Value
	end
	return 1
end

function Utils.DistanceFromCharacter(position)
	if HRP then
		return (HRP.Position - position).Magnitude
	end
	return math.huge
end

function Utils.GetNearestEnemy()
	local nearest = nil
	local dist = math.huge
	for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
		if Utils.IsAlive(enemy) and enemy:FindFirstChild("HumanoidRootPart") then
			local mag = Utils.DistanceFromCharacter(enemy.HumanoidRootPart.Position)
			if mag < dist then
				dist = mag
				nearest = enemy
			end
		end
	end
	return nearest
end

function Utils.GetEnemiesInWorkspace()
	return Workspace:FindFirstChild("Enemies") and Workspace.Enemies:GetChildren() or {}
end

function Utils.IsEnemyAlive(enemy)
	return Utils.IsAlive(enemy) and enemy:FindFirstChild("HumanoidRootPart")
end

function Utils.EquipWeapon(name)
	for _, tool in pairs(Player.Backpack:GetChildren()) do
		if tool:IsA("Tool") and (name == "" or tool.Name:find(name)) then
			if tool.ToolTip == "Melee" or tool.ToolTip == "Sword" or tool.ToolTip == "Gun" or tool.ToolTip == "Blox Fruit" then
				Character.Humanoid:EquipTool(tool)
				return tool
			end
		end
	end
	for _, tool in pairs(Player.Backpack:GetChildren()) do
		if tool:IsA("Tool") then
			Character.Humanoid:EquipTool(tool)
			return tool
		end
	end
	return nil
end

function Utils.GetSelectedWeapon()
	for _, tool in pairs(Character:GetChildren()) do
		if tool:IsA("Tool") then
			return tool
		end
	end
	local current = Settings.SelectWeapon
	for _, tool in pairs(Player.Backpack:GetChildren()) do
		if tool:IsA("Tool") and tool.ToolTip == current then
			Character.Humanoid:EquipTool(tool)
			return tool
		end
	end
	for _, tool in pairs(Player.Backpack:GetChildren()) do
		if tool:IsA("Tool") then
			Character.Humanoid:EquipTool(tool)
			return tool
		end
	end
	return nil
end

function Utils.HasItemInBackpack(name)
	for _, item in pairs(Player.Backpack:GetChildren()) do
		if item.Name == name then return item end
	end
	return nil
end

local Movement = {}

function Movement.Teleport(cframe)
	if HRP then
		HRP.CFrame = cframe
	end
end

function Movement.TweenTo(cframe)
	if not HRP then return end
	local distance = (HRP.Position - cframe.Position).Magnitude
	local speed = Settings.TweenSpeed or 300
	local time = distance / speed
	local tween = TweenService:Create(
		HRP,
		TweenInfo.new(time, Enum.EasingStyle.Linear),
		{CFrame = cframe}
	)
	tween:Play()
	return tween
end

local Combat = {}

function Combat.BladeHitAttack()
	if not Utils.IsAlive(Character) then return end
	local weapon = Utils.GetSelectedWeapon()
	if not weapon then return end
	local AC = CombatModule.activeController
	if not AC then return end
	if AC.blades and #AC.blades > 0 then
		local bladeHits = LibModule.getBladeHits(Character, AC.blades, (Settings.AttackDistance or 60))
		if #bladeHits > 0 then
			local Val1 = getupvalue(AC.attack, 5)
			local Val2 = getupvalue(AC.attack, 6)
			local Val3 = getupvalue(AC.attack, 4)
			local Val4 = getupvalue(AC.attack, 7)
			local Val5 = ((Val1 * 798405 + Val3 * 727595) % Val2)
			local Val6 = (Val3 * 798405)
			Val5 = ((Val5 * Val2 + Val6) % 1099511627776)
			Val1 = (math.floor(Val5 / Val2))
			Val3 = (Val5 - Val1 * Val2)
			Val4 = (Val4 + 1)
			setupvalue(AC.attack, 5, Val1)
			setupvalue(AC.attack, 6, Val2)
			setupvalue(AC.attack, 4, Val3)
			setupvalue(AC.attack, 7, Val4)
			local Blade = AC.currentWeaponModel
			if typeof(Blade) == "Instance" then
				AC.animator.anims.basic[1]:Play()
				RigControllerEvent:FireServer("weaponChange", Blade.Name)
				Validator:FireServer(math.floor(Val5 / 1099511627776 * 16777215), Val4)
				RigControllerEvent:FireServer("hit", bladeHits, 1, "")
			end
		end
	end
end

function Combat.ClickAttack()
	if not Utils.IsAlive(Character) then return end
	if Settings.FastAttack then
		Combat.BladeHitAttack()
	else
		VirtualUser:CaptureController()
		VirtualUser:Button1Down(Vector2.new(1e4, 1e4))
	end
end

function Combat.BringMob(enemy, distance)
	distance = distance or Settings.BringDistance
	for _, mob in pairs(Utils.GetEnemiesInWorkspace()) do
		if mob.Name == enemy.Name and Utils.IsEnemyAlive(mob) then
			local hum = mob:FindFirstChild("Humanoid")
			if hum then
				hum.WalkSpeed = 0
				hum:ChangeState(14)
				if hum:FindFirstChild("Animator") then
					hum.Animator:Destroy()
				end
			end
			local pp = mob.PrimaryPart
			if pp and enemy.PrimaryPart then
				pp.CanCollide = false
				pp.Size = Vector3.new(50, 50, 50)
				local mag = (enemy.PrimaryPart.Position - pp.Position).Magnitude
				if mag > 1 and mag < distance then
					pp.CFrame = enemy.PrimaryPart.CFrame
				end
			end
			sethiddenproperty(Player, "SimulationRadius", math.huge)
		end
	end
end

task.spawn(function()
	while task.wait() do
		if getgenv().Settings.FastAttack then
			pcall(function()
				local AC = CombatModule.activeController
				if AC then
					AC.timeToNextAttack = 0
					AC.attacking = false
					AC.timeToNextBlock = 0
					AC.increment = 4
					AC.blocking = false
					AC.humanoid.AutoRotate = true
				end
			end)
		end
	end
end)

local QuestData = {}

QuestData.Sea1 = {
	{Level = 1, Name = "Bandit", QuestName = "QuestTier1", QuestNumber = 1, CFrameQuest = CFrame.new(1060, 16, 1548), CFrameMob = CFrame.new(1085, 16, 1585)},
	{Level = 10, Name = "Monkey", QuestName = "JungleQuest", QuestNumber = 1, CFrameQuest = CFrame.new(-1598, 37, 153), CFrameMob = CFrame.new(-1602, 37, 153)},
	{Level = 15, Name = "Gorilla", QuestName = "JungleQuest", QuestNumber = 2, CFrameQuest = CFrame.new(-1598, 37, 153), CFrameMob = CFrame.new(-1278, 19, -460)},
	{Level = 22, Name = "Pirate", QuestName = "BuggyQuest1", QuestNumber = 1, CFrameQuest = CFrame.new(-1140, 4, 3828), CFrameMob = CFrame.new(-1140, 4, 3828)},
	{Level = 30, Name = "Brute", QuestName = "BuggyQuest1", QuestNumber = 2, CFrameQuest = CFrame.new(-1140, 4, 3828), CFrameMob = CFrame.new(-1140, 4, 3828)},
	{Level = 40, Name = "Desert Bandit", QuestName = "DesertQuest", QuestNumber = 1, CFrameQuest = CFrame.new(897, 6, 4389), CFrameMob = CFrame.new(897, 6, 4389)},
	{Level = 45, Name = "Desert Officer", QuestName = "DesertQuest", QuestNumber = 2, CFrameQuest = CFrame.new(897, 6, 4389), CFrameMob = CFrame.new(1572, 4, 4397)},
	{Level = 50, Name = "Snow Bandit", QuestName = "SnowQuest", QuestNumber = 1, CFrameQuest = CFrame.new(606, 401, -5371), CFrameMob = CFrame.new(606, 401, -5371)},
	{Level = 60, Name = "Snowman", QuestName = "SnowQuest", QuestNumber = 2, CFrameQuest = CFrame.new(606, 401, -5371), CFrameMob = CFrame.new(606, 401, -5371)},
	{Level = 75, Name = "Chief Petty Officer", QuestName = "MarineQuest2", QuestNumber = 1, CFrameQuest = CFrame.new(-5036, 28, 4324), CFrameMob = CFrame.new(-5036, 28, 4324)},
	{Level = 90, Name = "Sky Bandit", QuestName = "SkyQuest", QuestNumber = 1, CFrameQuest = CFrame.new(-4842, 717, -2620), CFrameMob = CFrame.new(-4842, 717, -2620)},
	{Level = 100, Name = "Dark Master", QuestName = "SkyQuest", QuestNumber = 2, CFrameQuest = CFrame.new(-4842, 717, -2620), CFrameMob = CFrame.new(-4842, 717, -2620)},
	{Level = 120, Name = "Prisoner", QuestName = "PrisonerQuest", QuestNumber = 1, CFrameQuest = CFrame.new(5308, 1, 475), CFrameMob = CFrame.new(5308, 1, 475)},
	{Level = 145, Name = "Dangerous Prisoner", QuestName = "PrisonerQuest", QuestNumber = 2, CFrameQuest = CFrame.new(5308, 1, 475), CFrameMob = CFrame.new(5308, 1, 475)},
	{Level = 150, Name = "Toga Warrior", QuestName = "ColosseumQuest", QuestNumber = 1, CFrameQuest = CFrame.new(-1576, 7, -2987), CFrameMob = CFrame.new(-1576, 7, -2987)},
	{Level = 175, Name = "Gladiator", QuestName = "ColosseumQuest", QuestNumber = 2, CFrameQuest = CFrame.new(-1576, 7, -2987), CFrameMob = CFrame.new(-1576, 7, -2987)},
	{Level = 190, Name = "Military Soldier", QuestName = "MagmaQuest", QuestNumber = 1, CFrameQuest = CFrame.new(-5313, 12, 8515), CFrameMob = CFrame.new(-5313, 12, 8515)},
	{Level = 200, Name = "Military Spy", QuestName = "MagmaQuest", QuestNumber = 2, CFrameQuest = CFrame.new(-5313, 12, 8515), CFrameMob = CFrame.new(-5803, 86, 8829)},
	{Level = 225, Name = "Fishman Warrior", QuestName = "FishmanQuest", QuestNumber = 1, CFrameQuest = CFrame.new(61123, 18, 1569), CFrameMob = CFrame.new(61123, 18, 1569)},
	{Level = 250, Name = "Fishman Commando", QuestName = "FishmanQuest", QuestNumber = 2, CFrameQuest = CFrame.new(61123, 18, 1569), CFrameMob = CFrame.new(61123, 18, 1569)},
	{Level = 275, Name = "God's Guard", QuestName = "SkyExp1Quest", QuestNumber = 1, CFrameQuest = CFrame.new(-4722, 845, -1950), CFrameMob = CFrame.new(-4722, 845, -1950)},
	{Level = 300, Name = "Shanda", QuestName = "SkyExp1Quest", QuestNumber = 2, CFrameQuest = CFrame.new(-7859, 5544, -381), CFrameMob = CFrame.new(-7678, 5566, -497)},
	{Level = 325, Name = "Royal Squad", QuestName = "SkyExp2Quest", QuestNumber = 1, CFrameQuest = CFrame.new(-7905, 5636, -1413), CFrameMob = CFrame.new(-7905, 5636, -1413)},
	{Level = 350, Name = "Royal Soldier", QuestName = "SkyExp2Quest", QuestNumber = 2, CFrameQuest = CFrame.new(-7905, 5636, -1413), CFrameMob = CFrame.new(-7905, 5636, -1413)},
	{Level = 375, Name = "Galley Pirate", QuestName = "FountainQuest", QuestNumber = 1, CFrameQuest = CFrame.new(5256, 38, 4049), CFrameMob = CFrame.new(5256, 38, 4049)},
	{Level = 400, Name = "Galley Captain", QuestName = "FountainQuest", QuestNumber = 2, CFrameQuest = CFrame.new(5256, 38, 4049), CFrameMob = CFrame.new(5256, 38, 4049)},
}

QuestData.Sea2 = {
	{Level = 700, Name = "Raider", QuestName = "Area1Quest", QuestNumber = 1, CFrameQuest = CFrame.new(-424, 73, 1836), CFrameMob = CFrame.new(-424, 73, 1836)},
	{Level = 725, Name = "Mercenary", QuestName = "Area1Quest", QuestNumber = 2, CFrameQuest = CFrame.new(-424, 73, 1836), CFrameMob = CFrame.new(-424, 73, 1836)},
	{Level = 775, Name = "Swan Pirate", QuestName = "Area2Quest", QuestNumber = 1, CFrameQuest = CFrame.new(636, 73, 918), CFrameMob = CFrame.new(636, 73, 918)},
	{Level = 800, Name = "Factory Staff", QuestName = "Area2Quest", QuestNumber = 2, CFrameQuest = CFrame.new(636, 73, 918), CFrameMob = CFrame.new(636, 73, 918)},
	{Level = 875, Name = "Marine Lieutenant", QuestName = "MarineQuest3", QuestNumber = 1, CFrameQuest = CFrame.new(-2442, 73, -3219), CFrameMob = CFrame.new(-2442, 73, -3219)},
	{Level = 900, Name = "Marine Captain", QuestName = "MarineQuest3", QuestNumber = 2, CFrameQuest = CFrame.new(-2442, 73, -3219), CFrameMob = CFrame.new(-2442, 73, -3219)},
	{Level = 950, Name = "Zombie", QuestName = "ZombieQuest", QuestNumber = 1, CFrameQuest = CFrame.new(-5494, 48, -794), CFrameMob = CFrame.new(-5494, 48, -794)},
	{Level = 975, Name = "Vampire", QuestName = "ZombieQuest", QuestNumber = 2, CFrameQuest = CFrame.new(-5494, 48, -794), CFrameMob = CFrame.new(-5494, 48, -794)},
	{Level = 1000, Name = "Snow Trooper", QuestName = "SnowMountainQuest", QuestNumber = 1, CFrameQuest = CFrame.new(609, 400, -5371), CFrameMob = CFrame.new(609, 400, -5371)},
	{Level = 1050, Name = "Winter Warrior", QuestName = "SnowMountainQuest", QuestNumber = 2, CFrameQuest = CFrame.new(609, 400, -5371), CFrameMob = CFrame.new(609, 400, -5371)},
	{Level = 1100, Name = "Lab Subordinate", QuestName = "IceSideQuest", QuestNumber = 1, CFrameQuest = CFrame.new(-6061, 15, -4904), CFrameMob = CFrame.new(-6061, 15, -4904)},
	{Level = 1125, Name = "Horned Warrior", QuestName = "IceSideQuest", QuestNumber = 2, CFrameQuest = CFrame.new(-6061, 15, -4904), CFrameMob = CFrame.new(-6061, 15, -4904)},
	{Level = 1175, Name = "Magma Ninja", QuestName = "FireSideQuest", QuestNumber = 1, CFrameQuest = CFrame.new(-5500, 16, -5300), CFrameMob = CFrame.new(-5500, 16, -5300)},
	{Level = 1200, Name = "Lava Pirate", QuestName = "FireSideQuest", QuestNumber = 2, CFrameQuest = CFrame.new(-5500, 16, -5300), CFrameMob = CFrame.new(-5500, 16, -5300)},
	{Level = 1250, Name = "Ship Deckhand", QuestName = "ShipQuest1", QuestNumber = 1, CFrameQuest = CFrame.new(1039, 125, 32912), CFrameMob = CFrame.new(1039, 125, 32912)},
	{Level = 1275, Name = "Ship Engineer", QuestName = "ShipQuest1", QuestNumber = 2, CFrameQuest = CFrame.new(1039, 125, 32912), CFrameMob = CFrame.new(1039, 125, 32912)},
	{Level = 1300, Name = "Ship Steward", QuestName = "ShipQuest2", QuestNumber = 1, CFrameQuest = CFrame.new(970, 125, 33245), CFrameMob = CFrame.new(970, 125, 33245)},
	{Level = 1325, Name = "Ship Officer", QuestName = "ShipQuest2", QuestNumber = 2, CFrameQuest = CFrame.new(970, 125, 33245), CFrameMob = CFrame.new(970, 125, 33245)},
	{Level = 1350, Name = "Arctic Warrior", QuestName = "FrostQuest", QuestNumber = 1, CFrameQuest = CFrame.new(5668, 26, -6484), CFrameMob = CFrame.new(5668, 26, -6484)},
	{Level = 1400, Name = "Snow Lurker", QuestName = "FrostQuest", QuestNumber = 2, CFrameQuest = CFrame.new(5668, 26, -6484), CFrameMob = CFrame.new(5668, 26, -6484)},
	{Level = 1425, Name = "Sea Soldier", QuestName = "ForgottenQuest", QuestNumber = 1, CFrameQuest = CFrame.new(-3053, 236, -10144), CFrameMob = CFrame.new(-3053, 236, -10144)},
	{Level = 1475, Name = "Water Fighter", QuestName = "ForgottenQuest", QuestNumber = 2, CFrameQuest = CFrame.new(-3053, 236, -10144), CFrameMob = CFrame.new(-3053, 236, -10144)},
}

QuestData.Sea3 = {
	{Level = 1500, Name = "Pirate Millionaire", QuestName = "PiratePortQuest", QuestNumber = 1, CFrameQuest = CFrame.new(-290, 47, 5581), CFrameMob = CFrame.new(-290, 47, 5581)},
	{Level = 1525, Name = "Pistol Billionaire", QuestName = "PiratePortQuest", QuestNumber = 2, CFrameQuest = CFrame.new(-290, 47, 5581), CFrameMob = CFrame.new(-290, 47, 5581)},
	{Level = 1550, Name = "Dragon Crew Warrior", QuestName = "AmazonQuest", QuestNumber = 1, CFrameQuest = CFrame.new(5832, 51, -1101), CFrameMob = CFrame.new(5832, 51, -1101)},
	{Level = 1575, Name = "Dragon Crew Archer", QuestName = "AmazonQuest", QuestNumber = 2, CFrameQuest = CFrame.new(5832, 51, -1101), CFrameMob = CFrame.new(5832, 51, -1101)},
	{Level = 1600, Name = "Female Islander", QuestName = "AmazonQuest2", QuestNumber = 1, CFrameQuest = CFrame.new(5448, 602, 749), CFrameMob = CFrame.new(5448, 602, 749)},
	{Level = 1625, Name = "Giant Islander", QuestName = "AmazonQuest2", QuestNumber = 2, CFrameQuest = CFrame.new(5448, 602, 749), CFrameMob = CFrame.new(5448, 602, 749)},
	{Level = 1650, Name = "Marine Commodore", QuestName = "MarineTreeIsland", QuestNumber = 1, CFrameQuest = CFrame.new(2180, 29, -6741), CFrameMob = CFrame.new(2180, 29, -6741)},
	{Level = 1675, Name = "Marine Rear Admiral", QuestName = "MarineTreeIsland", QuestNumber = 2, CFrameQuest = CFrame.new(2180, 29, -6741), CFrameMob = CFrame.new(2180, 29, -6741)},
	{Level = 1700, Name = "Fishman Raider", QuestName = "DeepForestIsland", QuestNumber = 1, CFrameQuest = CFrame.new(-10681, 332, -8860), CFrameMob = CFrame.new(-10681, 332, -8860)},
	{Level = 1725, Name = "Fishman Captain", QuestName = "DeepForestIsland", QuestNumber = 2, CFrameQuest = CFrame.new(-10681, 332, -8860), CFrameMob = CFrame.new(-10681, 332, -8860)},
	{Level = 1750, Name = "Forest Pirate", QuestName = "DeepForestIsland2", QuestNumber = 1, CFrameQuest = CFrame.new(-12493, 332, -7470), CFrameMob = CFrame.new(-12493, 332, -7470)},
	{Level = 1775, Name = "Mythological Pirate", QuestName = "DeepForestIsland2", QuestNumber = 2, CFrameQuest = CFrame.new(-12493, 332, -7470), CFrameMob = CFrame.new(-12493, 332, -7470)},
	{Level = 1800, Name = "Jungle Pirate", QuestName = "DeepForestIsland3", QuestNumber = 1, CFrameQuest = CFrame.new(-13232, 332, -7627), CFrameMob = CFrame.new(-13232, 332, -7627)},
	{Level = 1825, Name = "Musketeer Pirate", QuestName = "DeepForestIsland3", QuestNumber = 2, CFrameQuest = CFrame.new(-13232, 332, -7627), CFrameMob = CFrame.new(-13232, 332, -7627)},
	{Level = 1850, Name = "Reborn Skeleton", QuestName = "HauntedQuest1", QuestNumber = 1, CFrameQuest = CFrame.new(-9480, 146, 5563), CFrameMob = CFrame.new(-9480, 146, 5563)},
	{Level = 1875, Name = "Living Zombie", QuestName = "HauntedQuest1", QuestNumber = 2, CFrameQuest = CFrame.new(-9480, 146, 5563), CFrameMob = CFrame.new(-9480, 146, 5563)},
	{Level = 1900, Name = "Demonic Soul", QuestName = "HauntedQuest2", QuestNumber = 1, CFrameQuest = CFrame.new(-9516, 172, 6078), CFrameMob = CFrame.new(-9516, 172, 6078)},
	{Level = 1925, Name = "Posessed Mummy", QuestName = "HauntedQuest2", QuestNumber = 2, CFrameQuest = CFrame.new(-9516, 172, 6078), CFrameMob = CFrame.new(-9516, 172, 6078)},
	{Level = 1950, Name = "Peanut Scout", QuestName = "NutsQuest", QuestNumber = 1, CFrameQuest = CFrame.new(-2062, 38, -10287), CFrameMob = CFrame.new(-2062, 38, -10287)},
	{Level = 1975, Name = "Peanut President", QuestName = "NutsQuest", QuestNumber = 2, CFrameQuest = CFrame.new(-2062, 38, -10287), CFrameMob = CFrame.new(-2062, 38, -10287)},
	{Level = 2000, Name = "Ice Cream Chef", QuestName = "IceCreamQuest", QuestNumber = 1, CFrameQuest = CFrame.new(-840, 66, -10877), CFrameMob = CFrame.new(-840, 66, -10877)},
	{Level = 2025, Name = "Ice Cream Commander", QuestName = "IceCreamQuest", QuestNumber = 2, CFrameQuest = CFrame.new(-840, 66, -10877), CFrameMob = CFrame.new(-840, 66, -10877)},
	{Level = 2050, Name = "Cookie Crafter", QuestName = "CakeQuest1", QuestNumber = 1, CFrameQuest = CFrame.new(-2024, 38, -12025), CFrameMob = CFrame.new(-2024, 38, -12025)},
	{Level = 2075, Name = "Cake Guard", QuestName = "CakeQuest1", QuestNumber = 2, CFrameQuest = CFrame.new(-2024, 38, -12025), CFrameMob = CFrame.new(-2024, 38, -12025)},
	{Level = 2100, Name = "Baking Staff", QuestName = "CakeQuest2", QuestNumber = 1, CFrameQuest = CFrame.new(-1928, 38, -12840), CFrameMob = CFrame.new(-1928, 38, -12840)},
	{Level = 2125, Name = "Head Baker", QuestName = "CakeQuest2", QuestNumber = 2, CFrameQuest = CFrame.new(-1928, 38, -12840), CFrameMob = CFrame.new(-1928, 38, -12840)},
	{Level = 2150, Name = "Cocoa Warrior", QuestName = "ChocQuest", QuestNumber = 1, CFrameQuest = CFrame.new(233, 29, -12178), CFrameMob = CFrame.new(233, 29, -12178)},
	{Level = 2175, Name = "Chocolate Bar Battler", QuestName = "ChocQuest", QuestNumber = 2, CFrameQuest = CFrame.new(233, 29, -12178), CFrameMob = CFrame.new(233, 29, -12178)},
	{Level = 2200, Name = "Sweet Thief", QuestName = "ChocQuest2", QuestNumber = 1, CFrameQuest = CFrame.new(-150, 29, -12778), CFrameMob = CFrame.new(-150, 29, -12778)},
	{Level = 2225, Name = "Candy Rebel", QuestName = "ChocQuest2", QuestNumber = 2, CFrameQuest = CFrame.new(-150, 29, -12778), CFrameMob = CFrame.new(-150, 29, -12778)},
	{Level = 2250, Name = "Candy Pirate", QuestName = "CandyQuest", QuestNumber = 1, CFrameQuest = CFrame.new(-105, 14, -12850), CFrameMob = CFrame.new(-105, 14, -12850)},
	{Level = 2275, Name = "Snow Demon", QuestName = "CandyQuest", QuestNumber = 2, CFrameQuest = CFrame.new(-105, 14, -12850), CFrameMob = CFrame.new(-105, 14, -12850)},
	{Level = 2300, Name = "Isle Outlaw", QuestName = "TikiQuest1", QuestNumber = 1, CFrameQuest = CFrame.new(-16549, 56, -179), CFrameMob = CFrame.new(-16549, 56, -179)},
	{Level = 2325, Name = "Island Boy", QuestName = "TikiQuest1", QuestNumber = 2, CFrameQuest = CFrame.new(-16549, 56, -179), CFrameMob = CFrame.new(-16549, 56, -179)},
	{Level = 2350, Name = "Sun-kissed Warrior", QuestName = "TikiQuest2", QuestNumber = 1, CFrameQuest = CFrame.new(-16542, 56, -179), CFrameMob = CFrame.new(-16542, 56, -179)},
	{Level = 2375, Name = "Isle Champion", QuestName = "TikiQuest2", QuestNumber = 2, CFrameQuest = CFrame.new(-16542, 56, -179), CFrameMob = CFrame.new(-16542, 56, -179)},
	{Level = 2400, Name = "Serpentian", QuestName = "TikiQuest3", QuestNumber = 1, CFrameQuest = CFrame.new(-16542, 56, -179), CFrameMob = CFrame.new(-16542, 56, -179)},
	{Level = 2425, Name = "Pineaju", QuestName = "TikiQuest3", QuestNumber = 2, CFrameQuest = CFrame.new(-16542, 56, -179), CFrameMob = CFrame.new(-16542, 56, -179)},
	{Level = 2450, Name = "Straw Hat", QuestName = "TikiQuest4", QuestNumber = 1, CFrameQuest = CFrame.new(-16542, 56, -179), CFrameMob = CFrame.new(-16542, 56, -179)},
	{Level = 2475, Name = "Sea Dog", QuestName = "TikiQuest4", QuestNumber = 2, CFrameQuest = CFrame.new(-16542, 56, -179), CFrameMob = CFrame.new(-16542, 56, -179)},
	{Level = 2500, Name = "Mythological", QuestName = "TikiQuest5", QuestNumber = 1, CFrameQuest = CFrame.new(-16542, 56, -179), CFrameMob = CFrame.new(-16542, 56, -179)},
	{Level = 2525, Name = "Ancient Warrior", QuestName = "TikiQuest5", QuestNumber = 2, CFrameQuest = CFrame.new(-16542, 56, -179), CFrameMob = CFrame.new(-16542, 56, -179)},
	{Level = 2550, Name = "Legendary Sword", QuestName = "TikiQuest6", QuestNumber = 1, CFrameQuest = CFrame.new(-16542, 56, -179), CFrameMob = CFrame.new(-16542, 56, -179)},
}

QuestData.Bosses = {
	Sea1 = {
		{Name = "The Saw", Level = 100, CFrame = CFrame.new(-6883, 19, 1583)},
		{Name = "Bobby", Level = 15, CFrame = CFrame.new(-1123, 14, 4328)},
		{Name = "Yeti", Level = 110, CFrame = CFrame.new(1268, 101, -1450)},
		{Name = "Mob Leader", Level = 7, CFrame = CFrame.new(-2850, 7, 5350)},
		{Name = "Vice Admiral", Level = 130, CFrame = CFrame.new(-5075, 24, 4357)},
		{Name = "Warden", Level = 200, CFrame = CFrame.new(5314, 1, 475)},
		{Name = "Chief Warden", Level = 200, CFrame = CFrame.new(5314, 1, 475)},
		{Name = "Swan", Level = 225, CFrame = CFrame.new(5314, 1, 475)},
		{Name = "Magma Admiral", Level = 350, CFrame = CFrame.new(-5500, 16, -5300)},
		{Name = "Fishman Lord", Level = 450, CFrame = CFrame.new(61123, 18, 1569)},
		{Name = "Wysper", Level = 500, CFrame = CFrame.new(-7859, 5544, -381)},
		{Name = "Thunder God", Level = 525, CFrame = CFrame.new(-7859, 5544, -381)},
		{Name = "Cyborg", Level = 675, CFrame = CFrame.new(-5500, 16, -5300)},
	},
	Sea2 = {
		{Name = "Diamond", Level = 750, CFrame = CFrame.new(-6485, 250, -1010)},
		{Name = "Jeremy", Level = 875, CFrame = CFrame.new(-7905, 5636, -1413)},
		{Name = "Fajita", Level = 925, CFrame = CFrame.new(-2442, 73, -3219)},
		{Name = "Don Swan", Level = 1000, CFrame = CFrame.new(228, 15, 90)},
		{Name = "Smoke Admiral", Level = 1150, CFrame = CFrame.new(-5500, 16, -5300)},
		{Name = "Awakened Ice Admiral", Level = 1350, CFrame = CFrame.new(5668, 26, -6484)},
		{Name = "Tide Keeper", Level = 1475, CFrame = CFrame.new(-3053, 236, -10144)},
	},
	Sea3 = {
		{Name = "Stone", Level = 1550, CFrame = CFrame.new(-10892, 38, -10072)},
		{Name = "Island Empress", Level = 1675, CFrame = CFrame.new(5448, 602, 749)},
		{Name = "Kilo Admiral", Level = 1750, CFrame = CFrame.new(2180, 29, -6741)},
		{Name = "Captain Elephant", Level = 1850, CFrame = CFrame.new(-6485, 250, -1010)},
		{Name = "Beautiful Pirate", Level = 1900, CFrame = CFrame.new(5448, 602, 749)},
		{Name = "Cake Queen", Level = 2050, CFrame = CFrame.new(-1928, 38, -12840)},
		{Name = "rip_indra True Form", Level = 2100, CFrame = CFrame.new(-5500, 16, -5300)},
		{Name = "Longma", Level = 2275, CFrame = CFrame.new(-1058, 424, -9329)},
		{Name = "Soul Reaper", Level = 2450, CFrame = CFrame.new(-9516, 172, 6078)},
		{Name = "Dough King", Level = 2525, CFrame = CFrame.new(-1058, 424, -9329)},
	},
}

QuestData.Islands = {
	Sea1 = {
		{Name = "Starter Island", CFrame = CFrame.new(216, 20, 1988)},
		{Name = "Jungle", CFrame = CFrame.new(-1602, 37, 153)},
		{Name = "Pirate Village", CFrame = CFrame.new(-1140, 4, 3828)},
		{Name = "Desert", CFrame = CFrame.new(897, 6, 4389)},
		{Name = "Frozen Village", CFrame = CFrame.new(606, 401, -5371)},
		{Name = "Marine Fortress", CFrame = CFrame.new(-5036, 28, 4324)},
		{Name = "Skylands", CFrame = CFrame.new(-4842, 717, -2620)},
		{Name = "Prison", CFrame = CFrame.new(5308, 1, 475)},
		{Name = "Colosseum", CFrame = CFrame.new(-1576, 7, -2987)},
		{Name = "Magma Village", CFrame = CFrame.new(-5313, 12, 8515)},
		{Name = "Underwater City", CFrame = CFrame.new(61164, 11, 1819)},
		{Name = "Fountain City", CFrame = CFrame.new(5256, 38, 4049)},
	},
	Sea2 = {
		{Name = "Kingdom of Rose", CFrame = CFrame.new(-424, 73, 1836)},
		{Name = "Dark Arena", CFrame = CFrame.new(5715, 23, 1529)},
		{Name = "Ghost Island", CFrame = CFrame.new(-5494, 48, -794)},
		{Name = "Snow Mountain", CFrame = CFrame.new(609, 400, -5371)},
		{Name = "Hot and Cold", CFrame = CFrame.new(-6061, 15, -4904)},
		{Name = "Cursed Ship", CFrame = CFrame.new(923, 125, 32852)},
		{Name = "Ice Castle", CFrame = CFrame.new(5668, 26, -6484)},
		{Name = "Forgotten Island", CFrame = CFrame.new(-3053, 236, -10144)},
	},
	Sea3 = {
		{Name = "Port Town", CFrame = CFrame.new(-290, 47, 5581)},
		{Name = "Hydra Island", CFrame = CFrame.new(5832, 51, -1101)},
		{Name = "Great Tree", CFrame = CFrame.new(2180, 29, -6741)},
		{Name = "Castle on the Sea", CFrame = CFrame.new(-5085, 315, -3175)},
		{Name = "Floating Turtle", CFrame = CFrame.new(-13274, 535, -7579)},
		{Name = "Haunted Castle", CFrame = CFrame.new(-9480, 146, 5563)},
		{Name = "Peanut Island", CFrame = CFrame.new(-2062, 38, -10287)},
		{Name = "Ice Cream Island", CFrame = CFrame.new(-840, 66, -10877)},
		{Name = "Cake Island", CFrame = CFrame.new(-1928, 38, -12840)},
		{Name = "Chocolate Island", CFrame = CFrame.new(233, 29, -12178)},
		{Name = "Tiki Outpost", CFrame = CFrame.new(-16549, 56, -179)},
	},
}

function QuestData.GetCurrentSea()
	local placeId = game.PlaceId
	if placeId == 2753915549 then return "Sea1"
	elseif placeId == 4442272183 then return "Sea2"
	elseif placeId == 7449423635 then return "Sea3" end
	return "Sea1"
end

function QuestData.GetQuestForLevel(level)
	local sea = QuestData.GetCurrentSea()
	local quests = QuestData[sea]
	if not quests then return nil end
	local bestQuest = nil
	for _, quest in ipairs(quests) do
		if level >= quest.Level then
			bestQuest = quest
		else
			break
		end
	end
	return bestQuest
end

function QuestData.GetBossesForSea()
	local sea = QuestData.GetCurrentSea()
	return QuestData.Bosses[sea] or {}
end

function QuestData.GetIslandsForSea()
	local sea = QuestData.GetCurrentSea()
	return QuestData.Islands[sea] or {}
end

local AutoFarmLevel = {}

function AutoFarmLevel.GetQuest()
	local level = Utils.GetLevel()
	return QuestData.GetQuestForLevel(level)
end

function AutoFarmLevel.StartQuest(quest)
	if not quest then return end
	local questGui = Player.PlayerGui:FindFirstChild("Main") and Player.PlayerGui.Main:FindFirstChild("Quest")
	if questGui and questGui.Visible then
		local title = questGui.Container and questGui.Container.QuestTitle and questGui.Container.QuestTitle.Title
		if title and title.Text:find(quest.Name) then
			return true
		end
	end
	Movement.Teleport(quest.CFrameQuest)
	task.wait(0.5)
	Utils.FireRemote("StartQuest", quest.QuestName, quest.QuestNumber)
	Utils.FireRemote("SetSpawnPoint")
	task.wait(0.3)
	return true
end

function AutoFarmLevel.FindMob(quest)
	for _, enemy in pairs(Utils.GetEnemiesInWorkspace()) do
		if enemy.Name:find(quest.Name) and Utils.IsEnemyAlive(enemy) then
			return enemy
		end
	end
	for _, enemy in pairs(ReplicatedStorage:GetChildren()) do
		if enemy.Name:find(quest.Name) and Utils.IsEnemyAlive(enemy) then
			return enemy
		end
	end
	return nil
end

function AutoFarmLevel.FarmMob(quest)
	local mob = AutoFarmLevel.FindMob(quest)
	if not mob then
		Movement.Teleport(quest.CFrameMob)
		task.wait(0.5)
		return
	end
	if Settings.BringMobs then
		Combat.BringMob(mob)
	end
	while Utils.IsEnemyAlive(mob) and Settings.AutoFarmLevel do
		if not mob:FindFirstChild("HumanoidRootPart") then break end
		Movement.Teleport(mob.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
		Combat.ClickAttack()
		task.wait(0.1)
	end
end

function AutoFarmLevel.Run()
	while Settings.AutoFarmLevel do
		local quest = AutoFarmLevel.GetQuest()
		if quest then
			AutoFarmLevel.StartQuest(quest)
			AutoFarmLevel.FarmMob(quest)
		end
		task.wait(0.5)
	end
end

local AutoFarmMastery = {}

function AutoFarmMastery.GetBestMob()
	local level = Utils.GetLevel()
	local sea = QuestData.GetCurrentSea()
	local quests = QuestData[sea]
	if not quests then return nil end
	local bestQuest = nil
	for _, quest in ipairs(quests) do
		if level >= quest.Level then
			bestQuest = quest
		end
	end
	return bestQuest
end

function AutoFarmMastery.Farm()
	local quest = AutoFarmMastery.GetBestMob()
	if not quest then return end
	local questGui = Player.PlayerGui:FindFirstChild("Main") and Player.PlayerGui.Main:FindFirstChild("Quest")
	if not questGui or not questGui.Visible then
		Movement.Teleport(quest.CFrameQuest)
		task.wait(0.5)
		Utils.FireRemote("StartQuest", quest.QuestName, quest.QuestNumber)
		Utils.FireRemote("SetSpawnPoint")
		task.wait(0.3)
	end
	while Settings.AutoFarmMastery do
		local mob = nil
		for _, enemy in pairs(Utils.GetEnemiesInWorkspace()) do
			if enemy.Name:find(quest.Name) and Utils.IsEnemyAlive(enemy) then
				mob = enemy
				break
			end
		end
		if not mob then
			Movement.Teleport(quest.CFrameMob)
			task.wait(0.5)
		else
			if Settings.BringMobs then
				Combat.BringMob(mob)
			end
			while Utils.IsEnemyAlive(mob) and Settings.AutoFarmMastery do
				if not mob:FindFirstChild("HumanoidRootPart") then break end
				Movement.Teleport(mob.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
				Combat.ClickAttack()
				task.wait(0.1)
			end
		end
		task.wait(0.3)
	end
end

local AutoFarmNearest = {}

function AutoFarmNearest.Farm()
	while Settings.AutoFarmNearest do
		local nearest = Utils.GetNearestEnemy()
		if nearest then
			while Utils.IsEnemyAlive(nearest) and Settings.AutoFarmNearest do
				if not nearest:FindFirstChild("HumanoidRootPart") then break end
				Movement.Teleport(nearest.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
				Combat.ClickAttack()
				task.wait(0.1)
			end
		end
		task.wait(0.3)
	end
end

local AutoFarmBosses = {}

function AutoFarmBosses.Farm()
	while Settings.AutoFarmBosses do
		local bosses = QuestData.GetBossesForSea()
		for _, bossData in ipairs(bosses) do
			if not Settings.AutoFarmBosses then break end
			if Utils.GetLevel() >= bossData.Level then
				Movement.Teleport(bossData.CFrame)
				task.wait(1)
				local boss = nil
				for _, enemy in pairs(Utils.GetEnemiesInWorkspace()) do
					if enemy.Name:find(bossData.Name) and Utils.IsEnemyAlive(enemy) then
						boss = enemy
						break
					end
				end
				if boss then
					while Utils.IsEnemyAlive(boss) and Settings.AutoFarmBosses do
						if not boss:FindFirstChild("HumanoidRootPart") then break end
						Movement.Teleport(boss.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
						Combat.ClickAttack()
						task.wait(0.1)
					end
				end
			end
		end
		task.wait(1)
	end
end

local AutoChest = {}

function AutoChest.Collect()
	while Settings.AutoChest do
		local found = false
		for _, obj in pairs(Workspace:GetChildren()) do
			if not Settings.AutoChest then break end
			if obj:IsA("Model") and obj:FindFirstChild("Chest") then
				found = true
				local chest = obj:FindFirstChild("Chest")
				if chest then
					Movement.Teleport(chest.CFrame)
					task.wait(0.3)
					for _, item in pairs(Player.Backpack:GetChildren()) do
						if item:IsA("Tool") and (item.Name == "Fist of Darkness" or item.Name == "God's Chalice") then
							Settings.AutoChest = false
							break
						end
					end
				end
			end
		end
		if not found then
			task.wait(1)
		end
	end
end

local AutoSeaBeast = {}

function AutoSeaBeast.FindSeaBeast()
	for _, obj in pairs(Workspace:GetChildren()) do
		if obj:IsA("Model") and (obj.Name:find("Sea Beast") or obj.Name:find("SeaBeast") or obj.Name:find("Water")) then
			if Utils.IsEnemyAlive(obj) then
				return obj
			end
		end
	end
	return nil
end

function AutoSeaBeast.Farm()
	while Settings.AutoSeaBeast do
		local beast = AutoSeaBeast.FindSeaBeast()
		if beast then
			while Utils.IsEnemyAlive(beast) and Settings.AutoSeaBeast do
				if not beast:FindFirstChild("HumanoidRootPart") then break end
				Movement.Teleport(beast.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
				Combat.ClickAttack()
				task.wait(0.1)
			end
		end
		task.wait(1)
	end
end

local Teleport = {}

function Teleport.ToIsland(islandData)
	if islandData and islandData.CFrame then
		Movement.Teleport(islandData.CFrame)
	end
end

function Teleport.ToPlayer(targetPlayer)
	if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
		Movement.Teleport(targetPlayer.Character.HumanoidRootPart.CFrame)
	end
end

function Teleport.ToSea(sea)
	if sea == "Sea 1" then
		Utils.FireRemote("requestEntrance", Vector3.new(1, 100000, 1))
	elseif sea == "Sea 2" then
		Utils.FireRemote("requestEntrance", Vector3.new(-4608, 872, -4096))
	elseif sea == "Sea 3" then
		Utils.FireRemote("requestEntrance", Vector3.new(-1000, 1, -1000))
	end
end

task.spawn(function()
	Player.Idled:Connect(function()
		VirtualInputManager:SendKeyEvent(true, "W", false, game)
		task.wait(1)
		VirtualInputManager:SendKeyEvent(false, "W", false, game)
	end)
end)

task.spawn(function()
	while task.wait() do
		if Utils.IsAlive(Character) then
			for _, part in pairs(Character:GetChildren()) do
				if part:IsA("BasePart") and part.CanCollide then
					part.CanCollide = false
				end
			end
		end
	end
end)

local MainTab = Window:NewTab("Farm")
local FarmSection = MainTab:NewSection("Auto Farm")

FarmSection:NewToggle("Auto Farm Level", "Farms quests for XP", function(state)
	Settings.AutoFarmLevel = state
	if state then task.spawn(AutoFarmLevel.Run) end
end)

FarmSection:NewToggle("Auto Farm Mastery", "Farms mastery on best mob", function(state)
	Settings.AutoFarmMastery = state
	if state then task.spawn(AutoFarmMastery.Farm) end
end)

FarmSection:NewToggle("Auto Farm Nearest", "Farms nearest enemy", function(state)
	Settings.AutoFarmNearest = state
	if state then task.spawn(AutoFarmNearest.Farm) end
end)

FarmSection:NewToggle("Auto Farm Bosses", "Farms all bosses in current sea", function(state)
	Settings.AutoFarmBosses = state
	if state then task.spawn(AutoFarmBosses.Farm) end
end)

FarmSection:NewToggle("Auto Collect Chests", "Collects all chests", function(state)
	Settings.AutoChest = state
	if state then task.spawn(AutoChest.Collect) end
end)

FarmSection:NewToggle("Auto Sea Beasts", "Farms sea beasts", function(state)
	Settings.AutoSeaBeast = state
	if state then task.spawn(AutoSeaBeast.Farm) end
end)

local SettingsTab = Window:NewTab("Settings")
local CombatSection = SettingsTab:NewSection("Combat")

CombatSection:NewToggle("Fast Attack", "Enables fast attack bypass", function(state)
	Settings.FastAttack = state
end)

CombatSection:NewToggle("Bring Mobs", "Brings mobs to you", function(state)
	Settings.BringMobs = state
end)

CombatSection:NewDropdown("Weapon", "Select weapon type", {"Melee", "Sword", "Gun", "Blox Fruit"}, function(option)
	Settings.SelectWeapon = option
end)

CombatSection:NewSlider("Tween Speed", "Movement speed", 500, 100, function(value)
	Settings.TweenSpeed = value
end)

local TeleportTab = Window:NewTab("Teleport")
local IslandSection = TeleportTab:NewSection("Islands")

local islands = QuestData.GetIslandsForSea()
for _, island in ipairs(islands) do
	IslandSection:NewButton(island.Name, "Teleport to " .. island.Name, function()
		Teleport.ToIsland(island)
	end)
end

local SeaSection = TeleportTab:NewSection("Sea Travel")
SeaSection:NewButton("Sea 1", "Go to First Sea", function() Teleport.ToSea("Sea 1") end)
SeaSection:NewButton("Sea 2", "Go to Second Sea", function() Teleport.ToSea("Sea 2") end)
SeaSection:NewButton("Sea 3", "Go to Third Sea", function() Teleport.ToSea("Sea 3") end)

local PlayerTPSection = TeleportTab:NewSection("Players")
PlayerTPSection:NewDropdown("Select Player", "Choose a player to teleport", function(option)
	for _, p in pairs(Players:GetPlayers()) do
		if p.Name == option then
			Teleport.ToPlayer(p)
			break
		end
	end
end)

task.spawn(function()
	while task.wait(2) do
		local names = {}
		for _, p in pairs(Players:GetPlayers()) do
			if p ~= Player then
				table.insert(names, p.Name)
			end
		end
	end
end)

local BossTab = Window:NewTab("Bosses")
local BossSection = BossTab:NewSection("Boss Teleport")

local bosses = QuestData.GetBossesForSea()
for _, boss in ipairs(bosses) do
	BossSection:NewButton(boss.Name .. " (Lv." .. boss.Level .. ")", "Teleport to " .. boss.Name, function()
		Movement.Teleport(boss.CFrame)
	end)
end

local FruitTab = Window:NewTab("Fruits")
local FruitSection = FruitTab:NewSection("Fruit Stuff")

FruitSection:NewButton("Get Fruits", "Print fruit shop stock", function()
	local fruits = CommF_:InvokeServer("GetFruits")
	for _, fruit in pairs(fruits) do
		if fruit.OnSale then
			print(fruit.Name .. " - $" .. fruit.Price)
		end
	end
end)

FruitSection:NewButton("Get Stored Fruits", "Print stored fruits", function()
	local fruits = CommF_:InvokeServer("getInventoryFruits")
	for _, fruit in pairs(fruits) do
		print(fruit)
	end
end)

FruitSection:NewButton("Buy Random Fruit", "Buy from Cousin", function()
	CommF_:InvokeServer("Cousin", "Buy")
end)

FruitSection:NewDropdown("Store Fruit", "Select fruit to store", FruitCodes, function(option)
	CommF_:InvokeServer("StoreFruit", option, Utils.HasItemInBackpack(option))
end)

local DressrosaSection = FruitTab:NewSection("Dressrosa")

DressrosaSection:NewButton("Travel Dressrosa", "Travel to Dressrosa", function()
	CommF_:InvokeServer("TravelDressrosa")
end)

DressrosaSection:NewButton("Travel Zou", "Travel to Zou", function()
	CommF_:InvokeServer("TravelZou")
end)

DressrosaSection:NewButton("Dressrosa Progress", "Advance Dressrosa quest", function()
	CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
end)

local TeamTab = Window:NewTab("Team")
local TeamSection = TeamTab:NewSection("Team Selection")

TeamSection:NewButton("Join Pirates", "Join the Pirates team", function()
	CommF_:InvokeServer("SetTeam", "Pirates")
end)

TeamSection:NewButton("Join Marines", "Join the Marines team", function()
	CommF_:InvokeServer("SetTeam", "Marines")
end)

local StatTab = Window:NewTab("Stats")
local StatSection = StatTab:NewSection("Stat Allocation")

StatSection:NewDropdown("Select Stat", "Choose stat to allocate", {"Melee", "Defense", "Sword", "Gun", "Demon Fruit"}, function(option)
	Settings.SelectStat = option
end)

StatSection:NewSlider("Points", "Amount of points to allocate", 10, 1, function(value)
	Settings.StatPoints = value
end)

StatSection:NewButton("Allocate Stats", "Add points to selected stat", function()
	local args = {"AddPoint", Settings.SelectStat, Settings.StatPoints}
	CommF_:InvokeServer(unpack(args))
end)

local MiscTab = Window:NewTab("Misc")
local ServerSection = MiscTab:NewSection("Server")

ServerSection:NewButton("Redeem Codes", "Redeem all codes", function()
	CommF_:InvokeServer("Redeem", "CODE")
end)

ServerSection:NewButton("Join Crew", "Join a crew", function()
	CommF_:InvokeServer("Crew", "Join")
end)

ServerSection:NewButton("Find Friends", "Find friends", function()
	CommF_:InvokeServer("FriendFinder", "Start")
end)

ServerSection:NewButton("Start Raid", "Start raid", function()
	CommF_:InvokeServer("Raids", "Start")
end)

ServerSection:NewButton("Send Money", "Send money to player", function()
	CommF_:InvokeServer("SendMoney", 1000)
end)

local TeleportSection = MiscTab:NewSection("Teleport")

TeleportSection:NewButton("VIP Teleport", "VIP teleport", function()
	CommF_:InvokeServer("TeleportVip")
end)

TeleportSection:NewButton("Glitch Fix", "Check teleport glitch", function()
	CommF_:InvokeServer("CheckTeleportGlitchFix")
end)

TeleportSection:NewButton("Room Manager", "Room management", function()
	CommF_:InvokeServer("RoomManager")
end)

local ShipSection = MiscTab:NewSection("Ship")

ShipSection:NewButton("Spawn Ship", "Spawn ship", function()
	CommF_:InvokeServer("Ship", "Spawn")
end)

ShipSection:NewButton("Ship Service", "Ship service", function()
	CommF_:InvokeServer("ShipServiceEvent")
end)

ShipSection:NewButton("Block Part", "Block part", function()
	CommF_:InvokeServer("BlockPart")
end)

ShipSection:NewButton("Leviathan", "Leviathan", function()
	CommF_:InvokeServer("Leviathan")
end)

local CombatSection2 = MiscTab:NewSection("Combat")

CombatSection2:NewButton("Parry", "Parry", function()
	ParryRemote:FireServer()
end)

CombatSection2:NewButton("Parry All", "Parry all", function()
	ParrySuccessAll:FireServer()
end)

CombatSection2:NewButton("Register Attack", "Register attack", function()
	RegisterAttack:FireServer()
end)

CombatSection2:NewButton("Register Hit", "Register hit", function()
	RegisterHit:FireServer()
end)

local QuestSection = MiscTab:NewSection("Quest")

QuestSection:NewButton("Refresh Quest", "Refresh quest", function()
	RefreshQuestPro:FireServer()
end)

QuestSection:NewButton("Refresh Bartilo", "Refresh Bartilo quest", function()
	RefreshBartiloQuestPro:FireServer()
end)

QuestSection:NewButton("Refresh Dressrosa", "Refresh Dressrosa quest", function()
	RefreshDressrosaQuestPro:FireServer()
end)

QuestSection:NewButton("Refresh Z Quest", "Refresh Z quest", function()
	RefreshZQuestPro:FireServer()
end)

QuestSection:NewButton("Refresh Citizen", "Refresh citizen quest", function()
	RefreshCitizenQuestPro:FireServer()
end)

QuestSection:NewButton("Refresh Haunted", "Refresh haunted puzzle", function()
	RefreshHauntedPuzzlePro:FireServer()
end)

QuestSection:NewButton("Quest Update", "Update quest", function()
	QuestUpdate:FireServer()
end)

local TradeSection = MiscTab:NewSection("Trade")

TradeSection:NewButton("Trade", "Open trade", function()
	CommF_:InvokeServer("TradeFunction", "Start")
end)

TradeSection:NewButton("Sales", "Open sales", function()
	CommF_:InvokeServer("SalesFunction", "Start")
end)

local SettingSection = MiscTab:NewSection("Settings")

SettingSection:NewButton("Change Setting", "Change game setting", function()
	CommF_:InvokeServer("ChangeSetting", "Setting")
end)

SettingSection:NewButton("Danger Distance", "Set danger distance", function()
	CommF_:InvokeServer("DangerDistance", 100)
end)

print("NexoHub - Zyros loaded successfully!")
