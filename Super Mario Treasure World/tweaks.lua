gLevelValues.entryLevel = LEVEL_CASTLE_GROUNDS
gLevelValues.exitCastleLevel = 16
gLevelValues.exitCastleArea = 1
gLevelValues.exitCastleWarpNode = 31

gBehaviorValues.ToadStar1Requirement = 0
gBehaviorValues.ToadStar2Requirement = 0
gBehaviorValues.ToadStar3Requirement = 0

gBehaviorValues.KoopaThiAgility = 6.0
gBehaviorValues.KoopaBobAgility = 4.0
gBehaviorValues.trajectories.KoopaBobTrajectory = get_trajectory("KoopaBoB_path")
gBehaviorValues.trajectories.KoopaThiTrajectory = get_trajectory("KoopaTHI_path")

gLevelValues.pssSlideStarTime = 690
hook_event(HOOK_GET_STAR_COLLECTION_DIALOG, function () return 0 end)