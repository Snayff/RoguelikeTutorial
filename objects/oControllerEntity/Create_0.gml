/// @desc handle entity


scDebugMsg("CREATE CONTROLLER ENTITY:");

//create entity list
entityList = ds_list_create()

//initialise entity array and set to empty
entityGrid = ds_grid_create(global.mapWidthInTiles, global.mapHeightInTiles);
ds_grid_set_region(oControllerEntity.entityGrid, 0, 0, ds_grid_width(oControllerEntity.entityGrid), ds_grid_height(oControllerEntity.entityGrid), 0);

//initialise starting info for all entities
scInitialiseEntityStartingInfo() ;

//create player var for referencing
player = -1;

//who has current turn?
turnHolder = -1;

//create movement grid
movementGrid = mp_grid_create(0,0, global.mapWidthInTiles, global.mapHeightInTiles, TILESIZE, TILESIZE); 

