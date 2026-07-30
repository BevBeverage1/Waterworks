local mod = RegisterMod("Waterworks", 1)

local tidalWave = Isaac.GetItemIdByName("Tidal Wave")

function mod:TidalWaveUse(item, rng, player, useFlags, activeSlot)
    local roomEntities = Isaac.GetRoomEntities()

    for _, entity in ipairs(roomEntities) do
        if entity:IsActiveEnemy() and entity:IsVulnerableEnemy() then
            entity:Kill()
        end
    end

    return {
        Discharge = true,
        Remove = false,
        ShowAnim = true
    }
end

mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.TidalWaveUse, tidalWave)