-- name: King Boo's Revenge X
-- description: A sequal to King Boo's Revenge 2 with 160 stars. Created by Thebloody7.\nPorted by Sunk.
-- incompatible: romhack

gServerSettings.skipIntro = true

-- Can't be bothered testing every course that might need fixed collision so it's just blanket on
function update()
    gLevelValues.fixCollisionBugs = true
    gLevelValues.fixCollisionBugsRoundedCorners = false
    gLevelValues.fixCollisionBugsFalseLedgeGrab = false
    gLevelValues.fixCollisionBugsGroundPoundBonks = false
    gLevelValues.fixCollisionBugsPickBestWall = false

    if gNetworkPlayers[0].currLevelNum == LEVEL_BBH and gMarioStates[0].pos.y < -8000 then
        gLevelValues.fixCollisionBugs = false
    end
end

hook_event(HOOK_UPDATE, update)

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)

-- KBRX makes Mario not die to quicksand if he's vanished
---@param m MarioState
---@param hazardType number
function allow_hazard_surface(m, hazardType)
    if m.playerIndex ~= 0 then return end

    if m.flags & MARIO_VANISH_CAP ~= 0 and hazardType == HAZARD_TYPE_QUICKSAND then
        return false
    end
    return true
end

hook_event(HOOK_ALLOW_HAZARD_SURFACE, allow_hazard_surface)