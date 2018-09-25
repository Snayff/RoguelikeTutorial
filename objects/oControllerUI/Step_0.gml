/// @desc msg log, show tile select, 


#region message log
//var _scribLength = scribble_get_length( oExample.json );
var _arrayLength = array_length_1d(stringArray);
var _string = "";

//if rendered all of previous message
//if oExample.char_pos == _scribLength && newMessageAdded {
if newMessageAdded {
	
	//if room left in log to show more
	if _arrayLength < maxLogLines - runOverLines {
		runOverLines = 0; //reset counter
		messageString = "";
		
		for (var _i = 0; _i < min(array_length_1d(stringArray), maxLogLines - runOverLines); _i++) {
			if string_width(string(stringArray[_i ])) > logWidth {
				runOverLines++;	
			}
			messageString = messageString + string(stringArray[_i ]) + "\n" ;
		}	
		
	} else if (stringArrayCounter + maxLogLines) - runOverLines < _arrayLength && _arrayLength > stringArrayCounter { //if incrementing wont end up with empty lines && if there are more lines in array than we are up to
		
		//var _lineRemovedLength = string_length(string( stringArray[stringArrayCounter]));
		runOverLines = 0; //reset counter
		messageString = "";
		stringArrayCounter++;
			
		for (var _i = 0; _i < maxLogLines - runOverLines; _i++) {
			if string_width(string(stringArray[_i ])) > logWidth {
				runOverLines++;	
			}
			
			//_string = _string + string(stringArray[_i + stringArrayCounter ]) + "\n" ;
			messageString = messageString + string(stringArray[_i + stringArrayCounter ]) + "\n" ;
		}
			
		//oExample.char_pos -= _lineRemovedLength; // go back enough to render new text
	}  
	
	//delete and recreate json
	//scribble_destroy( oExample.json );
	//oExample.json = scribble_create( _string, 235, "spSpriteFont", fa_left, make_colour_hsv( 35, 140, 210 ) );
	
	//turn flag off
	newMessageAdded = false
}
#endregion


if oControllerEntity.player.movedThisTurn {
	showTileSelect = false;	
	
}