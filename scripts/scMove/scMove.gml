///@desc move entity
///@param entity
///@param xMovement
///@param yMovement
 
var _entity = argument0;
var _x = argument1;
var _y = argument2;

var _targetX = (_entity.startingGridX + _x);
var _targetY = (_entity.startingGridY + _y);
var _tileGridValue = ds_grid_get(oControllerTile.tileGrid, _targetX, _targetY);

scDebugMsg("MOVE:") ;

//check if trying to move outside of array
if _targetX > 0 || _targetX < ds_grid_width(oControllerTile.tileGrid)  || _targetY > 0 || _targetY < ds_grid_height(oControllerTile.tileGrid) {
	//check if tile is NOT ISBLOCKINGMOVEMENT
	if _tileGridValue & ISBLOCKINGMOVEMENT == 0{
		//check if another entity is in the way
		if ds_grid_get(oControllerEntity.entityGrid,_targetX, _targetY) == 0 {
		
			//no entity in the way so move
			//scDebugMsg("startY: ", _entity.startingGridY, " startX: ", _entity.startingGridX );
			//scDebugMsg("targetY: ", _targetY," targetX: ",_targetX );
			//scDebugMsg("startingArrayValueBeforeMove: ", ds_grid_get(oControllerEntity.entityGrid, _entity.startingGridX, _entity.startingGridY));
		
			//remove entity from current position in entityGrid
			ds_grid_set(oControllerEntity.entityGrid, _entity.startingGridX, _entity.startingGridY, 0);
		
			//scDebugMsg("startingArrayValueAfterMove: ", ds_grid_get(oControllerEntity.entityGrid, _entity.startingGridX, _entity.startingGridY));
			
			//add entity to new position in array
			ds_grid_set(oControllerEntity.entityGrid, _targetX, _targetY, _entity);
		
			//move entity
			_entity.x = scConvertToXY(_targetX);
			_entity.y = scConvertToXY(_targetY);
			
			
			//update endingGrid* vars
			_entity.endingGridX = _targetX;
			_entity.endingGridY = _targetY;
			
			scDebugMsg("An entity (", ds_grid_get(oControllerEntity.entityGrid, _targetX, _targetY), ") moved to [", _targetX, ",", _targetY, "]");
		} else {
			//bump attack
			scDebugMsg("An entity (", ds_grid_get(oControllerEntity.entityGrid, _targetX, _targetY), ") is blocking the target location [",_targetX, ",", _targetY, "].");

		}

	} else {
		scDebugMsg("A tile is blocking the target location [",_targetX, ",", _targetY, "]." )	;
		
	}
} else {
	scDebugMsg("The target location exceeds the map limits [",_targetX, ",", _targetY, "].")	;
}