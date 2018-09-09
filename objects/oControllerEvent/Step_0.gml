/// @desc process events queue

//if there are events in the queue process them
if !ds_map_empty(oControllerEvent.eventQueue){
	scProcessEvents();
}