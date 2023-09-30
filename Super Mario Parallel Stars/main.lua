-- name: Super Mario Parallel Stars
-- description: Romhack created by Mese_Insanity and RambiRampage, with 151 stars to collect. Features a custom hud, 3D coins, and other advanced behaviors.\nPorted by Sunk.
-- incompatible: romhack

E_MODEL_PURPLE_COIN = smlua_model_util_get_id("purple_coin")

camera_set_use_course_specific_settings(0)
camera_set_romhack_override(RCO_ALL)
rom_hack_cam_set_collisions(0)
camera_romhack_allow_centering(0)

-- In PSS and C10, there is a death timer
local activated = false
local death_timer = 0
-- In C15 act 6, daredevil is active
local daredevil = false

local function level_init()
    ---@type NetworkPlayer
    local np = gNetworkPlayers[0]
    if np.currLevelNum == LEVEL_PSS then
        death_timer = 960
        activated = true
    elseif np.currLevelNum == LEVEL_SL and np.currActNum == 5 then
        death_timer = 1650
        activated = true
    elseif np.currLevelNum == LEVEL_RR and np.currActNum == 6 then
        daredevil = true
    else
        death_timer = 0
        hud_set_value(HUD_DISPLAY_FLAGS, ~HUD_DISPLAY_FLAGS_TIMER)
        activated = false
        daredevil = false
    end
end

local custom_hud = true

---@param text string
local function append_zero_and_format_negative(text)
    local length = #text
    if length == 1 then
        text = "0" .. text
    elseif text:sub(1, 1) == "-" then
        text = "M" .. text:sub(2, length)
    end
    return text
end

