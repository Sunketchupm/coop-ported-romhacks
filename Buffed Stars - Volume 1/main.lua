-- name: Buffed Stars - Volume 1
-- description: The credit for every level goes to their original creator, and all of the buffs are created by MorningStormSM64.\nPorted by Sunk.
-- incompatible: romhack

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)

-- Force 1 hp in c9 and c13

local levels = {
    [LEVEL_DDD] = true,
    [LEVEL_THI] = true
}

local function sync_valid()
    ---@type NetworkPlayer
    local np = gNetworkPlayers[0]
    if levels[np.currLevelNum] then
        ---@type MarioState
        local m = gMarioStates[0]
        local obj = obj_get_nearest_object_with_behavior_id(m.marioObj, id_bhvSpinAirborneWarp)
        vec3f_set(m.pos, obj.oPosX, obj.oPosY, obj.oPosZ)
    end
end

---@param m MarioState
local function mario_update(m)
    if m.playerIndex ~= 0 then return end

    ---@type NetworkPlayer
    local np = gNetworkPlayers[0]
    if levels[np.currLevelNum] then
        if m.healCounter > 12 then
            m.healCounter = 0
        end
    end
end

hook_event(HOOK_ON_SYNC_VALID, sync_valid)
hook_event(HOOK_MARIO_UPDATE, mario_update)

-- Force fake stars to act more like how they're intended to be

---@param m MarioState
---@param obj Object
---@param intType integer
local function allow_interact(m, obj, intType)
    if m.playerIndex ~= 0 then return true end

    if intType == INTERACT_STAR_OR_KEY and obj.oBehParams >> 24 > 6 then
        local noExit = (obj.oInteractionSubtype & INT_SUBTYPE_NO_EXIT) ~= 0 or gServerSettings.stayInLevelAfterStar ~= 0
        if m.health > 255 and m.action ~= ACT_BUBBLED then
            set_mario_action(m, ACT_FALL_AFTER_STAR_GRAB, noExit and 3 or 2)
        end
        m.health = 255
        return false
    end
    return true
end

hook_event(HOOK_ALLOW_INTERACT, allow_interact)