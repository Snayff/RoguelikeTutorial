///@desc set one or more fields of a row in a ds_grid
///@param grid the ds_grid
///@param gridY row to edit
///@param startingGridX col to start at
///@param value value to set
///@param [...]

var _grid = argument[0];
var _gridY = argument[1];
var _startingGridX = argument[2];
var _argValue;

//loop through values and add to grid whilst in grid range
for (var _i = 3; _i < argument_count ; _i++){
	ds_grid_add(_grid, _startingGridX + (_i -3) , _gridY, argument[_i]); //3 is the number of arguments before the value
	//scDebugMsg("Write to grid position ", _i - 3, ": ", argument[_i]);
}
