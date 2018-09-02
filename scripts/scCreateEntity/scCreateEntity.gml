///@desc create entity in world and add to data structures
///@param creationX tile X to create entity
///@param creationY tile Y to create entity
///@param entityName entity's name from enum

var _creationX = argument0;
var _creationY = argument1;
var _entityName = argument2;
var _entityObject = -1;
var _entity = -1;

//check if creating player as player has different object
if _entityName == entityName.player {
	_entityObject = oPlayer;
} else {
	_entityObject = oNpc;	
}

//create entity instance
_entity = instance_create_depth(scConvertToXY(_creationX), scConvertToXY(_creationY), -100, _entityObject );

scDebugMsg("Entity ", _entityName, " created at [",_creationX , ",", _creationY, "].");

//add to entityList
ds_list_add(oControllerEntity.entityList, _entity);

//add to entityGrid
ds_grid_set(oControllerEntity.entityGrid, _creationX, _creationY, _entity);

if _entityName == entityName.player {
	oControllerEntity.player = ds_list_find_value(oControllerEntity.entityList, 0);
	_entity.name = _entityName;
} else { 
	//add entity name to allow populating of stats, sprite etc.
	_entity.name = _entityName;
} 

//provide entity with initial info
_entity.startingGridX =_creationX;
_entity.startingGridY = _creationY;
_entity.endingGridX = _creationX;
_entity.endingGridY = _creationY;
_entity.isBlockingMovement = true;
_entity.sprite_index = ds_grid_get(oControllerEntity.entityStartingInfoGrid, entityStartingInfo.sprite , _entityName );
_entity.image_index  = ds_grid_get(oControllerEntity.entityStartingInfoGrid, entityStartingInfo.subimage , _entityName );
_entity.image_blend	 = ds_grid_get(oControllerEntity.entityStartingInfoGrid, entityStartingInfo.colour , _entityName );


