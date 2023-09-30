-- name: Senseless Delirium
-- description: Romhack created by Redmat, with 80 stars to collect.\nPorted by Sunk.
-- incompatible: romhack

gLevelValues.fixCollisionBugs = true
gLevelValues.fixCollisionBugsRoundedCorners = false
gLevelValues.fixCollisionBugsFalseLedgeGrab = false
gLevelValues.fixCollisionBugsGroundPoundBonks = false
gLevelValues.fixCollisionBugsPickBestWall = false

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)

--------------------------------
------- Helper functions -------
--------------------------------

---@param bhvId table
---@return table
local function obj_get_all_from_behavior_id(bhvId)
    local found_objects = {}
    local obj = obj_get_first_with_behavior_id(bhvId)
    while obj do
        table.insert(found_objects, obj)
        obj = obj_get_next_with_same_behavior_id(obj)
    end
    return found_objects
end

---------------------------
------- Cap factory -------
---------------------------

-- Necessary so players can collect multiple caps at once in order to perform hat-in-hand

gBehaviorValues.MultipleCapCollection = true

-- Abuses the fact that the only level that requires hat factory doesn't have
-- any other warp than the teleporter

local function warp()
    if gNetworkPlayers[0].currLevelNum ~= LEVEL_CCM then return end
    local obj_table = obj_get_all_from_behavior_id(id_bhvNormalCap)
    ---@param obj Object
    for _, obj in ipairs(obj_table) do
        spawn_non_sync_object(
            id_bhvNormalCap,
            E_MODEL_MARIOS_CAP,
            obj.oPosX, obj.oPosY, obj.oPosZ,
            ---@param o Object
            function (o)
                obj_set_pos(o, obj.oPosX, obj.oPosY, obj.oPosZ)
            end
        )
    end
end

hook_event(HOOK_ON_WARP, warp)

-----------------------------------
------- Chuckya double jump -------
-----------------------------------
-- ! Very much prone to breaking in multiplayer

local chuckya_grabbed_mario = nil

---@param m MarioState
local function mario_update(m)
    if m.playerIndex ~= 0 then return end
    if gNetworkPlayers[0].currLevelNum ~= LEVEL_HMC then return end

    -- All chuckyas will become affected by local draw distance
    local obj_table = obj_get_all_from_behavior_id(id_bhvChuckya)
    ---@param obj Object
    for _, obj in ipairs(obj_table) do
        local dist = dist_between_objects(m.marioObj, obj)
        if dist > 4000 then -- 4000 is the chuckya's draw distance
            obj.activeFlags = obj.activeFlags | ACTIVE_FLAG_DORMANT
        else
            obj.activeFlags = obj.activeFlags & ~ACTIVE_FLAG_DORMANT
        end
    end

    m.marioObj.header.gfx.node.flags = m.marioObj.header.gfx.node.flags & ~GRAPH_RENDER_INVISIBLE
    if chuckya_grabbed_mario then
        m.marioObj.header.gfx.node.flags = m.marioObj.header.gfx.node.flags | GRAPH_RENDER_INVISIBLE
        if chuckya_grabbed_mario.oAction == 3 and chuckya_grabbed_mario.oTimer == 0 then
            m.vel.y = 40
            chuckya_grabbed_mario = nil
        end
    end
end

---@param m MarioState
local function on_set_mario_action_2(m)
    if m.playerIndex ~= 0 then return end
    if gNetworkPlayers[0].currLevelNum ~= LEVEL_HMC then return end

    if m.action == ACT_GRABBED and m.prevAction & ACT_GROUP_MASK == ACT_GROUP_SUBMERGED then
        chuckya_grabbed_mario = obj_get_nearest_object_with_behavior_id(m.marioObj, id_bhvChuckya)
    end

    if chuckya_grabbed_mario and m.action == ACT_THROWN_FORWARD then
        vec3f_set(m.pos, chuckya_grabbed_mario.oPosX, chuckya_grabbed_mario.oPosY, chuckya_grabbed_mario.oPosZ)
        chuckya_grabbed_mario = nil
    end
end

hook_event(HOOK_MARIO_UPDATE, mario_update)
hook_event(HOOK_ON_SET_MARIO_ACTION, on_set_mario_action_2)
hook_event(HOOK_ON_WARP, function () chuckya_grabbed_mario = nil end)