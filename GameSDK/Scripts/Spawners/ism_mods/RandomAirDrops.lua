local airDropCrate = FindInTable(ItemSpawnerManager.itemCategories, "category", "RandomAirDropCrate")

local crateItem1 = FindInTable(airDropCrate.classes, "category", "RandomAirDropCratePolice")
crateItem1.percent = 20

local crateItem2 = FindInTable(airDropCrate.classes, "category", "RandomAirDropCrateMilitary")
crateItem2.percent = 15

local crateItem3 = FindInTable(airDropCrate.classes, "category", "RandomAirDropCrateCivilian")
crateItem3.percent = 14

local crateItem4 = FindInTable(airDropCrate.classes, "category", "RandomAirDropCrateExplosives")
crateItem4.percent = 8

local crateItem5 = FindInTable(airDropCrate.classes, "category", "RandomAirDropCrateBaseBuilding")
crateItem5.percent = 20

local crateItem6 = FindInTable(airDropCrate.classes, "category", "RandomAirDropCrateRadiation")
crateItem6.percent = 15

-- Add additional Air Drop event.
local newCrateItem = {
	class = "RandomAirDropCrateExplosives",
	percent = 8,
}

InsertIntoTable(airDropCrate.classes, newCrateItem)
