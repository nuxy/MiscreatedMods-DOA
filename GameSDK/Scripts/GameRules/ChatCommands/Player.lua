-- Output to console help menu.
ChatCommands["!help"] = function(playerId)
	Log(">> !help")

	local message = [[
Supported Commands
  !stats <pve|pvp>
  !kills <pve|pvp>
  !top10 <pve|pvp>
  !report <player>
]]

	g_gameRules.game:SendTextMessage(4, playerId, message)
end
