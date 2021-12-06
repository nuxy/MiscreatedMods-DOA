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
