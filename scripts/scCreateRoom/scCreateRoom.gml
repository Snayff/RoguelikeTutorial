///@desc carve out a room in the map
///@param {real} startingTileX First Tile x
///@param {real} widthOfRoom The room's width
///@param {real} startingTileY First Tile y
///@param {real} heightOfRoom The room's height

var _startingTileX = argument0;
var _widthOfRoom = argument1;
var _startingTileY = argument2;
var _heightOfRoom = argument3;
var _firstXUsed = -1; //for debugging
var _firstYUsed = -1; //for debugging
var _lastXUsed = -1; //for debugging
var _lastYUsed = -1; //for debuging

scDebugMsg("CREATE ROOM:");

//loop through tiles in room co-ords and ensure is in map
for (var _x = _startingTileX + 1; _x <= _startingTileX + (_widthOfRoom - 1) && _x <= oControllerTile.mapWidth - 1; _x++) { //+1/-1 to ensure a wall is always left
	for (var _y = _startingTileY + 1; _y <= _startingTileY + ( _heightOfRoom - 1) && _y <= oControllerTile.mapHeight - 1; _y++) { //+1/-1 to ensure a wall is always left
		
		//deactivate flags on tiles
		oControllerTile.tileArray[_y, _x] = (~ISBLOCKINGMOVEMENT) & (~ISBLOCKINGSIGHT); 
		
		//log room creation
		if _firstXUsed == -1 || _x < _firstXUsed {
			_firstXUsed = _x; //update var to earliest x	
		}
		
		if _lastXUsed == -1 || _x > _lastXUsed {
			_lastXUsed = _x; //update var to latest x	
		}
		
		if _firstYUsed == -1 || _y < _firstYUsed {
			_firstYUsed = _y; //update var to earliest x	
		}
		
		if _lastYUsed == -1 || _y < _lastYUsed {
			_lastYUsed = _y; //update var to earliest x	
		}
	}
}

//if vars havent moved from initialised position something went wrong
if _firstXUsed == -1 || _firstYUsed == -1 || _lastXUsed == -1 || _lastYUsed == -1 {
	scDebugMsg("Error in room creation");
}
//log room co-ords
scDebugMsg("x1: ", _firstXUsed, " x2: ",_lastXUsed , " y1: ",_firstYUsed , " y2: ",_lastYUsed );