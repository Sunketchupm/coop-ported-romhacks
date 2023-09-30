-- name: Despair Mario's Gambit
-- description: A romhack made by GMD. There are 120 stars to collect in this romhack.\nPorted by Sunk.
-- incompatible: romhack

--Exit nodes----------------------------------------------------------

gLevelValues.exitCastleLevel = LEVEL_CASTLE_GROUNDS
gLevelValues.exitCastleArea = 1
gLevelValues.exitCastleWarpNode = 0x0A
gLevelValues.skipCreditsAt = LEVEL_CASTLE_GROUNDS

--Preview blue coins-------------------------------------------------

gLevelValues.previewBlueCoins = true

--Everything else---------------------------------------------------

gServerSettings.skipIntro = true

function mario_update(m)
    if m.playerIndex ~= 0 then return end

    -- Forces Mario's movement to be 2D in course 15
    if gNetworkPlayers[0].currLevelNum == LEVEL_RR then
        m.pos.z = 261
    end

    -- The bowser fight entry cutscene is disabled
    -- Bowser 1 only, since disabling the cutscene in bowser 2 prevents the textbox from spawning
    ---@type NetworkPlayer
    local np = gNetworkPlayers[0]
    if np.currLevelNum == LEVEL_BOWSER_1 and m.area.camera.cutscene == CUTSCENE_ENTER_BOWSER_ARENA then
        m.area.camera.cutscene = 0
    end
end

--Removes the star select when going to course 15
function c15_entry(levelNum)
    if levelNum == LEVEL_RR then
        return false
    end
end

hook_event(HOOK_MARIO_UPDATE, mario_update)
hook_event(HOOK_USE_ACT_SELECT, c15_entry)

--Removes star checkpoint dialogs
hook_event(HOOK_GET_STAR_COLLECTION_DIALOG, function () return 0 end)

local allow_collisions = false
camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(allow_collisions)
camera_romhack_allow_centering(0)

hook_chat_command('setcamera', "Sets the camera to have collision or not",
function (msg)
    allow_collisions = not allow_collisions
    djui_chat_message_create("Camera collisons is now " .. (allow_collisions and "enabled" or "disabled"))
    return true
end)