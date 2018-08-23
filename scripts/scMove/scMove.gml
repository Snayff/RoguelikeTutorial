///@desc move entity
///@param entity
///@param xMovement
///@param yMovement
 
var _entity = argument0;
var _x = argument1;
var _y = argument2;

var _targetX = (_entity.startingGridX + _x);
var _targetY = (_entity.startingGridY + _y);
var _test = ds_grid_get(oControllerTile.tileGrid, _targetX, _targetY);
//var _tileGridValue = oControllerTile.tileGrid[_targetX, _targetY];

scDebugMsg("MOVE:") ;

//check if trying to move outside of array
if _targetX > 0 || _targetX < ds_grid_width(oControllerTile.tileGrid)  || _targetY > 0 || _targetY < ds_grid_height(oControllerTile.tileGrid) {
	//check if tile is NOT ISBLOCKINGMOVEMENT
	if _test & ISBLOCKINGMOVEMENT == 0{
	//if oControllerTile.tileGrid[ _targetY, _targetX] & ISBLOCKINGMOVEMENT = 0 {
		//check if another entity is in the way
		if ds_grid_get(oControllerEntity.entityGrid,_targetX, _targetY) == 0 {
		
		//if oControllerEntity.entityGrid[ _targetY, _targetX] == 0 {
		
			//no entity in the way so move
			scDebugMsg("startY: ", _entity.startingGridY, " startX: ", _entity.startingGridX );
			scDebugMsg("targetY: ", _targetY," targetX: ",_targetX );
			//show_debug_message("startingArrayValueBeforeMove: " +  string(oControllerEntity.entityGrid[ _entity.startingGridY, _entity.startingGridX]))
			scDebugMsg("startingArrayValueBeforeMove: ", ds_grid_get(oControllerEntity.entityGrid, _entity.startingGridX, _entity.startingGridY));
		
			//remove entity from current position in entityGrid
			ds_grid_set(oControllerEntity.entityGrid, _entity.startingGridX, _entity.startingGridY, 0);
			//oControllerEntity.entityGrid[ _entity.startingGridY, _entity.startingGridX] = 0;
		
			//show_debug_message("startingArrayValueAfterMove: " +  string(oControllerEntity.entityGrid[ _entity.startingGridY, _entity.startingGridX]))
			scDebugMsg("startingArrayValueAfterMove: ", ds_grid_get(oControllerEntity.entityGrid, _entity.startingGridX, _entity.startingGridY));
			
			//add entity to new position in array
			//oControllerEntity.entityGrid[ _targetY, _targetX] = _entity;
			ds_grid_set(oControllerEntity.entityGrid, _targetX, _targetY, _entity);
		
			//move entity
			_entity.x = _targetX * TILESIZE;
			_entity.y = _targetY * TILESIZE;
		
			//update startingGrid* vars
			_entity.startingGridX = _targetX;
			_entity.startingGridY = _targetY;
		} else {
			//bump attack
			//show_debug_message("An entity (" + string(oControllerEntity.entityGrid[ _targetY, _targetX]) + ") is blocking the target location.")	;
			scDebugMsg("An entity (", ds_grid_get(oControllerEntity.entityGrid, _targetX, _targetY), ") is blocking the target location [",_targetX, ",", _targetY, "].");

		}

	} else {
		scDebugMsg("A tile is blocking the target location [",_targetX, ",", _targetY, "]." )	;
		
	}
} else {
	scDebugMsg("The target location exceeds the map limits [",_targetX, ",", _targetY, "].")	;
}