///@desc update viewGrid to show tile as visible
///@param targetTileX tile X of target
///@param targetTileY tile Y of target
///@param octant octant number out of 8
///@param tileX origin tile X position
///@param tileY origin tile Y position
///@param {bool}visible is visible?


//FOV_SetVisible(_dx, _dy, _octant, _xpos, _ypos)

var _dx = argument0;
var _dy = argument1;
var _octant = argument2;
var _xpos = argument3;
var _ypos = argument4;

var _nx = _xpos, _ny = _ypos;
switch(_octant){
    case 0: _nx += _dx; _ny -= _dy; break;
    case 1: _nx += _dy; _ny -= _dx; break;
    case 2: _nx -= _dy; _ny -= _dx; break;
    case 3: _nx -= _dx; _ny -= _dy; break;
    case 4: _nx -= _dx; _ny += _dy; break;
    case 5: _nx -= _dy; _ny += _dx; break;
    case 6: _nx += _dy; _ny += _dx; break;
    case 7: _nx += _dx; _ny += _dy; break;
}

	
	
oControllerView.viewGrid[# _nx, _ny] |= ISVISIBLE;
//scDebugMsg("Updated viewGrid[", _newX, ",", _newY, "] from ", _currentViewValue, " to ",_newViewValue,"." )