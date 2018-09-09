///@desc carve out a room in the map
///@param startingTileX First Tile x
///@param widthOfRoom The room's width
///@param startingTileY First Tile y
///@param heightOfRoom The room's height
///@param maxMonsters max number of monsters for the room


var _startingTileX = argument0;
var _widthOfRoom = argument1;
var _startingTileY = argument2;
var _heightOfRoom = argument3;
var _maxMonsters = argument4;
var _intersectFound = false;

scDebugMsg("CREATE ROOM:");


//check if co-ords given are in the map
if (_startingTileX + _widthOfRoom) > global.mapWidthInTiles - 1 { // -1 to leave a wall
	_widthOfRoom = 	min((_startingTileX + _widthOfRoom) - global.mapWidthInTiles - 1, _startingTileX);
} 
if (_startingTileY + _heightOfRoom) > global.mapHeightInTiles - 1 {
	_heightOfRoom = min((_startingTileY + _heightOfRoom) - global.mapHeightInTiles - 1, _startingTileY);
} 

//check target room doesnt intersect with an existing room
//if there isnt a room (no width) in roomInfoGrid then this is the first room so dont check
if ds_grid_get(oControllerTile.roomInfoGrid, roomInfo.width, 0) <> 0 {
	var _gridSize = ds_grid_height(oControllerTile.roomInfoGrid);
	
	//loop through existing rooms until intersect found
	for ( var _index = 0; _index < _gridSize && _intersectFound == false; _index ++) {
		
		//get room info
		var _existingRoomX = ds_grid_get(oControllerTile.roomInfoGrid, roomInfo.startX, _index);
		var _existingRoomY = ds_grid_get(oControllerTile.roomInfoGrid, roomInfo.startY, _index);
		var _existingRoomWidth = ds_grid_get(oControllerTile.roomInfoGrid, roomInfo.width,_index) ;
		var _existingRoomHeight = ds_grid_get(oControllerTile.roomInfoGrid, roomInfo.height, _index);
		
		// compare to target room
		 if rectangle_in_rectangle(_existingRoomX, _existingRoomY,_existingRoomX + _existingRoomWidth, _existingRoomY + _existingRoomHeight,_startingTileX,_startingTileY,_startingTileX + _widthOfRoom, _startingTileY + _heightOfRoom) <> 0 {
				_intersectFound = true;	
				//log where room overlaps
				scDebugMsg("Intersect found, x1: ", _existingRoomX, " y1 : ", _existingRoomY, " x2: ", _existingRoomX + _existingRoomWidth, " y2: ", _existingRoomY + _existingRoomHeight)
		 }
		
	
	}

}

//check if room is greater than 1x1
if _widthOfRoom > 1 || _heightOfRoom > 1 {
	//check no room intersect
	if _intersectFound == false {
		
		//add room to tileGrid and movementGrid
		for (var _x = _startingTileX + 1; _x <= _startingTileX + (_widthOfRoom - 1) && _x <= global.mapWidthInTiles - 1; _x++) { //+1/-1 to ensure a wall is always left
			for (var _y = _startingTileY + 1; _y <= _startingTileY + ( _heightOfRoom - 1) && _y <= global.mapHeightInTiles - 1; _y++) { //+1/-1 to ensure a wall is always left
				mp_grid_clear_cell(oControllerEntity.movementGrid, _x, _y);
				oControllerTile.tileGrid[# _x, _y] &= ~(ISBLOCKINGMOVEMENT | ISBLOCKINGSIGHT); //***change to function
			
			}
		}
		
		var _centreX = round((_startingTileX + (_startingTileX + _widthOfRoom)) / 2);
		var _centreY = round((_startingTileY + (_startingTileY + _heightOfRoom)) / 2);
		
		//log room co-ords
		scDebugMsg("Room created: x1: ", _startingTileX, " y1: ", _startingTileY," x2: ", _startingTileX + _widthOfRoom, " y2: ", _startingTileY + _heightOfRoom, " centreX: ", _centreX, " centreY: ", _centreY );

		
		//if first room add player, if not add tunnel between rooms and populate with monsters
		if oControllerTile.numberOfRooms == 0 {
			scCreatePlayer(_centreX, _centreY);
		} else {
			var _previousRoomCentreX = ds_grid_get(oControllerTile.roomInfoGrid, roomInfo.centreX, ds_grid_height(oControllerTile.roomInfoGrid)-1);
			var _previousRoomCentreY = ds_grid_get(oControllerTile.roomInfoGrid, roomInfo.centreY, ds_grid_height(oControllerTile.roomInfoGrid)-1);
			
			//determine which way to tunnel first
			if irandom_range(0,1) == 0 {
				scCreateHTunnel(_previousRoomCentreX, _centreX, _previousRoomCentreY);
				scCreateVTunnel(_previousRoomCentreY, _centreY, _centreX);
			} else {
				scCreateVTunnel(_previousRoomCentreY, _centreY, _previousRoomCentreX);
				scCreateHTunnel(_previousRoomCentreX, _centreX, _centreY);
			}
			
			scDebugMsg("Tunnel created between Room ",ds_grid_height(oControllerTile.roomInfoGrid) -2, " and Room ", ds_grid_height(oControllerTile.roomInfoGrid)-1 );
			
			//add entities to room
			scAddEntitiesToRoom(_maxMonsters, _startingTileX, _startingTileY, _startingTileX + _widthOfRoom, _startingTileY + _heightOfRoom,  entityName.orc, entityName.troll);
		}
		
		//add to roomInfoGrid
		scAddRoomInfoToGrid(_startingTileX, _startingTileY, _widthOfRoom, _heightOfRoom, _centreX, _centreY);
		
		
		
		//update number of rooms
		oControllerTile.numberOfRooms++;
		
	} else {
	scDebugMsg("Room not created due to intersect")	;
	}
	
	
} else {
	scDebugMsg("Room too small to create.")	;
}

