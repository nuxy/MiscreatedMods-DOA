Script.LoadScript("scripts/gamerules/AccessControl.lua")

-- Execute an RCON command on the server.
ChatCommands["!rcon"] = function(playerId, command)
	Log(">> !rcon %s", command)

	local message = "Invalid command. Usage:\n  !rcon <command>"

	local player = System.GetEntity(playerId)

	if IsAdminPlayer(player.player:GetSteam64Id()) then
		if not EmptyString(command) then
			System.ExecuteCommand(command)
		else
			g_gameRules.game:SendTextMessage(4, playerId, message)
		end
	end
end

-- Send a screen message to all players.
ChatCommands["!wall"] = function(playerId, textMessage)
	Log(">> !wall %s", textMessage)

	local message = "Invalid command. Usage:\n  !wall <message>"

	local player = System.GetEntity(playerId)

	if IsAdminPlayer(player.player:GetSteam64Id()) then
		if not EmptyString(textMessage) then
			g_gameRules.game:SendTextMessage(0, 0, textMessage)
		else
			g_gameRules.game:SendTextMessage(4, playerId, message)
		end
	end
end

-- Teleport to the Safe Zone.
ChatCommands["!safezone"] = function(playerId)
	Log(">> !safezone")

	local player = System.GetEntity(playerId)

	if IsAdminPlayer(player.player:GetSteam64Id()) then
		g_Vectors.temp_v1.x = 4912.13916015625
		g_Vectors.temp_v1.y = 4717.68994140625
		g_Vectors.temp_v1.z = 142.735000610352

		player.player:TeleportTo(g_Vectors.temp_v1)
	end
end

-- Ban player by Steam ID.
ChatCommands["!ban"] = function(playerId, steamId)
	Log(">> !ban %s", steamId)

	local player = System.GetEntity(playerId)

	if IsAdminPlayer(player.player:GetSteam64Id()) then
		ChatCommands["!rcon"](playerId, "mis_ban_steamid " .. steamId)
	end
end

-- Kick player by Steam ID.
ChatCommands["!kick"] = function(playerId, steamId)
	Log(">> !kick %s", steamId)

	local player = System.GetEntity(playerId)

	if IsAdminPlayer(player.player:GetSteam64Id()) then
		ChatCommands["!rcon"](playerId, "mis_kick " .. steamId)
	end
end
