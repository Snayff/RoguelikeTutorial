///@desc handle monster death
///@param entity dead entity


var _entity = argument0;
var _entityNumber = _entity.number;
var _entityName = _entity.name;
_entity.image_blend = c_red;
_entity.image_index = ds_grid_get(oControllerEntity.entityStartingInfoGrid, entityStartingInfo.deathSubImage, _entityNumber );
_entity.depthPos = depthPosition.dead;
_entity.ai = -1;
_entity.fighter = -1;
_entity.isBlockingMovement = false;

//var _msg = scConvertToString(COLOUR_NAME_ENTITY, _entityName, "[] has died.");
var _msg = scConvertToString(_entityName, " has died.");
scAddMessageToEventQueue(_msg);

if oControllerEntity.turnHolder == _entity {
	scIncrementTurn();	
}
