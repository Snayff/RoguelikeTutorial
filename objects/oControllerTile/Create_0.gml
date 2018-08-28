/// @desc handle world tile

//tile info
#macro TILESIZE 32
// tile bitmask notations
#macro ISBLOCKINGMOVEMENT 1
#macro ISBLOCKINGSIGHT 2
#macro ISVISIBLE 4
//colours
#macro COLOUR_DARKWALL  make_color_rgb(0,0,100)
#macro COLOUR_DARKGROUND make_color_rgb(50,50,150)
#macro COLOUR_LIGHTWALL make_color_rgb(130, 110, 50)
#macro COLOUR_LIGHTGROUND make_color_rgb(200, 180, 50)

//roomInfoGrid enum
enum roomInfo {
	startX,
	startY,
	width,
	height,
	centreX,
	centreY,
	enumSize
}

//tileInfo enum
enum tileInfo {
	sprite,
	subImage,
	enumSize
	
}


//set map values
maxRooms = 30;
maxRoomSize = 10;
minRoomSize = 3; 
mapHeightInTiles = scConvertToTile(room_height);
mapWidthInTiles = scConvertToTile(room_width);

//manage rooms
numberOfRooms = 0;

//tile info
wall[tileInfo.sprite] = spCalibriFont;
wall[tileInfo.subImage] = 35;
ground[tileInfo.sprite] = spTile;
ground[tileInfo.subImage] = 0;


//field of view values
fovRadius = 10; //how far player can see
fovRecompute = true; //flag to determine when fov needs to be recalculated

//intiialise grids
roomInfoGrid = ds_grid_create(roomInfo.enumSize, 1);// x, y, centreX, centreY
tileGrid = ds_grid_create(mapWidthInTiles, mapHeightInTiles);



//create the map
scCreateMap();

