/// @desc handle entities

//create entities list
entitiesList = ds_list_create()

//initialise player
player = instance_create_depth(0,0,0,oPlayer);
ds_list_add(entitiesList, player);

//move player to centre of screen
player.x = window_get_width() / 2;
player.y = window_get_height() / 2;

//initialise npc
npc = instance_create_depth(0,0,0,oPlayer);
ds_list_add(entitiesList, npc);

//move npc to off-centre of screen
npc.x = (window_get_width() / 2) - 5;
npc.y = window_get_height() / 2;
npc.image_blend = c_aqua; //set colour



