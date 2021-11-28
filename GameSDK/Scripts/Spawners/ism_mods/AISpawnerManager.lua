-- Remove mutant bugs.
local bug1 = FindInTable(AISpawnerManager.aiCategories, "category", "BabySpiderSingle")

RemoveFromTable(AISpawnerManager.aiCategories, bug1)

local bug2 = FindInTable(AISpawnerManager.aiCategories, "category", "GiantRoachSingle")

RemoveFromTable(AISpawnerManager.aiCategories, bug2)

local bug3 = FindInTable(AISpawnerManager.aiCategories, "category", "giantroach_invasion")

RemoveFromTable(AISpawnerManager.aiCategories, bug3)

local bug4 = FindInTable(AISpawnerManager.aiCategories, "category", "ai_actionable_roach")

RemoveFromTable(AISpawnerManager.aiCategories, bug4)

local bug5 = FindInTable(AISpawnerManager.aiCategories, "category", "ai_actionable_spider")

RemoveFromTable(AISpawnerManager.aiCategories, bug5)

local bug6 = FindInTable(AISpawnerManager.aiCategories, "category", "ai_actionable_critter")

RemoveFromTable(AISpawnerManager.aiCategories, bug6)

-- Add more human spiders.
local mutant1 = FindInTable(AISpawnerManager.aiCategories, "category", "Spiker")
mutant1.classes =
{
	{ category = "CrazySingle", percent = 30 },
	{ category = "SpikerSingle", percent = 20 },
	{ category = "HumanSpiderSingle", percent = 20 },
	{ category = "HumanZombieSingle", percent = 15 },
	{ category = "BruteMutantSingle", percent = 10 },
	{ category = "spiker_pack", percent = 5 },
}

local mutant2 = FindInTable(AISpawnerManager.aiCategories, "category", "spiker_pack")
mutant2.min = 4
mutant2.max = 5

local mutant3 = FindInTable(AISpawnerManager.aiCategories, "category", "brute_pack")
mutant3.min = 4
mutant3.max = 6

local mutant4 = FindInTable(AISpawnerManager.aiCategories, "category", "brute_hunting_pack")
mutant4.min = 4
mutant4.max = 7

local mutant5 = FindInTable(AISpawnerManager.aiCategories, "category", "horde")
mutant5.classes =
{
	{ category = "CrazySingle", percent = 30 },
	{ category = "SpikerSingle", percent = 20 },
	{ category = "HumanSpiderSingle", percent = 20 },
	{ category = "HumanZombieSingle", percent = 20 },
	{ category = "BruteMutantSingle", percent = 10 },
}

local mutant6 = FindInTable(AISpawnerManager.aiCategories, "category", "mutant_invasion")
mutant6.classes =
{
	{ category = "CrazySingle", percent = 30 },
	{ category = "SpikerSingle", percent = 20 },
	{ category = "HumanSpiderSingle", percent = 30 },
	{ category = "HumanZombieSingle", percent = 20 },
}
