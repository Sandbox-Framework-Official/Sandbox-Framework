_tempLastLocation = {}
_lastSpawnLocations = {}

_pleaseFuckingWorkSID = {}
_pleaseFuckingWorkID = {}

_fuckingBozos = {}

AddEventHandler("Player:Server:Connected", function(source)
	_fuckingBozos[source] = os.time()
end)

function RegisterCallbacks()
	Citizen.CreateThread(function()
		while true do
			if not (GlobalState["DisableAFK"] or false) then
				for k, v in pairs(_fuckingBozos) do
					if v < (os.time() - (60 * 10)) then
						local pState = Player(k).state
						if not pState.isDev and not pState.isAdmin and not pState.isStaff then
							Punishment:Kick(k, "You Were Kicked For Being AFK On Character Select", "Pwnzor", true)
						else
							Logger:Warn("Characters", "Staff or Admin Was AFK, Removing From Checks")
							_fuckingBozos[k] = nil
						end
					elseif v < (os.time() - (60 * 5)) then
						-- TODO: Implement better alert when at this stage when we have someway to do it
						Execute:Client(k, "Notification", "Warn", "You Will Be Kicked Soon For Being AFK", 58000)
					end
				end
			end
			Citizen.Wait(60000)
		end
	end)
	
	Callbacks:RegisterServerCallback("Characters:GetServerData", function(source, data, cb)
		while Fetch:Source(source) == nil do
			Citizen.Wait(1000)
		end
	
		local motd = GetConvar("motd", "Welcome to SandboxRP")
		
		local query = 'SELECT * FROM `changelogs` ORDER BY `date` DESC LIMIT 1'
	
		MySQL.Async.fetchAll(query, {}, function(results)
			if not results then
				cb({ changelog = nil, motd = "" })
				return
			end
	
			if #results > 0 then
				cb({ changelog = results[1], motd = motd })
			else
				cb({ changelog = nil, motd = motd })
			end
		end)
	end)

	Callbacks:RegisterServerCallback("Characters:GetCharacters", function(source, data, cb)
		local player = Fetch:Source(source)
		local myCharacters = MySQL.query.await(
		  [[
			SELECT * FROM `characters` WHERE `User` = @User AND `Deleted` = 0
		  ]],
		  {
			["@User"] = player:GetData("AccountID"),
		  }
		)
		if #myCharacters == 0 then
		  return cb({})
		end
	
		local cData = {}
		for k, v in ipairs(myCharacters) do
		  local pedData = MySQL.single.await(
			[[
			  SELECT * FROM `peds` WHERE `Char` = @Char
			]],
			{
			  ["@Char"] = v._id,
			}
		  )
		  table.insert(cData, {
			ID = v._id,
			First = v.First,
			Last = v.Last,
			Phone = v.Phone,
			DOB = v.DOB,
			Gender = v.Gender,
			LastPlayed = v.LastPlayed,
			Jobs = json.decode(v.Jobs),
			SID = v.SID,
			GangChain = json.decode(v.GangChain),
			Preview = pedData and json.decode(pedData?.ped) or false
		  })
		end
	
		player:SetData("Characters", cData)
		cb(cData)
	  end)

	Callbacks:RegisterServerCallback("Characters:CreateCharacter", function(source, data, cb)
		local player = Fetch:Source(source)
		local pNumber = Phone:GeneratePhoneNumber()
		local doc = {
			User = player:GetData("AccountID"),
			First = data.first,
			Last = data.last,
			Phone = pNumber,
			Gender = tonumber(data.gender),
			Bio = data.bio,
			Origin = data.origin,
			DOB = data.dob,
			LastPlayed = -1,
			Jobs = {},
			SID = Sequence:Get("Character"),
			Cash = 1000,
			New = true,
			Licenses = {
				Drivers = {
					Active = true,
					Points = 0,
					Suspended = false,
				},
				Weapons = {
					Active = false,
					Suspended = false,
				},
				Hunting = {
					Active = false,
					Suspended = false,
				},
				Fishing = {
					Active = false,
					Suspended = false,
				},
				Pilot = {
					Active = false,
					Suspended = false,
				},
				Drift = {
					Active = false,
					Suspended = false,
				},
			},
		}

		print("1")
		local extra = Middleware:TriggerEventWithData("Characters:Creating", source, doc)
		for k, v in ipairs(extra) do
			for k2, v2 in pairs(v) do
				if k2 ~= "ID" then
					doc[k2] = v2
				end
			end
		end

		print("2")
		local dbData = Utils:CloneDeep(doc)
		for k, v in pairs(dbData) do
			if type(v) == 'table' then
				dbData[k] = json.encode(v)
			end
		end

		print("3")
		local insertedCharacter = MySQL.insert.await('INSERT INTO `characters` SET ?', { dbData })
		if insertedCharacter <= 0 then
			return cb(nil)
		end

		print("4")
		local myChar = MySQL.single.await('SELECT `_id` FROM `characters` WHERE `SID` = ? AND `User` = ?',
		{ insertedCharacter, player:GetData("AccountID") })
		if myChar == nil then
			return cb(nil)
		end
		print("5")
		doc.ID = myChar._id
		
		TriggerEvent("Characters:Server:CharacterCreated", doc)
		Middleware:TriggerEvent("Characters:Created", source, doc)
			
		Logger:Info(
			"Characters",
			string.format(
				"%s [%s] Created a New Character %s %s (%s)",
				player:GetData("Name"),
				player:GetData("AccountID"),
				doc.First,
				doc.Last,
				doc.SID
			),
			{
				console = true,
				file = true,
				database = true,
			}
		)
		return cb(doc)
	end)
	

	Callbacks:RegisterServerCallback("Characters:DeleteCharacter", function(source, data, cb)
		local player = Fetch:Source(source)
	
		local myCharacter = MySQL.single.await(
		  [[
			SELECT * FROM `characters` WHERE `User` = @User AND `_id` = @ID
		  ]],
		  {
			["@User"] = player:GetData("AccountID"),
			["@ID"] = data,
		  }
		)
	
		if myCharacter == nil then
		  return cb(nil)
		end
	
		local deletingChar = Utils:CloneDeep(myCharacter)
		local deletedCharacter = MySQL.update.await(
		  [[
			UPDATE `characters` SET `Deleted` = 1 WHERE `User` = @User AND `_id` = @ID
		  ]],
		  {
			["@User"] = player:GetData("AccountID"),
			["@ID"] = data,
		  }
		)
	
		if deletedCharacter then
		  TriggerEvent("Characters:Server:CharacterDeleted", data)
		  cb(true)
	
		  Logger:Warn(
			"Characters",
			string.format(
			  "%s [%s] Deleted Character %s %s (%s)",
			  player:GetData("Name"),
			  player:GetData("AccountID"),
			  deletingChar.First,
			  deletingChar.Last,
			  deletingChar.SID
			),
			{
			  console = true,
			  file = true,
			  database = true,
			  discord = {
				embed = true,
			  },
			}
		  )
		else
		  cb(false)
		end
	  end)

	  Callbacks:RegisterServerCallback("Characters:GetSpawnPoints", function(source, data, cb)
		local player = Fetch:Source(source)
		local myCharacter = MySQL.single.await(
		  [[
			SELECT * FROM `characters` WHERE `User` = @User AND `_id` = @ID
		  ]],
		  {
			["@User"] = player:GetData("AccountID"),
			["@ID"] = data,
		  }
		)
		if myCharacter == nil then
		  return cb(nil)
		end
		myCharacter.Jobs = json.decode(myCharacter.Jobs)
		if myCharacter.New then
		  return cb({
			{
			  id = 1,
			  label = "Character Creation",
			  location = Apartment:GetInteriorLocation(myCharacter.Apartment or 1),
			},
		  })
		elseif myCharacter.Jailed then
		  local JailedData = json.decode(myCharacter.JailedData)
		  -- and not myCharacter.Jailed.Released ~= nil
		  if not JailedData.Released then
			return cb({ Config.PrisonSpawn })
		  end
		elseif myCharacter.ICU then
		  local ICUData = json.decode(myCharacter.ICUData)
		  if not ICUData.Released then
			return cb({ Config.ICUSpawn })
		  end
		end
	
		local spawns = Middleware:TriggerEventWithData("Characters:GetSpawnPoints", source, data, myCharacter)
		cb(spawns)
	  end)

	Callbacks:RegisterServerCallback("Characters:GetCharacterData", function(source, data, cb)
		local player = Fetch:Source(source)
		local myCharacter = MySQL.single.await([[
			SELECT * FROM `characters` WHERE `User` = @User AND `_id` = @ID
			]],
			{
				["@User"] = player:GetData("AccountID"),
				["@ID"] = data,
			}
		)

		if myCharacter == nil then
			return cb(nil)
		end

		local cData = myCharacter

		for k, v in ipairs(_tablesToDecode) do
			if cData[v] then
				cData[v] = json.decode(cData[v])
			end
		end

		cData.Source = source
		cData.ID = myCharacter._id
		cData._id = nil

		player:SetData("Character", {
			SID = cData.SID,
			First = cData.First,
			Last = cData.Last,
		})

		local store = DataStore:CreateStore(source, "Character", cData)
		ONLINE_CHARACTERS[source] = store

		_pleaseFuckingWorkSID[cData.SID] = source
		_pleaseFuckingWorkID[cData.ID] = source

		GlobalState[string.format("SID:%s", source)] = cData.SID

		Middleware:TriggerEvent("Characters:CharacterSelected", source)

		cb(cData)
	end)
	

	Callbacks:RegisterServerCallback("Characters:Logout", function(source, data, cb)
		_fuckingBozos[source] = os.time()
		local c = Fetch:CharacterSource(source)
		if c ~= nil then
			local cData = c:GetData()
			if cData.SID and cData.ID then
				_pleaseFuckingWorkSID[cData.SID] = nil
				_pleaseFuckingWorkID[cData.ID] = nil
			end

			TriggerEvent("Characters:Server:PlayerLoggedOut", source, cData)

			Middleware:TriggerEvent("Characters:Logout", source)
			ONLINE_CHARACTERS[source] = nil
			GlobalState[string.format("SID:%s", source)] = nil
			TriggerClientEvent("Characters:Client:Logout", source)
			Routing:RoutePlayerToHiddenRoute(source)
			DataStore:DeleteStore(source, "Character")
		end
		cb("ok")
	end)

	Callbacks:RegisterServerCallback("Characters:GlobalSpawn", function(source, data, cb)
		Routing:RoutePlayerToGlobalRoute(source)
		cb()
	end)
