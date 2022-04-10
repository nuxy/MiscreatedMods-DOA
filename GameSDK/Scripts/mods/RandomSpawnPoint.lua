Script.ReloadScript("scripts/MisDB/MisDB.lua")
Script.ReloadScript("scripts/utils/MisDB.lua")

local DB = MisDB:Create("SpawnPointDB/", "SpawnPointData")
local DBCollection = DB:Collection("LocationCollection")

--
-- Support for custom player spawns.
--
function Miscreated:InitPlayer(playerId)
	--Log(">> Miscreated:InitPlayer")

	local player = System.GetEntity(playerId)

	if player and player.player then
		local pos = {x=0, y=0, z=0}
		local rot = {x=0, y=0, z=0}

		-- Spawn at base PlotSign position.
		for _, plotsign in ipairs(BaseBuildingSystem:GetPlotSigns()) do
			local steamId = player.player:GetSteam64Id()

			if plotsign.plotsign:GetOwnerSteam64Id() == steamId then
				pos = plotsign:GetWorldPos()
				rot = plotsign:GetAngles()
				break
			end
		end

		-- Spawn at Admin defined location.
		if IsNullVector(pos) and not IsEmptyCollection(DB, "LocationCollection") then
			local data = GetRandomPage(DBCollection)

			if data ~= nil then
				pos.x = tonumber(data["posX"])
				pos.y = tonumber(data["posY"])
				pos.z = tonumber(data["posZ"])

				rot = player:GetAngles()
				rot.z = tonumber(data["posR"])
			end
		end

		if IsNotNullVector(pos) and IsNotNullVector(rot) then
			player:SetAngles(rot)
			player:SetWorldPos(pos)
		end
	end
end
