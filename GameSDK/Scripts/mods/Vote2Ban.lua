Script.ReloadScript("scripts/MisDB/MisDB.lua")
Script.ReloadScript("scripts/utils/MisDB.lua")

local DB, DBCollection

if CryAction.IsDedicatedServer() then
	DB = MisDB:Create("Vote2BanDB/", "Vote2BanData")
	DBCollection = DB:Collection("PlayerCollection")
end

--
-- Force system exit for banned players.
--
local forceExit = function(playerId)
	local message = "You are banned on this server. Exiting"

	g_gameRules.game:SendTextMessage(0, playerId, message)

	local delayExit = function()
		player.actor:ShutDown()

		System.Quit()
	end

	Script.SetTimerForFunction(2000, delayExit)
end

--
-- Write player to database on game entry.
--
function Miscreated.Server:OnClientEnteredGame(channelId, player)
	--Log(">> Miscreated.Server:OnClientEnteredGame")

	local steamId = player.player:GetSteam64Id()

	if not IsEmptyCollection(DB, "PlayerCollection") then
		local lastInsertId = GetLastInsertId(DBCollection)

		local found = false

		for i = 1, lastInsertId do
			local data = GetPageData(DBCollection, i)

			if data ~= nil and data["steamId"] == steamId then
				found = true

				if data["status"] == "banned" then
					forceExit(player.id)
				end
			end
		end

		if not found then
			local playerInfo =
			{
				["channelId"] = channelId,
				["steamId"] = steamId,
				["username"] = player:GetName(),
				["status"] = "active",
			}

			SetPageData(DBCollection, playerInfo)
		end
	end
end

--
-- Remove player from database on exit.
--
function Miscreated.Server:OnClientDisconnect(channelId)
	--Log(">> Miscreated.Server:OnClientDisconnect")

	if not IsEmptyCollection(DB, "PlayerCollection") then
		local lastInsertId = GetLastInsertId(DBCollection)

		for i = 1, lastInsertId do
			local data = GetPageData(DBCollection, i)

			if data ~= nil and data["channelId"] == channelId and data["status"] ~= "banned" then
				PurgePageData(DBCollection, i)
			end
		end
	end
end
