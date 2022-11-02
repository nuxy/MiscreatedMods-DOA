--
-- Support for the world events to spawn.
--

Miscreated.Properties.WorldEvent.fMaxTime = 3600
Miscreated.Properties.WorldEvent.fMinTime = 2400

SpawnWorldEvent = function(self)
	--Log(">> Miscreated:SpawnWorldEvent")

	local className = "UFOCrash"

	--
	-- Uncomment to enable Air Plane events.
	--
	-- local rnd = random(1, 16)

	-- if rnd >= 1 and rnd <= 4 then
	-- 	className = "AirDropPlane"
	-- elseif rnd >= 5 and rnd <= 8 then
	-- 	className = "AirPlaneCrash"
	-- end

	local spawnParams = {
		class = className,
		name = "SpawnWorldEvent"
	}

	local spawnedEntity = System.SpawnEntity(spawnParams)

	if not spawnedEntity then
		LogError("Entity %s could not be spawned", className)
	end

	-- Set timer up for the next world event.
	self:CreateWorldEventTimer()
end
