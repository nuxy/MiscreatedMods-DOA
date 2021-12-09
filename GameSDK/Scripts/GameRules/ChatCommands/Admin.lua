Script.ReloadScript("scripts/gamerules/AccessControl.lua")

-- Execute an RCON command on the server.
ChatCommands["!rcon"] = function(playerId, command)
	Log(">> !rcon %s", command)

	if player and IsAdminPlayer(player.player:GetSteam64Id()) then
		System.ExecuteCommand(command)
	end
end

-- Send a screen message to all players.
ChatCommands["!attn"] = function(playerId, message)
	Log(">> !attn %s", message)

	local player = System.GetEntity(playerId)

	if player and IsAdminPlayer(player.player:GetSteam64Id()) and message then
		g_gameRules.game:SendTextMessage(0, 0, message)
	end
end

-- Teleport to the Safe Zone.
ChatCommands["!safezone"] = function(playerId)
	Log(">> !safezone")

	local player = System.GetEntity(playerId)

	if player and IsAdminPlayer(player.player:GetSteam64Id()) then
		g_Vectors.temp_v1.x = 4912.13916015625
		g_Vectors.temp_v1.y = 4717.68994140625
		g_Vectors.temp_v1.z = 142.735000610352

		player.player:TeleportTo(g_Vectors.temp_v1)
	end
end
