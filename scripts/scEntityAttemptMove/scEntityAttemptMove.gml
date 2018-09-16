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
			_otherEntity = ds_grid_get(oControllerEntity.entityGrid,_targetX, _targetY)
			
			//is it an entity blocking movement
			if _otherEntity.isBlockingMovement {
				
				oControllerEvent.eventQueue[? "attack"] = _otherEntity;
				
			} else {
				var _move;
				_move[0] = _targetX;
				_move[1] = _targetY;
				oControllerEvent.eventQueue[? "move"] = _move; 
			}
		}
	} else {
		scDebugMsg("A tile is blocking the target location [",_targetX, ",", _targetY, "]." );
		if _entity.name <> "player" {
			scIncrementTurn();
		}
	}
} else {
	scDebugMsg("The target location exceeds the map limits [",_targetX, ",", _targetY, "].");
}