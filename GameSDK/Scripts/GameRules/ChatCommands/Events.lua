Script.LoadScript("scripts/gamerules/AccessControl.lua")

Script.ReloadScript("scripts/MisDB/MisDB.lua")
Script.ReloadScript("scripts/utils/MisDB.lua")

local DB = MisDB:Create("ChatReportDB/", "ChatReportData")
local DBCollection = DB:Collection("EventCollection")

-- Check string is contains valid console input.
local function IsValidInput(v)
	if not EmptyString(v) and string.len(v) <= 32 and string.match(v , "[%w-_.]") then
		return true
	end

	return false
end

-- In order to see cheat events we need more data.
local function EnableLogging()
	System.ExecuteCommand("log_WriteToFile 1")
	System.ExecuteCommand("log_WriteToFileVerbosity 4")
	System.ExecuteCommand("log_IncludeTime 1")
end

-- Write the actor name, reporter, and timestamp of submission.
local function ReportActor(name, reporterId)
	if name and reporterId then
		local reportedTime = os.date('%A, %B %d %Y at %I:%M:%S %p')
		local eventInfo =
		{
			["actorName"] = name,
			["reporterId"] = reporterId,
			["status"] = "Open",
			["time"] = reportedTime
		}

		-- Simplify iterating over stored pages.
		local lastInsertId = DBCollection:GetPage("lastInsertId")

		if lastInsertId ~= nil and lastInsertId > 0 then
			lastInsertId = (lastInsertId + 1)
		else
			lastInsertId = 1
		end

		DBCollection:SetPage("lastInsertId", lastInsertId)
		DBCollection:SetPage("event_" .. lastInsertId, eventInfo)
	end
end

-- Return list of player reported events as string.
local function GetEvents()
	local str = "There are no reported events."

	if not IsEmptyCollection(DB, "EventCollection") then
		str = "Reported Events\n"

		local lastInsertId = DBCollection:GetPage("lastInsertId")

		for i = 1, lastInsertId do
			local data = DBCollection:GetPage("event_" .. i)

			if data ~= nil then
				str = str .. "Actor Name: " .. data["actorName"] .. "\n"
				str = str .. "Reporter: " .. data["reporterId"] .. "\n"
				str = str .. "Status: " .. data["status"] .. "\n"
				str = str .. "Time: " .. data["time"] .. "\n\n"
			end
		end
	end

	return str
end

-- Report a player of malicious behavior by actor name (game-defined).
ChatCommands["!report"] = function(playerId, actorName)
	Log(">> !report %s", actorName)

	local message = "Player has been reported. Action pending."

	if IsValidInput(actorName) then
		local player = System.GetEntity(playerId)
		local steamId = player.player:GetSteam64Id()

		ReportActor(actorName, steamId)
		EnableLogging()
	end

	g_gameRules.game:SendTextMessage(4, playerId, message)
end

-- Output to console list of reported events.
ChatCommands["!events"] = function(playerId)
	Log(">> !events")

	local player = System.GetEntity(playerId)

	if IsAdminPlayer(player.player:GetSteam64Id()) then
		g_gameRules.game:SendTextMessage(4, playerId, GetEvents())
	end
end
