///@desc handle player death

//change sprite colour
var _player = oControllerEntity.player;
_player.image_blend = c_red;
var _message = "You have died.";

oControllerEvent.eventQueue[? "message"] = _message;

global.currentGameState = gameState.playerDead;
