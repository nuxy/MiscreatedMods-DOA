--
-- Support for the world events to spawn.
--

Miscreated.Properties.WorldEvent.fMaxTime = 900;
Miscreated.Properties.WorldEvent.fMinTime = 1200;

SpawnWorldEvent = function(self)
	--Log(">> Miscreated:SpawnWorldEvent")

	local eventName
	local rnd = random(1, 16)

	if rnd >= 1 and rnd <= 4 then
		eventName = "AirDropPlane"
	elseif rnd >= 5 and rnd <= 8 then
		eventName = "AirPlaneCrash"
	else
		eventName = "UFOCrash"
	end

	local spawnParams = {}
	spawnParams.class = eventName
	spawnParams.name = spawnParams.class

	--Log(">> Miscreated:SpawnWorldEvent - Spawning Event")
	local spawnedEntity = System.SpawnEntity(spawnParams)

	if not spawnedEntity then
		Log("Miscreated:SpawnWorldEvent - entity could not be spawned")
	end

	-- Set timer up for the next world event.
	self:CreateWorldEventTimer()
end
