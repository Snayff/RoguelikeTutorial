/// @desc draw required menu



//if should be showing a menu
if global.currentGameState == gameState.showMenu {
	


	//draw plain background
	//scDrawWindow(0,0, _screenWidth, _screenHeight, c_black, c_white, 1);

	//draw menu window
	scDrawWindow(menuStartX, menuStartY, menuWidth, menuHeight, menuBackColour, menuOutlineColour, menuAlpha );


	
	//which menu to draw?
	switch activeMenu {
	
		case menuNumber.inventory :
			scDrawMenuInventory()
			break;
	
	
	}

}