///@desc move entity
///@param entity
///@param xMovement
///@param yMovement

var _entity = argument0;
var _x = argument1;
var _y = argument2;

var _targetX = (_entity.x + _x) / TILESIZE;
var _targetY = (_entity.y + _y) / TILESIZE;

//check if tile is NOT isBlockingMovement
if oControllerTile.tiles[ _targetY, _targetX] & oControllerTile.isBlockingMovement = 0 {

	//apply movement values
	_entity.x += _x * TILESIZE;
	_entity.y += _y * TILESIZE;

}
