/// @desc handle entity


scDebugMsg("CREATE CONTROLLER ENTITY:");

//set map values
mapHeightInTiles = scConvertToTile(room_height);
mapWidthInTiles = scConvertToTile(room_width);

//create entity list
entityList = ds_list_create()

//initialise entity array
oControllerTile.entityArray = ds_grid_create(mapWidthInTiles, mapHeightInTiles);
ds_grid_set_region(oControllerTile.entityArray, 0, 0, ds_grid_width(oControllerTile.entityArray), ds_grid_height(oControllerTile.entityArray), 0);

//for (var _arrayHeight = mapHeight / TILESIZE; _arrayHeight >= 0; _arrayHeight--; ){
//	for (var _arrayLength = mapWidth / TILESIZE; _arrayLength >= 0; _arrayLength--; ){	
//		entityArray[_arrayHeight, _arrayLength] = 0;

//	}
//}


//initialise player
player = instance_create_depth(5 * TILESIZE, 9 * TILESIZE,0,oPlayer);
ds_list_add(entityList, player);

//track player's position in world in startingGrid*
player.startingGridX = scConvertToTile(player.x);
player.startingGridY = scConvertToTile(player.y);

//log player on array
ds_grid_set(oControllerTile.entityArray, player.startingGridX, player.startingGridY, player);

//entityArray[player.y / TILESIZE, player.x / TILESIZE] = player;


//initialise npc
npc = instance_create_depth(2 * TILESIZE, 4 * TILESIZE,0,oNpc);
ds_list_add(entityList, npc);

//track npc's position in world in startingGrid*
npc.startingGridX = scConvertToTile(npc.x);
npc.startingGridY = scConvertToTile(npc.y);

//log npc on array
ds_grid_set(oControllerTile.entityArray, npc.startingGridX, npc.startingGridY, npc);

//entityArray[npc.y / TILESIZE, npc.x / TILESIZE] = npc;