-- Custom hud
local function hud_render()
    -- Death timer
    ---@type MarioState
    local m = gMarioStates[0]
    ---@type NetworkPlayer
    local np = gNetworkPlayers[0]
    local hud_display_flags = hud_get_value(HUD_DISPLAY_FLAGS)
    if np.currLevelNum == LEVEL_PSS or (np.currLevelNum == LEVEL_SL and np.currActNum == 5) then
        if m.action ~= ACT_FALL_AFTER_STAR_GRAB then
            death_timer = death_timer - 1
            if death_timer <= 0 then
                mario_drop_held_object(m)
                m.health = 255
                death_timer = 0
            end
            hud_set_value(HUD_DISPLAY_FLAGS, (hud_display_flags | HUD_DISPLAY_FLAGS_TIMER))
            hud_set_value(HUD_DISPLAY_TIMER, death_timer)
        end
    end

    -- Daredevil
    m.health = daredevil and math.min(m.health, 256) or m.health

    -- ktq
    if not custom_hud then return end
    -- Custom hud
    hud_hide()
    -- Lives
    djui_hud_set_resolution(RESOLUTION_N64)
    djui_hud_set_font(FONT_HUD)
    djui_hud_set_color(255, 255, 255, 255)
    local x = 10
    local y = 15
    djui_hud_render_texture(gTextures.mario_head, x, y, 1, 1)
    djui_hud_print_text("x", x + 16, y, 1)
    local lives_text = append_zero_and_format_negative(tostring(m.numLives))
    djui_hud_print_text(lives_text, x + 31, y, 1)
    -- Stars
    y = 33
    djui_hud_render_texture(gTextures.star, x, y, 1, 1)
    djui_hud_print_text("x", x + 16, y, 1)
    djui_hud_print_text(append_zero_and_format_negative(tostring(m.numStars)), x + 31, y, 1)
    -- Coins
    y = 51
    djui_hud_render_texture(gTextures.coin, x, y, 1, 1)
    djui_hud_print_text("x", x + 16, y, 1)
    djui_hud_print_text(append_zero_and_format_negative(tostring(m.numCoins)), x + 31, y, 1)
    x = djui_hud_get_screen_width() - 60
    y = 5
    -- Power meter
    hud_render_power_meter(m.health, x, y, 60, 60)
    -- Caps
    if m.flags & MARIO_SPECIAL_CAPS ~= 0 then
        x = x + 18
        y = 60
        djui_hud_print_text("CAP", x, y, 1)
        x = djui_hud_get_screen_width()
        y = 80
        local cap_timer_text = tostring(m.capTimer)
        local cap_timer_text_length = djui_hud_measure_text(cap_timer_text)
        djui_hud_print_text(cap_timer_text, (x - cap_timer_text_length) - 9, y, 1)
    end
    -- Death timer hud
    if activated then
        local LEFT_text_length = djui_hud_measure_text("LEFT")
        x = djui_hud_get_screen_width() * 0.5 - (LEFT_text_length * 0.5)
        y = 24
        djui_hud_print_text("LEFT", x, y, 1)
        x = x - 3
        y = 42
        local time = hud_get_value(HUD_DISPLAY_TIMER)
        local seconds = append_zero_and_format_negative(tostring(time // 30))
        local milliseconds = append_zero_and_format_negative(tostring((time % 30) * 3)) -- Decimal expansion
        djui_hud_print_text("0" .. seconds, x, y, 1)
        djui_hud_print_text('"', x + 37, y - 6, 1)
        djui_hud_print_text(milliseconds, x + 48, y, 1)
    end
    -- ktq hud
    if np.currLevelNum == LEVEL_DDD and hud_display_flags & HUD_DISPLAY_FLAGS_TIMER ~= 0 then
        local timer = hud_get_value(HUD_DISPLAY_TIMER)
        local minutes = ("%d"):format((timer / 30) // 60)
        local seconds = append_zero_and_format_negative(tostring(timer // 30))
        local milliseconds = append_zero_and_format_negative(tostring((timer % 30) * 3))-- Decimal expansion
        x = djui_hud_get_screen_width() * 0.5 - 35
        y = djui_hud_get_screen_height() * 0.8
        djui_hud_print_text(minutes, x, y, 1)
        djui_hud_print_text("'", x + 9, y - 6, 1)
        djui_hud_print_text(seconds, x + 19, y, 1)
        djui_hud_print_text('"', x + 43, y - 6, 1)
        djui_hud_print_text(milliseconds, x + 56, y, 1)
    end
end

-- All of C14's acts should go to their own area
local function sync_valid()
    ---@type NetworkPlayer
    local np = gNetworkPlayers[0]

    if np.currLevelNum == LEVEL_TTC then
        if np.currActNum ~= np.currAreaIndex then
            warp_to_level(LEVEL_TTC, np.currActNum, np.currActNum)
        end
    end
end

local last_dialog_position = {x = 0, y = 0, z = 0}
local moved_away = false

---@param m MarioState
local function mario_update(m)
    if m.playerIndex ~= 0 then return end
    -- hack: check last position
    if vec3f_dist(last_dialog_position, m.pos) > 100 then
        moved_away = true
    end

    -- Force freecam to be temporary
    if gNetworkPlayers[0].currLevelNum == LEVEL_ENDING then
        camera_config_enable_free_cam(m.controller.buttonDown & X_BUTTON ~= 0)
    end
end

---@param m MarioState
---@param obj Object
local function allow_interact(m, obj)
    if m.playerIndex ~= 0 then return end
    if obj.oBehParams2ndByte == 0xFF and obj_has_behavior_id(obj, id_bhvDoor) == 1 then
        vec3f_copy(last_dialog_position, m.pos)
        if moved_away and m.action == ACT_WALKING then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, gBehaviorValues.dialogs.KeyDoor1DontHaveDialog)
            moved_away = false
        end
        return false
    end
    return true
end

hook_event(HOOK_ON_LEVEL_INIT, level_init)
hook_event(HOOK_ON_HUD_RENDER, hud_render)
hook_event(HOOK_ON_SYNC_VALID, sync_valid)
hook_event(HOOK_MARIO_UPDATE, mario_update)
hook_event(HOOK_ALLOW_INTERACT, allow_interact)

local function on_hud_chat_command(msg)
    custom_hud = not custom_hud
    djui_chat_message_create((custom_hud and "Now" or "No longer") .. " showing the custom hud")
    if not custom_hud then
        hud_show()
    end
    return true
end

local function on_unknown_command()
    if gMarioStates[0].numStars >= 151 then
        warp_to_warpnode(25, 6, 0, 102)
        return true
    end
    djui_chat_message_create("You don't have enough stars")
    return true
end

hook_chat_command('custom-hud', "Toggle using the custom hud", on_hud_chat_command)
hook_chat_command('...', " ", on_unknown_command)