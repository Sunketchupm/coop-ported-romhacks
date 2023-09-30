-- name: Momentum Testing
-- description: Romhack made by Iwer Sonsch.\nThere are 2 stars in this romhack to collect.\nPorted by Sunk
-- incompatible: romhack

smlua_text_utils_course_acts_replace(COURSE_JRB, ("   MOMENTUM TESTING"), (""),	(""), (""),	(""), (""),	(""))
gLevelValues.entryLevel = LEVEL_JRB
gLevelValues.exitCastleLevel = LEVEL_CASTLE
gLevelValues.exitCastleArea = 1
gLevelValues.exitCastleWarpNode = 0xA

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)

hook_event(HOOK_USE_ACT_SELECT, function () return false end)
hook_event(HOOK_GET_STAR_COLLECTION_DIALOG, function () return false end)