-- name: Eternal Endless Season Lite Demo
-- description: A demo of a romhack created by Morningstorm. There's currently only 1 star.\nPorted by Sunk
-- incompatible: romhack

gLevelValues.entryLevel = LEVEL_CASTLE_GROUNDS
gLevelValues.exitCastleLevel = LEVEL_CASTLE_GROUNDS
gLevelValues.exitCastleArea = 1
gLevelValues.exitCastleWarpNode = 0xA
gLevelValues.coinsRequiredForCoinStar = 0
gLevelValues.cellHeightLimit = 32767
gLevelValues.floorLowerLimit = -32768
gLevelValues.floorLowerLimitMisc = -32768
gLevelValues.floorLowerLimitShadow = -31768

gLevelValues.fixCollisionBugs = 1
gLevelValues.fixCollisionBugsFalseLedgeGrab = 0
gLevelValues.fixCollisionBugsGroundPoundBonks = 0
gLevelValues.fixCollisionBugsPickBestWall = 0
gLevelValues.fixCollisionBugsRoundedCorners = 0

smlua_text_utils_course_acts_replace(COURSE_BOB, (" 1 BOWSER'S VAST DESERT BASE"),	("A DOZEN SQUARED ACROSS THE MASSIVE STRUCTURE"),	(""),	(""),	(""),	(""),	(""))

smlua_audio_utils_replace_sequence(0x01, 0x22, 75, "01_Seq_custom")
smlua_audio_utils_replace_sequence(0x02, 0x11, 75, "02_Seq_custom")
smlua_audio_utils_replace_sequence(0x0B, 0x14, 75, "0B_Seq_custom")
smlua_audio_utils_replace_sequence(0x0D, 0x16, 75, "0D_Seq_custom")
smlua_audio_utils_replace_sequence(0x0E, 0x17, 75, "0E_Seq_custom")
smlua_audio_utils_replace_sequence(0x0F, 0x18, 75, "0F_Seq_custom")
smlua_audio_utils_replace_sequence(0x10, 0x12, 75, "10_Seq_custom")
smlua_audio_utils_replace_sequence(0x12, 0x1F, 75, "12_Seq_custom")
smlua_audio_utils_replace_sequence(0x14, 0x1A, 75, "14_Seq_custom")
smlua_audio_utils_replace_sequence(0x15, 0x0E, 75, "15_Seq_custom")
smlua_audio_utils_replace_sequence(0x16, 0x1B, 75, "16_Seq_custom")
smlua_audio_utils_replace_sequence(0x17, 0x1A, 75, "17_Seq_custom")
smlua_audio_utils_replace_sequence(0x1B, 0x14, 75, "1B_Seq_custom")
smlua_audio_utils_replace_sequence(0x1C, 0x20, 75, "1C_Seq_custom")
smlua_audio_utils_replace_sequence(0x1D, 0x1E, 75, "1D_Seq_custom")
smlua_audio_utils_replace_sequence(0x1E, 0x1B, 75, "1E_Seq_custom")
smlua_audio_utils_replace_sequence(0x1F, 0x1A, 75, "1F_Seq_custom")
smlua_audio_utils_replace_sequence(0x20, 0x23, 75, "20_Seq_custom")
smlua_audio_utils_replace_sequence(0x21, 0x24, 75, "21_Seq_custom")
smlua_audio_utils_replace_sequence(0x24, 0x18, 75, "24_Seq_custom")
smlua_audio_utils_replace_sequence(0x08, 0x1D, 75, "08_Seq_custom")

hook_event(HOOK_GET_STAR_COLLECTION_DIALOG, function () return 0 end)

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)

save_file_set_flags(SAVE_FLAG_HAVE_METAL_CAP | SAVE_FLAG_HAVE_VANISH_CAP | SAVE_FLAG_HAVE_WING_CAP)