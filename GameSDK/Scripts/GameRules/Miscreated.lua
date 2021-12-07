Script.ReloadScript("scripts/gamerules/GameRulesUtils.lua")

Miscreated = {
	Properties = {
		WorldEvent = {
			fMinTime = 1800, -- min time to spawn an event (in seconds)
			fMaxTime = 2700, -- max time to spawn an event (in seconds)
		}
	}
}

GameRulesSetStandardFuncs(Miscreated)

function Miscreated.Server:OnInit()
	self:CreateWorldEventTimer()
end

----------------------------------------------------------------------------------------------------
-- Support for the world events to spawn
----------------------------------------------------------------------------------------------------

function Miscreated:CreateWorldEventTimer()
	--Log(">> Miscreated:CreateWorldEventTimer")

	Script.SetTimerForFunction(
		randomF(
			self.Properties.WorldEvent.fMinTime * 1000,
			self.Properties.WorldEvent.fMaxTime * 1000
		),
		"SpawnWorldEvent", self
	)
end

SpawnWorldEvent = function(self)
	--Log(">> Miscreated:SpawnWorldEvent")

	local eventName
	local rnd = random(1, 16)

	if rnd >= 1 and rnd <= 3 then
		eventName = "AirDropPlane"
	elseif rnd >= 4 and rnd <=9 then
		eventName = "AirPlaneCrash"
	else
		eventName = "UFOCrash"
	end

	local spawnParams = {}
	spawnParams.class = eventName
	spawnParams.name = spawnParams.class

	--Log(">> Miscreated:SpawnWorldEvent - Spawning Event")
	local spawnedEntity = System.SpawnEntity(spawnParams)

	if not spawnedEntity then
		Log("Miscreated:SpawnWorldEvent - entity could not be spawned")
	end

	-- Set timer up for the next world event.
	self:CreateWorldEventTimer()
end

----------------------------------------------------------------------------------------------------
-- Support for custom chat commands
----------------------------------------------------------------------------------------------------

ChatCommands = {}

Script.LoadScriptFolder("Scripts/GameRules/ChatCommands", true, true)

function Miscreated:ChatCommand(playerId, command)
	--Log(">> Miscreated:ChatCommand")

	local player = System.GetEntity(playerId)

	if not player.actor then
		Log("Miscreated:ChatCommand - playerId is not a valid player")
		return
	end

	-- Find the requested chat command and execute it.
	local index = string.find(command, " ")

	if not index then
		if ChatCommands[command] then
			ChatCommands[command](playerId, "")
		end
	else
		local cmd = string.sub(command, 1, index - 1)
		if ChatCommands[cmd] then
			ChatCommands[cmd](playerId, string.sub(command, index + 1))
		end
	end
end

----------------------------------------------------------------------------------------------------
-- Support for custom player spawns
----------------------------------------------------------------------------------------------------

function Miscreated:InitPlayer(playerId)
	--Log(">> Miscreated:InitPlayer")

	local player = System.GetEntity(playerId)

	if (player and player.actor and player:IsDead()) then
		local x, y, z, r

		local rnd = random(8)

		-- Safe Zone spawn points.
		if rnd == 1 then
			x = 4893.166015625
			y = 4722.4150390625
			z = 148.322998046875
			r = -2.4210000038147
		elseif rnd == 2 then
			x = 4915.68310546875
			y = 4742.5458984375
			z = 148.908004760742
			r = -2.4210000038147
		elseif rnd == 3 then
			x = 4887.86083984375
			y = 4681.4482421875
			z = 145.337005615234
			r = -1.02900004386902
		elseif rnd == 4 then
			x = 4898.22802734375
			y = 4676.48583984375
			z = 145.378997802734
			r = 0.647000014781952
		elseif rnd == 5 then
			x = 4940.35302734375
			y = 4657.6328125
			z = 148.912002563477
			r = 0.621999979019165
		elseif rnd == 6 then
			x = 4927.62109375
			y = 4701.51318359375
			z = 142.645004272461
			r = 0.499000012874603
		elseif rnd == 7 then
			x = 4917.18701171875
			y = 4729.171875
			z = 146.251998901367
			r = -0.510999977588654
		else
			x = 4927.0859375
			y = 4722.0029296875
			z = 134.914001464844
			r = -0.0189999993890524
		end

		g_Vectors.temp_v1.x = x
		g_Vectors.temp_v1.y = y
		g_Vectors.temp_v1.z = z

		local angle = player:GetAngles()
		angle.z = r

		player:SetAngles(angle)
		player:SetWorldPos(g_Vectors.temp_v1)
	end
