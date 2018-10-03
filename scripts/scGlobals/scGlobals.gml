//font info
global.font = font_add_sprite(spCalibriFont, ord("!"), false, 2);

//map info
global.mapWidthInTiles =  scConvertToTile(room_width);
global.mapHeightInTiles = scConvertToTile(room_height);
global.mapWidthInPixels =  room_width;
global.mapHeightInPixels = room_height;

//turn management
global.currentGameState = gameState.playerTurn;


//tile info
#macro TILESIZE 32
// tile bitmask notations
#macro ISBLOCKINGMOVEMENT 1
#macro ISBLOCKINGSIGHT 2
//view bitmask notations
#macro ISVISIBLE 1
#macro ISEXPLORED 2

//colours
#macro COLOUR_DARKWALL  make_color_rgb(108,118,135)
#macro COLOUR_DARKGROUND make_color_rgb(50,50,50)
#macro COLOUR_LIGHTWALL make_color_rgb(130, 110, 50)
#macro COLOUR_LIGHTGROUND make_color_rgb(200, 180, 50)
#macro COLOUR_NAME_ENTITY "[$964a15]"
#macro COLOUR_NAME_PLAYER "[$671596]"

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

//entity numbers
enum entityNumber {
	player,
	orc,
	troll,
	healingPotion,
	enumSize
	
}

//entity info
enum actorStat {
	name,
	sprite,
	subimage,
	colour,
	maxHp,
	defense, 
	strength,
	deathSubImage,
	blocksMovement,
	fighter,
	ai, 
	inventory, // last item used in creation
	hp, //must come after creation list
	enumSize
}

//game state
enum gameState{
	playerTurn,
	enemyTurn,
	playerDead,
	enumSize
	
}

// render order - higher number is lower down
enum depthPosition {
	dead = -1,
	item = -2,
	living = -3
	
}

//resource type
enum resourceType {
	hp,
	enumSize
}
