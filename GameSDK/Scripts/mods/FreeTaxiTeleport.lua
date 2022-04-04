--
-- Override “Fast Travel to Base“ taxi amCoins requirement.
--

local performAction = Miscreated.PerformAction

Miscreated.PerformAction = function(self, srcId, objId, name)
	--Log(">> Miscreated.PerformAction")

	if name == "@teleport_to_base" then
		local player = System.GetEntity(srcId);
		if (player and player.IsActionable) then
			return player.player:RequestTeleportToBase(0);
		end
	end

	return performAction(self, srcId, objId, name)
end
