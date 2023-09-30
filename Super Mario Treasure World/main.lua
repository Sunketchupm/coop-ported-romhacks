-- name: Super Mario Treasure World
-- description: A classic 182 star kazio romhack created by Rambi Rampage.\nPorted by Sunk.
-- incompatible: romhack

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)

hook_event(HOOK_UPDATE,
function ()
    set_ttc_speed_setting(TTC_SPEED_SLOW)

    if gNetworkPlayers[0].currLevelNum == LEVEL_TTM then
        gLevelValues.fixCollisionBugs = true
        gLevelValues.fixCollisionBugsFalseLedgeGrab = false
        gLevelValues.fixCollisionBugsGroundPoundBonks = false
        gLevelValues.fixCollisionBugsPickBestWall = false
        gLevelValues.fixCollisionBugsRoundedCorners = false
    else
        gLevelValues.fixCollisionBugs = false
    end
end)