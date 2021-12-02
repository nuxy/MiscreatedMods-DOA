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
