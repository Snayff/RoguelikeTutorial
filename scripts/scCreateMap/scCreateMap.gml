///@desc initiliase map, determine what rooms to create and then create them

scDebugMsg("CREATE MAP:");

//intialise vars
var _room1 = 0;
var _room2 = 0;


//initialise tile array as walls and set walls as forbidden in movement grid
ds_grid_set_region(oControllerTile.tileGrid, 0, 0, ds_grid_width(oControllerTile.tileGrid), ds_grid_height(oControllerTile.tileGrid), ISBLOCKINGMOVEMENT | ISBLOCKINGSIGHT);
mp_grid_add_rectangle(oControllerEntity.movementGrid, 0,0, global.mapWidthInPixels, global.mapHeightInPixels);

scDebugMsg("Tiles created as walls.");

//room requirements
// 0 = tileX / 1 = width / 2 = tileY / 3 = height / 4 = max monsters

//room1
_room1[4] = 3; 
_room1[3] = 6; 
_room1[2] = 8; 
_room1[1] = 3; 
_room1[0] = 4; 
//room2
_room2[4] = 2; 
_room2[3] = 7; 
_room2[2] = 12; 
_room2[1] = 10; 
_room2[0] = 10; 

//create the rooms
scCreateRoom(_room1[0], _room1[1], _room1[2], _room1[3], _room1[4]);
scCreateRoom(_room2[0], _room2[1], _room2[2], _room2[3], _room2[4]);

scDebugMsg("All rooms carved out.");
