local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
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
local Events = ReplicatedStorage:WaitForChild("Events")
local Modules = ReplicatedStorage:WaitForChild("Modules")
local CommF_ = Remotes:WaitForChild("CommF_")
local CommE_ = Remotes:WaitForChild("CommE_")
local CommF = Remotes:WaitForChild("CommF")
local Validator = Remotes:WaitForChild("Validator")
local Validator2 = Remotes:WaitForChild("Validator2")
local NetModule = Modules:WaitForChild("Net")
local RegisterAttack = NetModule:WaitForChild("RE"):WaitForChild("RegisterAttack")
local RegisterHit = NetModule:WaitForChild("RE"):WaitForChild("RegisterHit")
local ReadPlayerData = NetModule:WaitForChild("RF"):WaitForChild("ReadPlayerData")
local AssignQATask = Events:WaitForChild("AssignQATask")
local GetCurrentMobileMouseLockMode = Events:WaitForChild("GetCurrentMobileMouseLockMode")
local IsObservationActive = Events:WaitForChild("IsObservationActive")
local SetQATaskStatus = Events:WaitForChild("SetQATaskStatus")
local ShootSoulGuitar = Events:WaitForChild("ShootSoulGuitar")
local ActivateHomeButton = Events:WaitForChild("ActivateHomeButton")
local ActivateRaceV4 = Events:WaitForChild("ActivateRaceV4")
local ActivatedSkill = Events:WaitForChild("ActivatedSkill")
local CelestialAwakenTransition = Events:WaitForChild("CelestialAwakenTransition")
local DeactivatedSkill = Events:WaitForChild("DeactivatedSkill")
local DomainEasterRequest = Events:WaitForChild("DomainEasterRequest")
local EnablePvP = Events:WaitForChild("EnablePvP")
local MobileUIModeUpdated = Events:WaitForChild("MobileUIModeUpdated")
local PlaySkillCooldownAnimation = Events:WaitForChild("PlaySkillCooldownAnimation")
local SetMobileMouseLockMode = Events:WaitForChild("SetMobileMouseLockMode")
local ToggleAllies = Events:WaitForChild("ToggleAllies")
local ToggleCodesWindow = Events:WaitForChild("ToggleCodesWindow")
local ToggleCrewWindow = Events:WaitForChild("ToggleCrewWindow")
local ToggleInventoryWindow = Events:WaitForChild("ToggleInventoryWindow")
local ToggleMusic = Events:WaitForChild("ToggleMusic")
local ToggleSettingsWindow = Events:WaitForChild("ToggleSettingsWindow")
local UsedRaceSkill = Events:WaitForChild("UsedRaceSkill")
local AddedToBlueMoonParticipants = NetModule:WaitForChild("RE"):WaitForChild("AddedToBlueMoonParticipants")
local BannerItemRE = NetModule:WaitForChild("RE"):WaitForChild("BannerItemRE")
local BlueMoonTimerTick = NetModule:WaitForChild("RE"):WaitForChild("BlueMoonTimerTick")
local CancelEquipAnim = NetModule:WaitForChild("RE"):WaitForChild("CancelEquipAnim")
local CollectBlueEmber = NetModule:WaitForChild("RE"):WaitForChild("CollectBlueEmber")
local CollectedDragonEgg = NetModule:WaitForChild("RE"):WaitForChild("CollectedDragonEgg")
local ConsumablesNetworkRE = NetModule:WaitForChild("RE"):WaitForChild("ConsumablesNetworkRE")
local DragonDojoEmber = NetModule:WaitForChild("RE"):WaitForChild("DragonDojoEmber")
local EasterServiceRE = NetModule:WaitForChild("RE"):WaitForChild("EasterServiceRE")
local EggsplosiveEggDamage = NetModule:WaitForChild("RE"):WaitForChild("EggsplosiveEggDamage")
local EquipAnimApplyEndState = NetModule:WaitForChild("RE"):WaitForChild("EquipAnimApplyEndState")
local FishIndexUpdated = NetModule:WaitForChild("RE"):WaitForChild("FishIndexUpdated")
local FishingRemote = NetModule:WaitForChild("RE"):WaitForChild("FishingRemote")
local FishingTournament = NetModule:WaitForChild("RE"):WaitForChild("FishingTournament")
local GachaNetworkRE = NetModule:WaitForChild("RE"):WaitForChild("GachaNetworkRE")
local HiddenAbilitiesRE = NetModule:WaitForChild("RE"):WaitForChild("HiddenAbilitiesRE")
local JobsRemoteEvent = NetModule:WaitForChild("RE"):WaitForChild("JobsRemoteEvent")
local JuiceNetworkRE = NetModule:WaitForChild("RE"):WaitForChild("JuiceNetworkRE")
local KickPlayer = NetModule:WaitForChild("RE"):WaitForChild("KickPlayer")
local ModificationEvent = NetModule:WaitForChild("RE"):WaitForChild("ModificationEvent")
local OnAnalyticsActivity = NetModule:WaitForChild("RE"):WaitForChild("OnAnalyticsActivity")
local OnFPSToggleCommand = NetModule:WaitForChild("RE"):WaitForChild("OnFPSToggleCommand")
local OnFishTournamentStartEnd = NetModule:WaitForChild("RE"):WaitForChild("OnFishTournamentStartEnd")
local OnItemReplicationServiceRefreshed = NetModule:WaitForChild("RE"):WaitForChild("OnItemReplicationServiceRefreshed")
local OnItemServerHit = NetModule:WaitForChild("RE"):WaitForChild("OnItemServerHit")
local OnItemValueChanged = NetModule:WaitForChild("RE"):WaitForChild("OnItemValueChanged")
local OnThrowReplicated = NetModule:WaitForChild("RE"):WaitForChild("OnThrowReplicated")
local PlayAttackStartEffect = NetModule:WaitForChild("RE"):WaitForChild("PlayAttackStartEffect")
local PlayRelicHitEffect = NetModule:WaitForChild("RE"):WaitForChild("PlayRelicHitEffect")
local PlayShrineActivateCutscene = NetModule:WaitForChild("RE"):WaitForChild("PlayShrineActivateCutscene")
local PrehistoricEvent = NetModule:WaitForChild("RE"):WaitForChild("PrehistoricEvent")
local PrepClientSpin = NetModule:WaitForChild("RE"):WaitForChild("PrepClientSpin")
local ReceivedHit = NetModule:WaitForChild("RE"):WaitForChild("ReceivedHit")
local RobloxAnalytics = NetModule:WaitForChild("RE"):WaitForChild("RobloxAnalytics")
local ShootGunEvent = NetModule:WaitForChild("RE"):WaitForChild("ShootGunEvent")
local ShopNetwork = NetModule:WaitForChild("RE"):WaitForChild("ShopNetwork")
local ShutdownVIPServer = NetModule:WaitForChild("RE"):WaitForChild("ShutdownVIPServer")
local SpawnBlueEmbers = NetModule:WaitForChild("RE"):WaitForChild("SpawnBlueEmbers")
local SpinGacha = NetModule:WaitForChild("RE"):WaitForChild("SpinGacha")
local StartShutdownCountdown = NetModule:WaitForChild("RE"):WaitForChild("StartShutdownCountdown")
local TeleportLoadingFX = NetModule:WaitForChild("RE"):WaitForChild("TeleportLoadingFX")
local TeleportPad = NetModule:WaitForChild("RE"):WaitForChild("TeleportPad")
local ToggleServerLock = NetModule:WaitForChild("RE"):WaitForChild("ToggleServerLock")
local ToggleServerMode = NetModule:WaitForChild("RE"):WaitForChild("ToggleServerMode")
local TouchKitsuneStatue = NetModule:WaitForChild("RE"):WaitForChild("TouchKitsuneStatue")
local VisualEquipped = NetModule:WaitForChild("RE"):WaitForChild("VisualEquipped")
local VisualUnequipped = NetModule:WaitForChild("RE"):WaitForChild("VisualUnequipped")
local QuestUpdate = Remotes:WaitForChild("QuestUpdate")
local RefreshQuestPro = Remotes:WaitForChild("RefreshQuestPro")
local RefreshBartiloQuestPro = Remotes:WaitForChild("RefreshBartiloQuestPro")
local RefreshDressrosaQuestPro = Remotes:WaitForChild("RefreshDressrosaQuestPro")
local RefreshZQuestPro = Remotes:WaitForChild("RefreshZQuestPro")
local RefreshCitizenQuestPro = Remotes:WaitForChild("RefreshCitizenQuestPro")
local RefreshHauntedPuzzlePro = Remotes:WaitForChild("RefreshHauntedPuzzlePro")
local RefreshCrew = Remotes:WaitForChild("RefreshCrew")
local ChestRemote = Remotes:WaitForChild("Chest")
local BreakTreeRemote = Remotes:WaitForChild("BreakTree")
local SendMoney = Remotes:WaitForChild("SendMoney")
local TradeEvent = Remotes:WaitForChild("TradeEvent")
local SalesEvent = Remotes:WaitForChild("SalesEvent")
local CrewRemote = Remotes:WaitForChild("Crew")
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
local Allies = Remotes:WaitForChild("Allies")
local BodyMover = Remotes:WaitForChild("BodyMover")
local ButtonEnabler = Remotes:WaitForChild("ButtonEnabler")
local CharacterTransparency = Remotes:WaitForChild("CharacterTransparency")
local ColorBought = Remotes:WaitForChild("ColorBought")
local Combo = Remotes:WaitForChild("Combo")
local DMGDEBUG = Remotes:WaitForChild("DMGDEBUG")
local DisableKen = Remotes:WaitForChild("DisableKen")
local DoRejoin = Remotes:WaitForChild("DoRejoin")
local JoinPlayerFromProfile = Remotes:WaitForChild("JoinPlayerFromProfile")
local MarkPlayerProfileOpened = Remotes:WaitForChild("MarkPlayerProfileOpened")
local MinValue = Remotes:WaitForChild("MinValue")
local Prompt = Remotes:WaitForChild("Prompt")
local RadarNotify = Remotes:WaitForChild("RadarNotify")
local RegenModel = Remotes:WaitForChild("RegenModel")
local ReportActivity = Remotes:WaitForChild("ReportActivity")
local SetLocalMovers = Remotes:WaitForChild("SetLocalMovers")
local SyncAnimations = Remotes:WaitForChild("SyncAnimations")
local Temple = Remotes:WaitForChild("Temple")
local TempleObby = Remotes:WaitForChild("TempleObby")
local ToggleQATasks = Remotes:WaitForChild("ToggleQATasks")
local PhysicsEggEvent = Remotes:WaitForChild("PhysicsEggEvent")
local OnQAAssign = Remotes:WaitForChild("OnQAAssign")
local OnQAStatusChange = Remotes:WaitForChild("OnQAStatusChange")
local OnQAStatusChangeById = Remotes:WaitForChild("OnQAStatusChangeById")
local OnAnalyticsUpdate = Remotes:WaitForChild("OnAnalyticsUpdate")
local OnIsComingSoonChanged = Remotes:WaitForChild("OnIsComingSoonChanged")
local ClientLoDPosition = Remotes:WaitForChild("ClientLoDPosition")
local SegmentHit = Remotes:WaitForChild("SegmentHit")
local RequestStreamAroundAsync = Remotes:WaitForChild("RequestStreamAroundAsync")
local ParrySuccessAll = Remotes:WaitForChild("ParrySuccessAll")
local ParrySuccess = Remotes:WaitForChild("ParrySuccess")
local ParryRemote = Remotes:WaitForChild("ParrySuccess")
local AdService = ReplicatedStorage:WaitForChild("AdService")
local SocialService = ReplicatedStorage:WaitForChild("SocialService")
local ParryNewRemote = AdService:FindFirstChildOfClass("RemoteEvent") or SocialService:FindFirstChildOfClass("RemoteEvent")
local PlayerDodged = ReplicatedStorage:WaitForChild("PlayerDodged")
local PlayerDoubleJumped = ReplicatedStorage:WaitForChild("PlayerDoubleJumped")

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
	ESPE = false,
	ESPPlayers = false,
	ESPFruits = false,
	ESPBosses = false,
	ESPChests = false,
	KillAura = false,
	KillAuraDistance = 50,
	FPSBoost = false,
	AutoAwaken = false,
	AutoRaceV4 = false,
	FruitSniper = false,
	SelectedFruits = {},
	AutoStats = false,
	AutoStatsAmount = 1,
	ServerHop = false,
	InfiniteJump = false,
	NoClip = true,
	SpeedBoost = false,
	SpeedMultiplier = 1,
	JumpBoost = false,
	JumpMultiplier = 1,
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

