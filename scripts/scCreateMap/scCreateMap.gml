///@desc initiliase map, determine what rooms to create and then create them

scDebugMsg("CREATE MAP:");

//intialise vars
var _room1 = 0;
var _room2 = 0;

//set map values
mapHeight = scConvertToTile(room_height);
mapWidth = scConvertToTile(room_width);



//tile info
// 0 = sprite / 1 = subimage / 2 = colour
darkWall[0] = spCalibriFont;
darkWall[1] = 35;
darkWall[2] = make_color_rgb(0,0,100);
darkGround[0] = spTile;
darkGround[1] = 0;
darkGround[2] = make_color_rgb(50,50,150);


//initialise tile array
for (var _arrayHeight = mapHeight; _arrayHeight >= 0; _arrayHeight--; ){
	for (var _arrayLength = mapWidth; _arrayLength >= 0; _arrayLength--; ){	
		oControllerTile.tileArray[_arrayHeight, _arrayLength] = 0 ;
		oControllerTile.tileArray[_arrayHeight, _arrayLength] |= ISBLOCKINGMOVEMENT | ISBLOCKINGSIGHT;

	}
}

scDebugMsg("Tiles created as walls.");

//room info
// 0 = x / 1 = width / 2 = y / 3 = height

//room1
_room1[3] = 10; 
_room1[2] = 8; 
_room1[1] = 7; 
_room1[0] = 4; 
//room2
_room2[3] = 15; 
_room2[2] = 12; 
_room2[1] = 18; 
_room2[0] = 10; 

//create the rooms
scCreateRoom(_room1[0], _room1[1], _room1[2], _room1[3]);
scCreateRoom(_room2[0], _room2[1], _room2[2], _room2[3]);

scDebugMsg("Rooms carved out.");