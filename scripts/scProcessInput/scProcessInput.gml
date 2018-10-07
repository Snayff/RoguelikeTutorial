///@desc interpret keypresses and convert to events

var _player = oControllerEntity.player;

//handle controls based on game state
if global.currentGameState == gameState.playerTurn{
	#region player turn
	
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

	//pickup item
	if inpPickup {
		scAttemptPickupItem(_player);
	}

	//show inventory
	if inpShowInventory {
		oControllerMenu.activeMenu = menuNumber.inventory; //update to show inventory menu
		scUpdateGameState(gameState.showMenu);	//update game state
		
	}
	
	//select tile
	if inpSelect {
		oControllerUI.showTileSelect = true;
		oControllerTile.tileSelectedX = scConvertToTile(mouse_x);
		oControllerTile.tileSelectedY = scConvertToTile(mouse_y);
	}
	#endregion	

} else if global.currentGameState == gameState.showMenu {
	
	#region  showMenu
	//show inventory
	if inpShowInventory {
		scRevertToPreviousGameState();	//update game state to whatever it was before we showed inventory
	}

	#endregion

} 

//handle game state agnostic controls
#region  unviersal controls

//exit game
if inpCancel == true {
	game_end()
}

//full screen
if inpFullScreen == true {
	
	switch window_get_fullscreen() {
		case false:
			window_set_fullscreen(1);
			break;
		case true:
			window_set_fullscreen(0);
			break;
	}

	oControllerCamera.alarm[0] = 1; // recenters display
}

#endregion