local function IsAlive(char)
	if not char then return false end
	local hum = char:FindFirstChildOfClass("Humanoid")
	return hum and hum.Health > 0
end

local function SafeCall(func, ...)
	local success, result = pcall(func, ...)
	if not success then
		warn("[NexoHub] Error: " .. tostring(result))
	end
	return success and result or nil
end

local function FireRemote(...)
	return SafeCall(function(...) return CommF_:InvokeServer(...) end, ...)
end

local function GetLevel()
	local data = Player:FindFirstChild("Data")
	if data and data:FindFirstChild("Level") then
		return data.Level.Value
	end
	return 1
end

local function GetDistance(position)
	if HRP then
		return (HRP.Position - position).Magnitude
	end
	return math.huge
end

local function GetNearestEnemy()
	local nearest, dist = nil, math.huge
	for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
		if IsAlive(enemy) and enemy:FindFirstChild("HumanoidRootPart") then
			local mag = GetDistance(enemy.HumanoidRootPart.Position)
			if mag < dist then
				dist = mag
				nearest = enemy
			end
		end
	end
	return nearest
end

local function GetEnemies()
	return Workspace:FindFirstChild("Enemies") and Workspace.Enemies:GetChildren() or {}
end

local function EquipWeapon(toolTip)
	for _, tool in pairs(Player.Backpack:GetChildren()) do
		if tool:IsA("Tool") and tool.ToolTip == toolTip then
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

