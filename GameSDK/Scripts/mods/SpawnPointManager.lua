Script.ReloadScript("scripts/gamerules/AccessControl.lua")

--
-- Support for custom player spawns.
--
function Miscreated:InitPlayer(playerId)
	--Log(">> Miscreated:InitPlayer")

	local player = System.GetEntity(playerId)

	if (player and player.player and (IsNoob(player) or (player:IsDead() and IsNoob(player)))) then
		local x, y, z, r

		local rnd = random(9)

		-- Safe Zone spawn points.
		if rnd == 1 then
			x = 4893.166015625
			y = 4722.4150390625
			z = 148.322998046875
			r = -2.4210000038147
		elseif rnd == 2 then
			x = 4915.68310546875
			y = 4742.5458984375
			z = 148.908004760742
			r = -2.4210000038147
		elseif rnd == 3 then
			x = 4887.86083984375
			y = 4681.4482421875
			z = 145.337005615234
			r = -1.02900004386902
		elseif rnd == 4 then
			x = 4898.22802734375
			y = 4676.48583984375
			z = 145.378997802734
			r = 0.647000014781952
		elseif rnd == 5 then
			x = 4940.35302734375
			y = 4657.6328125
			z = 148.912002563477
			r = 0.621999979019165
		elseif rnd == 6 then
			x = 4927.62109375
			y = 4701.51318359375
			z = 142.645004272461
			r = 0.499000012874603
		elseif rnd == 7 then
			x = 4917.18701171875
			y = 4729.171875
			z = 146.251998901367
			r = -0.510999977588654
		elseif rnd == 8 then
			x = 4945.2001953125
			y = 4679.51513671875
			z = 134.957992553711
			r = -0.806999981403351
		else
			x = 4927.0859375
			y = 4722.0029296875
			z = 134.914001464844
			r = -0.0189999993890524
		end

		g_Vectors.temp_v1.x = x
		g_Vectors.temp_v1.y = y
		g_Vectors.temp_v1.z = z

		local angle = player:GetAngles()
		angle.z = r

		player:SetAngles(angle)
		player:SetWorldPos(g_Vectors.temp_v1)
	end
end
