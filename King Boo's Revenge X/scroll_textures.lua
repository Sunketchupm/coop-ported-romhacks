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

add_scroll_target(0, "VB_castle_inside_1_0xe062870", 0, 15) -- Start VB
add_scroll_target(0, "VB_castle_inside_1_0xe062960", 0, 15)
add_scroll_target(0, "VB_castle_inside_1_0xe062a50", 0, 15)
add_scroll_target(0, "VB_castle_inside_1_0xe0470c0", 0, 15)
add_scroll_target(0, "VB_castle_inside_1_0xe0471b0", 0, 15)
add_scroll_target(0, "VB_castle_inside_1_0xe0472a0", 0, 15)
add_scroll_target(0, "VB_castle_inside_1_0xe047390", 0, 15)
add_scroll_target(0, "VB_castle_inside_1_0xe047480", 0, 15)
add_scroll_target(0, "VB_castle_inside_1_0xe062870", 0, 15) -- Start VB
-- Count: 135

add_scroll_target(1, "VB_castle_inside_1_0xe0711e0", 0, 15) -- Start VB
add_scroll_target(1, "VB_castle_inside_1_0xe0712d0", 0, 15)
add_scroll_target(1, "VB_castle_inside_1_0xe0713c0", 0, 15)
add_scroll_target(1, "VB_castle_inside_1_0xe0711e0", 0, 15) -- Start VB
add_scroll_target(1, "VB_castle_inside_1_0xe0711e0", 0, 15) -- Start VB
-- Count: 75

add_scroll_target(2, "VB_castle_inside_1_0xe053870", 0, 15) -- Start VB
add_scroll_target(2, "VB_castle_inside_1_0xe053870", 0, 15) -- Start VB
add_scroll_target(2, "VB_castle_inside_1_0xe053960", 0, 15)
-- Count: 45

add_scroll_target(3, "VB_ccm_1_0xe084260", 0, 4) -- Start VB
-- Count: 4

add_scroll_target(4, "VB_ccm_1_0xe08ee40", 0, 4) -- Start VB
-- Count: 4

-- No idea what's supposed to be scrolling
add_scroll_target(5, "VB_hmc_1_0xe046860", 0, 4) -- Start VB
-- Count: 4

add_scroll_target(6, "VB_ssl_1_0xe051830", 6, 6) -- Start VB
-- Count: 6

add_scroll_target(7, "VB_wdw_1_0xe04aba0", 0, 15) -- Start VB
add_scroll_target(7, "VB_wdw_1_0xe04ac90", 0, 14)
add_scroll_target(7, "VB_wdw_1_0xe04ad70", 0, 15)
add_scroll_target(7, "VB_wdw_1_0xe04ae60", 0, 13)
add_scroll_target(7, "VB_wdw_1_0xe04af30", 0, 3)
-- Count: 60

add_scroll_target(8, "VB_rr_1_0xe057d10", 0, 15) -- Start VB
add_scroll_target(8, "VB_rr_1_0xe057e00", 0, 15)
add_scroll_target(8, "VB_rr_1_0xe057ef0", 0, 8)
-- Count: 38

add_scroll_target(9, "VB_castle_grounds_1_0xe04b840", 0, 13) -- Start VB
add_scroll_target(9, "VB_castle_grounds_1_0xe04b910", 0, 3)
-- Count: 16

add_scroll_target(10, "VB_castle_grounds_1_0xe04d260", 0, 6) -- Start VB
-- Count: 6

add_scroll_target(11, "VB_castle_grounds_1_0xe05b100", 0, 4) -- Start VB
-- Count: 4

add_scroll_target(12, "VB_bitdw_1_0xe01a890", 0, 15) -- Start VB
add_scroll_target(12, "VB_bitdw_1_0xe01a980", 0, 15)
add_scroll_target(12, "VB_bitdw_1_0xe01aa70", 0, 15)
add_scroll_target(12, "VB_bitdw_1_0xe01ab60", 0, 13)
add_scroll_target(12, "VB_bitdw_1_0xe01ac30", 0, 13)
add_scroll_target(12, "VB_bitdw_1_0xe01ad00", 0, 13)
add_scroll_target(12, "VB_bitdw_1_0xe01add0", 0, 15)
add_scroll_target(12, "VB_bitdw_1_0xe01aec0", 0, 15)
add_scroll_target(12, "VB_bitdw_1_0xe01afb0", 0, 6)
-- Count: 120

add_scroll_target(13, "VB_vcutm_1_0xe026c90", 0, 15) -- Start VB
add_scroll_target(13, "VB_vcutm_1_0xe026d80", 0, 15)
add_scroll_target(13, "VB_vcutm_1_0xe026e70", 0, 13)
add_scroll_target(13, "VB_vcutm_1_0xe026f40", 0, 15)
add_scroll_target(13, "VB_vcutm_1_0xe027030", 0, 15)
add_scroll_target(13, "VB_vcutm_1_0xe027120", 0, 15)
add_scroll_target(13, "VB_vcutm_1_0xe027210", 0, 15)
add_scroll_target(13, "VB_vcutm_1_0xe027300", 0, 15)
add_scroll_target(13, "VB_vcutm_1_0xe0273f0", 0, 12)
-- Count: 130

add_scroll_target(14, "VB_bitfs_1_0xe044e40", 0, 4) -- Start VB
-- Count: 4

