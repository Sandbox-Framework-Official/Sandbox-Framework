local IsWide = false

if Config.AspectRatio.Enabled then
	CreateThread(function()
		while true do
			Wait(1000)
			if LocalPlayer.state.loggedIn then
				local res = GetIsWidescreen()
				if not res and not IsWide then
					startTimer()
					IsWide = true
					SetTimecycleModifier("Glasses_BlackOut")
				elseif res and IsWide then
					IsWide = false
					Notification.Persistent:Remove("pwnzor-aspectchecker")
					ClearTimecycleModifier()
				end
			end
		end
	end)
end

function startTimer()
	local timer = Config.AspectRatio.Options.KickTimer

	CreateThread(function()
		while timer > 0 and IsWide do
			Wait(1000)

			if timer > 0 then
				timer = timer - 1
				if timer == 0 then
					Callbacks:ServerCallback("Pwnzor:AspectRatio")
				end
			end
		end
	end)

	CreateThread(function()
		while IsWide do
			Wait(1000)
			Notification.Persistent:Error(
				"pwnzor-aspectchecker",
				string.format("You will get kicked in %s seconds. Change your resolution to 16:9", timer)
			)
		end
	end)
end
