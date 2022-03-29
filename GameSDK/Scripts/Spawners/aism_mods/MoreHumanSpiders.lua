--
-- Replace all entities with HumanSpider(s).
--
local spider = FindInTable(AISpawnerManager.aiCategories, "category", "HumanSpiderSingle")

local aiCategories = {
	"BabySpiderSingle",
	"BruteMutantArmored",
	"BruteMutantSingle",
	"CrazySingle",
	"GiantRoachSingle",
	"HumanZombieSingle",
	"SpikerSingle",
	"twoheaddog"
}

for _, category in pairs(aiCategories) do
	local mutant = FindInTable(AISpawnerManager.aiCategories, "category", category)
	mutant.classes = spider.classes
end

--
-- Increase entity group spawn count.
--
local aiCategories = {
	brute_pack = {4, 6},
	brute_hunting_pack = {4, 7},
	spiker_pack = {4, 5}
}

for category, v in pairs(aiCategories) do
	local mutant = FindInTable(AISpawnerManager.aiCategories, "category", category)
	mutant.min = v[1]
	mutant.max = v[2]
end

--
-- Remove hard-coded (stubborn) entities.
--
local mutant1 = FindInTable(AISpawnerManager.aiCategories, "category", "twoheaddog")
local mutant2 = FindInTable(AISpawnerManager.aiCategories, "category", "twoheaddog_invasion")

RemoveFromTable(AISpawnerManager.aiCategories, mutant1)
RemoveFromTable(AISpawnerManager.aiCategories, mutant2)
