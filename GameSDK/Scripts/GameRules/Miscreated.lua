Script.ReloadScript("scripts/gamerules/GameRulesUtils.lua");

Miscreated = {
	Properties = {
		WorldEvent = {
			fMinTime = 1800, -- min time to spawn an event (in seconds)
			fMaxTime = 2700, -- max time to spawn an event (in seconds)
		}
	}
}

GameRulesSetStandardFuncs(Miscreated);

function Miscreated.Server:OnInit()
	self:CreateWorldEventTimer()
end

----------------------------------------------------------------------------------------------------
-- Support for the world events to spawn
----------------------------------------------------------------------------------------------------

function Miscreated:CreateWorldEventTimer()
	--Log("Miscreated.CreateWorldEventTimer")
	Script.SetTimerForFunction(randomF(self.Properties.WorldEvent.fMinTime*1000, self.Properties.WorldEvent.fMaxTime*1000), "SpawnWorldEvent", self)
end

SpawnWorldEvent = function(self)
	--Log("Miscreated:SpawnWorldEvent")

	local eventName
	local rnd = random(1, 10)

	if rnd >= 1 and rnd <= 3 then
		eventName = "AirDropPlane"
	end

	if rnd >= 4 and rnd <=9 then
		eventName = "AirPlaneCrash"
	end

	if rnd >= 10 then
		eventName = "UFOCrash"
	end

	local spawnParams = {}
	spawnParams.class = eventName
	spawnParams.name = spawnParams.class

	--Log("Miscreated:SpawnWorldEvent - Spawning Event")
	local spawnedEntity = System.SpawnEntity(spawnParams)

	if not spawnedEntity then
		Log("Miscreated:SpawnWorldEvent - entity could not be spawned")
	end

	-- set timer up for the next world event
	self:CreateWorldEventTimer()
end

----------------------------------------------------------------------------------------------------
-- Support for custom chat command mods
----------------------------------------------------------------------------------------------------

-- Table for custom chat commands to use
ChatCommands = { }

-- Load custom chat commands (mods)
Script.LoadScriptFolder("Scripts/GameRules/ChatCommands", true, true)

-- Receives all unhandled, by the core game, chat commands
-- Do not add custom chat commands directly here
-- Add new chat commands to a file in the Scripts/GameRules/ChatCommands folder,
-- so they can be uploaded as mods to Steam
function Miscreated:ChatCommand(playerId, command)
	--Log(">> Miscreated:ChatCommand");

	-- player is an entity
	local player = System.GetEntity(playerId)

	if not player.actor then
		Log("Miscreated:ChatCommand - playerId is not a valid player")
		return
	end

	-- Find the requested chat command and execute it
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

-- See BattleRoyale.lua for a more complete example of the following 3 methods

--[[
-- Initialize the player
-- Use this to initialize the player before the server respawns the player
-- Any change to the player's position and rotation would have to be done here
function Miscreated:InitPlayer(playerId)
	--Log(">> Miscreated:InitPlayer");
  end
--]]

--[[
-- This is called when the character is being revived by the server
-- Set player stats here - only default CryEngine stats are currently exposed, like health
function Miscreated:RevivePlayer(playerId)
	--Log(">> Miscreated:RevivePlayer");
  end
--]]

function Miscreated:EquipPlayer(playerId)
	--Log(">> Miscreated:EquipPlayer")
	
	local player = System.GetEntity(playerId)

	if (player and player.player) then
		local rnd

		ISM.GiveItem(playerId, "Flashlight")

		-- Hat
		rnd = random(1, 3)

		if (rnd == 1) then
			ISM.GiveItem(playerId, "BeanieBrown")
		elseif (rnd == 2) then
			ISM.GiveItem(playerId, "BikeHelmetBlack")
		else
			ISM.GiveItem(playerId, "BandanaHat")
		end

		-- Feet
		rnd = random(1, 3)

		if (rnd == 1) then
			ISM.GiveItem(playerId, "TennisShoes")
		elseif (rnd == 2) then
			ISM.GiveItem(playerId, "Sneakers")
		else
			ISM.GiveItem(playerId, "CanvasShoes")
		end

		-- Legs
		local leg

		rnd = random(1, 4)

		if (rnd == 1) then
			leg = ISM.GiveItem(playerId, "BlueJeans", true)
		elseif (rnd == 2) then
			leg = ISM.GiveItem(playerId, "BlueJeans2", true)
		elseif (rnd == 3) then
			leg = ISM.GiveItem(playerId, "BlueJeans2Brown", true)
		else
			leg = ISM.GiveItem(playerId, "BlueJeans2Green", true)
		end

		-- Torso
		rnd = random(1, 6)

		if (rnd == 1) then
			ISM.GiveItem(playerId, "TshirtNoImageBlack")
		elseif (rnd == 2) then
			ISM.GiveItem(playerId, "TshirtNoImageBlue")
		elseif (rnd == 3) then
			ISM.GiveItem(playerId, "TshirtNoImageGreen")
		elseif (rnd == 4) then
			ISM.GiveItem(playerId, "TshirtNoImageGrey")
		elseif (rnd == 5) then
			ISM.GiveItem(playerId, "TshirtNoImagePink")
		else
			ISM.GiveItem(playerId, "TshirtNoImageRed")
		end

		-- Weapon
		rnd = random(1, 3)

		if (rnd == 1) then
			ISM.GiveItem(playerId, "Axe")
		elseif (rnd == 2) then
			ISM.GiveItem(playerId, "BaseballBat")
		else
			ISM.GiveItem(playerId, "Crowbar")
		end

		-- Bag
		local bag

		rnd = random(1, 2)

		if (rnd == 1) then
			bag = ISM.GiveItem(playerId, "horshoe_pack", true)
		else
			bag = ISM.GiveItem(playerId, "CraftedFannyPack", true)
		end

		-- Food
		rnd = random(1, 2)

		if (rnd == 1) then
			ISM.GiveItem(playerId, "Berries", false, bag.id)
		else
			ISM.GiveItem(playerId, "AppleFresh", false, bag.id)
		end

		-- Other items
		ISM.GiveItem(playerId, "Bandage", false, leg.id)
		ISM.GiveItem(playerId, "WaterBottle", false, bag.id)
	end
end
