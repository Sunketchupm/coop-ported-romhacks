gLevelValues.entryLevel = LEVEL_CASTLE_GROUNDS
gLevelValues.exitCastleLevel = 16
gLevelValues.exitCastleArea = 1
gLevelValues.exitCastleWarpNode = 31

gLevelValues.cellHeightLimit = 32767
gLevelValues.floorLowerLimit = -32768
gLevelValues.floorLowerLimitMisc = -31768
gLevelValues.floorLowerLimitShadow = -31768

gBehaviorValues.KingBobombFVel = 14.875
gBehaviorValues.KingBobombYawVel = 525
gBehaviorValues.KingBobombHealth = 5

gBehaviorValues.KoopaThiAgility = 6.0
gBehaviorValues.KoopaBobAgility = 4.0
gBehaviorValues.trajectories.KoopaBobTrajectory = get_trajectory("KoopaBoB_path")
gBehaviorValues.trajectories.KoopaThiTrajectory = get_trajectory("KoopaTHI_path")

gLevelValues.pssSlideStarTime = 3600

gLevelValues.metalCapDuration = 600
gLevelValues.wingCapDuration = 600
gLevelValues.vanishCapDuration = 600
gLevelValues.metalCapDurationCotmc = 1
gLevelValues.wingCapDurationTotwc = 1
gLevelValues.vanishCapDurationVcutm = 1

gLevelValues.coinsRequiredForCoinStar = 120
hook_event(HOOK_GET_STAR_COLLECTION_DIALOG, function () return 0 end)