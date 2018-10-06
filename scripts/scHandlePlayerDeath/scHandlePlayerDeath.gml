///@desc handle player death

//change sprite colour
var _player = oControllerEntity.player;
_player.image_blend = c_red;
var _msg = "You have died.";

scAddMessageToEventQueue(_msg);

scUpdateGameState(gameState.playerDead);
