-- name: Despair Mario's Greens 64
-- description: Green comet version of Despair Mario's Gambit 64. Contains 80 stars.\nCreated by Gmd.\nPorted by Sunk.
-- incompatible: romhack

gLevelValues.entryLevel = LEVEL_CASTLE_GROUNDS

-- This hack does not have 100 coin stars
gLevelValues.coinsRequiredForCoinStar = 0

smlua_audio_utils_replace_sequence(0x01, 0x14, 75, "01_Seq_custom")
smlua_audio_utils_replace_sequence(0x02, 0x25, 75, "02_Seq_custom")
smlua_audio_utils_replace_sequence(0x04, 0x25, 75, "04_Seq_custom")
smlua_audio_utils_replace_sequence(0x06, 0x11, 75, "06_Seq_custom")
smlua_audio_utils_replace_sequence(0x08, 0x11, 75, "08_Seq_custom")
smlua_audio_utils_replace_sequence(0x0A, 0x25, 75, "0A_Seq_custom")
smlua_audio_utils_replace_sequence(0x0B, 0x14, 75, "0B_Seq_custom")
smlua_audio_utils_replace_sequence(0x0D, 0x25, 75, "0D_Seq_custom")
smlua_audio_utils_replace_sequence(0x0E, 0x25, 75, "0E_Seq_custom")
smlua_audio_utils_replace_sequence(0x0F, 0x11, 75, "0F_Seq_custom")
smlua_audio_utils_replace_sequence(0x10, 0x12, 75, "10_Seq_custom")
smlua_audio_utils_replace_sequence(0x12, 0x14, 75, "12_Seq_custom")
smlua_audio_utils_replace_sequence(0x13, 0x25, 75, "13_Seq_custom")
smlua_audio_utils_replace_sequence(0x14, 0x1A, 75, "14_Seq_custom")
smlua_audio_utils_replace_sequence(0x15, 0x0E, 75, "15_Seq_custom")
smlua_audio_utils_replace_sequence(0x16, 0x11, 75, "16_Seq_custom")
smlua_audio_utils_replace_sequence(0x17, 0x1A, 75, "17_Seq_custom")
smlua_audio_utils_replace_sequence(0x18, 0x25, 75, "18_Seq_custom")
smlua_audio_utils_replace_sequence(0x1B, 0x14, 75, "1B_Seq_custom")
smlua_audio_utils_replace_sequence(0x1C, 0x20, 75, "1C_Seq_custom")
smlua_audio_utils_replace_sequence(0x1D, 0x1E, 75, "1D_Seq_custom")
smlua_audio_utils_replace_sequence(0x1E, 0x25, 75, "1E_Seq_custom")
smlua_audio_utils_replace_sequence(0x1F, 0x25, 75, "1F_Seq_custom")
smlua_audio_utils_replace_sequence(0x20, 0x23, 75, "20_Seq_custom")
smlua_audio_utils_replace_sequence(0x21, 0x25, 75, "21_Seq_custom")
smlua_audio_utils_replace_sequence(0x23, 0x25, 75, "23_Seq_custom")
smlua_audio_utils_replace_sequence(0x24, 0x25, 75, "24_Seq_custom")
smlua_audio_utils_replace_sequence(0x26, 0x25, 75, "26_Seq_custom")
smlua_audio_utils_replace_sequence(0x27, 0x11, 75, "27_Seq_custom")
smlua_audio_utils_replace_sequence(0x28, 0x11, 75, "28_Seq_custom")
smlua_audio_utils_replace_sequence(0x29, 0x25, 75, "29_Seq_custom")
smlua_audio_utils_replace_sequence(0x2B, 0x13, 75, "2B_Seq_custom")
smlua_audio_utils_replace_sequence(0x2C, 0x25, 75, "2C_Seq_custom")
smlua_audio_utils_replace_sequence(0x2D, 0x1D, 75, "2D_Seq_custom")
smlua_audio_utils_replace_sequence(0x2E, 0x25, 75, "2E_Seq_custom")
smlua_audio_utils_replace_sequence(0x2F, 0x25, 75, "2F_Seq_custom")
smlua_audio_utils_replace_sequence(0x30, 0x25, 75, "30_Seq_custom")
smlua_audio_utils_replace_sequence(0x31, 0x25, 75, "31_Seq_custom")
smlua_audio_utils_replace_sequence(0x33, 0x25, 75, "33_Seq_custom")
smlua_audio_utils_replace_sequence(0x34, 0x25, 75, "34_Seq_custom")

vec3f_set(gLevelValues.starPositions.KoopaBobStarPos, -4275, -360, -15325)
vec3f_set(gLevelValues.starPositions.KoopaThiStarPos, -5091, -200, -15397)
vec3f_set(gLevelValues.starPositions.KingBobombStarPos, 2000.0, 4500.0, -4500.0)
vec3f_set(gLevelValues.starPositions.KingWhompStarPos, -3555.0, 0.0, 0.0)
vec3f_set(gLevelValues.starPositions.EyerockStarPos, 0.0, -900.0, -3700.0)
vec3f_set(gLevelValues.starPositions.BigBullyStarPos, -7130.0, 12643.0, 97.0)
vec3f_set(gLevelValues.starPositions.ChillBullyStarPos, 130.0, 1600.0, -4335.0)
vec3f_set(gLevelValues.starPositions.BigPiranhasStarPos, 4029.0, 2877.0, -1136.0)
vec3f_set(gLevelValues.starPositions.TuxieMotherStarPos, 3167.0, -4300.0, 5108.0)
vec3f_set(gLevelValues.starPositions.WigglerStarPos, 0.0, 2048.0, 0.0)
vec3f_set(gLevelValues.starPositions.PssSlideStarPos, -6358.0, -4300.0, 4700.0)
vec3f_set(gLevelValues.starPositions.RacingPenguinStarPos, -2442.0, 180.0, 3374.0)
vec3f_set(gLevelValues.starPositions.TreasureChestStarPos, -1800.0, -2500.0, -1700.0)
vec3f_set(gLevelValues.starPositions.GhostHuntBooStarPos, 318.0, 4650.0, -314.0)
vec3f_set(gLevelValues.starPositions.KleptoStarPos, -5550.0, 300.0, -930.0)
vec3f_set(gLevelValues.starPositions.MerryGoRoundStarPos, -1600.0, -2100.0, 205.0)
vec3f_set(gLevelValues.starPositions.MrIStarPos, 4892.0, 8550.0, -6063.0)
vec3f_set(gLevelValues.starPositions.BalconyBooStarPos, 3036.0, 7509.0, -3686.0)
vec3f_set(gLevelValues.starPositions.BigBullyTrioStarPos, -3686.0, 0.0, 0.0)

local allow_collisions = false
camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(allow_collisions)
camera_romhack_allow_centering(0)

hook_chat_command('setcamera', "Sets the camera to have collision or not",
function (msg)
    allow_collisions = not allow_collisions
    djui_chat_message_create("Camera collisons is now " .. (allow_collisions and "enabled" or "disabled"))
    return true
end)