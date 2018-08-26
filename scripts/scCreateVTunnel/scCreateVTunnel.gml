///@desc create vetical tunnel
///@param startingTileY start point
///@param endingTileY end point
///@param startingTileX horizontal position

var _startingTileY = argument0;
var _endingTileY = argument1;
var _startingTileX = argument2;

scDebugMsg("CREATE V TUNNEL:");

ds_grid_set_region(oControllerTile.tileGrid, _startingTileX, _startingTileY, _startingTileX , _endingTileY, (~ISBLOCKINGMOVEMENT) & (~ISBLOCKINGSIGHT) );

scDebugMsg("x1: ", _startingTileX, " x2: ", _startingTileX, " y1: ", _startingTileY, " y2: ", _endingTileY );

