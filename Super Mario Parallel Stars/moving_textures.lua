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

add_scroll_target(0, "VB_ccm_1_0xe0088d0", 9, 6)
add_scroll_target(0, "VB_ccm_1_0xe0089c0", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe008ab0", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe008ba0", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe008c90", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe008d80", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe008e70", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe008f60", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe009050", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe009140", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe009230", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe009320", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe009410", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe009500", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe0095f0", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe0096e0", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe0097d0", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe0098c0", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe0099b0", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe009aa0", 0, 15)
add_scroll_target(0, "VB_ccm_1_0xe009b90", 0, 9)

add_scroll_target(1, "VB_castle_grounds_1_0xe033f30", 3, 12)
add_scroll_target(1, "VB_castle_grounds_1_0xe034020", 0, 15)
add_scroll_target(1, "VB_castle_grounds_1_0xe034110", 0, 15)
add_scroll_target(1, "VB_castle_grounds_1_0xe034200", 0, 15)
add_scroll_target(1, "VB_castle_grounds_1_0xe0342f0", 0, 15)
add_scroll_target(1, "VB_castle_grounds_1_0xe0343e0", 0, 15)
add_scroll_target(1, "VB_castle_grounds_1_0xe0344d0", 0, 15)
add_scroll_target(1, "VB_castle_grounds_1_0xe0345c0", 0, 15)
add_scroll_target(1, "VB_castle_grounds_1_0xe0346b0", 0, 15)
add_scroll_target(1, "VB_castle_grounds_1_0xe0347a0", 0, 15)
add_scroll_target(1, "VB_castle_grounds_1_0xe034890", 0, 15)
add_scroll_target(1, "VB_castle_grounds_1_0xe034980", 0, 15)
add_scroll_target(1, "VB_castle_grounds_1_0xe034a70", 0, 9)
-- Count: 186

add_scroll_target(2, "VB_bitfs_1_0xe061970", 6, 9)
add_scroll_target(2, "VB_bitfs_1_0xe061a60", 0, 15)
add_scroll_target(2, "VB_bitfs_1_0xe061b50", 0, 15)
add_scroll_target(2, "VB_bitfs_1_0xe061c40", 0, 15)
add_scroll_target(2, "VB_bitfs_1_0xe061970", 0, 3)
-- Count: 57

