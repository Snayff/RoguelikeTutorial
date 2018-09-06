///@desc create horizontal tunnel
///@param startingTileX start point
///@param endingTileX end point
///@param startingTileY vertical position

var _startingTileX = argument0;
var _endingTileX = argument1;
var _startingTileY = argument2;
var _startingRoomX = scConvertToXY(_startingTileX);
var _endingRoomX = scConvertToXY(_endingTileX);
var _startingRoomY = scConvertToXY(_startingTileY);

//scDebugMsg("CREATE H TUNNEL:");
ds_grid_set_region(oControllerTile.tileGrid, _startingTileX, _startingTileY, _endingTileX, _startingTileY, (~ISBLOCKINGMOVEMENT) & (~ISBLOCKINGSIGHT) );
mp_grid_clear_rectangle(oControllerEntity.movementGrid, _startingRoomX, _startingRoomY, _endingRoomX, _startingRoomY );
//scDebugMsg("x1: ", _startingTileX, " x2: ", _endingTileX, " y1: ", _startingTileY, " y2: ", _startingTileY  );
