///@desc distance between two entities
///@param targetEntity second entity

var _entity = id;
var _targetEntity = argument0;
var _distanceX = _targetEntity.startingGridX - _entity.startingGridX;
var _distanceY = _targetEntity.startingGridY - _entity.startingGridY;
var _distance = sqrt(power(_distanceX, 2) + power(_distanceY, 2));

return _distance;
