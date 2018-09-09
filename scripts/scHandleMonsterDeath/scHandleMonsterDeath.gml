///@desc handle monster death
///@param entity dead entity


var _entity = argument0;
var _entityName = _entity.name;
_entity.image_blend = c_red;
_entity.image_index = ds_grid_get(oControllerEntity.entityStartingInfoGrid, entityStartingInfo.deathSubImage, _entityName );
_entity.depthPos = depthPosition.dead;
_entity.ai = -1;
_entity.fighter = -1;
_entity.isBlockingMovement = false;

var _message = scConvertToString(_entityName, " has died.");

oControllerEvent.eventQueue[? "message"] = _message;