end

AddEventHandler("Characters:Server:DropCleanup", function(source, cData)
	_fuckingBozos[source] = nil
	ONLINE_CHARACTERS[source] = nil

	GlobalState[string.format("SID:%s", source)] = nil

	if cData and cData.SID and cData.ID then
		_pleaseFuckingWorkSID[cData.SID] = nil
		_pleaseFuckingWorkID[cData.ID] = nil
	end
end)

function HandleLastLocation(source)
	local char = Fetch:CharacterSource(source)

	if char ~= nil then
		local lastLocation = _tempLastLocation[source]
		if lastLocation and type(lastLocation) == "vector3" then
			_lastSpawnLocations[char:GetData("ID")] = {
				coords = lastLocation,
				time = os.time(),
			}
		end
	end

	_tempLastLocation[source] = nil
end

AddEventHandler("Characters:Server:PlayerLoggedOut", function(source, cData)
	local lastLocation = _tempLastLocation[source]
	if lastLocation and type(lastLocation) == "vector3" then
		_lastSpawnLocations[cData.ID] = {
			coords = lastLocation,
			time = os.time(),
		}
	end
end)

function RegisterMiddleware()
	Middleware:Add("Characters:Spawning", function(source)
		_fuckingBozos[source] = nil
		TriggerClientEvent("Characters:Client:Spawned", source)
	end, 100000)
	Middleware:Add("Characters:ForceStore", function(source)
		local char = Fetch:CharacterSource(source)
		if char ~= nil then
			StoreData(source)
		end
	end, 100000)
	Middleware:Add("Characters:Logout", function(source)
		local char = Fetch:CharacterSource(source)
		if char ~= nil then
			StoreData(source)
		end
	end, 10000)

	Middleware:Add("Characters:GetSpawnPoints", function(source, id)
		if id then
			local hasLastLocation = _lastSpawnLocations[id]
			if hasLastLocation and hasLastLocation.time and (os.time() - hasLastLocation.time) <= (60 * 5) then
				return {
					{
						id = "LastLocation",
						label = "Last Location",
						location = {
							x = hasLastLocation.coords.x,
							y = hasLastLocation.coords.y,
							z = hasLastLocation.coords.z,
							h = 0.0,
						},
						icon = "location-smile",
						event = "Characters:GlobalSpawn",
					},
				}
			end
		end
		return {}
	end, 1)

	Middleware:Add("Characters:GetSpawnPoints", function(source)
		local spawns = {}
		for k, v in ipairs(Spawns) do
			v.event = "Characters:GlobalSpawn"
			table.insert(spawns, v)
		end
		return spawns
	end, 5)

	Middleware:Add("playerDropped", function(source, message)
		local char = Fetch:CharacterSource(source)
		if char ~= nil then
			StoreData(source)
		end
	end, 10000)

	Middleware:Add("Characters:Logout", function(source)
		local pState = Player(source).state
		if pState?.tpLocation then
			_tempLastLocation[source] = pState?.tpLocation
		else
			_tempLastLocation[source] = GetEntityCoords(GetPlayerPed(source))
		end
		HandleLastLocation(source)
	end, 1)

	Middleware:Add("playerDropped", HandleLastLocation, 6)
end

AddEventHandler("playerDropped", function()
	local src = source
	if DoesEntityExist(GetPlayerPed(src)) then
		local pState = Player(src).state
		if pState?.tpLocation then
			_tempLastLocation[src] = pState?.tpLocation
		else
			_tempLastLocation[src] = GetEntityCoords(GetPlayerPed(src))
		end
	end
end)

RegisterNetEvent("Characters:Server:LastLocation", function(coords)
	local src = source
	_tempLastLocation[src] = coords
end)