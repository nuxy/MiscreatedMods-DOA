-- Output to console player PVP/PVE stats.
ChatCommands["!stats"] = function(playerId, gameType)
	Log(">> !stats %s", gameType)

	if not EmptyString(gameType) and gameType == 'pve' then
		ChatCommands["kc"](playerId, "mscore")
	else
		ChatCommands["kc"](playerId, "score")
	end
end

-- Output to console player PVP/PVE kill count.
ChatCommands["!kills"] = function(playerId, gameType)
	Log(">> !kills %s", gameType)

	if not EmptyString(gameType) and gameType == 'pve' then
		ChatCommands["kc"](playerId, "mstats")
	else
		ChatCommands["kc"](playerId, "stats")
	end
end

-- Output to console PVP/PVE "Top Ten" players.
ChatCommands["!top10"] = function(playerId, gameType)
	Log(">> !top10 %s", gameType)

	if not EmptyString(gameType) and gameType == 'pve' then
		ChatCommands["kc"](playerId, "mtop10")
	else
		ChatCommands["kc"](playerId, "top10")
	end
end

-- Clone original, remove PVP/PVE Stats command.
ChatCommands["kc"] = ChatCommands["!kc"]
ChatCommands["!kc"] = nil
