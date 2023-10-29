-- name: Treasure World Dream Edition
-- description: The infamous kaizo 182 star sequal to SMTW, created by Rambi Rampage.\nPorted by Sunk.
-- incompatible: romhack

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)

set_ttc_speed_setting(TTC_SPEED_FAST)

---- Locked Dream ----
local function on_pause_exit(isExitToCastle)
    return not (gNetworkPlayers[0].currLevelNum == LEVEL_PSS and isExitToCastle)
end

hook_event(HOOK_ON_PAUSE_EXIT, on_pause_exit)