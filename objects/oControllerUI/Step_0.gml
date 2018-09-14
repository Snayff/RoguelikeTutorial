/// @desc
//in step, if more line than max increment string being built, one line at a time - how do we know when fully rendered?
//if rendered all of previous
//if incrementing wont end up with empty lines
// if there are more lines in array than we are up to

var _scribLength = scribble_get_length( oExample.json );
var _arrayLength = array_length_1d(stringArray);
if oExample.char_pos == _scribLength && (stringArrayCounter + maxLogLines) < _arrayLength && _arrayLength > stringArrayCounter {
	var _lineRemovedLength = string_length(string( stringArray[stringArrayCounter]));
	var _string = "";
	stringArrayCounter++;
	for (var _i = 0; _i < maxLogLines; _i++) {
		_string = _string + stringArray[_i + stringArrayCounter ] + "\n" ;
	}
	scribble_destroy( oExample.json );
	oExample.char_pos -= _lineRemovedLength;
	oExample.json = scribble_create( _string, 235, "spSpriteFont", fa_left, make_colour_hsv( 35, 140, 210 ) );
}