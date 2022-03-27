Script.LoadScript("scripts/gamerules/AccessControl.lua")
Script.LoadScript("scripts/gamerules/ChatCommands/Common.lua")

Script.ReloadScript("scripts/MisDB/MisDB.lua")
Script.ReloadScript("scripts/utils/MisDB.lua")

local DB = MisDB:Create("SpawnPointDB/", "SpawnPointData")
local DBCollection = DB:Collection("LocationCollection")

-- Check string is contains valid console input.
local function IsValidInput(v)
	if not EmptyString(v) and string.len(v) <= 15 and string.match(v , "[%w]") then
		return true
	end

	return false
end

-- Write player current position coordinates.
local function SaveLocation(player, name)
	local pos = player:GetWorldPos()
	local rot = player:GetAngles()

	local createdTime = os.date('%A, %B %d %Y at %I:%M:%S %p')
	local locationInfo =
	{
		["name"] = name,
		["posX"] = tostring(pos.x);
		["posY"] = tostring(pos.y);
		["posZ"] = tostring(pos.z);
		["posR"] = tostring(rot.z);
	}

	-- Simplify iterating over stored pages.
	local lastInsertId = DBCollection:GetPage("lastInsertId")

	if lastInsertId ~= nil and lastInsertId > 0 then
		lastInsertId = (lastInsertId + 1)
	else
		lastInsertId = 1
	end

	DBCollection:SetPage("lastInsertId", lastInsertId)
	DBCollection:SetPage("location_" .. lastInsertId, locationInfo)

	local str = string.format('Saved location "%s"', name)

	return str
end

-- Delete player location by record ID.
local function DeleteLocation(id)
	local str = "No location record found."

	if not IsEmptyCollection(DB, "LocationCollection") then
		local record = "location_" .. id

		local data = DBCollection:GetPage(record)

		if data ~= nil then
			DBCollection:PurgePage(record)

			str = string.format("Removed record: %s", data['name'])
		end
	end

	return str
end

-- Return list of spawn point locations as string.
local function GetLocations()
	local str = "There are no locations defined."

	if not IsEmptyCollection(DB, "LocationCollection") then
		str = "Spawn Point Locations\n"
		
		local lastInsertId = DBCollection:GetPage("lastInsertId")

		for i = 1, lastInsertId do
			local data = DBCollection:GetPage("location_" .. i)

			if data ~= nil then
				str = str .. "Record #" .. i .. "\n"
				str = str .. "Name: " .. data["name"] .. "\n"
				str = str .. "X: " .. data["posX"] .. "\n"
				str = str .. "Y: " .. data["posY"] .. "\n"
				str = str .. "Z: " .. data["posZ"] .. "\n"
				str = str .. "R: " .. data["posR"] .. "\n\n"
			end
		end
	end

	return str
end

-- Manage spawn point locations (actions: create, delete, list).
ChatCommands["!sp"] = function(playerId, args)
	Log(">> !sp %s", args)

	local action, arg = string.match(args, "(%a*)%s*(%w*)")

	local player = System.GetEntity(playerId)

	if IsAdminPlayer(player.player:GetSteam64Id()) then
		local message = string.format("Invalid command: !sp %s \n\n", args)

		message = message .. [[
Supported Commands
  !sp create <name>
  !sp delete <record #>
  !sp list
]]

		if IsValidInput(arg) then
			if action == "create" then
				message = SaveLocation(player, arg)
			end

			if action == "delete" then
				message = DeleteLocation(arg)
			end
		else
			if action == "list" then
				message = GetLocations()
			end
		end

		g_gameRules.game:SendTextMessage(4, playerId, message)
	end
end
