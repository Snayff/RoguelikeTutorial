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

//check if trying to move outside of array
if _targetX > 0 || _targetX < array_length_2d(oControllerTile.tileArray, _targetY)  || _targetY > 0 || _targetY < array_height_2d(oControllerTile.tileArray) {
	//check if tile is NOT ISBLOCKINGMOVEMENT
	if ds_grid_get(oControllerTile.tileArray, _targetY, _targetX) & ISBLOCKINGMOVEMENT == 0{
	//if oControllerTile.tileArray[ _targetY, _targetX] & ISBLOCKINGMOVEMENT = 0 {
		//check if another entity is in the way
		if ds_grid_get(oControllerEntity.entityArray,  _targetY, _targetX) == 0 {
		
		//if oControllerEntity.entityArray[ _targetY, _targetX] == 0 {
		
			//no entity in the way so move
			show_debug_message("startY: " + string(_entity.startingGridY) + " startX: " + string(_entity.startingGridX) );
			show_debug_message("targetY: " + string(_targetY) + " targetX: " + string(_targetX) );
			//show_debug_message("startingArrayValueBeforeMove: " +  string(oControllerEntity.entityArray[ _entity.startingGridY, _entity.startingGridX]))
			scDebugMsg("startingArrayValueBeforeMove: ", ds_grid_get(oControllerEntity.entityArray, _entity.startingGridX, _entity.startingGridY));
		
			//remove entity from current position in entityArray
			ds_grid_set(oControllerEntity.entityArray, _entity.startingGridX, _entity.startingGridY, 0);
			//oControllerEntity.entityArray[ _entity.startingGridY, _entity.startingGridX] = 0;
		
			//show_debug_message("startingArrayValueAfterMove: " +  string(oControllerEntity.entityArray[ _entity.startingGridY, _entity.startingGridX]))
			scDebugMsg("startingArrayValueAfterMove: ", ds_grid_get(oControllerEntity.entityArray, _entity.startingGridX, _entity.startingGridY));
			
			//add entity to new position in array
			//oControllerEntity.entityArray[ _targetY, _targetX] = _entity;
			ds_grid_set(oControllerEntity.entityArray, _targetX, _targetY, player);
		
			//move entity
			_entity.x = _targetX * TILESIZE;
			_entity.y = _targetY * TILESIZE;
		
			//update startingGrid* vars
			_entity.startingGridX = _targetX;
			_entity.startingGridY = _targetY;
		} else {
			//bump attack
			//show_debug_message("An entity (" + string(oControllerEntity.entityArray[ _targetY, _targetX]) + ") is blocking the target location.")	;
			scDebugMsg("An entity (", ds_grid_get(oControllerEntity.entityArray, _targetX, _targetY), ") is blocking the target location.");
		}

	} else {
		show_debug_message("A tile is blocking the target location.")	;
	}
} else {
	show_debug_message("The target location exceeds the map limits.")	;
}