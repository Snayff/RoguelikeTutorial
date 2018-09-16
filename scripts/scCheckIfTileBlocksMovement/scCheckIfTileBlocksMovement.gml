///@desc checks if a tile oblocks movement
///@param targetX target's tile X 
///@param targetY target's tile Y 

var _tileValue = ds_grid_get(oControllerTile.tileGrid, argument0, argument1);

if _tileValue & ISBLOCKINGMOVEMENT {
	return true;
} else {
	return false; 
}