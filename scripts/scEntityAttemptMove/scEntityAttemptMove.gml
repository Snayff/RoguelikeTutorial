///@desc attempt to move entity and take appropriate action
///@param entity
///@param xMovement
///@param yMovement
 
var _entity = argument0;
var _x = argument1;
var _y = argument2;

var _targetX = (_entity.startingGridX + _x);
var _targetY = (_entity.startingGridY + _y);
var _tileGridValue = ds_grid_get(oControllerTile.tileGrid, _targetX, _targetY);
var _otherEntity = -1;

scDebugMsg("MOVE:") ;

//check if trying to move outside of array
if _targetX > 0 || _targetX < ds_grid_width(oControllerTile.tileGrid)  || _targetY > 0 || _targetY < ds_grid_height(oControllerTile.tileGrid) {
	//check if tile is NOT ISBLOCKINGMOVEMENT
	if _tileGridValue & ISBLOCKINGMOVEMENT == 0{
		//check if another entity is in the way
		if !scCheckIfEntityOccupiesTile(_targetX, _targetY) {
			//move the entity to the new tile
			var _move;
			_move[0] = _targetX;
			_move[1] = _targetY;
			oControllerEvent.eventQueue[? "move"] = _move; 
			
			scDebugMsg("An entity (", ds_grid_get(oControllerEntity.entityGrid, _targetX, _targetY), ") moved to [", _targetX, ",", _targetY, "]");
			
		} else { // another entity is in target location
			var _entityListAtPosition = ds_grid_get(oControllerEntity.entityGrid,_targetX, _targetY)
			
			//check all entities in that tile
			for ( var _i = 0; _i <= ds_list_size(_entityListAtPosition); _i++)  {
				_otherEntity = ds_list_find_value(_entityListAtPosition, _i);
				
				//check entity exists
				if !is_undefined(_otherEntity) {
					var _hasBlockMovement = variable_instance_exists(_otherEntity, "isBlockingMovement");
					var _blockingEntityFound = false;
				
					//if they entity has the right variable to check
					if _hasBlockMovement {
						//check if it is blocking us
						if _otherEntity.isBlockingMovement {
							oControllerEvent.eventQueue[? "attack"] = _otherEntity;
							_blockingEntityFound = true;
							break; //only one thing can block a space so if we found it leave the loop
						} 
					}
				}
			}
			
			//didnt find anything blocking the space so move to it
			if _blockingEntityFound == false {
				var _move;
				_move[0] = _targetX;
				_move[1] = _targetY;
				oControllerEvent.eventQueue[? "move"] = _move; 
			}
			
		}
	} else {
		scDebugMsg("A tile is blocking the target location [",_targetX, ",", _targetY, "]." );
		//when ai tries to walk into tile it just keeps trying if we dont increment
		//***update to force AI to try another direction
		if _entity.name <> "player" {
			scIncrementTurn();
		}
	}
} else {
	scDebugMsg("The target location exceeds the map limits [",_targetX, ",", _targetY, "].");
}