///@desc remove entity from a tile
///@param entity entity to remove
///@param targetX tile X to remove from
///@param targetY tile Y to remove from

var _entity = argument0;
var _targetX = argument1;
var _targetY = argument2;

//remove entity from current position in entityGrid
var _listIndexInPosition = oControllerEntity.entityGrid[# _targetX, _targetY];
ds_list_delete(_listIndexInPosition, ds_list_find_index(_listIndexInPosition, _entity));


//if list is empty delete list and set value to -1
if ds_list_empty(_listIndexInPosition) {
	ds_list_destroy(_listIndexInPosition)	
	oControllerEntity.entityGrid[# _targetX, _targetY] = -1;
}