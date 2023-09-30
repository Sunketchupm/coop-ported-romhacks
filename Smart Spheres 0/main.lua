-- name: Smart Spheres 0
-- description: Retexture of the 182 star romhack Stupid Ballz 2. Difficult kaizo hack.\nHack originally by Morningstorm SM64. Retexture by Dolphino and ShiN3.\nPorted by Sunk.
-- incompatible: romhack

gLevelValues.entryLevel = LEVEL_CASTLE_GROUNDS
gLevelValues.fixCollisionBugs = true
gLevelValues.fixCollisionBugsRoundedCorners = false
gLevelValues.fixCollisionBugsFalseLedgeGrab = false
gLevelValues.fixCollisionBugsGroundPoundBonks = false
gLevelValues.fixCollisionBugsPickBestWall = false

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)

--[[
    Courses 5, 6, 12, 15, and Bowser 3 have an A and B side to them.
    The following code indicates which side someone is on.
    Course 8 has an unused B side, which isn't shown here
]]

local valid_levels = {
    [LEVEL_BBH] = true,
    [LEVEL_HMC] = true,
    [LEVEL_TTM] = true,
    [LEVEL_BITS] = true,
    [LEVEL_RR] = false
}

local function set_description(np, msg)
    network_player_set_description(np, msg, 255, 255, 255, 255)
end

function update()
    ---@type NetworkPlayer
    local np = gNetworkPlayers

    for i = 0, MAX_PLAYERS - 1, 1 do
        local current_level = np[i].currLevelNum
        if valid_levels[current_level] ~= nil then
            local area = np[i].currAreaIndex
            set_description(np[i], "A Side")

            -- Should handle the B side of most courses
            if area == 2 and valid_levels[current_level] then
                set_description(np[i], "B Side")
            -- Should handle the B side of course 15
            elseif area == 1 and not valid_levels[current_level] then
                set_description(np[i], "B Side")
            -- Should handle the other areas of course 15
            elseif area == 2 or area == 3 then
                set_description(np[i], "")
            end
        else
            set_description(np[i], "")
        end
    end
end

hook_event(HOOK_UPDATE, update)

-- No idea if this hack actually has 45 degree wallkicks but I'll deal with that later


local actions_46_degree_wallkicks =
{
    [ACT_JUMP] = true,
    [ACT_HOLD_JUMP] = true,
    [ACT_DOUBLE_JUMP] = true,
    [ACT_TRIPLE_JUMP] = true,
    [ACT_SIDE_FLIP] = true,
    [ACT_BACKFLIP] = true,
    [ACT_LONG_JUMP] = true,
    [ACT_WALL_KICK_AIR] = true,
    [ACT_TOP_OF_POLE_JUMP] = true,
    [ACT_FREEFALL] = true,
}

---@param num number
---@return number
local function convert_s16(num)
    num = num & 0xFFFF
    return ((num >= 0x7FFF) and (num - 0x10000) or num)
end

local function degrees_to_angle_units(x)
    return (x * 0x10000) / 360
end

---@param m MarioState
function wallkicks(m)
    if m.playerIndex ~= 0 then return end
    local wall = m.wall

    if wall ~= nil then
        if wall.type == SURFACE_BURNING then return end

        local wallDYaw = (atan2s(wall.normal.z, wall.normal.x) - (m.faceAngle.y))
        local limit = degrees_to_angle_units(134)
        wallDYaw = convert_s16(wallDYaw)

        --Standard air hit wall requirements
        if m.forwardVel >= 16 and actions_46_degree_wallkicks[m.action] then
            if wallDYaw >= limit or wallDYaw <= -limit then
                mario_bonk_reflection(m, 0)
                m.faceAngle.y = m.faceAngle.y + 0x8000
                m.wallKickTimer = 5
                set_mario_action(m, ACT_AIR_HIT_WALL, 0)
            end
        end
    end
end

hook_event(HOOK_BEFORE_MARIO_UPDATE, wallkicks)

-- Some courses spawn Mario onto a box, which he will fall through if the area isn't synced
-- So just teleport him back to the warp if it is

local courses_spawn_on_box = {
    [LEVEL_BBH] = true,
    [LEVEL_WDW] = true,
    [LEVEL_BITFS] = true,
    [LEVEL_BITS] = true
}

function sync_valid()
    local m = gMarioStates[0]
    local np = gNetworkPlayers[0]
    local is_not_alone = network_player_connected_count() > 1

    if is_not_alone and courses_spawn_on_box[np.currLevelNum] then
        local obj = obj_get_nearest_object_with_behavior_id(m.marioObj, id_bhvSpinAirborneWarp)
        vec3f_set(m.pos, obj.oPosX, obj.oPosY, obj.oPosZ)
    end
end

hook_event(HOOK_ON_SYNC_VALID, sync_valid)