///@desc check a tile on the tileGrid to see if it blocks sight
///@param ds tile X of target
///@param dy tile Y of target
///@param octant octant number out of 8
///@param tileX origin tile X position
///@param tileY origin tile Y position


var _dx = argument0;
var _dy = argument1;
var _octant = argument2;
var _xpos = argument3;
var _ypos = argument4;

var _nx = _xpos, _ny = _ypos;
	switch(_octant)
    {
      case 0: _nx += _dx; _ny -= _dy; break;
      case 1: _nx += _dy; _ny -= _dx; break;
      case 2: _nx -= _dy; _ny -= _dx; break;
      case 3: _nx -= _dx; _ny -= _dy; break;
      case 4: _nx -= _dx; _ny += _dy; break;
      case 5: _nx -= _dy; _ny += _dx; break;
      case 6: _nx += _dy; _ny += _dx; break;
      case 7: _nx += _dx; _ny += _dy; break;
    }
    
if ds_grid_get(oControllerTile.tileGrid, _nx, _ny) & ISBLOCKINGSIGHT {
	return true; 		
} else {
	return false; 
}
