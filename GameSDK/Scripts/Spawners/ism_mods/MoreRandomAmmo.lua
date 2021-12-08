local item1 = FindInTable(ItemSpawnerManager.itemCategories, "category", "RandomAmmo")
item1.classes =
{
	{ category = "12GaugeAA12Mags", percent = 1 },
	{ category = "12GaugeShells", percent = 4, min = 5, max = 10 },
	{ category = "9mmMagazine", percent = 2, min = 5, max = 10  },
	{ category = "RandomAccessory", percent = 2 },
	{ category = "RandomChemlight", percent = 2 },
	{ category = "RandomSmokeGrenade", percent = 2 },
	{ class = "545x30", percent = 2, min = 15, max = 25 },
	{ class = "57x50", percent = 2, min = 25, max = 40 },
	{ class = "762x5", percent = 2, min = 3, max = 5 },
	{ class = "9mmx10_makarov", percent = 2, min = 5, max = 8 },
	{ class = "9mmx15_m9a1", percent = 2, min = 8, max = 12 },
	{ class = "9mmx19_ap85", percent = 1, min = 8, max = 12 },
	{ class = "acp_45x20", percent = 2, min = 8, max = 16 },
	{ class = "acp_45x30", percent = 2, min = 15, max = 25 },
	{ class = "10mmx15", percent = 2, min = 10, max = 14 },
	{ class = "10mmx30", percent = 2, min = 15, max = 25 },
	{ class = "22x10_ruger", percent = 2, min = 7, max = 10 },
	{ class = "acp_45x10_hk", percent = 2, min = 7, max = 10 },
	{ class = "acp_45x7", percent = 3, min = 4, max = 7 },
	{ class = "762x30", percent = 3, min = 15, max = 25 },
	{ class = "Arrowx8", percent = 2.5 },
	{ class = "Boltx5_0000", percent = 2 },
	{ class = "M40x5", percent = 0.99, min = 3, max = 5 },
	{ class = "556x100", percent = 0.01, min = 50, max = 80 },
	{ class = "Pile_10mm", percent = 2, min = 10, max = 20 },
	{ class = "Pile_22", percent = 2, min = 10, max = 20 },
	{ class = "Pile_545x39", percent = 2, min = 5, max = 20 },
	{ class = "Pile_57x28", percent = 2, min = 5, max = 20 },
	{ class = "Pile_223", percent = 3, min = 5, max = 20 },
	{ class = "Pile_308", percent = 3, min = 5, max = 20 },
	{ class = "Pile_357", percent = 3, min = 5, max = 20 },
	{ class = "Pile_45ACP", percent = 3, min = 5, max = 20 },
	{ class = "Pile_556x45", percent = 3, min = 5, max = 20 },
	{ class = "Pile_762x39", percent = 2, min = 5, max = 20 },
	{ class = "Pile_762x51", percent = 2, min = 5, max = 20 },
	{ class = "Pile_9mm", percent = 3.5, min = 5, max = 20 },
	{ class = "Pile_Flare", percent = 3.5 },
	{ class = "Pile_TranquilizerDart", percent = 3 },
	{ class = "STANAGx30", percent = 2, min = 15, max = 25 },
	{ class = "556x30_ak5d", percent = 2, min = 15, max = 25 },
	{ class = "762x20_Akval", percent = 2, min = 8, max = 16 },
	{ class = "9x19_mac10", percent = 2, min = 8, max = 16 },
	{ class = "Pile_40mmGrenade", percent = 0.3 },
}

local item2 = FindInTable(ItemSpawnerManager.itemCategories, "category", "RandomAmmoBox")
item2.classes =
{
	{ class = "AmmoBox_10mm", percent = 8, min = 50, max = 80 },
	{ class = "AmmoBox_22", percent = 8, min = 50, max = 80 },
	{ class = "AmmoBox_308", percent = 8, min = 50, max = 80 },
	{ class = "AmmoBox_357", percent = 8, min = 50, max = 80 },
	{ class = "AmmoBox_223", percent = 9, min = 50, max = 80 },
	{ class = "AmmoBox_5_45x39", percent = 8, min = 50, max = 80 },
	{ class = "AmmoBox_5_56x45", percent = 9, min = 50, max = 80 },
	{ class = "AmmoBox_5_70x28", percent = 8, min = 50, max = 80 },
	{ class = "AmmoBox_7_62x39", percent = 9, min = 50, max = 80 },
	{ class = "AmmoBox_7_62x51", percent = 8, min = 50, max = 80 },
	{ class = "AmmoBox_9mm", percent = 9, min = 50, max = 80 },
	{ class = "AmmoBox_acp_45", percent = 8, min = 50, max = 80 },
}

local item3 = FindInTable(ItemSpawnerManager.itemCategories, "category", "RandomCouchContent")
item3.classes =
{
	{ class = "AmcoinLedger", percent = 5 },
	{ category = "RandomAmmo", percent = 55 },
	{ category = "RandomMedical", percent = 15 },
	{ class = "Rags", percent = 10 },
	{ class = "HersheysBar", percent = 14 },
	{ class = "MagliteSmall", percent = 1 },
}

local item4 = FindInTable(ItemSpawnerManager.itemCategories, "category", "MediumHidingPlaceContent")
item4.classes =
{
	{ class = "AmcoinLedger", percent = 10 },
	{ category = "RandomAmmo", percent = 20 },
	{ category = "RandomCraftingGuide", percent = 30 },
	{ category = "RandomAccessory", percent = 30 },
	{ category = "RandomPistol", percent = 10 },
}

local item5 = FindInTable(ItemSpawnerManager.itemCategories, "category", "RandomDeskContent")
item5.classes =
{
	{ class = "AmcoinLedger", percent = 2 },
	{ category = "RandomCraftingGuide", percent = 2 },
	{ class = "Amalgaduino", percent = 1 },
	{ class = "HeatPack", percent = 5 },
	{ category = "RandomFireStarter", percent = 12 },
	{ class = "AppleRotten", percent = 5 },
	{ class = "HersheysBar", percent = 5 },
	{ category = "Map", percent = 5 },
	{ category = "RandomHands", percent = 10 },
	{ category = "RandomEyes", percent = 5 },
	{ category = "RandomAccessory", percent = 1.5 },
	{ category = "RandomMedical", percent = 7 },
	{ category = "RandomAmmo", percent = 8 },
	{ category = "RandomSeeds", percent = 5 },
	{ class = "WaterPurificationTablets", percent = 0.5 },
}

local item6 = FindInTable(ItemSpawnerManager.itemCategories, "category", "RandomLivingAreaContent")
item6.classes =
{
	{ category = "RandomAmmo", percent = 4 },
	{ category = "RandomPistol", percent = 2 },
	{ class = "AmcoinLedger", percent = 1 },
	{ category = "RandomCraftingGuide", percent = 1 },
	{ category = "RandomClothes", percent = 75 },
	{ category = "RandomNormalRepairKit", percent = 15 },
}

local item7 = FindInTable(ItemSpawnerManager.itemCategories, "category", "RandomOfficeContent")
item7.classes =
{
	{ category = "RandomAmmo", percent = 2 },
	{ category = "RandomPistol", percent = 2 },
	{ class = "AmcoinLedger", percent = 1 },
	{ category = "RandomTrashContent", percent = 95 },
}
