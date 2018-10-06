/// @desc handle entities


scDebugMsg("CREATE CONTROLLER ENTITY:");

//create entity list
entityList = ds_list_create()

//initialise entity array and set to empty
entityGrid = ds_grid_create(global.mapWidthInTiles, global.mapHeightInTiles);
ds_grid_set_region(oControllerEntity.entityGrid, 0, 0, ds_grid_width(oControllerEntity.entityGrid), ds_grid_height(oControllerEntity.entityGrid), -1);

//initialise starting info for all entities
scInitialiseEntityStartingInfo() ;

//create player var for referencing
player = -1;

//who has current turn?
turnHolder = -1;
moveToNextTurn = false;

//create movement grid - AI movement
movementGrid = mp_grid_create(0,0, global.mapWidthInTiles, global.mapHeightInTiles, TILESIZE, TILESIZE); 

//field of view values
fovRecompute = true; //flag to determine when fov needs to be recalculated

//create viewGrid - handle lighting / fov
viewGrid = ds_grid_create(global.mapWidthInTiles, global.mapHeightInTiles);

//initialise viewGrid
ds_grid_set_region(viewGrid, 0, 0, ds_grid_width(viewGrid), ds_grid_height(viewGrid), 0); // 0 = no starting value