local function GetEquippedWeapon()
	for _, tool in pairs(Character:GetChildren()) do
		if tool:IsA("Tool") then return tool end
	end
	return EquipWeapon(Settings.SelectWeapon)
end

local function HasItem(name)
	return Player.Backpack:FindFirstChild(name)
end

local function Teleport(cframe)
	if HRP then HRP.CFrame = cframe end
end

local function TweenTo(cframe)
	if not HRP then return end
	local dist = (HRP.Position - cframe.Position).Magnitude
	local speed = Settings.TweenSpeed or 300
	local tween = TweenService:Create(HRP, TweenInfo.new(dist / speed, Enum.EasingStyle.Linear), {CFrame = cframe})
	tween:Play()
	return tween
end

local function BladeHitAttack()
	if not IsAlive(Character) then return end
	local weapon = GetEquippedWeapon()
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
				Validator:FireServer(math.floor(Val5 / 1099511627776 * 16777215), Val4)
			end
		end
	end
end

local function ClickAttack()
	if not IsAlive(Character) then return end
	if Settings.FastAttack then
		BladeHitAttack()
	else
		VirtualUser:CaptureController()
		VirtualUser:Button1Down(Vector2.new(1e4, 1e4))
	end
end

local function BringMob(enemy, distance)
	distance = distance or Settings.BringDistance
	for _, mob in pairs(GetEnemies()) do
		if mob.Name == enemy.Name and IsAlive(mob) then
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

