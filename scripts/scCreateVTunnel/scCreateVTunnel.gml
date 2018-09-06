///@desc create vetical tunnel
///@param startingTileY start point
///@param endingTileY end point
///@param startingTileX horizontal position

var _startingTileY = argument0;
var _endingTileY = argument1;
var _startingTileX = argument2;
var _startingRoomX = scConvertToXY(_startingTileX);
var _endingRoomY = scConvertToXY(_endingTileY);
var _startingRoomY = scConvertToXY(_startingTileY);


//scDebugMsg("CREATE V TUNNEL:");

ds_grid_set_region(oControllerTile.tileGrid, _startingTileX, _startingTileY, _startingTileX , _endingTileY, (~ISBLOCKINGMOVEMENT) & (~ISBLOCKINGSIGHT) );
mp_grid_clear_rectangle(oControllerEntity.movementGrid,  _startingRoomX, _startingRoomY, _startingRoomX , _endingRoomY)
//scDebugMsg("x1: ", _startingTileX, " x2: ", _startingTileX, " y1: ", _startingTileY, " y2: ", _endingTileY );

