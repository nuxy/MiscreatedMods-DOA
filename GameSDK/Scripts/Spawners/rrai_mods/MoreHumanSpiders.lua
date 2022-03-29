--
-- Replace all entities with HumanSpider(s).
--
local rraiNames = {
	"RRAIGlobal_Spider",
	"RRAIGlobal_Roach",
	"RRAIZone_Brute",
	"RRAIZone_BruteArmored",
	"RRAIZone_Crazy",
	"RRAIZone_HumanZombie",
	"RRAIZone_Spiker",
	"RRAIZone_TwoHeadDog"
}

for _, name in pairs(rraiNames) do
	local mutant = FindInTable(AIRoundRobinManager.rraiSpawnGroups.islands, "name", name)
	mutant.spawnCategory = "HumanSpiderSingle"
end
