///@desc add message to event queue
///@param message 

var _msg = argument0;

if ds_map_exists(oControllerEvent.eventQueue, "message") {
	oControllerEvent.eventQueue[? "message"] = oControllerEvent.eventQueue[? "message"] + " " + _msg;	
} else {
	oControllerEvent.eventQueue[? "message"] = _msg;	
}
