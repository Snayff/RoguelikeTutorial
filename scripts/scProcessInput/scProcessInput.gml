///@desc interpret keypresses and convert to events

var _player = oControllerEntity.player;

//game functions
if inpCancel == true {
	game_end()
}
if inpFullScreen == true {
	switch window_get_fullscreen() {
		case false:
			window_set_fullscreen(1);
			break;
		case true:
			window_set_fullscreen(0);
			break;
	}

	oControllerView.alarm[0] = 1; // recenters display
}


if global.currentGameState == gameState.playerTurn {
	// attempt movement
	if inpRight == true {
		scEntityAttemptMove(_player, 1, 0);
	} else if inpLeft == true {
		scEntityAttemptMove(_player, -1, 0);	
	} else if inpUp == true {
		scEntityAttemptMove(_player, 0, -1);
	} else if inpDown == true {
		scEntityAttemptMove(_player, 0, 1);	
	} else if inpUpRight == true {
		scEntityAttemptMove(_player, 1, -1);	
	} else if inpUpLeft == true {
		scEntityAttemptMove(_player, -1, -1);	
	} else if inpDownRight == true {
		scEntityAttemptMove(_player, 1, 1);	
	} else if inpDownLeft == true {
		scEntityAttemptMove(_player, -1, 1);	
	}
}
