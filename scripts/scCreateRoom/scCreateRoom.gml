///@desc carve out a room in the map
///@param startingTileX
///@param startingTileY
///@param widthOfRoom
///@param heightOfRoom

var _startingTileX = argument0;
var _startingTileY = argument1;
var _widthOfRoom = argument2;
var _heightOfRoom = argument3;

for (var _x = _startingTileX; _x >= _startingTileX + _heightOfRoom; _x++) {
	for (var _y = _startingTileX; _y >= _startingTileY + _widthOfRoom; _y++) {
		oControllerTile.tileArray[_y, _x] |= isBlockingMovement | isBlockingSight;
	
	}
}