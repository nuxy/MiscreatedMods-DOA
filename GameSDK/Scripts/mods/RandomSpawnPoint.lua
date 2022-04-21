Script.ReloadScript("scripts/MisDB/MisDB.lua")
Script.ReloadScript("scripts/utils/MisDB.lua")

--
-- Support for custom player spawns.
--
RegisterCallbackReturnAware(Miscreated, "InitPlayer",
	function(self, ret, playerId)
		local DB = MisDB:Create("SpawnPointDB/", "SpawnPointData")
		local DBCollection = DB:Collection("LocationCollection")

		local player = System.GetEntity(playerId)

		if player and player.player then
			local pos = {x=0, y=0, z=0}
			local rot = {x=0, y=0, z=0}

			-- Spawn at base PlotSign when "Repawn At Base" is selected.
			local plotsigns = BaseBuildingSystem:GetPlotSigns()

			for _, plotsign in pairs(plotsigns) do
				local steamId = player.player:GetSteam64Id()

				if plotsign.plotsign:GetOwnerSteam64Id() == steamId then
					pos = plotsign:GetWorldPos()
					rot = plotsign:GetWorldAngles()
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
					rot.z = tonumber(data["posR"])
				end
			end

			if IsNotNullVector(pos) then
				player:SetAngles(rot)
				player:SetWorldPos(pos)
			end
		end

		return ret
	end
)
