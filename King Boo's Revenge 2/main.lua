-- name: King Boo's Revenge 2
-- description: Difficult 182 star hack.\nMade by Sizzlingmario4 and Thebloody7.\nPorted by Sunk. Custom exclamation box behavior port by Agent X.
-- incompatible: romhack
-------------------------
-----Warp exit nodes-----
-------------------------

gLevelValues.exitCastleLevel = LEVEL_CASTLE_GROUNDS
gLevelValues.exitCastleArea = 1
gLevelValues.exitCastleWarpNode = 0x0A
gLevelValues.skipCreditsAt = LEVEL_CASTLE_GROUNDS

---------------------------
------Everything else------
---------------------------

gServerSettings.skipIntro = true

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)