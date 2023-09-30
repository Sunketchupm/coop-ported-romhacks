-- Moving Textures (WaterBoxes)
--   Every movtext type is set to 1 (normal water texture)
--   If you want to configure and setup other water type, change the value here
local courses = {
    ["bob"] = LEVEL_BOB,
    ["wf"] = LEVEL_WF,
    ["jrb"] = LEVEL_JRB,
    ["ccm"] = LEVEL_CCM,
    ["bbh"] = LEVEL_BBH,
    ["hmc"] = LEVEL_HMC,
    ["lll"] = LEVEL_LLL,
    ["ssl"] = LEVEL_SSL,
    ["ddd"] = LEVEL_DDD,
    ["sl"] = LEVEL_SL,
    ["wdw"] = LEVEL_WDW,
    ["ttm"] = LEVEL_TTM,
    ["thi"] = LEVEL_THI,
    ["ttc"] = LEVEL_TTC,
    ["rr"] = LEVEL_RR,
    ["totwc"] = LEVEL_TOTWC,
    ["vcutm"] = LEVEL_VCUTM,
    ["cotmc"] = LEVEL_COTMC,
    ["bitdw"] = LEVEL_BITDW,
    ["bitfs"] = LEVEL_BITFS,
    ["bits"] = LEVEL_BITS,
    ["sa"] = LEVEL_SA,
    ["pss"] = LEVEL_PSS,
    ["wmotr"] = LEVEL_WMOTR,
    ["ending"] = LEVEL_ENDING,
    ["bowser_1"] = LEVEL_BOWSER_1,
    ["bowser_2"] = LEVEL_BOWSER_2,
    ["bowser_3"] = LEVEL_BOWSER_3,
    ["castle_grounds"] = LEVEL_CASTLE_GROUNDS,
    ["castle_inside"] = LEVEL_CASTLE,
    ["castle_courtyard"] = LEVEL_CASTLE_COURTYARD,
}

for key, value in pairs(courses) do
    for i = 0, 2 do
        local text = key .. "_1_Movtex_" .. tostring(i)
        movtexqc_register(text, value, 1, i)
    end
end

-- Scroll Textures
--   Uncomment and replace <id>, <offset> and <count> with the proper values
--   if you want to have scroll textures in your mod.

--Castle inside
add_scroll_target(0, "VB_castle_inside_1_0xe0a7ff0", 6, 9)
add_scroll_target(0, "VB_castle_inside_1_0xe0a80e0", 0, 15)
add_scroll_target(0, "VB_castle_inside_1_0xe0a81d0", 0, 15)
add_scroll_target(0, "VB_castle_inside_1_0xe0a82c0", 0, 15)
add_scroll_target(0, "VB_castle_inside_1_0xe0a83b0", 0, 15)
add_scroll_target(0, "VB_castle_inside_1_0xe0a84a0", 0, 15)
add_scroll_target(0, "VB_castle_inside_1_0xe0a8590", 0, 15)
add_scroll_target(0, "VB_castle_inside_1_0xe0a8680", 0, 15)
add_scroll_target(0, "VB_castle_inside_1_0xe0a8770", 0, 6)

--WDW
add_scroll_target(1, "VB_wdw_1_0xe0c32f0", 0, 12)

--Castle grounds
add_scroll_target(2, "VB_castle_grounds_1_0xe056280", 9, 6)
add_scroll_target(2, "VB_castle_grounds_1_0xe056370", 0, 15)
add_scroll_target(2, "VB_castle_grounds_1_0xe056460", 0, 15)
add_scroll_target(2, "VB_castle_grounds_1_0xe056550", 0, 15)
add_scroll_target(2, "VB_castle_grounds_1_0xe056640", 0, 15)
add_scroll_target(2, "VB_castle_grounds_1_0xe056730", 0, 15)
add_scroll_target(2, "VB_castle_grounds_1_0xe056820", 0, 15)
add_scroll_target(2, "VB_castle_grounds_1_0xe056910", 0, 15)
add_scroll_target(2, "VB_castle_grounds_1_0xe056a00", 0, 15)
add_scroll_target(2, "VB_castle_grounds_1_0xe056af0", 0, 15)
add_scroll_target(2, "VB_castle_grounds_1_0xe056be0", 0, 3)

