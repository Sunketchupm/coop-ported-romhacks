local E_MODEL_NOTEBLOCK = smlua_model_util_get_id("Noteblock_MOP")
local E_MODEL_SWITCHBLOCK = smlua_model_util_get_id("Switchblock_MOP")
local E_MODEL_SWITCHBLOCK_SWITCH = smlua_model_util_get_id("Switchblock_Switch_MOP")
local E_MODEL_CHECKPOINT = smlua_model_util_get_id("Checkpoint_Flag_MOP")

local NOTEBLOCK_ACT_IDLE = 0
local NOTEBLOCK_ACT_BOUNCING = 1

local SWITCHBLOCK_ACT_ACTIVE = 0
local SWITCHBLOCK_ACT_INACTIVE = 1

local play_sound = play_sound
local spawn_non_sync_object = spawn_non_sync_object
local obj_set_model_extended = obj_set_model_extended
local set_mario_action = set_mario_action
local load_object_collision_model = load_object_collision_model
local cur_obj_is_mario_on_platform = cur_obj_is_mario_on_platform
local spawn_mist_particles = spawn_mist_particles
local obj_scale = obj_scale
local count_objects_with_behavior = count_objects_with_behavior

-- Packing and unpacking like this allows for C-like type conversions
local string_pack = string.pack
local string_unpack = string.unpack
---@param value number
---@param pack_fmt string
---@param unpack_fmt string
local repack = function (value, pack_fmt, unpack_fmt)
    return string_unpack(unpack_fmt, string_pack(pack_fmt, value))
end

---@param m MarioState
---@return boolean
local function is_bubbled(m)
    return m.action == ACT_BUBBLED
end

---@return boolean
local function is_current_area_sync_valid()
    local np = gNetworkPlayers
    for i = 0, MAX_PLAYERS - 1, 1 do
        if np[i] and np[i].connected and (not np[i].currLevelSyncValid or not np[i].currAreaSyncValid) then
            return false
        end
    end
    return true
end

---@param start_point number
---@param end_point number
---@param time number
---@return number
local function lerp(start_point, end_point, time)
    return start_point * (1 - time) + end_point * time
end

---@param obj Object
function bhv_noteblock_loop(obj)
    obj_set_model_extended(obj, E_MODEL_NOTEBLOCK)

    load_object_collision_model()

    local m = gMarioStates[0]
    local y_spd = 64

    if cur_obj_is_mario_on_platform() == 1 and not is_bubbled(m) then
        --this is awful -- It really is -Sunk
        -- Jump. If A is pressed during the jump, increase y_spd.
        if m.controller.buttonPressed & A_BUTTON ~= 0 then
            y_spd = y_spd + 12 -- I feel like this should increase with oBehParams2ndByte
            spawn_mist_particles()
        end
        set_mario_action(m, ACT_DOUBLE_JUMP, 0)

        -- Calculates y speed
        local intermediate_y_spd = repack(y_spd, "f", "I")
		intermediate_y_spd = intermediate_y_spd + (obj.oBehParams2ndByte << 16)
		y_spd = repack(intermediate_y_spd, "I", "f")
		m.vel.y = y_spd

        obj.oAction = NOTEBLOCK_ACT_BOUNCING
    end

    if obj.oAction == NOTEBLOCK_ACT_BOUNCING then
        if obj.oTimer == 4 then
            obj.oAction = NOTEBLOCK_ACT_IDLE
            obj.oPosY = obj.oHomeY
        else
            -- Moves the noteblock slightly up and down, to give it a "bounce"
            if obj.oTimer > 2 then
                obj.oPosY = obj.oHomeY + (obj.oTimer % 3) * 6
            else
                obj.oPosY = obj.oHomeY - obj.oTimer * 6
            end
        end
    end
end

---@type Pointer_BehaviorScript
local checkpoint_flag_bhv = nil
---@type Object
local last_touched_checkpoint = nil
local stored_2nd_byte = 0

---@param obj Object
function bhv_checkpoint_flag_init(obj)
    checkpoint_flag_bhv = obj.behavior
    obj_set_model_extended(obj, E_MODEL_CHECKPOINT)
    load_object_collision_model()
end

