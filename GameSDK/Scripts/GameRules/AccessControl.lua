--
-- Check Steam player is an authorized Admin.
--
-- Requires `admin.txt` file created in the game root directory.
-- This file should contain authorized Steam IDs (one per line).

function IsAdminPlayer(steamId)
	local fh = io.open("./admins.txt", "r")

	if fh then
		local text = fh:read("*all")

		for line in string.gmatch(text, "[^\r\n]+") do
			m = string.match(line, "%d+")

			if m == steamId then
				return true
			end
		end
	end

	return false
end

--
-- Check Steam player is a Miscreated noob.
--
function IsNoob(player)

	-- Check player has a base or is part of a clan.
	for _, plotsign in ipairs(BaseBuildingSystem:GetPlotSigns()) do
		local steamId = player.player:GetSteam64Id()
		local clanId = tonumber(player.player:GetClanId())

		if ((plotsign.plotsign:GetOwnerSteam64Id() == steamId) or (clanId ~= nil and clanId > 0)) then
			return false
		end
	end

	return true
end
