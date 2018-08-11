/// @desc handle world tiles

//set map values
mapHeight = room_height;
mapWidth = room_width;
#macro TILESIZE 32

//bitmask notations
isBlockingMovement = 1;
isBlockingSight = 2;

//tile colours
darkWall = make_color_rgb(0,0,100);
darkGround = make_color_rgb(50,50,150);

//initialise tiles array
for (var _tilesArrayHeight = mapHeight / TILESIZE; _tilesArrayHeight >= 0; _tilesArrayHeight--; ){
	for (var _tilesArrayLength = mapWidth / TILESIZE; _tilesArrayLength >= 0; _tilesArrayLength--; ){	
		tiles[_tilesArrayHeight, _tilesArrayLength] = 0;

	}
}

//set some tiles as blockingMovement and blocking sight
tiles[10,20] |= isBlockingMovement | isBlockingSight;
tiles[11,20] |= isBlockingMovement | isBlockingSight;
tiles[12,20] |= isBlockingMovement | isBlockingSight;