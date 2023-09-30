local E_MODEL_FLIPSWITCH_PANEL = smlua_model_util_get_id("Flipswitch_Panel_MOP")
local E_MODEL_FLIPSWAP_PLATFORM = smlua_model_util_get_id("Flipswap_Platform_MOP")
local E_MODEL_FLIPSWAP_PLATFORM_BORDER = smlua_model_util_get_id("Flipswap_Platform_Border_MOP")
local E_MODEL_FLIPBLOCK = smlua_model_util_get_id("FlipBlock_MOP")
local E_MODEL_NOTEBLOCK = smlua_model_util_get_id("Noteblock_MOP")
local E_MODEL_SWITCHBLOCK = smlua_model_util_get_id("Switchblock_MOP")
local E_MODEL_SWITCHBLOCK_SWITCH = smlua_model_util_get_id("Switchblock_Switch_MOP")

local FLIP_BLOCK_ACT_INACTIVE = 0
local FLIP_BLOCK_ACT_IDLE = 1
local FLIP_BLOCK_ACT_FLIPPING = 2

local NOTEBLOCK_ACT_IDLE = 0
local NOTEBLOCK_ACT_BOUNCE = 1

local FLIPSWAP_PLATFORM_ACT_IDLE = 0
local FLIPSWAP_PLATFORM_ACT_FLIPPING = 1

local FLIPSWITCH_PANEL_ACT_IDLE = 0
local FLIPSWITCH_PANEL_ACT_ACTIVE = 1

local SWITCHBLOCK_ACT_ACTIVE = 0
local SWITCHBLOCK_ACT_INACTIVE = 1

local id_bhvFlipswap_Platform_Border_MOP = id_bhvUnused05A8

local spawn_non_sync_object = spawn_non_sync_object
local obj_set_model_extended = obj_set_model_extended
local network_init_object = network_init_object
local network_send_object = network_send_object
local set_mario_action = set_mario_action
local cur_obj_was_attacked_or_ground_pounded = cur_obj_was_attacked_or_ground_pounded
local load_object_collision_model = load_object_collision_model
local cur_obj_is_mario_on_platform = cur_obj_is_mario_on_platform
local spawn_mist_particles = spawn_mist_particles
local cur_obj_play_sound_1 = cur_obj_play_sound_1
local nearest_player_to_object = nearest_player_to_object
local spawn_red_coin_cutscene_star = spawn_red_coin_cutscene_star
local cur_obj_scale = cur_obj_scale
local count_objects_with_behavior = count_objects_with_behavior
local cur_obj_nearest_object_with_behavior = cur_obj_nearest_object_with_behavior

local string_pack = string.pack
local string_unpack = string.unpack
---@param value number
---@param pack_fmt string
---@param unpack_fmt string
local repack = function (value, pack_fmt, unpack_fmt)
    return string_unpack(unpack_fmt, string_pack(pack_fmt, value))
end

local function switch(param, case_table)
    local case = case_table[param]
    if case then return case() end
    local def = case_table['default']
    return def and def() or nil
end

local function is_bubbled(m)
    if m.action == ACT_BUBBLED then
        return true
    end
    return false
end

local function is_current_area_sync_valid()
    local np
    for i = 0, MAX_PLAYERS - 1, 1 do
        np = gNetworkPlayers[i]
        if np ~= nil and np.connected and (not np.currLevelSyncValid or not np.currAreaSyncValid) then
            return false
        end
    end
    return true
end

local function lerp(start_point, end_point, time)
    return start_point * (1 - time) + end_point * time
end

local function obj_set_hitbox(obj, hitbox)
    if not obj or not hitbox then return end
    if (obj.oFlags & OBJ_FLAG_30) == 0 then
        obj.oFlags = obj.oFlags | OBJ_FLAG_30

        obj.oInteractType = hitbox.interactType
        obj.oDamageOrCoinValue = hitbox.damageOrCoinValue
        obj.oHealth = hitbox.health
        obj.oNumLootCoins = hitbox.numLootCoins

        cur_obj_become_tangible()
    end

    obj.hitboxRadius = obj.header.gfx.scale.x * hitbox.radius
    obj.hitboxHeight = obj.header.gfx.scale.y * hitbox.height
    obj.hurtboxRadius = obj.header.gfx.scale.x * hitbox.hurtboxRadius
    obj.hurtboxHeight = obj.header.gfx.scale.y * hitbox.hurtboxHeight
    obj.hitboxDownOffset = obj.header.gfx.scale.y * hitbox.downOffset
end

local FLIP_TIMER = 210

local sFlipBlockHitbox = {
    interactType = INTERACT_BREAKABLE,
    downOffset = 0,
    damageOrCoinValue = 0,
    health = 0,
    numLootCoins = 0,
    radius = 64,
    height = 64,
    hurtboxHeight = 0,
    hurtboxRadius = 0
}

function bhv_flip_block_init()
    -- do nothing
end

