System.ExecuteCommand("log_WriteToFile 1")
System.ExecuteCommand("log_WriteToFileVerbosity 4")
System.ExecuteCommand("log_IncludeTime 1")

--
-- Spawn Base/Flag in-game entities.
--
RegisterCallback(_G, "OnInitAllLoaded", nil,
	function()
		-- Log(">> CaptureTheFlag:OnInitAllLoaded")

		-- Define common methods/variables.
		if CryAction.IsServer then
			CaptureTheFlag.GetTeamId = function(self, name)
				Log(">> CaptureTheFlag:GetTeamId '%s'", name)

				return 123456
			end

			CaptureTheFlag.SetTeamId = function(self, id, playerId)
				Log(">> CaptureTheFlag:SetTeamId '%d'", id)

			end
		end

		local teams = {}

		-- / Team Blue / Hayward-Valley (North)
		table.insert(teams,
			{
				name = "Team Blue",
				base = {
					position = {
						x = 4701.30908203125,
						y = 6552.43603515625,
						z = 144.91200256347
					}
				},
				flag = {
					position = {
						x = 4701.30908203125,
						y = 6552.43603515625,
						z = 144.912002563477
					}
				}
			}
		)

		-- / Team Red / Pinecrest (South)
		table.insert(teams,
			{
				name = "Team Red",
				base = {
					position = {
						x = 3714.50390625,
						y = 915.981018066406,
						z = 98.9499969482422
					}
				},
				flag = {
					position = {
						x = 3714.50390625,
						y = 915.981018066406,
						z = 98.9499969482422
					}
				}
			}
		)

		--Log(">> CaptureTheFlag:OnInitAllLoaded - Spawn entities")

		local spawnParams = {class = "CTFBase"}

		for i, team in ipairs(teams) do
			local className = "Base " .. i

			spawnParams.name = className
			spawnParams.position = team.base.position

			local spawnedEntity = System.SpawnEntity(spawnParams)

			if not spawnedEntity then
				LogError("Entity %s could not be spawned", className)
			end
		end
	end
)
