local item = FindInTable(ItemSpawnerManager.itemCategories, "category", "RandomNormalRepairKit")
item.classes =
{
	{ class = "RK_Canvas", percent = 20 },
	{ class = "RK_Cloth", percent = 28 },
	{ class = "RK_ClothingHelmet", percent = 10 },
	{ class = "RK_ClothingHelmetBallistic", percent = 2 },
	{ class = "RK_Equipment", percent = 10 },
	{ class = "RK_Glasses", percent = 10 },
	{ class = "RK_Leather", percent = 15 },
	{ class = "RK_Teflon", percent = 5 },
}
