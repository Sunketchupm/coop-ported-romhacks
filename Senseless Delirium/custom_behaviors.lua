local E_MODEL_DL_07001570 = smlua_model_util_get_id("custom_DL_07001570")

---@param obj Object
local function bhv_Custom_0x130056bc_init(obj)
    obj.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj.oAngleVelYaw = 65280
    obj.collisionData = gGlobalObjectCollisionData.wdw_seg7_collision_square_floating_platform
    obj.oCollisionDistance = 20000
    obj.oDrawingDistance = 20000
end

---@param obj Object
local function bhv_Custom_0x130056bc_loop(obj)
    obj_set_model_extended(obj, E_MODEL_DL_07001570)
    obj.oFaceAngleYaw = obj.oFaceAngleYaw + 65280
    load_object_collision_model()
end

hook_behavior(nil, OBJ_LIST_SURFACE, false, bhv_Custom_0x130056bc_init, bhv_Custom_0x130056bc_loop, "Bhv_Custom_0x130056bc")