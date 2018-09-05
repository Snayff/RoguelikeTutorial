///@desc determine direction to move in order to move towards another entity
///@param entity entity who wants to move
///@param targetEntity

var _entity = argument0;
var _targetEntity = argument1;
var _distanceX = _targetEntity.startingGridX - _entity.startingGridX;
var _distanceY = _targetEntity.startingGridY - _entity.startingGridY;
var _distance = sqrt(power(_distanceX, 2) + power(_distanceY, 2));


var _target;
_target[0] = sign(round(_distanceX / _distance)); //sign to limit movement to 1 tile per move action
_target[1] = sign(round(_distanceY / _distance));

return _target;
