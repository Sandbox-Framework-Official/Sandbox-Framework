local _weatherState = "EXTRASUNNY"
local _timeHour = 12
local _timeMinute = 0
local _blackoutState = false
local isTransionHappening = false
local _isStopped = true
local _isStoppedForceTime = 20

local _inCayo = false
local _inCayoStorm = false

AddEventHandler("Sync:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Callbacks = exports["sandbox-base"]:FetchComponent("Callbacks")
	Logger = exports["sandbox-base"]:FetchComponent("Logger")
	Sync = exports["sandbox-base"]:FetchComponent("Sync")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["sandbox-base"]:RequestDependencies("Sync", {
		"Callbacks",
		"Logger",
		"Sync",
	}, function(error)
		if #error > 0 then
			return
		end
		RetrieveComponents()

		if GlobalState["Sync:Winter"] then
			SetForceVehicleTrails(true)
			SetForcePedFootstepsTracks(true)
			ForceSnowPass(true)

			RequestScriptAudioBank("ICE_FOOTSTEPS", false)
			RequestScriptAudioBank("SNOW_FOOTSTEPS", false)
		else
			SetForceVehicleTrails(false)
			SetForcePedFootstepsTracks(false)
			ForceSnowPass(false)

			ReleaseNamedScriptAudioBank("ICE_FOOTSTEPS")
			ReleaseNamedScriptAudioBank("SNOW_FOOTSTEPS")
		end
	end)
end)

AddEventHandler("Characters:Client:Spawn", function()
	Sync:Start()
	-- CreateThread(function()
	-- 	SwitchTrainTrack(0, true)
	-- 	SwitchTrainTrack(3, true)
	-- 	SetTrainTrackSpawnFrequency(0, 60 * 240 * 1000) -- 240 minutes in milliseconds
	-- 	SetRandomTrains(1)
	-- 	-- turn off/On doors opening
	-- 	SetTrainsForceDoorsOpen(false)
	-- end)
end)

RegisterNetEvent("Characters:Client:Logout", function()
	Sync:Stop()
end)

SYNC = {
	Start = function(self)
		Logger:Trace("Sync", "Starting Time and Weather Sync")
		_isStopped = false

		_weatherState = GlobalState["Sync:Weather"]
		_blackoutState = GlobalState["Sync:Blackout"]
		local timeState = GlobalState["Sync:Time"]
		_timeHour = timeState.hour
		_timeMinute = timeState.minute

		SetRainFxIntensity(-1.0)

		if
			_weatherState == "XMAS"
			or _weatherState == "BLIZZARD"
			or _weatherState == "SNOW"
			or GlobalState["Sync:Winter"]
		then
			SetForceVehicleTrails(true)
			SetForcePedFootstepsTracks(true)
			ForceSnowPass(true)

			RequestScriptAudioBank("ICE_FOOTSTEPS", false)
			RequestScriptAudioBank("SNOW_FOOTSTEPS", false)
		else
			SetForceVehicleTrails(false)
			SetForcePedFootstepsTracks(false)
			ForceSnowPass(false)

			ReleaseNamedScriptAudioBank("ICE_FOOTSTEPS")
			ReleaseNamedScriptAudioBank("SNOW_FOOTSTEPS")
		end
	end,
	Stop = function(self, hour)
		Logger:Trace("Sync", "Stopping Time and Weather Sync")
		_isStopped = true

		if not hour then
			_isStoppedForceTime = 20
		else
			_isStoppedForceTime = hour
		end
	end,
	IsSyncing = function(self)
		return not _isStopped
	end,
	GetTime = function(self)
		return {
			hour = _timeHour,
			minute = _timeMinute,
		}
	end,
	GetWeather = function(self)
		return _weatherState
	end,
}

AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["sandbox-base"]:RegisterComponent("Sync", SYNC)
end)

CreateThread(function()
	StartSyncThreads()
end)

