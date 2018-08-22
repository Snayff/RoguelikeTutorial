///@desc create vetical tunnel
///@param startingTileY start point
///@param heightOfRoom end point
///@param startingTileX horizontal position

var _startingTileY = argument0;
var _heightOfRoom = argument1;
var _startingTileX = argument2;

scDebugMsg("CREATE V TUNNEL:");

ds_grid_set_region(oControllerTile.tileArray, _startingTileX, _startingTileY, _startingTileX , _startingTileY + _heightOfRoom, (~ISBLOCKINGMOVEMENT) & (~ISBLOCKINGSIGHT) );

scDebugMsg("x1: ", _startingTileX, " x2: ", _startingTileX, " y1: ", _startingTileY, " y2: ", _startingTileY + _heightOfRoom );


//for ( var _y = min(_y1, _y2); _y < max(_y1, _y2); _y++ ) {
	
//	//deactivate flags on tiles
//	oControllerTile.tileArray[_y, _x] = (~ISBLOCKINGMOVEMENT) & (~ISBLOCKINGSIGHT); 
//}

