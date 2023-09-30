--Timer code by Agent X
gGlobalSyncTable.gameEnabled = true

local started = false
local finished = false

local time = 0

local restart = true
local exit = true
function reset()
    if restart == true then
        warp_restart_level()
        time = 0
        finished = false
        started = true

        gMarioStates[0].health = 0x0880
        exit = true
    end
end

--Stops the timer and shows the time upon star collection
function on_star_collection(m, obj, intee)
    --Prevents the timer from stopping upon collecting the 60 coin star
    if (intee == INTERACT_STAR_OR_KEY) and (get_id_from_behavior(obj.behavior) ~= id_bhvSpawnedStarNoLevelExit) then
        finished = true
        djui_chat_message_create("Your time: " .. tostring(string.format("%.2f", time / 30)) .. " seconds")
    --Shows the time it took to grab the 60 coin star
    elseif (intee == INTERACT_STAR_OR_KEY) and (get_id_from_behavior(obj.behavior) == id_bhvSpawnedStarNoLevelExit) then
        djui_chat_message_create("60 coins time: " .. tostring(string.format("%.2f", time / 30)) .. " seconds")
    end
end

function on_warp()
    if gNetworkPlayers[0].currLevelNum == LEVEL_BOB then
        if exit == true then
            exit = false
            return
        end
        time = 0
        finished = false
        started = false
    end
end

--Starts the timer upon level initialization
function on_init()
    if gNetworkPlayers[0].currLevelNum == LEVEL_BOB then
        started = true
    end
end

--Displays the timer to the screen
function timer()
    ---@type MarioState
    local m = gMarioStates[0]
    ---@type NetworkPlayer
    local np = gNetworkPlayers[0]

    if gGlobalSyncTable.gameEnabled == false then return end
    if m.playerIndex ~= 0 then return end

    -- render to N64 screen space, with the HUD font
    djui_hud_set_resolution(RESOLUTION_N64)
    djui_hud_set_font(FONT_NORMAL)

    local text = "0.000 seconds"
    if time ~= nil then
        if (finished == false) and (started == true) then
            time = time + 1
        end
        text = tostring(string.format("%.2f", time / 30)) .. " seconds"
    else
        return
    end

    if np.currLevelNum == LEVEL_CASTLE then
        text = ""
        time = 0
        started = false
        finished = false
    end

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local width = djui_hud_measure_text(text) * 0.50
    local bounds = 0
    --Hides the rectangle inside the castle
    if width ~= 0 then
        bounds = 12
    else
        bounds = 0
    end

    local x = (screenWidth - width) / 2.0
    local y = 0

    -- render top
    djui_hud_set_color(0, 0, 0, 128)
    djui_hud_render_rect(x - 6, y, width + bounds, 16)

    djui_hud_set_color(255, 255, 255, 255)
    djui_hud_print_text(text, x, y, 0.50)
end

function on_chat_command(msg)
    if gNetworkPlayers == LEVEL_BOB then
        djui_chat_message_create("You must leave the level before you change this.")
        return true
    end
    if string.lower(msg) == "on" then
        gGlobalSyncTable.gameEnabled = true
        djui_chat_message_create("Speedrun timer enabled.")
        return true
    elseif string.lower(msg) == "off" then
        gGlobalSyncTable.gameEnabled = false
        djui_chat_message_create("Speedrun timer disabled.")
        return true
    else
        return false
    end
end

function restart_command(msg)
    if string.lower(msg) == 'on' then
        restart = true
        djui_chat_message_create("You will now reset instead of exit upon pause exit.")
        return true
    elseif string.lower(msg) == 'off' then
        restart = false
        djui_chat_message_create("You will now exit upon pause exit.")
        return true
    else
        return false
    end
end

hook_event(HOOK_ON_PAUSE_EXIT, reset)
hook_event(HOOK_ON_INTERACT, on_star_collection)
hook_event(HOOK_ON_WARP, on_warp)
hook_event(HOOK_ON_LEVEL_INIT, on_init)
hook_event(HOOK_ON_HUD_RENDER, timer)

if network_is_server() then
    hook_chat_command('speedruntimer', "Turns the speedrun timer [on] or [off].", on_chat_command)
end
hook_chat_command('restart', 'Restarts the level upon pause exiting.\n[on] or [off].', restart_command)