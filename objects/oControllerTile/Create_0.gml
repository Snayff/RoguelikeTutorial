/// @desc handle world tile

//set map values
mapHeight = room_height;
mapWidth = room_width;
#macro TILESIZE 32

//bitmask notations
isBlockingMovement = 1;
isBlockingSight = 2;

//tile info
// 0 = sprite / 1 = subimage / 2 = colour
darkWall[0] = spCalibriFont;
darkWall[1] = 35;
darkWall[2] = make_color_rgb(0,0,100);
darkGround[0] = spTile;
darkGround[1] = 0;
darkGround[2] = make_color_rgb(50,50,150);


//initialise tile array
for (var _arrayHeight = mapHeight / TILESIZE; _arrayHeight >= 0; _arrayHeight--; ){
	for (var _arrayLength = mapWidth / TILESIZE; _arrayLength >= 0; _arrayLength--; ){	
		tileArray[_arrayHeight, _arrayLength] = 0;

	}
}

//set some tile as blockingMovement and blocking sight
tileArray[10,20] |= isBlockingMovement | isBlockingSight;
tileArray[11,20] |= isBlockingMovement | isBlockingSight;
tileArray[12,20] |= isBlockingMovement | isBlockingSight;