-- Output to console help menu.
ChatCommands["!help"] = function(playerId)
	Log(">> !help")

	local message = "Supported commands:\n  !stats <pve|pvp>\n  !kills <pve|pvp>\n  !top10 <pve|pvp>"

	g_gameRules.game:SendTextMessage(4, playerId, message)
end
