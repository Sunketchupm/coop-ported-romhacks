-- Moving Textures (WaterBoxes)
--   Every movtext type is set to 1 (normal water texture)
--   If you want to configure and setup other water type, change the value here
movtexqc_register('castle_grounds_1_Movtex_0', 16, 1, 0)
movtexqc_register('castle_grounds_1_Movtex_1', 16, 1, 1)
movtexqc_register('castle_grounds_1_Movtex_2', 16, 1, 2)
movtexqc_register('lll_1_Movtex_0', 22, 1, 0)
movtexqc_register('lll_1_Movtex_1', 22, 1, 1)
movtexqc_register('lll_1_Movtex_2', 22, 1, 2)

-- Scroll Textures
--   Uncomment and replace <id>, <offset> and <count> with the proper values
--   if you want to have scroll textures in your mod.
--[[
add_scroll_target(<id>, "VB_lll_1_0xe053980", <offset>, <count>)
--]]
