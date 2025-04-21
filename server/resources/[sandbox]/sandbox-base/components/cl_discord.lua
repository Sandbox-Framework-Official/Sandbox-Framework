COMPONENTS.Discord = {
	_name = "base",
	RichPresence = function(self)
		SetDiscordAppId(COMPONENTS.Convar.DISCORD_APP.value)
		SetDiscordRichPresenceAsset("logo")
		SetDiscordRichPresenceAssetText("Join Today: https://dsc.gg/Notyetbuddeh")
		SetDiscordRichPresenceAction(0, "Watch our trailer", "https://www.youtube.com")

		CreateThread(function()
			while true do
				local char = LocalPlayer.state.Character
				local playerCount = GlobalState["PlayerCount"] or 0
				local queueCount = GlobalState["QueueCount"] or 0
				if char ~= nil then
					SetRichPresence(
						string.format(
							"[%d/%d]%s - Playing %s %s",
							playerCount,
							GlobalState.MaxPlayers,
							queueCount > 0 and string.format(" (Queue: %d)", queueCount) or "",
							char:GetData("First"),
							char:GetData("Last")
						)
					)
				else
					SetRichPresence(
						string.format(
							"[%d/%d]%s - Selecting a Character",
							playerCount,
							GlobalState.MaxPlayers,
							queueCount > 0 and string.format(" (Queue: %d)", queueCount) or ""
						)
					)
				end

				-- SetDiscordRichPresenceAssetSmallText(
				-- 	string.format("%s/%s [Queue: %s]", playerCount, GlobalState.MaxPlayers, queueCount)
				-- )
				Wait(30000)
			end
		end)
	end,
}

CreateThread(function()
	--if GetConvar("web_baseUrl", "") ~= "https://sandbox-rp-lj7b87.users.cfx.re/" then
	--	return
	--end
	COMPONENTS.Discord:RichPresence()
end)