---@param obj Object
function bhv_flip_block_loop(obj)
    obj_set_model_extended(obj, E_MODEL_FLIPBLOCK)
    obj.oInteractStatus = 0

    if obj.oTimer == 0 and obj.oAction == FLIP_BLOCK_ACT_INACTIVE then
        obj_set_hitbox(obj, sFlipBlockHitbox)
        obj.oAction = FLIP_BLOCK_ACT_IDLE
    end
    if obj.oAction == FLIP_BLOCK_ACT_FLIPPING then
        obj.header.gfx.scale.y = 0.1
        if obj.oTimer == FLIP_TIMER then
            obj.oAction = FLIP_BLOCK_ACT_IDLE
            obj.oSubAction = 0
            -- Reset size
            obj.header.gfx.scale.y = 1
        end

        obj.oFaceAnglePitch = obj.oFaceAnglePitch + (FLIP_TIMER - obj.oTimer) * 16
        if ((obj.oFaceAnglePitch / 0x8000) - obj.oSubAction) > 0 then
            cur_obj_play_sound_1(SOUND_GENERAL_SWISH_WATER)
            obj.oSubAction = obj.oSubAction + 1
        end
    else
        ---@type MarioState
        local m = gMarioStates[0]
        if cur_obj_was_attacked_or_ground_pounded() ~= 0
        or (m.flags & MARIO_METAL_CAP ~= 0 and is_point_within_radius_of_mario(obj.oPosX, obj.oPosY, obj.oPosZ, 300) == 1) then
            obj.oAction = FLIP_BLOCK_ACT_FLIPPING
            obj.oIntangibleTimer = FLIP_TIMER

            cur_obj_play_sound_1(SOUND_GENERAL_SWISH_WATER)
        else
            obj.oFaceAnglePitch = 0
            obj.header.gfx.scale.y = 1

            load_object_collision_model()
        end
    end
end

---@param obj Object
function bhv_noteblock_init(obj)
    cur_obj_scale(0.64)
end

---@param obj Object
function bhv_noteblock_loop(obj)
    obj_set_model_extended(obj, E_MODEL_NOTEBLOCK)

    load_object_collision_model()

    local m = gMarioStates[0]
    local y_spd = 64

    if cur_obj_is_mario_on_platform() == 1 and not is_bubbled(m) then
        if m.controller.buttonPressed & A_BUTTON ~= 0 then
            y_spd = y_spd + 12
            spawn_mist_particles()
        end
        set_mario_action(m, ACT_DOUBLE_JUMP, 0)

        calc_speed = repack(y_spd, "f", "I")
		calc_speed = calc_speed + (obj.oBehParams2ndByte << 16)
		y_spd = repack(calc_speed, "I", "f")
		m.vel.y = y_spd

        obj.oAction = NOTEBLOCK_ACT_BOUNCE
    end

    if obj.oAction == NOTEBLOCK_ACT_BOUNCE then
        if obj.oTimer == 4 then
            obj.oAction = NOTEBLOCK_ACT_IDLE
            obj.oPosY = obj.oHomeY
        else
            if obj.oTimer > 2 then
                obj.oPosY = obj.oHomeY + (obj.oTimer % 3) * 6
            else
                obj.oPosY = obj.oHomeY - obj.oTimer * 6
            end
        end
    end
end

local FLIP_SPEED_MULTIPLIER = 0.5

---@param obj Object
function bhv_flipswap_init(obj)
    local childObj = spawn_non_sync_object(id_bhvFlipswap_Platform_Border_MOP, E_MODEL_FLIPSWAP_PLATFORM_BORDER, obj.oPosX, obj.oPosY, obj.oPosZ,
    ---@param o Object
    function (o)
        o.oFaceAngleYaw = obj.oFaceAngleYaw
        o.oFaceAnglePitch = obj.oFaceAnglePitch
        o.oFaceAngleRoll = obj.oFaceAngleRoll
        o.oMoveAngleYaw = obj.oMoveAngleYaw
        o.oMoveAnglePitch = obj.oMoveAnglePitch
        o.oMoveAngleRoll = obj.oMoveAngleRoll
    end)
    childObj.parentObj = obj
end

---@param obj Object
function bhv_flipswap_loop(obj)
    obj_set_model_extended(obj, E_MODEL_FLIPSWAP_PLATFORM)
    load_object_collision_model()

    local m = gMarioStates[0]

    switch(obj.oAction, {
        [FLIPSWAP_PLATFORM_ACT_IDLE] = function ()
            if m.prevAction & ACT_GROUP_MASK ~= ACT_GROUP_AIRBORNE and m.action & ACT_GROUP_MASK == ACT_GROUP_AIRBORNE then
                if obj.oFaceAngleRoll == 0 then
                    obj.oMoveAngleRoll = -2048 * FLIP_SPEED_MULTIPLIER
                else
                    obj.oMoveAngleRoll = 2048 * FLIP_SPEED_MULTIPLIER
                end
                obj.oAction = FLIPSWAP_PLATFORM_ACT_FLIPPING
            end
        end,
        [FLIPSWAP_PLATFORM_ACT_FLIPPING] = function ()
            if obj.oTimer < 16 * FLIP_SPEED_MULTIPLIER ^ -1 then
                obj.oFaceAngleRoll = obj.oFaceAngleRoll + obj.oMoveAngleRoll
            elseif m.action & ACT_GROUP_MASK ~= ACT_GROUP_AIRBORNE then
                obj.oAction = FLIPSWAP_PLATFORM_ACT_IDLE
            end
        end
    })
