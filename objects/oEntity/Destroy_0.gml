/// @desc remove entity from all data structures

var _entity = id;

scRemoveEntityFromTile( _entity);

ds_list_delete(oControllerEntity.entityList, ds_list_find_index(oControllerEntity.entityList, _entity));