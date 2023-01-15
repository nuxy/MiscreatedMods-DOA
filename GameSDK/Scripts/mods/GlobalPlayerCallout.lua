--
-- Globally callout connecting players.
--
function Miscreated.Server:OnClientEnteredGame(channelId, player)
	--Log(">> Miscreated.Server:OnClientEnteredGame")

	local message = player:GetName() .. " has entered the game"

	g_gameRules.game:SendTextMessage(0, 0, message)
end