function StartSyncThreads()
	CreateThread(function()
		while GlobalState["Sync:Time"] == nil do
			Wait(1)
		end

		local hour = 0
		local minute = 0
		while true do
			if not _isStopped then
				local timeState = GlobalState["Sync:Time"]
				_timeHour = timeState.hour
				_timeMinute = timeState.minute
			else
				_timeHour = _isStoppedForceTime
				_timeMinute = 0
			end

			Wait(2500)
		end
	end)

	CreateThread(function()
		while true do
			NetworkOverrideClockTime(_timeHour, _timeMinute, 0)
			if _blackoutState then
				SetArtificialLightsStateAffectsVehicles(false)
			end
			Wait(50)
		end
	end)

	CreateThread(function()
		while true do
			if not _isStopped then
				if _inCayo or _inCayoStorm then
					local lazyNick = "THUNDER"
					if _inCayo then
						lazyNick = "EXTRASUNNY"
					end
					SetArtificialLightsState(false)

					ClearOverrideWeather()
					ClearWeatherTypePersist()
					SetWeatherTypeOvertimePersist(lazyNick, 1.0)
					Wait(1000)

					SetWeatherTypePersist(lazyNick)
					SetWeatherTypeNow(lazyNick)
					SetWeatherTypeNowPersist(lazyNick)
				else
					_blackoutState = GlobalState["Sync:Blackout"]
						or (LocalPlayer.state.inPaletoPower and GlobalState["Sync:PaletoBlackout"])
					SetArtificialLightsState(_blackoutState) -- Blackout
					SetArtificialLightsStateAffectsVehicles(false)

					if _weatherState ~= GlobalState["Sync:Weather"] then
						local _prevWeather = _weatherState
						if not isTransionHappening then
							isTransionHappening = true
							_weatherState = GlobalState["Sync:Weather"]
							Logger:Trace("Sync", "Transitioning to Weather: " .. _weatherState)
							ClearOverrideWeather()
							ClearWeatherTypePersist()
							SetWeatherTypeOvertimePersist(_weatherState, 15.0)
							Wait(15000)
							Logger:Trace("Sync", "Finished Transitioning to Weather: " .. _weatherState)
							isTransionHappening = false
						end

						if
							_weatherState == "XMAS"
							or _weatherState == "BLIZZARD"
							or _weatherState == "SNOW"
							or GlobalState["Sync:Winter"]
						then
							SetForceVehicleTrails(true)
							SetForcePedFootstepsTracks(true)
							ForceSnowPass(true)

							RequestScriptAudioBank("ICE_FOOTSTEPS", false)
							RequestScriptAudioBank("SNOW_FOOTSTEPS", false)
						else
							SetForceVehicleTrails(false)
							SetForcePedFootstepsTracks(false)
							ForceSnowPass(false)

							ReleaseNamedScriptAudioBank("ICE_FOOTSTEPS")
							ReleaseNamedScriptAudioBank("SNOW_FOOTSTEPS")
						end
					end

					SetWeatherTypePersist(_weatherState)
					SetWeatherTypeNow(_weatherState)
					SetWeatherTypeNowPersist(_weatherState)
				end

				Wait(750)
			else
				SetRainFxIntensity(0.0)
				SetWeatherTypeNowPersist("EXTRASUNNY")
				Wait(2000)
			end
		end
	end)
end

AddEventHandler("Polyzone:Enter", function(id, point, insideZone, data)
	if id == "cayo_perico" and not _inCayo then
		_inCayo = true
		LocalPlayer.state.inCayo = true

		SetForceVehicleTrails(false)
		SetForcePedFootstepsTracks(false)
		ForceSnowPass(false)

		ReleaseNamedScriptAudioBank("ICE_FOOTSTEPS")
		ReleaseNamedScriptAudioBank("SNOW_FOOTSTEPS")
	end

	if id == "cayo_perico_weather" and not _inCayoStorm then
		_inCayoStorm = true

		SetRainFxIntensity(0.0)

		SetForceVehicleTrails(false)
		SetForcePedFootstepsTracks(false)
		ForceSnowPass(false)

		ReleaseNamedScriptAudioBank("ICE_FOOTSTEPS")
		ReleaseNamedScriptAudioBank("SNOW_FOOTSTEPS")
	end
end)

AddEventHandler("Polyzone:Exit", function(id, point, insideZone, data)
	if id == "cayo_perico" and _inCayo then
		_inCayo = false
		LocalPlayer.state.inCayo = false
	end

	if id == "cayo_perico_weather" and _inCayoStorm then
		_inCayoStorm = false

		SetRainFxIntensity(-1.0)
	end

	if
		_weatherState == "XMAS"
		or _weatherState == "BLIZZARD"
		or _weatherState == "SNOW"
		or GlobalState["Sync:Winter"]
	then
		SetForceVehicleTrails(true)
		SetForcePedFootstepsTracks(true)
		ForceSnowPass(true)

		RequestScriptAudioBank("ICE_FOOTSTEPS", false)
		RequestScriptAudioBank("SNOW_FOOTSTEPS", false)
	end
end)
