-- name: Waifu Cauldron
-- description: 119 star hack created by Morningstorm SM64.\nPorted by Sunk.
-- incompatible: romhack

-- This hack inherently has infinite lives
hook_event(HOOK_MARIO_UPDATE, function(m) m.numLives = 100 end)

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)

local fix_levels = {
    [LEVEL_WF] = true,
    [LEVEL_LLL] = true,
    [LEVEL_WDW] = true,
}

function fix_broken_floors()
    ---@type NetworkPlayer
    local np = gNetworkPlayers[0]
    ---@type MarioState
    local m = gMarioStates[0]
    gLevelValues.fixCollisionBugs = false

    if fix_levels[np.currLevelNum] then
        gLevelValues.fixCollisionBugs = true
        gLevelValues.fixCollisionBugsRoundedCorners = false
        gLevelValues.fixCollisionBugsFalseLedgeGrab = false
        gLevelValues.fixCollisionBugsGroundPoundBonks = false
        gLevelValues.fixCollisionBugsPickBestWall = false
    end
    if np.currLevelNum == LEVEL_TTM and m.pos.x > 16296 and m.pos.y < 6250 then
        gLevelValues.fixCollisionBugs = true
        gLevelValues.fixCollisionBugsRoundedCorners = false
        gLevelValues.fixCollisionBugsFalseLedgeGrab = false
        gLevelValues.fixCollisionBugsGroundPoundBonks = false
        gLevelValues.fixCollisionBugsPickBestWall = false
    end
end

hook_event(HOOK_UPDATE, fix_broken_floors)

-- This romhack uses the dive wallkick patch. Here's the patch recreated

---@param m MarioState
function on_set_mario_action(m)
    if m.playerIndex ~= 0 then return end

    if (m.action == ACT_BACKWARD_AIR_KB or m.action == ACT_SOFT_BONK) and m.prevAction ~= ACT_LEDGE_GRAB then
        m.prevAction = ACT_AIR_HIT_WALL
        m.wallKickTimer = 5
    end
end

hook_event(HOOK_ON_SET_MARIO_ACTION, on_set_mario_action)

hook_event(HOOK_GET_STAR_COLLECTION_DIALOG, function () return 0 end)