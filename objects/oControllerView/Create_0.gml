/// @desc

scDebugMsg("CREATE CONTROLLER VIEW:");
//field of view values
fovRadius = 5; //how far player can see, i.e. how much is shown on screen
fovRecompute = true; //flag to determine when fov needs to be recalculated

//create viewGrid - handle lighting
viewGrid = ds_grid_create(global.mapWidthInTiles, global.mapHeightInTiles);

//initialise viewGrid
ds_grid_set_region(viewGrid, 0, 0, ds_grid_width(viewGrid), ds_grid_height(viewGrid), 0); // 0 = no starting value