/// @desc
scDebugMsg("CREATE CONTROLLER UI:");


var _edgeSize = 10;
var _logWidth = 240;
var _logHeight = 180;
var _logStartX = oControllerCamera.cameraWidth - _logWidth - _edgeSize;
var _logStartY = oControllerCamera.cameraHeight - _logHeight - _edgeSize;

instance_create_depth(_logStartX + 2,_logStartY,0,oExample);

/*
//create test string array
for (var _i = 1; _i < 20; _i++) {
	stringArray[_i - 1] = "Line" + string(_i);
}
*/

//build first X lines from array from start position
maxLogLines = 10;
stringArrayCounter = 0;
stringArray[0] = "Welcome to [c_orange]Roguelike Tutorial[]";
newMessageAdded = false;

var _string = "";

for (var _i = 0; _i < min(array_length_1d(stringArray), maxLogLines); _i++) {
	_string = _string + string(stringArray[_i ]) + "\n" ;
}

scribble_destroy( oExample.json );
oExample.json = scribble_create( _string, 235, "spSpriteFont", fa_left, make_colour_hsv( 35, 140, 210 ) );

/*
//in step, if more line than max increment string being built, one line at a time - how do we know when fully rendered?
//if rendered all of previous
//if incrementing wont end up with empty lines
// if there are more lines in array than we are up to
if oExample.char_pos == scribble_get_length( oExample.json ) && (stringArrayCounter + maxLogLines) < array_length_1d(stringArray) && array_length_1d(stringArray) > stringArrayCounter {
	_string = "";
	for (var _i = 0 + stringArrayCounter; _i < maxLogLines; _i++) {
		_string = _string + stringArray[_i ] + "\n" ;
	}
	scribble_destroy( oExample.json );
	oExample.json = scribble_create( _string, 235, "spSpriteFont", fa_left, make_colour_hsv( 35, 140, 210 ) );
}