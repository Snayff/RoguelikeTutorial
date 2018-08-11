///@desc interpret input

var _player = oControllerEntity.player;
//get input values
scGetInput();

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

	oViewController.alarm[0] = 1; // recenters display
}

//movement
if inpRight == true {
	scMove(_player, 1, 0);
} else if inpLeft == true {
	scMove(_player, -1, 0);	
} else if inpUp == true {
	scMove(_player, 0, -1);
} else if inpDown == true {
	scMove(_player, 0, 1);	
}

