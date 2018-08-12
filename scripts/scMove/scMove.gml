///@desc move entity
///@param entity
///@param xMovement
///@param yMovement

var _entity = argument0;
var _x = argument1;
var _y = argument2;

var _targetX = (_entity.startingGridX + _x);
var _targetY = (_entity.startingGridY + _y);

show_debug_message("MOVE:") ;

//check if tile is NOT isBlockingMovement
if oControllerTile.tileArray[ _targetY, _targetX] & oControllerTile.isBlockingMovement = 0 {
	//check if another entity is in the way
	if oControllerEntity.entityArray[ _targetY, _targetX] == 0 {
		
		show_debug_message("startY: " + string(_entity.startingGridY) + " startX: " + string(_entity.startingGridX) );
		show_debug_message("targetY: " + string(_targetY) + " targetX: " + string(_targetX) );
		show_debug_message("startingArrayValueBeforeMove: " +  string(oControllerEntity.entityArray[ _entity.startingGridY, _entity.startingGridX]))
		
		
		//remove entity from current position in entityArray
		oControllerEntity.entityArray[ _entity.startingGridY, _entity.startingGridX] = 0;
		
		show_debug_message("startingArrayValueAfterMove: " +  string(oControllerEntity.entityArray[ _entity.startingGridY, _entity.startingGridX]))
		
		//add entity to new position in array
		oControllerEntity.entityArray[ _targetY, _targetX] = _entity;
		
		//move entity
		_entity.x = _targetX * TILESIZE;
		_entity.y = _targetY * TILESIZE;
		
		//update startingGrid* vars
		_entity.startingGridX = _targetX;
		_entity.startingGridY = _targetY;
	} else {
		show_debug_message("An entity (" + string(oControllerEntity.entityArray[ _targetY, _targetX]) + ") is blocking the target location.")	;
	}

} else {
	show_debug_message("A tile is blocking the target location.")	;
}
