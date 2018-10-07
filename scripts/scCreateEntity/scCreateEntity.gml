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
scAddEntityToTile(_entity, _creationX, _creationY);

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
_entity.sprite_index = scGetEntityStat(_entityNumber, actorStat.sprite); 
_entity.image_index  = scGetEntityStat(_entityNumber, actorStat.subimage);
_entity.image_blend	 = scGetEntityStat(_entityNumber, actorStat.colour );
_entity.isBlockingMovement = scGetEntityStat(_entityNumber, actorStat.blocksMovement );
_entity.depthPosition = depthPosition.living

if _entityNumber <> entityNumber.healingPotion {
	
	_entity.fighter = scGetEntityStat(_entityNumber, actorStat.fighter);
	_entity.ai = scGetEntityStat(_entityNumber, actorStat.ai );
	_entity.hp = scGetEntityStat(_entityNumber, actorStat.maxHp);
	_entity.maxHp = scGetEntityStat(_entityNumber, actorStat.maxHp );
	_entity.strength = scGetEntityStat(_entityNumber, actorStat.strength );
	_entity.defense = scGetEntityStat(_entityNumber, actorStat.defense );

	//run intialisation scripts
	if _entity.fighter <> false {
		with _entity {
			//script_execute(_entity.fighter);		
			//scComponentFighter(); //***need to amend componenent structure to handle intialisation scripts
		}
	}
	if _entity.inventory <> false {
		with _entity {
			//script_execute(_entity.inventory);		
			scComponentInventory();
		}
	}
}

