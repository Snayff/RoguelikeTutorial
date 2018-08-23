///@desc add new room, and info, to room list
///@param x Starting X
///@param y Starting Y
///@param width width of room
///@param height height of room

var _grid = oControllerTile.roomInfoGrid;

//resize grid
ds_grid_resize(_grid, ds_grid_width(_grid), ds_grid_height(_grid) + 1);

//add new values
for  (var _i = 0; _i < argument_count; _i++ ) {
    ds_grid_set(_grid, _i, ds_grid_height(_grid), argument[ _i ] );
}




//ds_list_add(oControllerTile.roomInfoGrid, argument0, argument1, argument2, argument3);