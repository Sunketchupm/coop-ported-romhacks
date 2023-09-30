-- name: Cursed Winter Forest
-- description: A buff of Haunted Autumn Forest, from King Boo's Revenge 2.\nBuff created by Morningstorm SM64. King Boo's Revenge 2 created by Thebloody7 and Sizzlingmario4.\nPorted by Sunk
-- incompatible: romhack

gLevelValues.fixCollisionBugs = true
gLevelValues.fixCollisionBugsRoundedCorners = false
gLevelValues.fixCollisionBugsFalseLedgeGrab = false
gLevelValues.fixCollisionBugsGroundPoundBonks = false
gLevelValues.fixCollisionBugsPickBestWall = false

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)

smlua_text_utils_secret_star_replace(23 + 1, ("   CURSED WINTER FOREST"))

--[[
    This romhack has you start on fire and have 1 health throughout most of the hack.
    This code here enforces being burned by the fire
    Not only that, healing from popping from a bubble is also disallowed
]]

function sync_valid()
    if gNetworkPlayers[0].currLevelNum == LEVEL_SA then
        local m = gMarioStates[0]
        local obj = obj_get_nearest_object_with_behavior_id(m.marioObj, id_bhvSpinAirborneWarp)
        vec3f_set(m.pos, obj.oPosX, obj.oPosY, obj.oPosZ)
    end
end

---@param m MarioState
local function mario_update(m)
    if m.playerIndex ~= 0 then return end

    if gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_GROUNDS and m.healCounter > 12 then
        m.healCounter = 0
    end
end

hook_event(HOOK_ON_SYNC_VALID, sync_valid)
hook_event(HOOK_MARIO_UPDATE, mario_update)