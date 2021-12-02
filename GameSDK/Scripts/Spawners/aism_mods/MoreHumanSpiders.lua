local mutant1 = FindInTable(AISpawnerManager.aiCategories, "category", "Spiker")
mutant1.classes =
{
	{ category = "HumanSpiderSingle", percent = 30 },
	{ category = "HumanSpiderSingle", percent = 20 },
	{ category = "HumanSpiderSingle", percent = 20 },
	{ category = "HumanZombieSingle", percent = 15 },
	{ category = "HumanSpiderSingle", percent = 10 },
	{ category = "HumanSpiderSingle", percent = 5 },
}

local mutant2 = FindInTable(AISpawnerManager.aiCategories, "category", "Brute")
mutant2.classes =
{
	{ category = "HumanSpiderSingle", percent = 30 },
	{ category = "HumanSpiderSingle", percent = 20 },
	{ category = "HumanSpiderSingle", percent = 20 },
	{ category = "HumanZombieSingle", percent = 15 },
	{ category = "HumanSpiderSingle", percent = 10 },
	{ category = "HumanSpiderSingle", percent = 5 },
}

local mutant3 = FindInTable(AISpawnerManager.aiCategories, "category", "spiker_pack")
mutant3.min = 4
mutant3.max = 5

local mutant4 = FindInTable(AISpawnerManager.aiCategories, "category", "brute_pack")
mutant4.min = 4
mutant4.max = 6

local mutant5 = FindInTable(AISpawnerManager.aiCategories, "category", "brute_hunting_pack")
mutant5.min = 4
mutant5.max = 7

local mutant6 = FindInTable(AISpawnerManager.aiCategories, "category", "horde")
mutant6.classes =
{
	{ category = "HumanSpiderSingle", percent = 30 },
	{ category = "HumanSpiderSingle", percent = 20 },
	{ category = "HumanSpiderSingle", percent = 20 },
	{ category = "HumanSpiderSingle", percent = 20 },
	{ category = "HumanSpiderSingle", percent = 10 },
}

local mutant7 = FindInTable(AISpawnerManager.aiCategories, "category", "mutant_invasion")
mutant7.classes =
{
	{ category = "HumanSpiderSingle", percent = 30 },
	{ category = "HumanSpiderSingle", percent = 20 },
	{ category = "HumanSpiderSingle", percent = 30 },
	{ category = "HumanSpiderSingle", percent = 20 },
}
