///@desc process events in events queue

var _entity = oControllerEntity.turnHolder;
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
	
	scAttack(_entity, _attack);
	ds_map_delete(oControllerEvent.eventQueue, "attack");
	
	scDebugMsg("Attack event processed");
	scIncrementTurn();
}
#endregion

#region dead
//if dead  has a value
if !is_undefined(_dead) {
	
	//who died?
	if _entity == oControllerEntity.player {
		scHandlePlayerDeath();
	} else {
		scHandleMonsterDeath(_entity);		
	}
	
	ds_map_delete(oControllerEvent.eventQueue, "dead");
	
	scDebugMsg("Dead event processed");
}

#endregion

#region message
//if message  has a value
if !is_undefined(_message) {
	
	
	ds_map_delete(oControllerEvent.eventQueue, "message");
	
	scDebugMsg("Message event processed");
}

#endregion








	