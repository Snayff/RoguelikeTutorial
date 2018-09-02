/// @desc handle world tile

scDebugMsg("CREATE CONTROLLER TILE:");

//set map values
maxRooms = 30;
maxRoomSize = 10;
minRoomSize = 3; 


//manage rooms
numberOfRooms = 0;

//tile info
wall[tileInfo.sprite] = spCalibriFont;
wall[tileInfo.subImage] = 35;
ground[tileInfo.sprite] = spTile;
ground[tileInfo.subImage] = 0;

//intiialise grids
roomInfoGrid = ds_grid_create(roomInfo.enumSize, 1);// x, y, centreX, centreY
tileGrid = ds_grid_create(global.mapWidthInTiles, global.mapHeightInTiles);



//create the map
scCreateMap();

