local item1 = FindInTable(ItemSpawnerManager.itemCategories, "category", "RandomClothes")
item1.classes =
{
	{ category = "RandomCraftingGuide", percent = 9 },
	{ category = "RandomEyes", percent = 6 },
	{ category = "RandomFace", percent = 6 },
	{ category = "RandomHands", percent = 12 },
	{ category = "RandomHat", percent = 12 },
	{ category = "RandomLegs", percent = 15 },
	{ category = "RandomNeck", percent = 7 },
	{ category = "RandomShoes", percent = 10 },
	{ category = "RandomTorso", percent = 13 },
	{ category = "RandomWaist", percent = 4 },
}

local item2 = FindInTable(ItemSpawnerManager.itemCategories, "category", "RandomFood")
item2.classes =
{
	{ category = "RandomRottenVeggie", percent = 10 }, 
	{ category = "RandomSeeds", percent = 2.5 }, 
	{ category = "SaltAndPepper", percent = 1 },
	{ class = "BeefStew", percent = 0.5 },
	{ class = "CannedMeat", percent = 0.5 },
	{ class = "CerealBox", percent = 0.5 },
	{ class = "CornCan", percent = 0.5 },
	{ class = "DogFoodCan", percent = 0.5 },
	{ class = "HersheysBar", percent = 0.5 },
	{ class = "NutSpread", percent = 0.5 },
	{ class = "PeachesCan", percent = 0.5 },
	{ class = "PearsCan", percent = 0.5 },
	{ class = "PeasCan", percent = 0.5 },
	{ class = "RavioliCan", percent = 0.5 },
	{ class = "SoupCan", percent = 0.5 },
	{ class = "TunaCan", percent = 0.5 },
}

local item3 = FindInTable(ItemSpawnerManager.itemCategories, "category", "RandomCrafting")
item3.classes =
{
	{ category = "RandomIncapacition", percent = 4 },
	{ category = "RandomPaintCan", percent = 3 },
	{ category = "RandomFireStarter", percent = 4 },
	{ class = "Amalgaduino", percent = 0.1 },
	{ class = "BarbedWireCoil", percent = 5 },
	{ class = "CamoNetting", percent = 5 },
	{ class = "DuctTape", percent = 6.9 },
	{ class = "ElectricalParts", percent = 6 },
	{ class = "EmptyBottle", percent = 6 },
	{ class = "Nails", percent = 7 },
	{ class = "PipeMetal", percent = 6 },
	{ class = "Rags", percent = 5 },
	{ class = "PropaneHeaterTop", percent = 8 },
	{ class = "Rope", percent = 6 },
	{ class = "SawBlade", percent = 5 },
	{ class = "SolarPanelPiece", percent = 4 },
	{ class = "TargetPaper", percent = 4 },
	{ class = "Tarp", percent = 5 },
	{ class = "WorkLight", percent = 5 },
	{ class = "Hacksaw", percent = 7},
}

local item4 = FindInTable(ItemSpawnerManager.itemCategories, "category", "RandomGnome")
item4.classes =
{
	{ class = "gnome_bronze", percent = 2 },
	{ class = "gnome_creep", percent = 8 },
	{ class = "gnome_gold", percent = 1 },
	{ class = "gnome_silver", percent = 2 },
	{ class = "gnome_standard_a", percent = 4 },
	{ class = "gnome_standard_b", percent = 4 },
	{ class = "gnome_standard_c", percent = 4 },
	{ class = "jerry", percent = 6 },
	{ class = "painting_landscape_01", percent = 4 },
	{ class = "painting_landscape_02", percent = 3 },
	{ class = "painting_landscape_03", percent = 3 },
	{ class = "painting_landscape_04", percent = 3 },
	{ class = "painting_landscape_05", percent = 3 },
	{ class = "painting_landscape_06", percent = 3 },
	{ class = "painting_landscape_07", percent = 3 },
	{ class = "painting_landscape_08", percent = 3 },
	{ class = "painting_landscape_09", percent = 3 },
	{ class = "painting_landscape_10", percent = 3 },
	{ class = "painting_square_01", percent = 4 },
	{ class = "painting_square_02", percent = 3 },
	{ class = "painting_vertical_landscape_01", percent = 3 },
	{ class = "painting_vertical_landscape_02", percent = 3 },
	{ class = "painting_vertical_landscape_03", percent = 3 },
	{ class = "painting_vertical_landscape_04", percent = 3 },
	{ class = "painting_vertical_landscape_05", percent = 3 },
	{ class = "painting_vertical_landscape_06", percent = 3 },
	{ class = "painting_map_canyonlands", percent = 3 },
	{ class = "poster_vertical_01", percent = 3 },
	{ class = "painting_map", percent = 4 },
}

local item5 = FindInTable(ItemSpawnerManager.itemCategories, "category", "RandomMilitaryFootlockerContent")
item5.classes =
{
	{ category = "RandomMilitaryClothing", percent = 5 },
	{ category = "RandomWeaponRepairKit", percent = 4 },
	{ category = "RandomMedical", percent = 5 },
	{ category = "RandomHospitalBandage", percent = 1 },
	{ category = "RandomMilitaryGrenade", percent = 3 },
	{ category = "RandomAccessory", percent = 1.5 },
	{ category = "RandomCraftingGuide", percent = 4 },
	{ class = "AmcoinLedger", percent = 3 },
	{ class = "Amalgaduino", percent = 0.8 },
	{ class = "MilitaryCanteenPlastic", percent = 3 },
	{ class = "GasMask", percent = 2 },
	{ class = "MilitaryCanteenMetal", percent = 2 },
	{ class = "MagliteSmall", percent = 2 },
	{ class = "Maglite", percent = 5 },
	{ class = "MRE", percent = 8 },
	{ class = "Cb_radio", percent = 5 },
	{ category = "GridMap_level", percent = 5 },
	{ class = "Binoculars", percent = 2 },
	{ class = "SurvivalKnife", percent = 3 },
	{ class = "HeatPack", percent = 5 },
	{ class = "WaterPurificationTablets", percent = 0.5 },
	{ category = "RandomTent", percent = 1 },
}

local item6 = FindInTable(ItemSpawnerManager.itemCategories, "category", "RandomMilitaryFootlockerIronSonsContent")
item6.classes =
{
	{ category = "RandomArmorTier3", percent = 2 },
	{ category = "RandomArmorTier2", percent = 5 },
	{ category = "RandomArmorTier1", percent = 8 },
	{ category = "RandomAmmo", percent = 9 },
	{ category = "RandomRangedPure", percent = 20 },
	{ category = "RandomAmmoBox", percent = 6 },
	{ category = "RandomAccessory", percent = 1 },
	{ category = "RandomMilitaryFootlockerContent", percent = 14 },
}
