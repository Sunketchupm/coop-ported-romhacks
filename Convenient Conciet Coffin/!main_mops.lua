
local E_MODEL_SWITCHBLOCK = smlua_model_util_get_id("Switchblock_MOP")
local E_MODEL_SWITCHBLOCK_SWITCH = smlua_model_util_get_id("Switchblock_Switch_MOP")
local E_MODEL_SPRING = smlua_model_util_get_id("Spring_MOP")

local SPRING_ACT_IDLE = 0
local SPRING_ACT_INACTIVE = 1

local SWITCHBLOCK_ACT_ACTIVE = 0
local SWITCHBLOCK_ACT_INACTIVE = 1

local play_sound = play_sound
local obj_set_model_extended = obj_set_model_extended
local obj_check_if_collided_with_object = obj_check_if_collided_with_object
local set_mario_action = set_mario_action
local load_object_collision_model = load_object_collision_model
local cur_obj_is_mario_on_platform = cur_obj_is_mario_on_platform

local string_pack = string.pack
local string_unpack = string.unpack
local repack = function (value, pack_fmt, unpack_fmt)
    return string_unpack(unpack_fmt, string_pack(pack_fmt, value))
end

local function bounce_off_object(m, obj, vel_y)
    m.pos.y = obj.oPosY + obj.hitboxHeight
    m.vel.y = vel_y

    m.flags = m.flags & ~MARIO_UNKNOWN_08

    play_sound(SOUND_ACTION_BOUNCE_OFF_OBJECT, m.marioObj.header.gfx.cameraToObject)
end

local function is_bubbled(m)
    return m.action == ACT_BUBBLED
end

local function lerp(start_point, end_point, time)
    return start_point * (1 - time) + end_point * time
end

---@param obj Object
function bhv_Spring_init(obj)
    --
end

---@param obj Object
function bhv_Spring_loop(obj)
    obj_set_model_extended(obj, E_MODEL_SPRING)

    local m = gMarioStates[0]
    if is_bubbled(m) then return end

    local Yspd = 56.0
    local y_vel = nil
    local forward_vel = nil

    if obj.oAction == SPRING_ACT_IDLE then
        if obj_check_if_collided_with_object(obj, m.marioObj) ~= 0 then
            set_mario_action(m, ACT_DOUBLE_JUMP, 0)
            -- m.actionTimer = 1000 --Really doubt this is necessary
            m.faceAngle.y = obj.oFaceAngleYaw

            y_vel = repack(Yspd, "f", "I")
            -- Calculates how fast Mario should go using oBehParams2ndByte
            forward_vel = repack(y_vel + (obj.oBehParams & 0x00FF0000), "I", "f")
            m.forwardVel = forward_vel

            -- Calculates how high Mario should go using the 1st byte
            y_vel = y_vel + (((obj.oBehParams >> 24) & 0xFF) << 16)
            bounce_off_object(m, obj, repack(y_vel, "I", "f"))

            -- Prevent interaction for some time
            obj.oAction = SPRING_ACT_INACTIVE
        end
    else
        -- Prevent interaction until half a second later
        if obj.oTimer == 15 then
            obj.oAction = SPRING_ACT_IDLE
        end
    end
end

local switchBlockState = 0

hook_event(HOOK_ON_LEVEL_INIT, function () switchBlockState = 0 end)

---@param obj Object
function bhv_Switchblock_init(obj)
    --
end

---@param obj Object
function bhv_Switchblock_loop(obj)
    obj_set_model_extended(obj, E_MODEL_SWITCHBLOCK)

    -- Determines which block color this becomes
    local params_2nd_byte = obj.oBehParams2ndByte
    obj.oAnimState = params_2nd_byte + obj.oAction -- Changes anim states

    -- Only loads collision if the corresponding switch is pressed
    -- Switchblocks have a second byte of 0 and 2, while switches have a second byte of 0 and 1
    if switchBlockState == params_2nd_byte >> 1 then
        load_object_collision_model()
        obj.oAction = SWITCHBLOCK_ACT_ACTIVE
    else
        obj.oAction = SWITCHBLOCK_ACT_INACTIVE
    end
end


---@param obj Object
function bhv_Switchblock_Switch_init(obj)
    --
end

local scalar_timer = 0
local activate_timer = false

---@param obj Object
function bhv_Switchblock_Switch_loop(obj)
    obj_set_model_extended(obj, E_MODEL_SWITCHBLOCK_SWITCH)

    local params_2nd_byte = obj.oBehParams2ndByte
    load_object_collision_model()

    obj.oAnimState = params_2nd_byte
    if cur_obj_is_mario_on_platform() == 1 then
        switchBlockState = params_2nd_byte
        activate_timer = true
    end

    local scalar = 0
    if switchBlockState ~= params_2nd_byte then
        scalar = 1
    end

    -- Uses to slowly raise and lower the switch
    if activate_timer then
        scalar_timer = scalar_timer + 1
        if scalar_timer > 100 then
            scalar_timer = 100
            activate_timer = false
        end
    else
        scalar_timer = 0
    end

    local result = scalar * 0.9 + 0.1
    local current_scale = obj.header.gfx.scale.y

    -- Make smaller if the switch is pressed
    obj.header.gfx.scale.y = lerp(current_scale, result, scalar_timer * 0.01)
end