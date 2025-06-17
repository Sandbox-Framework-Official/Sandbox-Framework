local _cachedSeq = {}
local _loadingPromises = {}

COMPONENTS.Sequence = {
    Get = function(self, key)
        -- Already cached: just increment and mark as dirty
        if _cachedSeq[key] then
            _cachedSeq[key].sequence += 1
            _cachedSeq[key].dirty = true
            return _cachedSeq[key].sequence
        end

        -- If another coroutine is already loading this key, wait for it
        if not _loadingPromises[key] then
            local p = promise.new()
            _loadingPromises[key] = p

            -- Async DB fetch
            MySQL.scalar("SELECT sequence FROM sequence WHERE id = ?", { key }, function(result)
                local value = tonumber(result) or 0
                local nextSeq = value + 1

                -- Cache it
                _cachedSeq[key] = {
                    id = key,
                    sequence = nextSeq,
                    dirty = true,
                }

                -- Async persist right away (non-blocking)
                MySQL.execute("INSERT INTO sequence (id, sequence) VALUES(?, ?) ON DUPLICATE KEY UPDATE sequence = VALUES(sequence)", {
                    key,
                    nextSeq
                }, function(success)
                    if not success then
                        COMPONENTS.Logger:Error("Sequence", "Failed to persist initial sequence for key: " .. key)
                    end
                end)

                p:resolve(_cachedSeq[key])
                _loadingPromises[key] = nil
            end)
        end

        -- Await for loading promise (waits if another coroutine is already loading)
        local seqData = Citizen.Await(_loadingPromises[key])
        return seqData.sequence
    end,

    Save = function(self)
        local queries = {}
        for k, v in pairs(_cachedSeq) do
            if v.dirty then
                table.insert(queries, {
                    query = "INSERT INTO sequence (id, sequence) VALUES(?, ?) ON DUPLICATE KEY UPDATE sequence = VALUES(sequence)",
                    values = { k, v.sequence },
                })
                v.dirty = false
            end
        end

        if #queries > 0 then
            MySQL.transaction(queries, function(success)
                if success then
                    COMPONENTS.Logger:Trace("Sequence", "All dirty sequences saved.")
                else
                    COMPONENTS.Logger:Error("Sequence", "Failed to save some sequences.")
                end
            end)
        end
    end,
}

AddEventHandler("Core:Shared:Ready", function()
    COMPONENTS.Tasks:Register("sequence_save", 1, function()
        COMPONENTS.Sequence:Save()
    end)
end)

AddEventHandler("Core:Server:ForceSave", function()
    COMPONENTS.Sequence:Save()
end)
