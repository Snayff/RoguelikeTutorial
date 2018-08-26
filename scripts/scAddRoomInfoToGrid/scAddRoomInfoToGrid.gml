///@desc add new room info, to roomInfoGrid
///@param x Starting X
///@param y Starting Y
///@param width width of room
///@param height height of room

var _grid = oControllerTile.roomInfoGrid;

//resize grid
ds_grid_resize(_grid, ds_grid_width(_grid), ds_grid_height(_grid) + 1);

//add new values
for  (var _i = 0; _i < argument_count; _i++ ) {
    ds_grid_set(_grid, _i, ds_grid_height(_grid) - 1, argument[ _i ] ); // -1 to use last position
}
