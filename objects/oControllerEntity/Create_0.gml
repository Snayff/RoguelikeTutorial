/// @desc handle entity

//set map values
mapHeight = room_height;
mapWidth = room_width;

//create entity list
entityList = ds_list_create()

//initialise entity array
for (var _arrayHeight = mapHeight / TILESIZE; _arrayHeight >= 0; _arrayHeight--; ){
	for (var _arrayLength = mapWidth / TILESIZE; _arrayLength >= 0; _arrayLength--; ){	
		entityArray[_arrayHeight, _arrayLength] = 0;

	}
}


//initialise player
player = instance_create_depth(4 * TILESIZE, 6 * TILESIZE,0,oPlayer);
ds_list_add(entityList, player);

//move player to centre of array
entityArray[player.y / TILESIZE, player.x / TILESIZE] = player;
//track player's position in world in startingGrid*
player.startingGridX = player.x / TILESIZE;
player.startingGridY = player.y / TILESIZE;

show_debug_message("passToStartingX: " + string(player.x / TILESIZE) +  " passToStartingY: " + string(player.y / TILESIZE));
show_debug_message("startingX: " + string(player.startingGridX) + " startingY: " + string(player.startingGridY));
show_debug_message("arrayValue: " + string(entityArray[player.y / TILESIZE, player.x / TILESIZE] ));

//initialise npc
npc = instance_create_depth(2 * TILESIZE, 4 * TILESIZE,0,oNpc);
ds_list_add(entityList, npc);

//move npc to off-centre of screen
entityArray[npc.y / TILESIZE, npc.x / TILESIZE] = npc;
//track player's position in world in startingGrid*
npc.startingGridX = npc.x / TILESIZE;
npc.startingGridY = npc.y / TILESIZE;