end

local StarSpawned = false
---@type Pointer_BehaviorScript
local flipswitch_panel_bhv = nil
---@type Pointer_BehaviorScript
local flipswitch_panel_starspawn_bhv = nil

hook_event(HOOK_ON_LEVEL_INIT, function ()
    if not flipswitch_panel_starspawn_bhv then return end
    if count_objects_with_behavior(flipswitch_panel_starspawn_bhv) == 0 then
        StarSpawned = false
    end
end)

---@param obj Object
function bhv_flipswitch_panel_init(obj)
    flipswitch_panel_bhv = obj.behavior
    network_init_object(obj, false, {
        "oAction",
        "oAnimState"
    })
end

---@param obj Object
function bhv_flipswitch_panel_loop(obj)
    if not flipswitch_panel_bhv or not flipswitch_panel_starspawn_bhv then
        flipswitch_panel_bhv = obj.behavior
        return
    end
    obj_set_model_extended(obj, E_MODEL_FLIPSWITCH_PANEL)

    load_object_collision_model()

    local starspawn_obj = cur_obj_nearest_object_with_behavior(flipswitch_panel_starspawn_bhv)
    if obj.parentObj ~= starspawn_obj then
        obj.parentObj = starspawn_obj
        if not obj.parentObj then
           return
        end
    end

    if StarSpawned then
        obj.oAnimState = 2
    else
        switch(obj.oAction, {
            [FLIPSWITCH_PANEL_ACT_IDLE] = function()
                if cur_obj_is_mario_on_platform() == 1 and not is_bubbled(gMarioStates[0]) then
                    obj.parentObj.oHiddenStarTriggerCounter = obj.parentObj.oHiddenStarTriggerCounter + 1 - (2 * obj.oAnimState)
                    obj.oAnimState = obj.oAnimState ~ 1

                    cur_obj_play_sound_1(SOUND_GENERAL_BIG_CLOCK)
                    obj.oAction = FLIPSWITCH_PANEL_ACT_ACTIVE
                    if is_current_area_sync_valid() then
                        network_send_object(obj, false)
                    end
                end
            end,
            [FLIPSWITCH_PANEL_ACT_ACTIVE] = function()
                local closest_player = nearest_player_to_object(obj)
                if cur_obj_is_mario_on_platform() == 0 and closest_player and closest_player.platform ~= obj then
                    obj.oAction = FLIPSWITCH_PANEL_ACT_IDLE
                end
            end
        })
    end
end

---@param obj Object
function bhv_flipswitch_panel_starspawn_init(obj)
    obj.oHealth = 0
    flipswitch_panel_starspawn_bhv = obj.behavior

    network_init_object(obj, false, {
        "oHiddenStarTriggerCounter"
    })
end

---@param obj Object
function bhv_flipswitch_panel_starspawn_loop(obj)
    if not flipswitch_panel_bhv or not flipswitch_panel_starspawn_bhv then
        flipswitch_panel_starspawn_bhv = obj.behavior
        return
    end

    local amount_of_panels = count_objects_with_behavior(flipswitch_panel_bhv)
    if amount_of_panels > obj.oHealth or obj.oHealth == 0 then
        obj.oHealth = amount_of_panels
        return
    end

    if obj.oHealth == obj.oHiddenStarTriggerCounter and not StarSpawned then
        spawn_red_coin_cutscene_star(obj.oPosX, obj.oPosY, obj.oPosZ)
        StarSpawned = true
        obj.activeFlags = obj.activeFlags | ACTIVE_FLAG_DEACTIVATED
    end

    if is_current_area_sync_valid() then
        network_send_object(obj, false)
    end
end

gGlobalSyncTable.switchBlockState = 0

---@param obj Object
function bhv_Switchblock_loop(obj)
    obj_set_model_extended(obj, E_MODEL_SWITCHBLOCK)

    local params_2nd_byte = obj.oBehParams2ndByte
    obj.oAnimState = params_2nd_byte + obj.oAction 

    if gGlobalSyncTable.switchBlockState == params_2nd_byte >> 1 then
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

    local params_2nd_byte = obj.oBehParams2ndByte
    load_object_collision_model()

    obj.oAnimState = params_2nd_byte
    if cur_obj_is_mario_on_platform() == 1 then
        gGlobalSyncTable.switchBlockState = params_2nd_byte
    end

    local scalar = 0
    if gGlobalSyncTable.switchBlockState ~= params_2nd_byte then
        scalar = 1
    end

    scalar_timer = scalar_timer + 1
    if scalar_timer > 100 then
        scalar_timer = 100
    end

    local result = scalar * 0.9 + 0.1
    local current_scale = obj.header.gfx.scale.y

    obj.header.gfx.scale.y = lerp(current_scale, result, scalar_timer * 0.01)
end

hook_on_sync_table_change(gGlobalSyncTable, "switchBlockState", "tag",
function (tag, oldVal, newVal)
    scalar_timer = 0
end)