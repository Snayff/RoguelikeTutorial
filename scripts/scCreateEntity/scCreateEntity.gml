///@desc create entity in world and add to data structures
///@param creationX -  tile X to create entity
///@param creationY tile -  Y to create entity
///@param {real} entityNumber - entity's name from enum
///@param {bool} blocksMovement -  entity blocks movement
///@param *componentFighter - fighter component to include
///@param *ai entity - AI

var _creationX = argument[0];
var _creationY = argument[1];
var _entityNumber = argument[2];
var _blocksMovement = argument[3];
var _componentFighter = -1; //arg 4
var _ai = -1; //arg5

//optional arguments
if argument_count > 3 {
	if argument[4] <> -1 {
		_componentFighter = argument[4];
	}
}
if argument_count > 4 {
	if argument[5] <> -1 {
		_ai = argument[5];
	}
}

var _entityObject = -1;
var _entity = -1;

//check if creating player as player has different object
if _entityNumber == entityNumber.player {
	_entityObject = oPlayer;
} else {
	_entityObject = oActor;	
}

//create entity instance
_entity = instance_create_depth(scConvertToXY(_creationX), scConvertToXY(_creationY), -100, _entityObject );

scDebugMsg("Entity ", _entityNumber, " created at [",_creationX , ",", _creationY, "].");

//add to entityList
ds_list_add(oControllerEntity.entityList, _entity);

//add to entityGrid
ds_grid_set(oControllerEntity.entityGrid, _creationX, _creationY, _entity);

//assign player instance ID to player variable
if _entityNumber == entityNumber.player {
	oControllerEntity.player = ds_list_find_value(oControllerEntity.entityList, 0);
	oControllerEntity.turnHolder = ds_list_find_value(oControllerEntity.entityList, 0);
	_entity.name = "player";
}  else {
	_entity.name = choose("steve", "bob", "dave");	
}

//provide entity with initial info
_entity.number = _entityNumber; //add entity name to allow populating of stats, sprite etc.
_entity.startingGridX =_creationX;
_entity.startingGridY = _creationY;
_entity.endingGridX = _creationX;
_entity.endingGridY = _creationY;
_entity.isBlockingMovement = _blocksMovement;
_entity.depthPosition = depthPosition.living
_entity.fighter = _componentFighter;
_entity.ai = _ai;
_entity.sprite_index = ds_grid_get(oControllerEntity.entityStartingInfoGrid, entityStartingInfo.sprite , _entityNumber );
_entity.image_index  = ds_grid_get(oControllerEntity.entityStartingInfoGrid, entityStartingInfo.subimage , _entityNumber );
_entity.image_blend	 = ds_grid_get(oControllerEntity.entityStartingInfoGrid, entityStartingInfo.colour , _entityNumber );

//run intialisation scripts
if _componentFighter <> -1 {
	with _entity {
		script_execute(_componentFighter);		
	}
}