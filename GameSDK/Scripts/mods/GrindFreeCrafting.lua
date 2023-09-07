---
-- Equip player with custom items.
--
RegisterCallback(Miscreated, "EquipPlayer",
	function(self, playerId)
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

			-- Grind-Free crafting.
			local waist = ISM.GiveItem(playerId, "GrindFreeCrafting")
			waist.item:SetStackCount(10000)
		end
	end
)