local ESPFolder = Instance.new("Folder", Workspace)
ESPFolder.Name = "NexoHub_ESP"

local function CreateESP(instance, color, text)
	if not instance then return end
	local adornee = instance:FindFirstChild("HumanoidRootPart") or instance:FindFirstChildWhichIsA("BasePart")
	if not adornee then return end
	local highlight = Instance.new("Highlight")
	highlight.FillColor = color
	highlight.OutlineColor = color
	highlight.FillTransparency = 0.5
	highlight.OutlineTransparency = 0
	highlight.Adornee = instance
	highlight.Parent = ESPFolder
	local billboard = Instance.new("BillboardGui")
	billboard.Size = UDim2.new(0, 200, 0, 50)
	billboard.StudsOffset = Vector3.new(0, 3, 0)
	billboard.Adornee = adornee
	billboard.Parent = instance
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = text or instance.Name
	label.TextColor3 = color
	label.TextScaled = true
	label.Parent = billboard
end

local function UpdateESP()
	ESPFolder:ClearAllChildren()
	if getgenv().Settings.ESPE then
		if getgenv().Settings.ESPPlayers then
			for _, plr in pairs(Players:GetPlayers()) do
				if plr ~= Player and plr.Character then
					CreateESP(plr.Color, Color3.new(1, 0, 0), plr.Name)
				end
			end
		end
		if getgenv().Settings.ESPBosses then
			for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
				if enemy:FindFirstChild("HumanoidRootPart") then
					local isBoss = false
					for _, bossData in pairs(QuestData.Bosses[QuestData.GetCurrentSea()] or {}) do
						if enemy.Name:find(bossData.Name) then
							isBoss = true
							break
						end
					end
					if isBoss then
						CreateESP(enemy, Color3.new(1, 0, 1), enemy.Name .. " [BOSS]")
					end
				end
			end
		end
		if getgenv().Settings.ESPFruits then
			for _, obj in pairs(Workspace:GetDescendants()) do
				if obj:IsA("Model") and obj.Name:find("Fruit") then
					CreateESP(obj, Color3.new(0, 1, 1), obj.Name)
				end
			end
		end
		if getgenv().Settings.ESPChests then
			for _, obj in pairs(Workspace:GetChildren()) do
				if obj:IsA("Model") and obj:FindFirstChild("Chest") then
					CreateESP(obj, Color3.new(1, 1, 0), "Chest")
				end
			end
		end
	end
