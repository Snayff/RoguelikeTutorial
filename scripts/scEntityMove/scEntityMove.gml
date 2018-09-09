///@desc move entity to new tile
///@param entity entity to move
///@param targetX tile X to move to 
///@param targetY tile Y to move to 

var _entity = argument0;
var _targetX = argument1;
var _targetY = argument2;

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
