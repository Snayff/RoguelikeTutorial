/// @desc populate msg log


#region message log
var _arrayLength = array_length_1d(stringArray);
var _string = "";

//if new messages to show
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
		
		runOverLines = 0; //reset counter
		messageString = "";
		stringArrayCounter++;
			
		for (var _i = 0; _i < maxLogLines - runOverLines; _i++) {
			if string_width(string(stringArray[_i ])) > logWidth {
				runOverLines++;	
			}
			
			messageString = messageString + string(stringArray[_i + stringArrayCounter ]) + "\n" ;
		}
	}  
	
	//turn flag off
	newMessageAdded = false
}
#endregion
