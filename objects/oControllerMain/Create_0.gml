/// @desc create required objects and run start up scripts

scDebugMsg("CREATE CONTROLLER MAIN:");

//load globals
scGlobals();

//load font
//draw_set_font(global.font)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//set seed
//random_set_seed();

//load controllers
instance_create_depth(0,0,0,oControllerEvent);
instance_create_depth(0,0,0,oControllerEntity);
instance_create_depth(0,0,0,oControllerTile);
instance_create_depth(0,0,0,oControllerView);
instance_create_depth(0,0,0,oControllerInput);

