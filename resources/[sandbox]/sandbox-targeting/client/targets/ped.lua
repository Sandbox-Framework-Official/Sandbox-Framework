interactablePeds = {}
interactableGlobalPeds = {}
interactableModels = {}

TARGETING.AddPed = function(self, entityId, icon, menuArray, proximity)
    if not entityId then return end
    if not proximity then proximity = 3 end
    if type(menuArray) ~= 'table' then menuArray = {} end

    interactablePeds[entityId] = {
        type = 'ped',
        ped = entityId,
        icon = icon,
        menu = menuArray,
        proximity = proximity,
    }
end

TARGETING.RemovePed = function(self, entityId)
    interactablePeds[entityId] = nil
end

TARGETING.AddGlobalPed = function(self, menuArray)
    if type(menuArray) ~= 'table' then return end

    if Utils:GetTableLength(interactableGlobalPeds) > 0 then
        for _, option in ipairs(menuArray) do
            table.insert(interactableGlobalPeds.menu, option)
        end
        return Utils:GetTableLength(interactableGlobalPeds.menu) -- Returns index so you can remove it
    else
        interactableGlobalPeds = {
            type = 'ped',
            icon = "user",
            menu = menuArray,
            proximity = 3.0,
        }
    end
end

TARGETING.RemoveGlobalPed = function(self, menuIndex)
    if #interactableGlobalPeds > 0 then
        interactableGlobalPeds.menu[menuIndex] = nil
    end
end

TARGETING.AddPedModel = function(self, modelId, icon, menuArray, proximity)
    if not modelId then return end
    if not proximity then proximity = 3 end
    if type(menuArray) ~= 'table' then menuArray = {} end

    interactableModels[modelId] = {
        type = 'ped',
        ped = modelId,
        icon = icon,
        menu = menuArray,
        proximity = proximity,
    }
end

TARGETING.RemovePedModel = function(self, modelId)
    interactableModels[modelId] = nil
end

function IsPedInteractable(entity)
    if interactablePeds[entity] then -- Do entities first because they are higher priority
        return interactablePeds[entity]
    end

    local model = GetEntityModel(entity)
    if interactableModels[model] then
        return interactableModels[model]
    end

    if interactableGlobalPeds and not IsPedAPlayer(entity) then -- Fallback to global ped rules (if defined and not a player)
    return {
        type = interactableGlobalPeds.type or "ped",
        proximity = interactableGlobalPeds.proximity or 3.0,
        icon = interactableGlobalPeds.icon or "user",
        menu = interactableGlobalPeds.menu
    }
    end
    return false
end