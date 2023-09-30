gLevelValues.entryLevel = LEVEL_CASTLE_GROUNDS
gLevelValues.exitCastleLevel = 16
gLevelValues.exitCastleArea = 1
gLevelValues.exitCastleWarpNode = 10
gBehaviorValues.trajectories.KoopaBobTrajectory = get_trajectory("KoopaBoB_path")
gBehaviorValues.trajectories.KoopaThiTrajectory = get_trajectory("KoopaTHI_path")
gBehaviorValues.KingBobombFVel = 4.0
gBehaviorValues.KingBobombYawVel = 384
gBehaviorValues.KingBobombHealth = 5
gBehaviorValues.KingWhompHealth = 5
gBehaviorValues.KoopaThiAgility = 6.0
gBehaviorValues.KoopaBobAgility = 12.0
gBehaviorValues.MipsStar1Requirement = 15
gBehaviorValues.MipsStar2Requirement = 50
gBehaviorValues.ToadStar1Requirement = 15
gBehaviorValues.ToadStar2Requirement = 40
gBehaviorValues.ToadStar3Requirement = 70

hook_event(HOOK_GET_STAR_COLLECTION_DIALOG, function () return 0 end)