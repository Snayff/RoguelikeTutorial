/// @desc
scDebugMsg("CREATE CONTROLLER UI:");

showTileSelect = false;

var _screenHeight = oControllerCamera.idealHeight;
var _screenWidth = oControllerCamera.idealWidth;
draw_set_font(fTestA);
fontHeight = string_height("0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM");
edgeSize = 5;

//Message Log
maxLogLines = 10;
logBackColour = c_black;
logOutlineColour = c_white;
logAlpha = 1; // 0.5;
logWidth = 180;
logHeight = (maxLogLines * fontHeight) + fontHeight + edgeSize ;
logStartX = 0 + edgeSize; 
logStartY = _screenHeight - logHeight - edgeSize;


//InfoBox - show entity info
infoBoxWidth = logWidth;
infoBoxHeight = logHeight * 0.6; 
infoBoxStartX = logStartX; 
infoBoxStartY = logStartY;

//TileBox - show tile info
tileBoxWidth = logWidth ;
tileBoxHeight = logHeight * 0.4; 
tileBoxStartX = logStartX;
tileBoxStartY = logStartY + infoBoxHeight;

//ResourceBar
resourceBarWidth = 120;
resourceBarHeight = 20;
resourceBarStartX = logWidth + (edgeSize * 2);
resourceBarStartY = _screenHeight - resourceBarHeight -  edgeSize;
resourceBackColour = c_black;


//Manage Message Log
stringArrayCounter = 0; //what is the starting point of the array to start showing in the log
stringArray[0] = "Welcome to Roguelike Tutorial";
newMessageAdded = true;
messageString = ""; 
runOverLines = 0; //lines of text that exceed line width and wrap to next line


//build first X lines from array from start position
for (var _i = 0; _i < min(array_length_1d(stringArray), maxLogLines - runOverLines); _i++) {
	if string_width(string(stringArray[_i ])) > logWidth {
		runOverLines++;	
	}
	messageString = messageString + string(stringArray[_i ]) + "\n" ;
}
