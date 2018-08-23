/// @desc create required objects and run start up scripts

//load font
global.font = font_add_sprite(spCalibriFont, ord("!"), false, 2);
draw_set_font(global.font)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//load controllers
instance_create_depth(0,0,0,oControllerTile);
instance_create_depth(0,0,0,oControllerEntity);
instance_create_depth(0,0,0,oControllerInput);
instance_create_depth(0,0,0,oControllerView);
