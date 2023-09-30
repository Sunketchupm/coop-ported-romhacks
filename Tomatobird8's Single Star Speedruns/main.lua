-- name: Tomatobird8's Single Star Speedruns
-- description: Collect the 8 stars as fast as you can!\nRomhack created by Tomatobird8.\nTimer created by Agent X, Mjcox24, and Malkierian.\nRomhack ported by Sunk.
-- incompatible: romhack

----------------
-----Tweaks-----
----------------

--Warps
gLevelValues.entryLevel = LEVEL_CASTLE
gLevelValues.exitCastleArea = 1
gLevelValues.exitCastleLevel = LEVEL_CASTLE
gLevelValues.exitCastleWarpNode = 0x0A

--Other
gLevelValues.coinsRequiredForCoinStar = 60
camera_set_use_course_specific_settings(false)

----------------
----Movtexts----
----------------

movtexqc_register("bob_1_Movtex_0", LEVEL_BOB, 1, 0)