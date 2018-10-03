///@desc checks if an entity occupies the specified tile
///note that it is a ds_list storing all entities
///@param targetX target's tile X 
///@param targetY target's tile Y 

var _entityListAtPosition = oControllerEntity.entityGrid[# argument0, argument1];

//check if there is a list of entities at that tile position 
// - we delete it when empty so if it exists there is at least one entity
if ds_exists(_entityListAtPosition, ds_type_list) {
	return true;
} else {
	return false; 
}