add_scroll_target(15, "VB_sa_1_0xe08d6b0", 0, 4) -- Start VB
-- Count: 4

add_scroll_target(16, "VB_sa_1_0xe08d6f0", 0, 4) -- Start VB
-- Count: 4

add_scroll_target(17, "VB_bits_1_0xe030450", 0, 15) -- Start VB
add_scroll_target(17, "VB_bits_1_0xe030540", 0, 11)
-- Count: 26

add_scroll_target(18, "VB_lll_1_0xe03a510", 0, 15) -- Start VB
add_scroll_target(18, "VB_lll_1_0xe03a600", 0, 3)
-- Count: 18

add_scroll_target(19, "VB_lll_1_0xe03c950", 0, 4) -- Start VB
-- Count: 4

add_scroll_target(20, "VB_ddd_1_0xe06d050", 0, 6) -- Start VB
-- Count: 6

add_scroll_target(21, "VB_ddd_1_0xe0626a0", 3, 6) -- Start VB
-- Count: 6

add_scroll_target(22, "VB_wf_1_0xe044f20", 0, 4) -- Start VB
-- Count: 4

add_scroll_target(23, "VB_wf_1_0xe0454c0", 0, 15) -- Start VB
add_scroll_target(23, "VB_wf_1_0xe0455b0", 0, 11)
-- Count: 26

add_scroll_target(24, "VB_wf_1_0xe0460a0", 0, 15) -- Start VB
add_scroll_target(24, "VB_wf_1_0xe046190", 0, 11)
-- Count: 26

add_scroll_target(25, "VB_wf_1_0xe047500", 0, 15) -- Start VB
add_scroll_target(25, "VB_wf_1_0xe0475f0", 0, 11)
-- Count: 26

add_scroll_target(26, "VB_ending_1_0xe077dc0", 0, 4) -- Start VB
-- Count: 4

add_scroll_target(27, "VB_castle_courtyard_1_0xe07e160", 0, 4) -- Start VB
-- Count: 4

add_scroll_target(28, "VB_pss_1_0xe04e8e0", 0, 12) -- Start VB
-- Count: 12

add_scroll_target(29, "VB_totwc_1_0xe040110", 0, 4) -- Start VB
-- Count: 4

add_scroll_target(30, "VB_bowser_1_1_0xe001050", 0, 15) -- Start VB
add_scroll_target(30, "VB_bowser_1_1_0xe001140", 0, 15)
add_scroll_target(30, "VB_bowser_1_1_0xe001230", 0, 15)
add_scroll_target(30, "VB_bowser_1_1_0xe001320", 0, 15)
add_scroll_target(30, "VB_bowser_1_1_0xe001410", 0, 15)
add_scroll_target(30, "VB_bowser_1_1_0xe001500", 0, 15)
add_scroll_target(30, "VB_bowser_1_1_0xe0015f0", 0, 8)
-- Count: 98

add_scroll_target(31, "VB_bowser_2_1_0xe006650", 0, 15) -- Start VB
add_scroll_target(31, "VB_bowser_2_1_0xe006740", 0, 14)
add_scroll_target(31, "VB_bowser_2_1_0xe006820", 0, 15)
add_scroll_target(31, "VB_bowser_2_1_0xe006910", 0, 15)
add_scroll_target(31, "VB_bowser_2_1_0xe006a00", 0, 15)
add_scroll_target(31, "VB_bowser_2_1_0xe006af0", 0, 15)
add_scroll_target(31, "VB_bowser_2_1_0xe006be0", 0, 11)
-- Count: 100

add_scroll_target(32, "VB_ttm_1_0xe01ac90", 0, 14) -- Start VB
add_scroll_target(32, "VB_ttm_1_0xe01ad70", 0, 15)
add_scroll_target(32, "VB_ttm_1_0xe01ae60", 0, 15)
add_scroll_target(32, "VB_ttm_1_0xe01af50", 0, 15)
add_scroll_target(32, "VB_ttm_1_0xe01b040", 0, 15)
add_scroll_target(32, "VB_ttm_1_0xe01b130", 0, 13)
add_scroll_target(32, "VB_ttm_1_0xe01b200", 0, 15)
add_scroll_target(32, "VB_ttm_1_0xe01b2f0", 0, 14)
add_scroll_target(32, "VB_ttm_1_0xe01b3d0", 0, 14)
add_scroll_target(32, "VB_ttm_1_0xe01b4b0", 0, 15)
add_scroll_target(32, "VB_ttm_1_0xe01b5a0", 0, 15)
add_scroll_target(32, "VB_ttm_1_0xe01b690", 0, 15)
add_scroll_target(32, "VB_ttm_1_0xe01b780", 0, 15)
add_scroll_target(32, "VB_ttm_1_0xe01b870", 0, 15)
add_scroll_target(32, "VB_ttm_1_0xe01b960", 0, 14)
add_scroll_target(32, "VB_ttm_1_0xe01ba40", 0, 14)
add_scroll_target(32, "VB_ttm_1_0xe01bb20", 0, 15)
add_scroll_target(32, "VB_ttm_1_0xe01bc10", 0, 15)
add_scroll_target(32, "VB_ttm_1_0xe01bd00", 0, 13)
add_scroll_target(32, "VB_ttm_1_0xe01bdd0", 0, 15)
-- Count: 291

