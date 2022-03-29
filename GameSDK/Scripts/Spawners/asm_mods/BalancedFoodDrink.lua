local action1 = FindInTable(ActionableWorldManager.actionables, "text", "@drink_from_pump")
action1.drinkAmount = 600
action1.regenerate = 30

local action2 = FindInTable(ActionableWorldManager.actionables, "text", "@drink_from_hydrant")
action2.drinkAmount = 400
action2.regenerate = 30

local action3 = FindInTable(ActionableWorldManager.actionables, "text", "@search_vending_machine")
action3.regenerate = 60
action3.percentage = 80
