gLevelValues.entryLevel = LEVEL_CASTLE_GROUNDS
gLevelValues.exitCastleLevel = 16
gLevelValues.exitCastleArea = 1
gLevelValues.exitCastleWarpNode = 10

gLevelValues.wingCapDuration = 360
gLevelValues.coinsRequiredForCoinStar = 0

hook_event(HOOK_GET_STAR_COLLECTION_DIALOG, function () return 0 end)

gLevelValues.disableActs = true
hook_event(HOOK_USE_ACT_SELECT, function () return false end)