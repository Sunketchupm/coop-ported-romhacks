-- name: Deadly Gas Mines
-- description: A buff of Mineral Disaster, from King Boo's Revenge 2.\nBuff created by Morningstorm SM64. King Boo's Revenge 2 created by Thebloody7 and Sizzlingmario4.\nPorted by Sunk
-- incompatible: romhack

smlua_text_utils_course_acts_replace(COURSE_CCM, (" 4 DEADLY GAS MINES"),	("A MONTH IN THE TOXIC MINES"),	(""),	(""),	(""),	(""),	(""))

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)