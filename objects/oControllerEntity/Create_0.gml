/// @desc handle entity


scDebugMsg("CREATE CONTROLLER ENTITY:");

//create entity list
entityList = ds_list_create()

//initialise entity array
entityGrid = ds_grid_create(oControllerTile.mapWidthInTiles, oControllerTile.mapHeightInTiles);
ds_grid_set_region(oControllerEntity.entityGrid, 0, 0, ds_grid_width(oControllerEntity.entityGrid), ds_grid_height(oControllerEntity.entityGrid), 0);

//for (var _arrayHeight = mapHeight / TILESIZE; _arrayHeight >= 0; _arrayHeight--; ){
//	for (var _arrayLength = mapWidth / TILESIZE; _arrayLength >= 0; _arrayLength--; ){	
//		entityGrid[_arrayHeight, _arrayLength] = 0;

//	}
//}


//initialise player
player = instance_create_depth(5 * TILESIZE, 9 * TILESIZE,0,oPlayer);
ds_list_add(entityList, player);

//track player's position in world in startingGrid*
player.startingGridX = scConvertToTile(player.x);
player.startingGridY = scConvertToTile(player.y);

//log player on array
ds_grid_set(oControllerEntity.entityGrid, player.startingGridX, player.startingGridY, player);

//entityGrid[player.y / TILESIZE, player.x / TILESIZE] = player;


//initialise npc
npc = instance_create_depth(2 * TILESIZE, 4 * TILESIZE,0,oNpc);
ds_list_add(entityList, npc);

//track npc's position in world in startingGrid*
npc.startingGridX = scConvertToTile(npc.x);
npc.startingGridY = scConvertToTile(npc.y);

//log npc on array
ds_grid_set(oControllerEntity.entityGrid, npc.startingGridX, npc.startingGridY, npc);

//entityGrid[npc.y / TILESIZE, npc.x / TILESIZE] = npc;





