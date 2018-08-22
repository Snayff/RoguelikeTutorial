///@desc initiliase map, determine what rooms to create and then create them

scDebugMsg("CREATE MAP:");

//intialise vars
var _room1 = 0;
var _room2 = 0;

//set map values
mapHeightInTiles = scConvertToTile(room_height);
mapWidthInTiles = scConvertToTile(room_width);

//manage rooms
numberOfRooms = 0;
oControllerTile.roomList = ds_grid_create(4, 1);// x, y, centreX, centreY
oControllerTile.tileArray = ds_grid_create(mapWidthInTiles, mapHeightInTiles);

//tile info
// 0 = sprite / 1 = subimage / 2 = colour
darkWall[0] = spCalibriFont;
darkWall[1] = 35;
darkWall[2] = make_color_rgb(0,0,100);
darkGround[0] = spTile;
darkGround[1] = 0;
darkGround[2] = make_color_rgb(50,50,150);


//initialise tile array as walls
ds_grid_set_region(oControllerTile.tileArray, 0, 0, ds_grid_width(oControllerTile.tileArray), ds_grid_height(oControllerTile.tileArray), ISBLOCKINGMOVEMENT | ISBLOCKINGSIGHT);

//for (var _arrayHeight = mapHeight; _arrayHeight >= 0; _arrayHeight--; ){
//	for (var _arrayLength = mapWidth; _arrayLength >= 0; _arrayLength--; ){	
//		oControllerTile.tileArray[_arrayHeight, _arrayLength] = 0 ;
//		oControllerTile.tileArray[_arrayHeight, _arrayLength] |= ISBLOCKINGMOVEMENT | ISBLOCKINGSIGHT;

//	}
//}

scDebugMsg("Tiles created as walls.");

//room info
// 0 = tileX / 1 = width / 2 = tileY / 3 = height

//room1
_room1[3] = 6; 
_room1[2] = 8; 
_room1[1] = 3; 
_room1[0] = 4; 
//room2
_room2[3] = 4; 
_room2[2] = 12; 
_room2[1] = 6; 
_room2[0] = 10; 

//create the rooms
scCreateRoom(_room1[0], _room1[1], _room1[2], _room1[3]);
scCreateRoom(_room2[0], _room2[1], _room2[2], _room2[3]);
scCreateHTunnel(7,14,12);

scDebugMsg("Rooms carved out.");