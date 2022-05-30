Script.LoadScript("scripts/entities/items/RemoteInventory.lua")
Script.LoadScript("scripts/entities/items/RemoteInventoryStorage.lua")

RemoteInventoryRMIObject = nil
RemoteInventoryStorageId = nil

---
-- Replace Steam kiosks with custom entity.
--
local ReplaceSteamStands = function()
	--Log(">> ReplaceSteamStands")

	local entities = System.GetEntitiesByClass("SteamStand")

	for i, entity in pairs(entities) do
		local className = "RemoteInventoryStorage"

		local spawnParams = {
			class = className,
			orientation = entity:GetWorldDir(),
			position = entity:GetWorldPos()
		}

		local spawnedEntity = System.SpawnEntity(spawnParams)

		if spawnedEntity ~= nil then
			entity:DeleteThis()
		else
			LogError("Entity %s could not be spawned", className)
		end
	end
end

--
-- Spawn RMI handler object for the game session.
--
local SpawnManagerObject = function(playerId)
	--Log(">> SpawnManagerObject")

	if not RemoteInventoryRMIObject then
		RemoteInventoryRMIObject = ISM.SpawnItem("RemoteInventory", {x=1000, y=1000, z=500})
	end
end

--
-- Get storage entity for a given player.
--
local GetStorageEntity = function(playerId)
	--Log(">> GetStorageEntity")

	local player = System.GetEntity(playerId)

	local plotsigns = BaseBuildingSystem:GetPlotSigns()

	for _, plotsign in pairs(plotsigns) do
		local steamId = player.player:GetSteam64Id()
	
		if plotsign.plotsign:GetOwnerSteam64Id() == steamId then
			local partCount = plotsign.plotsign:GetPartCount()

			if partCount > 0 then
				for i = 0, partCount - 1 do
					local partId = plotsign.plotsign:GetPartId(i)

					if plotsign.plotsign:GetPartClassName(partId) == "RemoteInventoryStorage_packed" then
						RemoteInventoryStorageId = plotsign.plotsign:GetPartEntityId(partId)
					end
				end
			end
		end
	end
end

--
-- Initialize during client startup.
--
function RemoteInventoryInit()
	--Log(">> RemoteInventoryInit")

	if CryAction.IsClient() then
		ReplaceSteamStands()
	end
end

--
-- Initialize globally-scoped RMI function handler.
--
RegisterCallbackReturnAware(Miscreated, "RevivePlayer",
	function(self, ret, playerId)
		SpawnManagerObject(playerId)
		GetStorageEntity(playerId)
		return ret
	end
)
