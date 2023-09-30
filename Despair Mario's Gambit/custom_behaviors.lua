---@param obj Object
function custom_metal_box_loop(obj)
    obj.parentObj = obj_get_nearest_object_with_behavior_id(obj, id_bhvFloorSwitchGrills)
    if obj.parentObj and obj.parentObj.oAction == 2 then
        obj_mark_for_deletion(obj)
    end
end

id_bhvCustomMetalBox = hook_behavior(id_bhvPushableMetalBox, OBJ_LIST_SURFACE, false, nil, custom_metal_box_loop, "bhvCustomMetalBox")

local obj_list = get_object_list_from_behavior(get_behavior_from_id(id_bhvBowser))
local actions_table = {
    [2] = true,
    [3] = true,
    [7] = true,
    [8] = true,
    [9] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [16] = true,
    [17] = true
}

---@param obj Object
function stop_bowser(obj)
    if actions_table[obj.oAction] then
        obj.oAction = 0
    end
end

hook_behavior(id_bhvBowser, obj_list, false, nil, stop_bowser)