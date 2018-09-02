///@desc checks if an entity occupies the specified tile
///@param targetX target's tile X 
///@param targetY target's tile Y 

if ds_grid_get(oControllerEntity.entityGrid,argument0, argument1) <> 0 {
	return true;
} else {
	return false; 
}