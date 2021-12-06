-- Requires `admin.txt` file to be created in the game root directory.
--
-- This file should contain authorized Steam IDs (one per line).

function IsAdminPlayer(steamId)
	local fh = io.open("./admins.txt", "r")
	local text = fh:read("*all")

	for line in string.gmatch(text, "[^\r\n]+") do
		m = string.match(line, "%d+")

		if m == steamId then
			return true
		end
	end

	return false
end
