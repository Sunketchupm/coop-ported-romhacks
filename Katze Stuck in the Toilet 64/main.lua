-- name: Katze Stuck in the Toilet 64
-- description: 
-- incompatible: romhack

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)

local function level_init()
    if gNetworkPlayers[0].currLevelNum == LEVEL_WF then
        local obj = obj_get_first_with_behavior_id(id_bhvWarp)
        while obj do
            obj.oIntangibleTimer = 30
            obj = obj_get_next_with_same_behavior_id(obj)
        end
    end
end

hook_event(HOOK_ON_WARP, level_init)