end

task.spawn(function()
	while task.wait(1) do
		UpdateESP()
	end
end)

local function KillAura()
	if not getgenv().Settings.KillAura then return end
	local distance = getgenv().Settings.KillAuraDistance or 50
	for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
		if IsAlive(enemy) and enemy:FindFirstChild("HumanoidRootPart") then
			if GetDistance(enemy.HumanoidRootPart.Position) < distance then
				enemy.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
				enemy.HumanoidRootPart.CanCollide = false
				enemy.Humanoid:ChangeState(15)
				enemy.Humanoid.Health = 0
				sethiddenproperty(Player, "SimulationRadius", math.huge)
			end
		end
	end
end

task.spawn(function()
	while task.wait(0.5) do
		if getgenv().Settings.KillAura then
			pcall(KillAura)
		end
	end
end)

local function ApplyFPSBoost()
	if getgenv().Settings.FPSBoost then
		local cameraShaker = ReplicatedStorage:FindFirstChild("Util") and ReplicatedStorage.Util:FindFirstChild("CameraShaker")
		if cameraShaker then
			local camShaker = require(cameraShaker)
			if camShaker.Stop then camShaker:Stop() end
		end
		local deathEffect = ReplicatedStorage:FindFirstChild("Effect") and ReplicatedStorage.Effect:FindFirstChild("Container") and ReplicatedStorage.Effect.Container:FindFirstChild("Death")
		if deathEffect then
			hookfunction(require(deathEffect), function() end)
		end
		settings().Rendering.QualityLevel = 1
		workspace:FindFirstChildOfClass("Terrain").WaterWaveSize = 0
		workspace:FindFirstChildOfClass("Terrain").WaterWaveSpeed = 0
		workspace:FindFirstChildOfClass("Terrain").WaterReflectance = 0
		workspace:FindFirstChildOfClass("Terrain").WaterTransparency = 0
	end
end

task.spawn(function()
	while task.wait(2) do
		pcall(ApplyFPSBoost)
	end
end)

local function AutoAwaken()
	if not getgenv().Settings.AutoAwaken then return end
	local awakenFrame = Player.PlayerGui:FindFirstChild("Awakening") and Player.PlayerGui.Awakening:FindFirstChild("Frame")
	if awakenFrame and awakenFrame.Visible then
		for _, button in pairs(awakenFrame:GetChildren()) do
			if button:IsA("TextButton") and button.Text == "Awaken" then
				button:Activate()
			end
		end
	end
end

task.spawn(function()
	while task.wait(1) do
		if getgenv().Settings.AutoAwaken then
			pcall(AutoAwaken)
		end
	end
end)

local function AutoRaceV4()
	if not getgenv().Settings.AutoRaceV4 then return end
	FireRemote("ActivateRaceV4")
end

task.spawn(function()
	while task.wait(5) do
		if getgenv().Settings.AutoRaceV4 then
			pcall(AutoRaceV4)
		end
	end
end)

local function FruitSniper()
	if not getgenv().Settings.FruitSniper then return end
	local fruits = SafeCall(function() return CommF_:InvokeServer("GetFruits") end)
	if not fruits then return end
	for _, fruit in pairs(fruits) do
		if fruit.OnSale and getgenv().Settings.SelectedFruits[fruit.Name] then
			FireRemote("BuyFruit", fruit.Name)
		end
	end
end

task.spawn(function()
	while task.wait(2) do
		if getgenv().Settings.FruitSniper then
			pcall(FruitSniper)
		end
	end
end)

local function AutoStats()
	if not getgenv().Settings.AutoStats then return end
	local points = getgenv().Settings.AutoStatsAmount or 1
	local stats = {"Melee", "Defense", "Sword", "Gun", "Demon Fruit"}
	for _, stat in pairs(stats) do
		FireRemote("AddPoint", stat, points)
	end
end

task.spawn(function()
	while task.wait(2) do
		if getgenv().Settings.AutoStats then
			pcall(AutoStats)
		end
	end
end)

