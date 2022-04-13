--
-- Globally callout connecting players.
--
RegisterCallback(Miscreated.Server, "OnClientEnteredGame", nil,
	function(channelId, player, loadingSaveGame)
		--Log(">> Miscreated.Server:OnClientEnteredGame")

		local message = player:GetName() .. " has entered the game"

		g_gameRules.game:SendTextMessage(0, 0, message)
	end
)
