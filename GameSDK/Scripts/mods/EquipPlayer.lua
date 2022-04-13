Script.ReloadScript("scripts/gamerules/AccessControl.lua")

---
-- Equip player with custom items.
--
RegisterCallback(Miscreated, "EquipPlayer", nil,
	function(playerId)
		--Log(">> Miscreated:EquipPlayer")

		local player = System.GetEntity(playerId)

		if (player and player.player) then
			local rnd

			ISM.GiveItem(playerId, "Flashlight")
			ISM.GiveItem(playerId, "Map")

			-- Hat
			rnd = random(1, 3)

			if rnd == 1 then
				ISM.GiveItem(playerId, "BeanieBrown")
			elseif rnd == 2 then
				ISM.GiveItem(playerId, "BikeHelmetBlack")
			else
				ISM.GiveItem(playerId, "BandanaHat")
			end

			-- Feet
			rnd = random(1, 3)

			if rnd == 1 then
				ISM.GiveItem(playerId, "TennisShoes")
			elseif rnd == 2 then
				ISM.GiveItem(playerId, "Sneakers")
			else
				ISM.GiveItem(playerId, "CanvasShoes")
			end

			-- Legs
			local leg

			rnd = random(1, 4)

			if rnd == 1 then
				leg = ISM.GiveItem(playerId, "BlueJeans")
			elseif rnd == 2 then
				leg = ISM.GiveItem(playerId, "BlueJeans2")
			elseif rnd == 3 then
				leg = ISM.GiveItem(playerId, "BlueJeans2Brown")
			else
				leg = ISM.GiveItem(playerId, "BlueJeans2Green")
			end

			-- Torso
			local torso

			rnd = random(1, 6)

			if rnd == 1 then
				torso = ISM.GiveItem(playerId, "TshirtNoImageBlack")
			elseif rnd == 2 then
				torso = ISM.GiveItem(playerId, "TshirtNoImageBlue")
			elseif rnd == 3 then
				torso = ISM.GiveItem(playerId, "TshirtNoImageGreen")
			elseif rnd == 4 then
				torso = ISM.GiveItem(playerId, "TshirtNoImageGrey")
			elseif rnd == 5 then
				torso = ISM.GiveItem(playerId, "TshirtNoImagePink")
			else
				torso = ISM.GiveItem(playerId, "TshirtNoImageRed")
			end

			if IsNoob(player) then

				-- Weapon
				rnd = random(1, 3)

				if rnd == 1 then
					ISM.GiveItem(playerId, "Axe")
				elseif rnd == 2 then
					ISM.GiveItem(playerId, "BaseballBat")
				else
					ISM.GiveItem(playerId, "Crowbar")
				end

				-- Bag
				local bag

				rnd = random(1, 2)

				if rnd == 1 then
					bag = ISM.GiveItem(playerId, "horshoe_pack")
				else
					bag = ISM.GiveItem(playerId, "CraftedFannyPack")
				end

				-- Food
				local food

				rnd = random(1, 2)

				if rnd == 1 then
					food = ISM.GiveItem(bag.id, "Berries")
					food.item:SetStackCount(8)
				else
					food = ISM.GiveItem(bag.id, "AppleFresh")
					food.item:SetStackCount(2)
				end

				-- Essentials
				local medicine = ISM.GiveItem(torso.id, "Antibiotics")
				medicine.item:SetStackCount(3)

				ISM.GiveItem(torso.id, "Bandage")
				ISM.GiveItem(leg.id, "WaterBottle")

				local ledger = ISM.GiveItem(leg.id, "AmcoinLedger")
				ledger.item:SetStackCount(random(20, 50))

				-- Base building
				ISM.GiveItem(bag.id, "safe")
			end

			-- Override defaults.
			player.player:SetFood(2000.0)
			player.player:SetWater(2000.0)
		end
	end
)