local function ServerHop()
	if not getgenv().Settings.ServerHop then return end
	local success, servers = pcall(function()
		return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
	end)
	if success and servers and servers.data then
		for _, server in pairs(servers.data) do
			if server.playing < server.maxPlayers then
				TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, Player)
				break
			end
		end
	end
end

task.spawn(function()
	while task.wait(10) do
		if getgenv().Settings.ServerHop then
			pcall(ServerHop)
		end
	end
end)

local function InfiniteJump()
	if not getgenv().Settings.InfiniteJump then return end
	if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
		if HRP then
			HRP.Velocity = Vector3.new(HRP.Velocity.X, 50, HRP.Velocity.Z)
		end
	end
end

UserInputService.JumpRequest:Connect(function()
	if getgenv().Settings.InfiniteJump then
		if Character and Humanoid then
			Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)

local function ApplySpeedBoost()
	if getgenv().Settings.SpeedBoost and Humanoid then
		Humanoid.WalkSpeed = 16 * (getgenv().Settings.SpeedMultiplier or 1)
	else
		if Humanoid then
			Humanoid.WalkSpeed = 16
		end
	end
end

task.spawn(function()
	while task.wait(0.5) do
		pcall(ApplySpeedBoost)
	end
end)

local function ApplyJumpBoost()
	if getgenv().Settings.JumpBoost and Humanoid then
		Humanoid.JumpPower = 50 * (getgenv().Settings.JumpMultiplier or 1)
	end
end

task.spawn(function()
	while task.wait(0.5) do
		pcall(ApplyJumpBoost)
	end
end)

getgenv().QuestData = {
	Sea1 = {},
	Sea2 = {},
	Sea3 = {},
	Bosses = {Sea1 = {}, Sea2 = {}, Sea3 = {}},
	Islands = {Sea1 = {}, Sea2 = {}, Sea3 = {}},
}
local QuestData = getgenv().QuestData
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

local function StartQuest(quest)
	if not quest then return end
	local questGui = Player.PlayerGui:FindFirstChild("Main") and Player.PlayerGui.Main:FindFirstChild("Quest")
	if questGui and questGui.Visible then
		local title = questGui.Container and questGui.Container.QuestTitle and questGui.Container.QuestTitle.Title
		if title and title.Text:find(quest.Name) then return true end
	end
	Teleport(quest.CFrameQuest)
	task.wait(0.5)
	FireRemote("StartQuest", quest.QuestName, quest.QuestNumber)
	FireRemote("SetSpawnPoint")
	task.wait(0.3)
	return true
end

local function FindMob(name)
	for _, enemy in pairs(GetEnemies()) do
		if enemy.Name:find(name) and IsAlive(enemy) then return enemy end
	end
	for _, enemy in pairs(ReplicatedStorage:GetChildren()) do
		if enemy.Name:find(name) and IsAlive(enemy) then return enemy end
	end
	return nil
end

