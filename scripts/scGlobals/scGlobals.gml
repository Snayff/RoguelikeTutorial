//tile info
#macro TILESIZE 32
// tile bitmask notations
#macro ISBLOCKINGMOVEMENT 1
#macro ISBLOCKINGSIGHT 2
//view bitmask notations
#macro ISVISIBLE 1

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