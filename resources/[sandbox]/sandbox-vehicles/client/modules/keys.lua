VEHICLE_KEYS = {}

local _lockdelay = false

AddEventHandler("Vehicles:Client:StartUp", function()
	Callbacks:RegisterClientCallback("Vehicles:Keys:GetVehicleToShare", function(data, cb)
		local playerCoords = GetEntityCoords(GLOBAL_PED)
		local veh = VEHICLE_INSIDE and VEHICLE_INSIDE or GetClosestVehicleWithinRadius(playerCoords, 10.0)
		if DoesEntityExist(veh) then
			local vehEnt = Entity(veh)
			if
				vehEnt
				and vehEnt.state
				and vehEnt.state.VIN
				and Vehicles.Keys:Has(vehEnt.state.VIN, vehEnt.state.GroupKeys)
			then
				if IsPedInAnyVehicle(LocalPlayer.state.ped, true) then
					local sids = {}
					for i = -1, GetVehicleModelNumberOfSeats(veh), 1 do
						local ped = GetPedInVehicleSeat(veh, i)
						if ped ~= 0 and ped ~= LocalPlayer.state.ped then
							table.insert(sids, GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped)))
						end
					end
					return cb(VehToNet(veh), sids)
				else
					local myCoords = GetEntityCoords(LocalPlayer.state.ped)
					local peds = GetGamePool("CPed")
					local sids = {}
					for _, ped in ipairs(peds) do
						if ped ~= LocalPlayer.state.ped and IsPedAPlayer(ped) then
							local entCoords = GetEntityCoords(ped)
							if #(entCoords - myCoords) <= 4.0 then
								table.insert(sids, GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped)))
							end
						end
					end
					return cb(VehToNet(veh), sids)
				end
			else
				cb(false)
			end
		else
			cb(false)
		end
	end)

	Keybinds:Add("vehicle_lock", "l", "keyboard", "Vehicle - Toggle Door Locks", function()
		if not _lockdelay then
			local veh = VEHICLE_INSIDE and VEHICLE_INSIDE
				or GetClosestVehicleWithinRadius(GetEntityCoords(GLOBAL_PED), 10.0)
			if DoesEntityExist(veh) then
				_lockdelay = true
				SetTimeout(1500, function()
					_lockdelay = false
				end)
				Vehicles:SetLocks(veh)
			end
		end
	end)
end)

AddEventHandler('Vehicles:Client:K9GetInNearestSeat', function(entityData)
	if entityData and DoesEntityExist(entityData.entity) then
		local vehmodel = GetEntityModel(entityData.entity)
		for i = -1, GetVehicleModelNumberOfSeats(vehmodel) do
			if GetPedInVehicleSeat(entityData.entity, i) == 0 then
				TaskWarpPedIntoVehicle(LocalPlayer.state.ped, entityData.entity, i)
				Wait(100)
				Animations.Emotes:Play("dogsitcar", false, false, false)
				return
			end
		end
	end
end)

AddEventHandler('Vehicles:Client:K9LeaveVehicle', function()
	local veh = GetVehiclePedIsIn(LocalPlayer.state.ped, false)
	if LocalPlayer.state.isK9Ped and veh ~= 0 then
		TaskLeaveVehicle(LocalPlayer.state.ped, veh, 16)
		Wait(100)
		local coords = GetEntityCoords(LocalPlayer.state.ped)
		SetEntityCoords(LocalPlayer.state.ped, coords.x, coords.y, coords.z - 0.4)
		Wait(100)
		Animations.Emotes:ForceCancel()
	end
end)

RegisterNetEvent("Vehicles:Client:UpdateKeys", function(keys)
	VEHICLE_KEYS = keys
end)

_vehicleKeysExtension = {
	Keys = {
		Has = function(self, VIN, gKeys)
			if VIN and (
				VEHICLE_KEYS[VIN] 
				or (gKeys and (LocalPlayer.state.onDuty == gKeys or (LocalPlayer.state.sentOffDuty and LocalPlayer.state.sentOffDuty == gKeys)))
			) then
				return true
			else
				return false
			end
		end,
	},
	SetLocks = function(self, veh, state)
		if Entity(veh).state.keepLocked then
			return	
		end

		Callbacks:ServerCallback("Vehicles:ToggleLocks", {
			netId = NetworkGetNetworkIdFromEntity(veh),
			state = state,
		}, function(success, newState)
			if success then
				UnlockAnim()
				if newState then
					Notification:Error("Vehicle Locked")
					Sounds.Do.Play:One("central-locking.ogg", 0.2)
					DoVehicleLockShit(veh)
				else
					Notification:Success("Vehicle Unlocked")
					Sounds.Do.Play:One("central-locking.ogg", 0.2)
					DoVehicleUnlockShit(veh)
				end
			end
		end)
	end,
	HasAccess = function(self, vehicle, keysOnly, ownedOnly) -- Does the character have access to the vehicle
		if DoesEntityExist(vehicle) then
			local vehEnt = Entity(vehicle)
			if vehEnt.state.VIN then
				if ownedOnly and not vehEnt.state.Owned then
					return false
				end

				if not keysOnly and not vehEnt.state.Locked then
					return true
				end

				if Vehicles.Keys:Has(vehEnt.state.VIN, vehEnt.state.GroupKeys) then
					return true
				end
			end
		end
		return false
	end,
}

AddEventHandler("Proxy:Shared:ExtendReady", function(component)
	if component == "Vehicles" then
		exports["sandbox-base"]:ExtendComponent(component, _vehicleKeysExtension)
	end
end)

AddEventHandler("Vehicles:Client:ToggleLocks", function(entityData)
	if not DoesEntityExist(entityData.entity) then
		return
	end

	Vehicles:SetLocks(entityData.entity)
end)