end

function Miscreated:EquipPlayer(playerId)
	--Log(">> Miscreated:EquipPlayer")

	local player = System.GetEntity(playerId)

	if (player and player.actor) then
		local rnd

		ISM.GiveItem(playerId, "Flashlight")
		ISM.GiveItem(playerId, "Map")

		-- Hat
		rnd = random(1, 3)

		if rnd == 1 then
			ISM.GiveItem(playerId, "BeanieBrown")
		elseif rnd == 2 then
			ISM.GiveItem(playerId, "BikeHelmetBlack")
		else
			ISM.GiveItem(playerId, "BandanaHat")
		end

		-- Feet
		rnd = random(1, 3)

		if rnd == 1 then
			ISM.GiveItem(playerId, "TennisShoes")
		elseif rnd == 2 then
			ISM.GiveItem(playerId, "Sneakers")
		else
			ISM.GiveItem(playerId, "CanvasShoes")
		end

		-- Legs
		local leg

		rnd = random(1, 4)

		if rnd == 1 then
			leg = ISM.GiveItem(playerId, "BlueJeans")
		elseif rnd == 2 then
			leg = ISM.GiveItem(playerId, "BlueJeans2")
		elseif rnd == 3 then
			leg = ISM.GiveItem(playerId, "BlueJeans2Brown")
		else
			leg = ISM.GiveItem(playerId, "BlueJeans2Green")
		end

		-- Torso
		local torso

		rnd = random(1, 6)

		if rnd == 1 then
			torso = ISM.GiveItem(playerId, "TshirtNoImageBlack")
		elseif rnd == 2 then
			torso = ISM.GiveItem(playerId, "TshirtNoImageBlue")
		elseif rnd == 3 then
			torso = ISM.GiveItem(playerId, "TshirtNoImageGreen")
		elseif rnd == 4 then
			torso = ISM.GiveItem(playerId, "TshirtNoImageGrey")
		elseif rnd == 5 then
			torso = ISM.GiveItem(playerId, "TshirtNoImagePink")
		else
			torso = ISM.GiveItem(playerId, "TshirtNoImageRed")
		end

		-- Weapon
		rnd = random(1, 3)

		if rnd == 1 then
			ISM.GiveItem(playerId, "Axe")
		elseif rnd == 2 then
			ISM.GiveItem(playerId, "BaseballBat")
		else
			ISM.GiveItem(playerId, "Crowbar")
		end

		-- Bag
		local bag

		rnd = random(1, 2)

		if rnd == 1 then
			bag = ISM.GiveItem(playerId, "horshoe_pack")
		else
			bag = ISM.GiveItem(playerId, "CraftedFannyPack")
		end

		-- Food
		local food

		rnd = random(1, 2)

		if rnd == 1 then
			food = ISM.GiveItem(bag.id, "Berries")
			food.item:SetStackCount(8)
		else
			food = ISM.GiveItem(bag.id, "AppleFresh")
			food.item:SetStackCount(2)
		end

		-- Essentials
		local medicine = ISM.GiveItem(bag.id, "Antibiotics")
		medicine.item:SetStackCount(3)

		ISM.GiveItem(torso.id, "Bandage")
		ISM.GiveItem(leg.id, "WaterBottle")

		local ledger = ISM.GiveItem(leg.id, "AmcoinLedger")
		ledger.item:SetStackCount(20)

		-- Override defaults.
		player.player:SetFood(2000.0)
		player.player:SetWater(2000.0)
	end
end
