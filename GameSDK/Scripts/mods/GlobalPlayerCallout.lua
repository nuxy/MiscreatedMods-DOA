--
-- Globally callout connecting players.
--
RegisterCallbackReturnAware(Miscreated.Server, "OnClientEnteredGame", nil,
	function(self, channelId, player, loadingSaveGame)
		--Log(">> Miscreated.Server:OnClientEnteredGame")

		local message = player:GetName() .. " has entered the game"

		g_gameRules.game:SendTextMessage(0, 0, message)
		return ret
	end
)
