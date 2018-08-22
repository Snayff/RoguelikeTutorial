///@desc add new room, and info, to room list
///@param x Starting X
///@param y Starting Y
///@param width width of room
///@param height height of room

var _controller = oControllerTile.roomList;

//resize grid
ds_grid_resize(_controller, ds_grid_width(_controller), ds_grid_height(_controller) + 1);

//add new values
for  (var _i = 0; _i < argument_count; _i++ ) {
    ds_grid_set(_controller, _i, ds_grid_height(_controller), argument[ _i ] );
}




//ds_list_add(oControllerTile.roomList, argument0, argument1, argument2, argument3);