local function FarmMob(quest)
	local mob = FindMob(quest.Name)
	if not mob then
		Teleport(quest.CFrameMob)
		task.wait(0.5)
		return
	end
	if Settings.BringMobs then BringMob(mob) end
	while IsAlive(mob) and (Settings.AutoFarmLevel or Settings.AutoFarmMastery) do
		if not mob:FindFirstChild("HumanoidRootPart") then break end
		Teleport(mob.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
		ClickAttack()
		task.wait(0.1)
	end
end

local function AutoFarmLevelLoop()
	while Settings.AutoFarmLevel do
		local quest = QuestData.GetQuestForLevel(GetLevel())
		if quest then
			StartQuest(quest)
			FarmMob(quest)
		end
		task.wait(0.5)
	end
end

local function AutoFarmMasteryLoop()
	local quest = QuestData.GetQuestForLevel(GetLevel())
	if not quest then return end
	local questGui = Player.PlayerGui:FindFirstChild("Main") and Player.PlayerGui.Main:FindFirstChild("Quest")
	if not questGui or not questGui.Visible then
		Teleport(quest.CFrameQuest)
		task.wait(0.5)
		FireRemote("StartQuest", quest.QuestName, quest.QuestNumber)
		FireRemote("SetSpawnPoint")
		task.wait(0.3)
	end
	while Settings.AutoFarmMastery do
		local mob = FindMob(quest.Name)
		if not mob then
			Teleport(quest.CFrameMob)
			task.wait(0.5)
		else
			if Settings.BringMobs then BringMob(mob) end
			while IsAlive(mob) and Settings.AutoFarmMastery do
				if not mob:FindFirstChild("HumanoidRootPart") then break end
				Teleport(mob.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
				ClickAttack()
				task.wait(0.1)
			end
		end
		task.wait(0.3)
	end
end

local function AutoFarmNearestLoop()
	while Settings.AutoFarmNearest do
		local nearest = GetNearestEnemy()
		if nearest then
			while IsAlive(nearest) and Settings.AutoFarmNearest do
				if not nearest:FindFirstChild("HumanoidRootPart") then break end
				Teleport(nearest.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
				ClickAttack()
				task.wait(0.1)
			end
		end
		task.wait(0.3)
	end
end

local function AutoFarmBossesLoop()
	while Settings.AutoFarmBosses do
		local bosses = QuestData.GetBossesForSea()
		for _, bossData in ipairs(bosses) do
			if not Settings.AutoFarmBosses then break end
			if GetLevel() >= bossData.Level then
				Teleport(bossData.CFrame)
				task.wait(1)
				local boss = nil
				for _, enemy in pairs(GetEnemies()) do
					if enemy.Name:find(bossData.Name) and IsAlive(enemy) then
						boss = enemy
						break
					end
				end
				if boss then
					while IsAlive(boss) and Settings.AutoFarmBosses do
						if not boss:FindFirstChild("HumanoidRootPart") then break end
						Teleport(boss.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
						ClickAttack()
						task.wait(0.1)
					end
				end
			end
		end
		task.wait(1)
	end
end

local function AutoChestLoop()
	while Settings.AutoChest do
		local found = false
		for _, obj in pairs(Workspace:GetChildren()) do
			if not Settings.AutoChest then break end
			if obj:IsA("Model") and obj:FindFirstChild("Chest") then
				found = true
				local chest = obj:FindFirstChild("Chest")
				if chest then
					Teleport(chest.CFrame)
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
		if not found then task.wait(1) end
	end
end

local function FindSeaBeast()
	for _, obj in pairs(Workspace:GetChildren()) do
		if obj:IsA("Model") and (obj.Name:find("Sea Beast") or obj.Name:find("SeaBeast") or obj.Name:find("Water")) then
			if IsAlive(obj) then return obj end
		end
	end
	return nil
end

local function AutoSeaBeastLoop()
	while Settings.AutoSeaBeast do
		local beast = FindSeaBeast()
		if beast then
			while IsAlive(beast) and Settings.AutoSeaBeast do
				if not beast:FindFirstChild("HumanoidRootPart") then break end
				Teleport(beast.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
				ClickAttack()
				task.wait(0.1)
			end
		end
		task.wait(1)
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
		if getgenv().Settings.NoClip and IsAlive(Character) then
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
	if state then task.spawn(AutoFarmLevelLoop) end
end)

FarmSection:NewToggle("Auto Farm Mastery", "Farms mastery on best mob", function(state)
	Settings.AutoFarmMastery = state
	if state then task.spawn(AutoFarmMasteryLoop) end
end)

FarmSection:NewToggle("Auto Farm Nearest", "Farms nearest enemy", function(state)
	Settings.AutoFarmNearest = state
	if state then task.spawn(AutoFarmNearestLoop) end
end)

FarmSection:NewToggle("Auto Farm Bosses", "Farms all bosses in current sea", function(state)
	Settings.AutoFarmBosses = state
	if state then task.spawn(AutoFarmBossesLoop) end
end)

FarmSection:NewToggle("Auto Collect Chests", "Collects all chests", function(state)
	Settings.AutoChest = state
	if state then task.spawn(AutoChestLoop) end
end)

FarmSection:NewToggle("Auto Sea Beasts", "Farms sea beasts", function(state)
	Settings.AutoSeaBeast = state
	if state then task.spawn(AutoSeaBeastLoop) end
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
		Teleport(island.CFrame)
	end)
end

local SeaSection = TeleportTab:NewSection("Sea Travel")
SeaSection:NewButton("Sea 1", "Go to First Sea", function() FireRemote("requestEntrance", Vector3.new(1, 100000, 1)) end)
SeaSection:NewButton("Sea 2", "Go to Second Sea", function() FireRemote("requestEntrance", Vector3.new(-4608, 872, -4096)) end)
SeaSection:NewButton("Sea 3", "Go to Third Sea", function() FireRemote("requestEntrance", Vector3.new(-1000, 1, -1000)) end)

local PlayerTPSection = TeleportTab:NewSection("Players")
PlayerTPSection:NewDropdown("Select Player", "Choose a player to teleport", function(option)
	for _, p in pairs(Players:GetPlayers()) do
		if p.Name == option then
			if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
				Teleport(p.Character.HumanoidRootPart.CFrame)
			end
			break
		end
	end
end)

local BossTab = Window:NewTab("Bosses")
local BossSection = BossTab:NewSection("Boss Teleport")

local bosses = QuestData.GetBossesForSea()
for _, boss in ipairs(bosses) do
	BossSection:NewButton(boss.Name .. " (Lv." .. boss.Level .. ")", "Teleport to " .. boss.Name, function()
		Teleport(boss.CFrame)
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
	CommF_:InvokeServer("StoreFruit", option, HasItem(option))
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
	CommF_:InvokeServer("AddPoint", Settings.SelectStat, Settings.StatPoints)
end)

local ESPTab = Window:NewTab("ESP")
local ESPSection = ESPTab:NewSection("ESP Options")

ESPSection:NewToggle("Enable ESP", "Toggle all ESP", function(state)
	Settings.ESPE = state
end)

ESPSection:NewToggle("ESP Players", "Highlight players", function(state)
	Settings.ESPPlayers = state
end)

ESPSection:NewToggle("ESP Bosses", "Highlight bosses", function(state)
	Settings.ESPBosses = state
end)

ESPSection:NewToggle("ESP Fruits", "Highlight devil fruits", function(state)
	Settings.ESPFruits = state
end)

ESPSection:NewToggle("ESP Chests", "Highlight chests", function(state)
	Settings.ESPChests = state
end)

local CombatTab = Window:NewTab("Combat")
local KillAuraSection = CombatTab:NewSection("Kill Aura")

KillAuraSection:NewToggle("Kill Aura", "Kill nearby enemies", function(state)
	Settings.KillAura = state
end)

KillAuraSection:NewSlider("Aura Distance", "Kill distance", 100, 10, function(value)
	Settings.KillAuraDistance = value
end)

local MovementSection = CombatTab:NewSection("Movement")

MovementSection:NewToggle("Speed Boost", "Increase walk speed", function(state)
	Settings.SpeedBoost = state
end)

MovementSection:NewSlider("Speed Multiplier", "Speed multiplier", 5, 1, function(value)
	Settings.SpeedMultiplier = value
end)

MovementSection:NewToggle("Jump Boost", "Increase jump power", function(state)
	Settings.JumpBoost = state
end)

MovementSection:NewSlider("Jump Multiplier", "Jump multiplier", 5, 1, function(value)
	Settings.JumpMultiplier = value
end)

MovementSection:NewToggle("Infinite Jump", "Jump unlimited times", function(state)
	Settings.InfiniteJump = state
end)

local UtilityTab = Window:NewTab("Utility")
local FPSBoostSection = UtilityTab:NewSection("Performance")

FPSBoostSection:NewToggle("FPS Boost", "Optimize performance", function(state)
	Settings.FPSBoost = state
end)

local AutoSection = UtilityTab:NewSection("Automation")

AutoSection:NewToggle("Auto Awaken", "Auto awaken fruit moves", function(state)
	Settings.AutoAwaken = state
end)

AutoSection:NewToggle("Auto Race V4", "Automate race V4 quest", function(state)
	Settings.AutoRaceV4 = state
end)

AutoSection:NewToggle("Auto Stats", "Auto allocate all stats", function(state)
	Settings.AutoStats = state
end)

local FruitSniperSection = UtilityTab:NewSection("Fruit Sniper")

FruitSniperSection:NewToggle("Fruit Sniper", "Auto-buy selected fruits", function(state)
	Settings.FruitSniper = state
end)

FruitSniperSection:NewLabel("Select fruits to auto-buy:")

for _, fruit in pairs(FruitCodes) do
	FruitSniperSection:NewToggle(fruit, "Auto-buy " .. fruit, function(state)
		Settings.SelectedFruits[fruit] = state
	end)
end

local ServerSection2 = UtilityTab:NewSection("Server")

ServerSection2:NewToggle("Server Hop", "Find new server", function(state)
	Settings.ServerHop = state
	if state then pcall(ServerHop) end
end)

local MiscTab = Window:NewTab("Misc")
local ServerSection = MiscTab:NewSection("Server")

ServerSection:NewButton("Redeem Codes", "Redeem all codes", function()
	CommF_:InvokeServer("Redeem", "CODE")
end)

ServerSection:NewButton("Join Crew", "Join a crew", function()
	CommF_:InvokeServer("Crew", "Join")
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
