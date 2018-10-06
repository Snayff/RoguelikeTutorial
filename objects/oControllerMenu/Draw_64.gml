/// @desc draw required menu

var _screenHeight = oControllerCamera.idealHeight;
var _screenWidth = oControllerCamera.idealWidth;

//draw plain background
scDrawWindow(0,0, _screenWidth, _screenHeight, c_black, c_white, 1);

//if should be showing a menu
if global.currentGameState == gameState.showMenu {
	
	//which menu to draw?
	switch activeMenu {
	
		case menuNumber.inventory :
			scDrawMenuInventory()
			break;
	
	
	}

}