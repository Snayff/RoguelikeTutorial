///@desc create player in world
///@param tileX x position to create player
///@param tileY Y position to create player

var _tileX = argument0;
var _tileY = argument1;

scCreateEntity(_tileX, _tileY, entityNumber.player, true, scFighter, -1 );