--Bowser 1 (Scrolling texture 1)
add_scroll_target(3, "VB_bitdw_1_0xe024930", 6, 6)
--Bowser 1 (Scrolling texture 2)
add_scroll_target(4, "VB_bitdw_1_0xe024930", 12, 3)
add_scroll_target(4, "VB_bitdw_1_0xe024a20", 0, 3)

--Castle courtyard (Scrolling texture 1)
add_scroll_target(5, "VB_castle_courtyard_1_0xe055c50", 9, 6)
add_scroll_target(5, "VB_castle_courtyard_1_0xe055d40", 0, 15)
add_scroll_target(5, "VB_castle_courtyard_1_0xe055e30", 0, 15)
add_scroll_target(5, "VB_castle_courtyard_1_0xe055f20", 0, 15)
add_scroll_target(5, "VB_castle_courtyard_1_0xe056010", 0, 15)
add_scroll_target(5, "VB_castle_courtyard_1_0xe056100", 0, 15)
add_scroll_target(5, "VB_castle_courtyard_1_0xe0561f0", 0, 15)
--Castle courtyard (Scrolling texture 2)
add_scroll_target(6, "VB_castle_courtyard_1_0xe045f30", 12, 3)
add_scroll_target(6, "VB_castle_courtyard_1_0xe045f30", 0, 9)

--PSS (Scrolling textures 1)
add_scroll_target(7, "VB_pss_1_0xe0502c0", 9, 6)
add_scroll_target(7, "VB_pss_1_0xe0503b0", 0, 15)
add_scroll_target(7, "VB_pss_1_0xe0504a0", 0, 15)
add_scroll_target(7, "VB_pss_1_0xe050590", 0, 12)
--PSS (Scrolling texture 2)
add_scroll_target(8, "VB_pss_1_0xe053b00", 9, 6)
add_scroll_target(8, "VB_pss_1_0xe053bf0", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe053ce0", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe053dd0", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe053ec0", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe053fb0", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe0540a0", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe054190", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe054280", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe054370", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe054460", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe054550", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe054640", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe054730", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe054820", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe054910", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe054a00", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe054af0", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe054be0", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe054cd0", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe054dc0", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe054eb0", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe054fa0", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe055090", 0, 15)
add_scroll_target(8, "VB_pss_1_0xe055180", 0, 9)
--PSS (Scrolling texture 3)
add_scroll_target(9, "VB_pss_1_0xe055180", 9, 6)
add_scroll_target(9, "VB_pss_1_0xe055270", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe055360", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe055450", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe055540", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe055630", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe055720", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe055810", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe055900", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe0559f0", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe055ae0", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe055bd0", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe055cc0", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe055db0", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe055ea0", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe055f90", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe056080", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe056170", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe056260", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe056350", 0, 15)
add_scroll_target(9, "VB_pss_1_0xe056440", 0, 3)

--Wing cap
add_scroll_target(10, "VB_totwc_1_0xe072090", 0, 15)
add_scroll_target(10, "VB_totwc_1_0xe072180", 0, 15)
add_scroll_target(10, "VB_totwc_1_0xe072270", 0, 15)
add_scroll_target(10, "VB_totwc_1_0xe072360", 0, 15)
add_scroll_target(10, "VB_totwc_1_0xe072450", 0, 15)
add_scroll_target(10, "VB_totwc_1_0xe072540", 0, 15)
add_scroll_target(10, "VB_totwc_1_0xe072630", 0, 15)
add_scroll_target(10, "VB_totwc_1_0xe072720", 0, 15)
add_scroll_target(10, "VB_totwc_1_0xe072810", 0, 15)
add_scroll_target(10, "VB_totwc_1_0xe072900", 0, 9)

--TTM
add_scroll_target(11, "VB_ttm_1_0xe033850", 9, 6)