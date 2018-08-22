///@desc create horizontal tunnel
///@param startingTileX start point
///@param widthOfRoom end point
///@param startingTileY vertical position

var _startingTileX = argument0;
var _widthOfRoom = argument1;
var _startingTileY = argument2;

scDebugMsg("CREATE H TUNNEL:");

ds_grid_set_region(oControllerTile.tileArray, _startingTileX, _startingTileY, _startingTileX + _widthOfRoom, _startingTileY, (~ISBLOCKINGMOVEMENT) & (~ISBLOCKINGSIGHT) );

scDebugMsg("x1: ", _startingTileX, " x2: ", _startingTileX + _widthOfRoom, " y1: ", _startingTileY, " y2: ", _startingTileY  );

//for ( var _x = min(_x1, _x2); _x < max(_x1, _x2); _x++ ) {
	
//	//deactivate flags on tiles
//	oControllerTile.tileArray[_y, _x] = (~ISBLOCKINGMOVEMENT) & (~ISBLOCKINGSIGHT); 
//}

