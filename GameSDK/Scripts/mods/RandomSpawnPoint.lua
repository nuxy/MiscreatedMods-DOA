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
		if not IsEmptyCollection(DB, "LocationCollection") then

			-- Get random location.
			local data = GetRandomPage(DBCollection)

			if data ~= nil then
				g_Vectors.temp_v1.x = tonumber(data["posX"])
				g_Vectors.temp_v1.y = tonumber(data["posY"])
				g_Vectors.temp_v1.z = tonumber(data["posZ"])

				local angle = player:GetAngles()
				angle.z = tonumber(data["posR"])

				player:SetAngles(angle)
				player:SetWorldPos(g_Vectors.temp_v1)
			end
		end
	end
end
