///@desc carve out a room in the map
///@param {real} startingTileX First Tile x
///@param {real} widthOfRoom The room's width
///@param {real} startingTileY First Tile y
///@param {real} heightOfRoom The room's height

var _startingTileX = argument0;
var _widthOfRoom = argument1;
var _startingTileY = argument2;
var _heightOfRoom = argument3;
//var _firstXUsed = -1; //for debugging
//var _firstYUsed = -1; //for debugging
//var _lastXUsed = -1; //for debugging
//var _lastYUsed = -1; //for debuging

scDebugMsg("CREATE ROOM:");

//check room doesnt intersect ** needs updating to check for intersection
if ds_grid_get(oControllerTile.roomInfoGrid, 0,0) == 0 {
	var _gridSize = ds_grid_height(oControllerTile.roomInfoGrid);
	
	for ( var _index = 0; _index < _gridSize; _index ++) {
		var _listX = 0;
		var _listWidth  = 0;
		var _listY = 0;
		var _listHeight = 0;
	
	}

}

//check if co-ords given are in the map
if (_startingTileX + _widthOfRoom) > oControllerTile.mapWidthInTiles - 1 {
	_widthOfRoom = 	min((_startingTileX + _widthOfRoom) - oControllerTile.mapWidthInTiles - 1, _startingTileX);
} 
if (_startingTileY + _heightOfRoom) > oControllerTile.mapHeightInTiles - 1 {
	_heightOfRoom = min((_startingTileY + _heightOfRoom) - oControllerTile.mapHeightInTiles - 1, _startingTileY);
} 


//check if room is greater than 1x1
if _widthOfRoom > 1 || _heightOfRoom > 1 {
	for (var _x = _startingTileX + 1; _x <= _startingTileX + (_widthOfRoom - 1) && _x <= oControllerTile.mapWidthInTiles - 1; _x++) { //+1/-1 to ensure a wall is always left
		for (var _y = _startingTileY + 1; _y <= _startingTileY + ( _heightOfRoom - 1) && _y <= oControllerTile.mapHeightInTiles - 1; _y++) { //+1/-1 to ensure a wall is always left
			oControllerTile.tileGrid[# _x, _y] &= ~(ISBLOCKINGMOVEMENT | ISBLOCKINGSIGHT);
			//ds_grid_set_region(oControllerTile.tileGrid, _startingTileX, _startingTileY, _startingTileX + _widthOfRoom, _startingTileY + _heightOfRoom, (~ISBLOCKINGMOVEMENT) & (~ISBLOCKINGSIGHT) );
		}
	}
} else {
	scDebugMsg("Room too small to create.")	
}

//add to room list
scAddRoomInfo(_startingTileX, _startingTileY, _widthOfRoom, _heightOfRoom);

//log room co-ords
scDebugMsg("x1: ", _startingTileX, " x2: ", _startingTileX + _widthOfRoom, " y1: ", _startingTileY, " y2: ", _startingTileY + _heightOfRoom );

////loop through tiles in room co-ords and ensure is in map
//for (var _x = _startingTileX + 1; _x <= _startingTileX + (_widthOfRoom - 1) && _x <= oControllerTile.mapWidth - 1; _x++) { //+1/-1 to ensure a wall is always left
//	for (var _y = _startingTileY + 1; _y <= _startingTileY + ( _heightOfRoom - 1) && _y <= oControllerTile.mapHeight - 1; _y++) { //+1/-1 to ensure a wall is always left
		
//		//deactivate flags on tiles
//		oControllerTile.tileGrid[_y, _x] = (~ISBLOCKINGMOVEMENT) & (~ISBLOCKINGSIGHT); 
		
//		//log room creation
//		if _firstXUsed == -1 || _x < _firstXUsed {
//			_firstXUsed = _x; //update var to earliest x	
//		}
		
//		if _lastXUsed == -1 || _x > _lastXUsed {
//			_lastXUsed = _x; //update var to latest x	
//		}
		
//		if _firstYUsed == -1 || _y < _firstYUsed {
//			_firstYUsed = _y; //update var to earliest x	
//		}
		
//		if _lastYUsed == -1 || _y < _lastYUsed {
//			_lastYUsed = _y; //update var to earliest x	
//		}
//	}
//}

////add to room list
//scAddToRoomList(_startingTileX, _startingTileY, _widthOfRoom, _heightOfRoom);

////if vars havent moved from initialised position something went wrong
//if _firstXUsed == -1 || _firstYUsed == -1 || _lastXUsed == -1 || _lastYUsed == -1 {
//	scDebugMsg("Error in room creation");
//}

//log room co-ords
//scDebugMsg("x1: ", _firstXUsed, " x2: ",_lastXUsed , " y1: ",_firstYUsed , " y2: ",_lastYUsed );