gLevelValues.exitCastleLevel = 16
gLevelValues.exitCastleArea = 1
gLevelValues.exitCastleWarpNode = 10
gLevelValues.entryLevel = LEVEL_CASTLE_GROUNDS

gLevelValues.metalCapDurationCotmc = -1 -- infinite

hook_event(HOOK_GET_STAR_COLLECTION_DIALOG, function () return 0 end)