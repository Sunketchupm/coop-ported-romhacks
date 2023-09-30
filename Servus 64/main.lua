-- name: Servus 64
-- description: A 141 star romhack made by NBKevin98 (or Whoskeev). This romhack is heavily inspired by SM74 and SM74EE and is considered a light kaizo overall.\nPorted by Sunk
-- incompatible: romhack

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)

function delete_barrier(o)
    if gMarioStates[0].numStars >= 140 then
        obj_mark_for_deletion(o)
    end
end