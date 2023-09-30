-- name: Treasure World Dream Edition
-- description: Created by Rambi_Rampage
-- incompatible: romhack

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)

---- Locked Dream ----
local function on_pause_exit(isExitToCastle)
    return not (gNetworkPlayers[0].currLevelNum == LEVEL_PSS and isExitToCastle)
end

hook_event(HOOK_ON_PAUSE_EXIT, on_pause_exit)