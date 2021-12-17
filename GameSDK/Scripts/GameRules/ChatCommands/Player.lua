Script.LoadScript("scripts/gamerules/AccessControl.lua")

-- Output to console help menu.
ChatCommands["!help"] = function(playerId)
	Log(">> !help")

	local player = System.GetEntity(playerId)

	local message = [[
Supported Commands
  !stats <pve|pvp>
  !kills <pve|pvp>
  !top10 <pve|pvp>
  !report <PLAYER>
]]

	if IsAdminPlayer(player.player:GetSteam64Id()) then
		message = message .. [[
  !rcon <command>
  !wall <message>
  !ban <64BITSTEAMID>
  !kick <64BITSTEAMID>
  !safezone
]]
	end

	g_gameRules.game:SendTextMessage(4, playerId, message)
end