---@param obj Object
function bhv_checkpoint_flag_loop(obj)
    ---@type MarioState
    local m = gMarioStates[0]
    if is_bubbled(m) then return end

    if lateral_dist_between_objects(obj, m.marioObj) < 100 and obj ~= last_touched_checkpoint then
        -- Notes down this particular object and its 2nd byte
        last_touched_checkpoint = obj
        stored_2nd_byte = obj.oBehParams2ndByte

        local ltc = last_touched_checkpoint
        play_sound(SOUND_MENU_CHANGE_SELECT + (1 << 16), {x = ltc.oPosX, y = ltc.oPosY, z = ltc.oPosZ})
        spawn_non_sync_object(id_bhvSparkle, E_MODEL_SPARKLES, ltc.oPosX, ltc.oPosY, ltc.oPosZ,
        ---@param o Object
        function (o)
            obj_scale(o, 5)
        end)
    end
end

hook_event(HOOK_ON_SYNC_VALID,
function ()
    if not last_touched_checkpoint then return end

    if count_objects_with_behavior(checkpoint_flag_bhv) > 0 then
        local ltc = last_touched_checkpoint
        local m = gMarioStates[0]
        -- Warps to the particular object noted down if it shares the same 2nd byte
        if ltc.behavior == checkpoint_flag_bhv and ltc.oBehParams2ndByte == stored_2nd_byte then
            vec3f_set(m.pos, ltc.oPosX, ltc.oPosY, ltc.oPosZ)
        end
    end
end)

local switch_block_state = 0

---@param obj Object
function bhv_Switchblock_loop(obj)
    obj_set_model_extended(obj, E_MODEL_SWITCHBLOCK)

    -- Determines which block color this becomes
    obj.oAnimState = obj.oBehParams2ndByte + obj.oAction

    -- Only loads collision if the corresponding switch is pressed
    if switch_block_state == obj.oBehParams2ndByte >> 1 then
        load_object_collision_model()
        obj.oAction = SWITCHBLOCK_ACT_ACTIVE
    else
        obj.oAction = SWITCHBLOCK_ACT_INACTIVE
    end
end

local scalar_timer = 0

---@param obj Object
function bhv_Switchblock_Switch_loop(obj)
    obj_set_model_extended(obj, E_MODEL_SWITCHBLOCK_SWITCH)
    load_object_collision_model()

    obj.oAnimState = obj.oBehParams2ndByte
    local old_state = switch_block_state
    if cur_obj_is_mario_on_platform() == 1 and not is_bubbled(gMarioStates[0]) then
        switch_block_state = obj.oBehParams2ndByte
    end

    local scalar = 0
    if switch_block_state ~= obj.oBehParams2ndByte then
        scalar = 1
    end

    -- Whenever the switch block state changes
    if old_state ~= switch_block_state then
        scalar_timer = 0
        local np = gNetworkPlayers
        for i = 1, MAX_PLAYERS - 1, 1 do
            if is_current_area_sync_valid() and np[0].currLevelNum == np[i].currLevelNum then
                network_send_to(i, true, { timer = 0, state = switch_block_state })
            end
        end
    end

    -- Slowly raise and lower the switch
    if scalar_timer < 100 then
        scalar_timer = scalar_timer + 1
    end

    local result = scalar * 0.9 + 0.1
    local current_scale = obj.header.gfx.scale.y

    -- Make smaller if the switch is pressed
    obj.header.gfx.scale.y = lerp(current_scale, result, scalar_timer * 0.01)
end

hook_event(HOOK_ON_PACKET_RECEIVE,
function (datatable)
    scalar_timer = datatable.timer
    switch_block_state = datatable.state
end)

hook_event(HOOK_ON_LEVEL_INIT,
function ()
    switch_block_state = 0
end)

-- Not a mop but a custom behavior

define_custom_obj_fields({
    oStarSpawned = 'u32'
})

---@param obj Object
function Func_Custom_0x804060c8(obj)
    if not obj_get_nearest_object_with_behavior_id(obj, id_bhvSmallBully) and obj.oStarSpawned == 0 then
        spawn_non_sync_object(
            id_bhvSpawnedStar,
            E_MODEL_STAR,
            obj.oPosX, obj.oPosY, obj.oPosZ,
            nil
        )
        obj.oStarSpawned = 1
    end
end