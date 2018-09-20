/// @desc
scDebugMsg("CREATE CONTROLLER UI:");

incrementY = 0;
incrementX = 0;

var _camHeight = oControllerCamera.cameraHeight;
var _camWidth = oControllerCamera.cameraWidth;

logBackColour = c_black;
logOutlineColour = c_white;
logAlpha = 0.5;
edgeSize = 5;
logWidth = 180;
logHeight = 140;
logStartX = 0 + edgeSize; 
logStartY = oControllerCamera.cameraHeight - logHeight - edgeSize;
tileBoxWidth = 115;
tileBoxHeight = 50;
tileBoxStartX = oControllerCamera.cameraWidth - tileBoxWidth - edgeSize;
tileBoxStartY = oControllerCamera.cameraHeight - tileBoxHeight -  edgeSize;
infoBoxWidth = tileBoxWidth;
infoBoxHeight = 90;
infoBoxStartX = oControllerCamera.cameraWidth - tileBoxWidth - edgeSize;
infoBoxStartY = oControllerCamera.cameraHeight - infoBoxHeight - tileBoxHeight - edgeSize;
resourceBarWidth = 120;
resourceBarHeight = 20;
resourceBarStartX = logWidth + (edgeSize * 2);
resourceBarStartY = oControllerCamera.cameraHeight - resourceBarHeight -  edgeSize;
resourceBackColour = c_black;

//instance_create_depth(logStartX + 2, logStartY,0,oExample);


maxLogLines = 10;
stringArrayCounter = 0;
stringArray[0] = "Welcome to Roguelike Tutorial";
//stringArray[0] = "Welcome to [c_orange]Roguelike Tutorial[]";
newMessageAdded = false;
messageString = ""; 
runOverLines = 0;


//build first X lines from array from start position
for (var _i = 0; _i < min(array_length_1d(stringArray), maxLogLines - runOverLines); _i++) {
	if string_width(string(stringArray[_i ])) > logWidth {
		runOverLines++;	
	}
	messageString = messageString + string(stringArray[_i ]) + "\n" ;
}

//scribble_destroy( oExample.json );
//oExample.json = scribble_create( _string, 235, "spSpriteFont", fa_left, make_colour_hsv( 35, 140, 210 ) );
