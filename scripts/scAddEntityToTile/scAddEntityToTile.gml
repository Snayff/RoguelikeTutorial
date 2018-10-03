///@desc add entity to new tile
///@param entity entity to add
///@param targetX tile X to add to 
///@param targetY tile Y to add to 

var _entity = argument0;
var _targetX = argument1;
var _targetY = argument2;

//add entity to new position in array
var _listIndexInTarget = oControllerEntity.entityGrid[# _targetX, _targetY];
if !ds_exists(_listIndexInTarget, ds_type_list) {
	_listIndexInTarget = ds_list_create();
	ds_grid_set(oControllerEntity.entityGrid, _targetX, _targetY, _listIndexInTarget);
}

ds_list_add(_listIndexInTarget, _entity);