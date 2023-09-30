-- name: Lava Lava Lava Lava
-- description: Kaizo hack made by Tomatobird8. Go check him out!\nPorted by Sunk, with the help of EmeraldLockdown.
-- incompatible: romhack

gLevelValues.entryLevel = LEVEL_CASTLE
gLevelValues.exitCastleWarpNode = 0x0A

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)

hook_event(HOOK_GET_STAR_COLLECTION_DIALOG, function () return 0 end)