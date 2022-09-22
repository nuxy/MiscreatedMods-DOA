Script.LoadScript("scripts/gamerules/AccessControl.lua")

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

	local createdTime = os.date("%A, %B %d %Y at %I:%M:%S %p")
	local locationInfo =
	{
		["name"] = name,
		["posX"] = tostring(pos.x),
		["posY"] = tostring(pos.y),
		["posZ"] = tostring(pos.z),
		["posR"] = tostring(rot.z),
	}

	SetPageData(DBCollection, locationInfo)

	return string.format('Saved location "%s"', name)
end

-- Delete player location by record ID.
local function DeleteLocation(id)
	local str = "No location record found."

	if not IsEmptyCollection(DB, "LocationCollection") then
		local data = GetPageData(DBCollection, id)

		if data ~= nil then
			PurgePageData(DBCollection, id)

			str = string.format("Removed record: %s", data["name"])
		end
	end

	return str
end

-- Teleport player to location by record ID.
local function TestLocation(player, id)
	local str = "No location record found."

	if not IsEmptyCollection(DB, "LocationCollection") then
		local data = GetPageData(DBCollection, id)

		if data ~= nil then
			g_Vectors.temp_v1.x = tonumber(data["posX"])
			g_Vectors.temp_v1.y = tonumber(data["posY"])
			g_Vectors.temp_v1.z = tonumber(data["posZ"])

			player.player:TeleportTo(g_Vectors.temp_v1)
		end
	end

	return str
end

-- Return list of spawn point locations as string.
local function GetLocations(groupNum)
	groupNum = tonumber(groupNum) or 1

	local str = "There are no locations defined."

	if not IsEmptyCollection(DB, "LocationCollection") then
		local lastInsertId = GetLastInsertId(DBCollection)
		local itemsPerGroup = 10

		local results = {}

		-- Group items (SendTextMessage workaround).
		for i = 1, lastInsertId do
			local data = GetPageData(DBCollection, i)

			if data ~= nil then
				str = str .. "Record #" .. i .. " [" .. data["name"] .. "]\n"
				str = str .. "X: " .. data["posX"] .. "\n"
				str = str .. "Y: " .. data["posY"] .. "\n"
				str = str .. "Z: " .. data["posZ"] .. "\n"
				str = str .. "R: " .. data["posR"] .. "\n\n"

				if i == lastInsertId or i % itemsPerGroup == 0 then
					table.insert(results, str)

					str = ""
				end
			end
		end

		-- Construct per-group results.
		local resultCount = count(results)

		if groupNum <= resultCount then
			str = "Spawn Point Locations\n\n"
			str = str .. results[groupNum]
			str = str .. string.format(
				"Showing group %s of %s\n\n", groupNum, resultCount
			)
		else
			str = "No data for group\n\n"
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
  !sp save <name>
  !sp delete <RECORDID>
  !sp test <RECORDID>
  !sp list <GROUPNUM>
]]

		if IsValidInput(arg) then
			if action == "save" then
				message = SaveLocation(player, arg)
			end

			if action == "delete" then
				message = DeleteLocation(arg)
			end

			if action == "list" then
				message = GetLocations(arg)
			end

			if action == "test" then
				message = TestLocation(player, arg)
			end
		else
			if action == "list" then
				message = GetLocations()
			end
		end

		g_gameRules.game:SendTextMessage(4, playerId, message)
	end
end
