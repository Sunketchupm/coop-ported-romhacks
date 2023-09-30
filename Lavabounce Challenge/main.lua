-- name: Lavabounce Challenge
-- description: A romhack made by Redmat that tests your lavabounce skills.\nPorted by Sunk.
-- incompatible: romhack

hook_event(HOOK_MARIO_UPDATE, function () stop_cap_music() end)

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)