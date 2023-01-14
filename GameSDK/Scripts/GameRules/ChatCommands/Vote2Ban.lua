Script.ReloadScript("scripts/MisDB/MisDB.lua")
Script.ReloadScript("scripts/utils/MisDB.lua")

local DB, DBCollection

if CryAction.IsDedicatedServer() then
	DB = MisDB:Create("Vote2BanDB/", "Vote2BanData")
	DBCollection = DB:Collection("PlayerCollection")
end

local voteInProgress = false

-- Check string is contains valid console input.
local function IsValidInput(v)
	if not EmptyString(v) and string.len(v) <= 15 and string.match(v , "[%w]") then
		return true
	end

	return false
end

-- Globally poll active players.
local function InitVote(playerId, username)
	if not voteInProgress then
		local message = string.format('Vote to ban "%s"?\n', username) .. "Type !yes or !no in the Chat Console"

		g_gameRules.game:SendTextMessage(0, 0, message)

		voteInProgress = true
	else
		return "Vote is in progress"
	end

	return ""
end

-- Return list of active players as string.
local function GetPlayers(groupNum)
	groupNum = tonumber(groupNum) or 1

	local str = "There are no active players."

	if not IsEmptyCollection(DB, "PlayerCollection") then
		local lastInsertId = GetLastInsertId(DBCollection)
		local itemsPerGroup = 30

		local results = {}

		-- Group items (SendTextMessage workaround).
		for i = 1, lastInsertId do
			local data = GetPageData(DBCollection, i)

			if data ~= nil and data["status"] ~= "banned" then
				str = str .. data["username"] .. "\n"

				if i == lastInsertId or i % itemsPerGroup == 0 then
					table.insert(results, str)

					str = ""
				end
			end
		end

		-- Construct per-group results.
		local resultCount = count(results)

		if groupNum <= resultCount then
			str = "Active Players\n\n"
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

-- Manage active players (actions: ban, list).
ChatCommands["!vb"] = function(playerId, args)
	Log(">> !vb %s", args)

	local action, arg = string.match(args, "(%a*)%s*(%w*)")

	local message = string.format("Invalid command: !vb %s \n\n", args)

	message = message .. [[
Supported Commands
  !vb ban <username>
  !vb list <GROUPNUM>
]]

	if IsValidInput(arg) then
		if action == "ban" then
			message = InitVote(playerId, arg)
		end

		if action == "list" then
			message = GetPlayers(arg)
		end
	else
		if action == "list" then
			message = GetPlayers()
		end
	end

	if message then
		g_gameRules.game:SendTextMessage(4, playerId, message)
	end
end

-- Handle player poll entries.
ChatCommands["!yes"] = function(playerId)
	local message = "No vote in progress"

	if voteInProgress then
		Log(">> !yes")

		message = "Vote accepted"
	end

	g_gameRules.game:SendTextMessage(4, playerId, message)
end

ChatCommands["!no"] = function(playerId)
	local message = "No vote in progress"

	if voteInProgress then
		Log(">> !no")

		message = "Vote accepted"
	end

	g_gameRules.game:SendTextMessage(4, playerId, message)
end
