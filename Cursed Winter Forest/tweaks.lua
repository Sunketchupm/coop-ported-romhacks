gLevelValues.entryLevel = LEVEL_CASTLE_GROUNDS
gLevelValues.exitCastleLevel = 16
gLevelValues.exitCastleArea = 1
gLevelValues.exitCastleWarpNode = 10

hook_event(HOOK_GET_STAR_COLLECTION_DIALOG, function () return 0 end)