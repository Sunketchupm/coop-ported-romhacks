-- name: Input Density Testing
-- description: Romhack made by Iwer Sonsch.\nThe sequal to Momentum Testing.\nPorted by Sunk
-- incompatible: romhack

gLevelValues.entryLevel = LEVEL_CASTLE_GROUNDS
gLevelValues.exitCastleLevel = LEVEL_CASTLE_GROUNDS
gLevelValues.exitCastleArea = 1
gLevelValues.exitCastleWarpNode = 0xA
gLevelValues.coinsRequiredForCoinStar = 0

gLevelValues.pauseExitAnywhere = false

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)

hook_event(HOOK_USE_ACT_SELECT, function () return false end)
hook_event(HOOK_GET_STAR_COLLECTION_DIALOG, function () return false end)