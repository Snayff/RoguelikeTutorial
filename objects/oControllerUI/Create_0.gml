/// @desc
scDebugMsg("CREATE CONTROLLER UI:");


edgeSize = 10;
logWidth = 240;
logHeight = 180;
logStartX = oControllerCamera.cameraWidth - logWidth - edgeSize;
logStartY = oControllerCamera.cameraHeight - logHeight - edgeSize;
logBackColour = c_black;
logOutlineColour = c_white;
logAlpha = 0.5;

//instance_create_depth(logStartX + 2, logStartY,0,oExample);


maxLogLines = 13;
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
