local item = FindInTable(ItemSpawnerManager.itemCategories, "category", "RandomUFOContents")
item.group =
{
	{ category = "RandomRangedMilitaryPure", percent = 100 },
	{ category = "RandomAmmoBox", percent = 100 },
	{ category = "RandomAmmoBox", percent = 100 },
	{ category = "RandomAccessory", percent = 100 },
	{ class = "SpaceHelmet", percent = 100 },
	{ category = "RandomEpicWeaponTrader", percent = 100 },
	{ category = "RandomEpicAttachmentTrader", percent = 100 },
	{ category = "RandomEggs", percent = 100 },
	{ class = "AmcoinLedger", percent = 100, min = 15, max = 35 },
}
