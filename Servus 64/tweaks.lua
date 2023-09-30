gLevelValues.entryLevel = LEVEL_CASTLE
gLevelValues.exitCastleLevel = 6
gLevelValues.exitCastleArea = 1
gLevelValues.exitCastleWarpNode = 31
gBehaviorValues.KingBobombFVel = 3.0
gBehaviorValues.KingBobombYawVel = 256
gBehaviorValues.KingBobombHealth = 3
gBehaviorValues.KingWhompHealth = 3
gBehaviorValues.KoopaThiAgility = 6.0
gBehaviorValues.KoopaBobAgility = 4.0
gBehaviorValues.trajectories.KoopaBobTrajectory = get_trajectory("KoopaBoB_path")
gBehaviorValues.trajectories.KoopaThiTrajectory = get_trajectory("KoopaTHI_path")

hook_event(HOOK_GET_STAR_COLLECTION_DIALOG, function () return 0 end)