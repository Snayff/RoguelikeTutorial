///@desc basic monster AI

var _entity = id;
var _pointX;
var _pointY;
var _targetDirection;
var _targetX;
var _targetY;

//only move within certain range of player
if scDistanceToEntity(oControllerEntity.player) < oControllerView.fovRadius {
	_entity.path = path_add()
	
	//create path to player
	if mp_grid_path(oControllerEntity.movementGrid, _entity.path, _entity.startingGridX, _entity.startingGridY, oControllerEntity.player.startingGridX,oControllerEntity.player.startingGridY, true) {
		_pointX = path_get_point_x(_entity.path, 1);
		_pointY = path_get_point_y(_entity.path, 1);
		_targetX = sign(_pointX);
		_targetY = sign(_pointY);
	
	
	} else { //a* unsuccessful so walk directly towatds player
		//get direction to move towards player
		_targetDirection = scDetermineDirectionToEntity(_entity, oControllerEntity.player);
		_targetX = _targetDirection[0];
		_targetY = _targetDirection[1];
	
	}
	
	//attempt to move
	scEntityAttemptMove(_entity,_targetX, _targetY );
	
}