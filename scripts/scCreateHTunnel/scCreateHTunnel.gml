///@desc create horizontal tunnel
///@param startingTileX start point
///@param endingTileX end point
///@param startingTileY vertical position

var _startingTileX = argument0;
var _endingTileX = argument1;
var _startingTileY = argument2;

scDebugMsg("CREATE H TUNNEL:");

ds_grid_set_region(oControllerTile.tileGrid, _startingTileX, _startingTileY, _endingTileX, _startingTileY, (~ISBLOCKINGMOVEMENT) & (~ISBLOCKINGSIGHT) );

scDebugMsg("x1: ", _startingTileX, " x2: ", _endingTileX, " y1: ", _startingTileY, " y2: ", _startingTileY  );
