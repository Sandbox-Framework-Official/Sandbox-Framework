local isOnBike = false

CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if IsPedInAnyVehicle(playerPed, true) then
			if IsThisModelABicycle(GetEntityModel(vehicle)) or IsThisModelABike(GetEntityModel(vehicle)) or IsThisModelAQuadbike(GetEntityModel(vehicle)) then
				isOnBike = true
			end
		end
		if not isOnBike then
			Wait(5000)
		else
			Wait(5)
			if IsControlPressed(0, 29) and IsControlJustReleased(0, 172) then
				if IsThisModelABicycle(GetEntityModel(vehicle)) or IsThisModelABike(GetEntityModel(vehicle)) or IsThisModelAQuadbike(GetEntityModel(vehicle)) then
					RequestAnimDict('rcmextreme2atv')
					while not HasAnimDictLoaded('rcmextreme2atv') do
						Wait(100)
					end
					TaskPlayAnim(playerPed, 'rcmextreme2atv', 'idle_e', -1, -1, -1, 32, 0, 0, 0, 0)
				end
			end

			if IsControlPressed(0, 29) and IsControlJustReleased(0, 173) then
				if IsThisModelABicycle(GetEntityModel(vehicle)) or IsThisModelABike(GetEntityModel(vehicle)) or IsThisModelAQuadbike(GetEntityModel(vehicle))  then
					RequestAnimDict('rcmextreme2atv')
					while not HasAnimDictLoaded('rcmextreme2atv') do
						Wait(100)
					end
					TaskPlayAnim(playerPed, 'rcmextreme2atv', 'idle_d', -1, -1, -1, 32, 0, 0, 0, 0)
				end
			end

			if IsControlPressed(0, 29) and IsControlJustReleased(0, 174) then
				if IsThisModelABicycle(GetEntityModel(vehicle)) or IsThisModelABike(GetEntityModel(vehicle)) or IsThisModelAQuadbike(GetEntityModel(vehicle)) then
					RequestAnimDict('rcmextreme2atv')
					while not HasAnimDictLoaded('rcmextreme2atv') do
						Wait(100)
					end
					TaskPlayAnim(playerPed, 'rcmextreme2atv', 'idle_b', -1, -1, -1, 32, 0, 0, 0, 0)
				end
			end

			if IsControlPressed(0, 29) and IsControlJustReleased(0, 175) then
				if IsThisModelABicycle(GetEntityModel(vehicle)) or IsThisModelABike(GetEntityModel(vehicle)) or IsThisModelAQuadbike(GetEntityModel(vehicle))  then
					RequestAnimDict('rcmextreme2atv')
					while not HasAnimDictLoaded('rcmextreme2atv') do
						Wait(100)
					end
					TaskPlayAnim(playerPed, 'rcmextreme2atv', 'idle_c', -1, -1, -1, 32, 0, 0, 0, 0)
				end	
			end
			if IsControlPressed(0, 29) and IsControlJustReleased(0, 182) then
				if IsThisModelABicycle(GetEntityModel(vehicle)) or IsThisModelABike(GetEntityModel(vehicle)) or IsThisModelAQuadbike(GetEntityModel(vehicle))  then
					RequestAnimDict('rcmextreme2atv')
					while not HasAnimDictLoaded('rcmextreme2atv') do
						Wait(100)
					end
					TaskPlayAnim(playerPed, 'rcmextreme2atv', 'idle_a', -1, -1, -1, 32, 0, 0, 0, 0)
				end	
			end
		end

	end
end)