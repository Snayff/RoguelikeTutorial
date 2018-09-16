///@desc process events in events queue

scDebugMsg("PROCESS EVENT QUEUE");

var _entity = oControllerEntity.turnHolder;

while !ds_map_empty(oControllerEvent.eventQueue) {

	var _move = oControllerEvent.eventQueue[? "move"]; // array [xTile, yTile]
	var _attack = oControllerEvent.eventQueue[? "attack"]; //defending entity
	var _dead = oControllerEvent.eventQueue[? "dead"]; //dead entity
	var _message = oControllerEvent.eventQueue[? "message"]; //string to show in log


	#region move
	//if move has a value
	if !is_undefined(_move) {
	
		scEntityMove(_entity, _move[0], _move[1]);
		ds_map_delete(oControllerEvent.eventQueue, "move");
	
		scDebugMsg("Move event processed");
		scIncrementTurn();
	}
	#endregion

	#region attack
	//if attack has a value
	if !is_undefined(_attack) {
		scDebugMsg("about to process Attack event");
		scAttack(_entity, _attack);
		ds_map_delete(oControllerEvent.eventQueue, "attack");
	
		scDebugMsg("Attack event processed");
		scIncrementTurn();
	}
	#endregion

	#region dead
	//if dead  has a value
	if !is_undefined(_dead) {
	
		scDebugMsg("about to process Dead event");
		//who died?
		if _dead == oControllerEntity.player {
			scHandlePlayerDeath();
		} else {
			scHandleMonsterDeath(_dead);		
		}
	
		ds_map_delete(oControllerEvent.eventQueue, "dead");
	
		scDebugMsg("Dead event processed");
	}

	#endregion

	#region message
	//if message  has a value
	if !is_undefined(_message) {
	
		scDebugMsg("about to process Message event");
	
		var _arrayLength = array_length_1d(oControllerUI.stringArray);
		oControllerUI.stringArray[_arrayLength] = oControllerEvent.eventQueue[? "message"]; //use this instead of temp as may have been updated since
		oControllerUI.newMessageAdded = true;
		ds_map_delete(oControllerEvent.eventQueue, "message");
	
		scDebugMsg("Message event processed");
	}

	#endregion

}