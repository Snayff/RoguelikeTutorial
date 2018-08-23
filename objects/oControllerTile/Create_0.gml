/// @desc handle world tile


#macro TILESIZE 32
//bitmask notations
#macro ISBLOCKINGMOVEMENT 1
#macro ISBLOCKINGSIGHT 2

//set map values
mapHeightInTiles = scConvertToTile(room_height);
mapWidthInTiles = scConvertToTile(room_width);

//intiialise grids
roomInfoGrid = ds_grid_create(4, 1);// x, y, centreX, centreY
tileGrid = ds_grid_create(mapWidthInTiles, mapHeightInTiles);

//manage rooms
numberOfRooms = 0;

//create the map
scCreateMap();

