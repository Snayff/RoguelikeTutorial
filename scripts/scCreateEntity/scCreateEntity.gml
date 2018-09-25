///@desc create entity in world and add to data structures
///@param creationX -  tile X to create entity
///@param creationY tile -  Y to create entity
///@param {real} entityNumber - entity's name from enum


var _creationX = argument[0];
var _creationY = argument[1];
var _entityNumber = argument[2];

var _entityObject = -1;
var _entity = -1;

//check if creating player as player has different object
if _entityNumber == entityNumber.player {
	_entityObject = oPlayer;
} else if _entityNumber == entityNumber.healingPotion {
	_entityObject = oItem;	
}else  {
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
}  else if _entityNumber == entityNumber.healingPotion {
	_entity.name  = "healing potion";
} else {
	_entity.name = choose("steve", "bob", "dave");	
}

//provide entity with initial info
_entity.number = _entityNumber; //add entity name to allow populating of stats, sprite etc.
_entity.startingGridX =_creationX;
_entity.startingGridY = _creationY;
_entity.endingGridX = _creationX;
_entity.endingGridY = _creationY;
_entity.sprite_index = ds_grid_get(oControllerEntity.actorStatGrid, actorStat.sprite , _entityNumber );
_entity.image_index  = ds_grid_get(oControllerEntity.actorStatGrid, actorStat.subimage , _entityNumber );
_entity.image_blend	 = ds_grid_get(oControllerEntity.actorStatGrid, actorStat.colour , _entityNumber );
_entity.isBlockingMovement = ds_grid_get(oControllerEntity.actorStatGrid, actorStat.blocksMovement , _entityNumber );
_entity.depthPosition = depthPosition.living

if _entityNumber <> entityNumber.healingPotion {
	
	_entity.fighter = ds_grid_get(oControllerEntity.actorStatGrid, actorStat.fighter , _entityNumber );
	_entity.ai = ds_grid_get(oControllerEntity.actorStatGrid, actorStat.ai, _entityNumber );
	_entity.hp = ds_grid_get(oControllerEntity.actorStatGrid, actorStat.maxHp , _entityNumber );
	_entity.maxHp = ds_grid_get(oControllerEntity.actorStatGrid, actorStat.maxHp , _entityNumber );
	_entity.strength = ds_grid_get(oControllerEntity.actorStatGrid, actorStat.strength, _entityNumber );
	_entity.defense = ds_grid_get(oControllerEntity.actorStatGrid, actorStat.defense , _entityNumber );

	//run intialisation scripts
	if _entity.fighter <> false {
		with _entity {
			script_execute(_entity.fighter);		
		}
	}

}

