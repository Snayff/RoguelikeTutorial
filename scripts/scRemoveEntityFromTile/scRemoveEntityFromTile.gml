///@desc remove entity from current tile
///@param entity entity to remove

var _entity = argument0;
var _targetX = _entity.startingGridX;
var _targetY =  _entity.startingGridY;

//remove entity from current position in entityGrid
var _listIndexInPosition = oControllerEntity.entityGrid[# _targetX, _targetY];
ds_list_delete(_listIndexInPosition, ds_list_find_index(_listIndexInPosition, _entity));


//if list is empty delete list and set value to -1
if ds_list_empty(_listIndexInPosition) {
	ds_list_destroy(_listIndexInPosition)	
	oControllerEntity.entityGrid[# _targetX, _targetY] = -1;
}