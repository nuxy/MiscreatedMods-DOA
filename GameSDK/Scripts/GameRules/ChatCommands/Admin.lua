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
ChatCommands["!attn"] = function(playerId, textMessage)
	Log(">> !attn %s", textMessage)

	local message = "Invalid command. Usage:\n  !attn <message>"

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
