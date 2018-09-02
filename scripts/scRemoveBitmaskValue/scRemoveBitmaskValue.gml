///@desc set bitmask notation for a grid position in a ds_grid
///@param grid grid ID
///@param gridX x position in grid
///@param gridY y position in grid
///@param notation bitmask notation to set as true
///@param ... 

var _grid = argument[0];
var _gridX = argument[1];
var _gridY = argument[2]; 
var _i = 3; //count of arguments preceeding notation
 
 
for (; _i < argument_count; _i++){
	_grid[# _gridX, _gridY] &= ~argument[_i];
}
