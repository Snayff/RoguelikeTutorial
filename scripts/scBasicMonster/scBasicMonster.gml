///@desc basic monster AI

var _entity = id;
var _pointX;
var _pointY;
var _targetDirection;
var _targetX;
var _targetY;
var _entityRoomX;
var _entityRoomY; 

//only move within certain range of player
if scDistanceToEntity(oControllerEntity.player) < oControllerEntity.player.fovRadius + 3 {
	
	//create path if one doesnt exist
	if !path_exists(_entity.path) {
		_entity.path = path_add()
	}
	
	_entityRoomX = scConvertToXY(_entity.startingGridX);
	_entityRoomY = scConvertToXY(_entity.startingGridY);
	
	//create path to player
	if mp_grid_path(oControllerEntity.movementGrid, _entity.path, _entityRoomX, _entityRoomY, scConvertToXY(oControllerEntity.player.endingGridX),scConvertToXY(oControllerEntity.player.endingGridY), true) {
		_pointX = path_get_point_x(_entity.path, 1);
		_pointY = path_get_point_y(_entity.path, 1);
		_targetX = sign(_pointX - _entityRoomX);
		_targetY = sign(_pointY - _entityRoomY);
		
		scDebugMsg("Entity ", _entity, " used path finding for direction.");
	
	} else { //mp unsuccessful so walk directly towards player
		//get direction to move towards player
		_targetDirection = scDetermineDirectionToEntity(_entity, oControllerEntity.player);
		_targetX = _targetDirection[0];
		_targetY = _targetDirection[1];
		scDebugMsg("Entity ", _entity, " used a crow for direction."); //as the crow flies, i.e. direct
	
	}
	
	//attempt to move
	scEntityAttemptMove(_entity,_targetX, _targetY );
	
}