add_scroll_target(3, "VB_bitfs_1_0xe05b250", 12, 3)
add_scroll_target(3, "VB_bitfs_1_0xe05b340", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05b430", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05b520", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05b610", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05b700", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05b7f0", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05b8e0", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05b9d0", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05bac0", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05bbb0", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05bca0", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05bd90", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05be80", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05bf70", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05c060", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05c150", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05c240", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05c330", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05c420", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05c510", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05c600", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05c6f0", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05c7e0", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05c8d0", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05c9c0", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05cab0", 0, 15)
add_scroll_target(3, "VB_bitfs_1_0xe05cba0", 0, 9)
-- Count: 402

add_scroll_target(4, "VB_sa_1_0xe03a630", 9, 6)
add_scroll_target(4, "VB_sa_1_0xe03a720", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03a810", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03a900", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03a9f0", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03aae0", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03abd0", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03acc0", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03adb0", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03aea0", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03af90", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03b080", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03b170", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03b260", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03b350", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03b440", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03b530", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03b620", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03b710", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03b800", 0, 15)
add_scroll_target(4, "VB_sa_1_0xe03b8f0", 0, 15)
-- Count: 321

add_scroll_target(5, "VB_bits_1_0xe03ba00", 6, 9)
add_scroll_target(5, "VB_bits_1_0xe03baf0", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03bbe0", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03bcd0", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03bdc0", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03beb0", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03bfa0", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03c090", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03c180", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03c270", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03c360", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03c450", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03c540", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03c630", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03c720", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03c810", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03c900", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03c9f0", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03cae0", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03cbd0", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03ccc0", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03cdb0", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03cea0", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03cf90", 0, 15)
add_scroll_target(5, "VB_bits_1_0xe03d080", 0, 15)
-- Count: 369

add_scroll_target(6, "VB_bits_1_0xe03a380", 6, 9)
add_scroll_target(6, "VB_bits_1_0xe03a470", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03a560", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03a650", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03a740", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03a830", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03a920", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03aa10", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03ab00", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03abf0", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03ace0", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03add0", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03aec0", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03afb0", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03b0a0", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03b190", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03b280", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03b370", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03b460", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03b550", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03b640", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03b730", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03b820", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03b910", 0, 15)
add_scroll_target(6, "VB_bits_1_0xe03ba00", 0, 6)
-- Count: 360

add_scroll_target(7, "VB_bits_1_0xe0351f0", 3, 12)
add_scroll_target(7, "VB_bits_1_0xe0352e0", 0, 15)
add_scroll_target(7, "VB_bits_1_0xe0353d0", 0, 15)
add_scroll_target(7, "VB_bits_1_0xe0354c0", 0, 15)
add_scroll_target(7, "VB_bits_1_0xe0355b0", 0, 15)
add_scroll_target(7, "VB_bits_1_0xe0356a0", 0, 15)
add_scroll_target(7, "VB_bits_1_0xe035790", 0, 9)
-- Count: 96

-- ID 8 doesn't exist
-- Count: 0

add_scroll_target(9, "VB_lll_1_0xe02add0", 9, 6)
add_scroll_target(9, "VB_lll_1_0xe02aec0", 0, 15)
add_scroll_target(9, "VB_lll_1_0xe02afb0", 0, 15)
add_scroll_target(9, "VB_lll_1_0xe02b0a0", 0, 15)
add_scroll_target(9, "VB_lll_1_0xe02b190", 0, 15)
-- Count: 75

add_scroll_target(10, "VB_wf_1_0xe041190", 9, 6)
add_scroll_target(10, "VB_wf_1_0xe041280", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe041370", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe041460", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe041550", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe041640", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe041730", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe041820", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe041910", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe041a00", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe041af0", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe041be0", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe041cd0", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe041dc0", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe041eb0", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe041fa0", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe042090", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe042180", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe042270", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe042360", 0, 15)
add_scroll_target(10, "VB_wf_1_0xe042450", 0, 15)
-- Count: 306

add_scroll_target(11, "VB_cotmc_1_0xe014ed0", 12, 3)
add_scroll_target(11, "VB_cotmc_1_0xe014fc0", 0, 15)
add_scroll_target(11, "VB_cotmc_1_0xe0150b0", 0, 15)
add_scroll_target(11, "VB_cotmc_1_0xe0151a0", 0, 15)
add_scroll_target(11, "VB_cotmc_1_0xe015290", 0, 15)
add_scroll_target(11, "VB_cotmc_1_0xe015380", 0, 15)
add_scroll_target(11, "VB_cotmc_1_0xe015470", 0, 12)
-- Count: 90

add_scroll_target(12, "VB_totwc_1_0xe017f20", 6, 9)
add_scroll_target(12, "VB_totwc_1_0xe018010", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe018100", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe0181f0", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe0182e0", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe0183d0", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe0184c0", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe0185b0", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe0186a0", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe018790", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe018880", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe018970", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe018a60", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe018b50", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe018c40", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe018d30", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe018e20", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe018f10", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe019000", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe0190f0", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe0191e0", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe0192d0", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe0193c0", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe0194b0", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe0195a0", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe019690", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe019780", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe019870", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe019960", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe019a50", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe019b40", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe019c30", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe019d20", 0, 15)
add_scroll_target(12, "VB_totwc_1_0xe019e10", 0, 15)
-- Count: 504

-- Unrecognized address
-- add_scroll_target(13, "VB_wmotr_1_0xe03da70", 0, 15)
-- Count: 15

add_scroll_target(14, "VB_bowser_2_1_0xe013110", 12, 3)
add_scroll_target(14, "VB_bowser_2_1_0xe013200", 0, 15)
add_scroll_target(14, "VB_bowser_2_1_0xe0132f0", 0, 15)
add_scroll_target(14, "VB_bowser_2_1_0xe0133e0", 0, 15)
add_scroll_target(14, "VB_bowser_2_1_0xe0134d0", 0, 15)
add_scroll_target(14, "VB_bowser_2_1_0xe0135c0", 0, 15)
add_scroll_target(14, "VB_bowser_2_1_0xe0136b0", 0, 15)
add_scroll_target(14, "VB_bowser_2_1_0xe0137a0", 0, 9)
-- Count: 102

add_scroll_target(15, "VB_bowser_2_1_0xe0137a0", 9, 6)
add_scroll_target(15, "VB_bowser_2_1_0xe013890", 0, 15)
add_scroll_target(15, "VB_bowser_2_1_0xe013980", 0, 15)
add_scroll_target(15, "VB_bowser_2_1_0xe013a70", 0, 15)
add_scroll_target(15, "VB_bowser_2_1_0xe013b60", 0, 15)
add_scroll_target(15, "VB_bowser_2_1_0xe013c50", 0, 15)
add_scroll_target(15, "VB_bowser_2_1_0xe013d40", 0, 15)
add_scroll_target(15, "VB_bowser_2_1_0xe013e30", 0, 6)
-- Count: 102

add_scroll_target(16, "VB_bowser_2_1_0xe013e30", 6, 9)
add_scroll_target(16, "VB_bowser_2_1_0xe013f20", 0, 15)
add_scroll_target(16, "VB_bowser_2_1_0xe014010", 0, 15)
add_scroll_target(16, "VB_bowser_2_1_0xe014100", 0, 15)
add_scroll_target(16, "VB_bowser_2_1_0xe0141f0", 0, 15)
add_scroll_target(16, "VB_bowser_2_1_0xe0142e0", 0, 15)
add_scroll_target(16, "VB_bowser_2_1_0xe0143d0", 0, 15)
add_scroll_target(16, "VB_bowser_2_1_0xe0144c0", 0, 15)
add_scroll_target(16, "VB_bowser_2_1_0xe0145b0", 0, 15)
add_scroll_target(16, "VB_bowser_2_1_0xe0146a0", 0, 15)
add_scroll_target(16, "VB_bowser_2_1_0xe014790", 0, 15)
add_scroll_target(16, "VB_bowser_2_1_0xe014880", 0, 15)
add_scroll_target(16, "VB_bowser_2_1_0xe014970", 0, 15)
add_scroll_target(16, "VB_bowser_2_1_0xe014a60", 0, 3)
-- Count: 192

add_scroll_target(17, "VB_bowser_2_1_0xe0124e0", 9, 6)
add_scroll_target(17, "VB_bowser_2_1_0xe0125d0", 0, 15)
add_scroll_target(17, "VB_bowser_2_1_0xe0126c0", 0, 15)
add_scroll_target(17, "VB_bowser_2_1_0xe0127b0", 0, 15)
add_scroll_target(17, "VB_bowser_2_1_0xe0128a0", 0, 15)
add_scroll_target(17, "VB_bowser_2_1_0xe012990", 0, 15)
add_scroll_target(17, "VB_bowser_2_1_0xe012a80", 0, 12)
-- Count: 105

add_scroll_target(18, "VB_bowser_2_1_0xe012a80", 12, 3)
add_scroll_target(18, "VB_bowser_2_1_0xe012b70", 0, 15)
add_scroll_target(18, "VB_bowser_2_1_0xe012c60", 0, 15)
add_scroll_target(18, "VB_bowser_2_1_0xe012d50", 0, 15)
add_scroll_target(18, "VB_bowser_2_1_0xe012e40", 0, 15)
add_scroll_target(18, "VB_bowser_2_1_0xe012f30", 0, 15)
add_scroll_target(18, "VB_bowser_2_1_0xe013020", 0, 15)
add_scroll_target(18, "VB_bowser_2_1_0xe013110", 0, 12)
-- Count: 105

add_scroll_target(19, "VB_bowser_2_1_0xe011f40", 9, 6)
add_scroll_target(19, "VB_bowser_2_1_0xe012030", 0, 15)
add_scroll_target(19, "VB_bowser_2_1_0xe012120", 0, 15)
add_scroll_target(19, "VB_bowser_2_1_0xe012210", 0, 15)
add_scroll_target(19, "VB_bowser_2_1_0xe012300", 0, 15)
add_scroll_target(19, "VB_bowser_2_1_0xe0123f0", 0, 15)
add_scroll_target(19, "VB_bowser_2_1_0xe0124e0", 0, 9)
-- Count: 90

add_scroll_target(20, "VB_bowser_2_1_0xe0109b0", 0, 15)
add_scroll_target(20, "VB_bowser_2_1_0xe010aa0", 0, 15)
add_scroll_target(20, "VB_bowser_2_1_0xe010b90", 0, 15)
add_scroll_target(20, "VB_bowser_2_1_0xe010c80", 0, 15)
add_scroll_target(20, "VB_bowser_2_1_0xe010d70", 0, 15)
add_scroll_target(20, "VB_bowser_2_1_0xe010e60", 0, 15)
-- Count: 90

add_scroll_target(21, "VB_bowser_3_1_0xe005e40", 6, 9)
add_scroll_target(21, "VB_bowser_3_1_0xe005f30", 0, 15)
add_scroll_target(21, "VB_bowser_3_1_0xe006020", 0, 15)
add_scroll_target(21, "VB_bowser_3_1_0xe006110", 0, 15)
add_scroll_target(21, "VB_bowser_3_1_0xe006200", 0, 15)
add_scroll_target(21, "VB_bowser_3_1_0xe0062f0", 0, 15)
-- Count: 84

add_scroll_target(22, "VB_bowser_3_1_0xe003050", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe003140", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe003230", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe003320", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe003410", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe003500", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe0035f0", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe0036e0", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe0037d0", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe0038c0", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe0039b0", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe003aa0", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe003b90", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe003c80", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe003d70", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe003e60", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe003f50", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe004040", 0, 15)
add_scroll_target(22, "VB_bowser_3_1_0xe004130", 0, 6)
-- Count: 276

add_scroll_target(23, "VB_ttm_1_0xe049090", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe049180", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe049270", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe049360", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe049450", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe049540", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe049630", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe049720", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe049810", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe049900", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe0499f0", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe049ae0", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe049bd0", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe049cc0", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe049db0", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe049ea0", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe049f90", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe04a080", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe04a170", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe04a260", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe04a350", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe04a440", 0, 15)
add_scroll_target(23, "VB_ttm_1_0xe04a530", 0, 15)
-- Count: 345

add_scroll_target(24, "VB_ttm_1_0xe04ff30", 12, 3)
add_scroll_target(24, "VB_ttm_1_0xe050020", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe050110", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe050200", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe0502f0", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe0503e0", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe0504d0", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe0505c0", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe0506b0", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe0507a0", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe050890", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe050980", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe050a70", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe050b60", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe050c50", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe050d40", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe050e30", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe050f20", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe051010", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe051100", 0, 15)
add_scroll_target(24, "VB_ttm_1_0xe0511f0", 0, 12)
-- Count: 300
