///@desc update viewGrid to show tile as visible
///@param targetTileX tile X of target
///@param targetTileY tile Y of target
///@param octant octant number out of 8
///@param tileX origin tile X position
///@param tileY origin tile Y position
///@param {bool}visible is visible?


var _targetTileX = argument0;
var _targetTileY = argument1;
var _octant = argument2;
var _tileX = argument3;
var _tileY = argument4;
var _visible = argument5;

var _newX = _tileX;
var _newY = _tileY;

//depending on which octant move to next target tile
switch(_octant) {
    case 0: 
		_newX += _targetTileX; 
		_newY -= _targetTileY; 
		break;
		
    case 1: 
		_newX += _targetTileY; 
		_newY -= _targetTileX; 
		break;
		
    case 2: 
		_newX -= _targetTileY; 
		_newY -= _targetTileX; 
		break;
		
    case 3: 
		_newX -= _targetTileX; 
		_newY -= _targetTileY; 
		break;
		
    case 4: 
		_newX -= _targetTileX; 
		_newY += _targetTileY; 
		break;
		
    case 5: 
		_newX -= _targetTileY; 
		_newY += _targetTileX; 
		break;
		
    case 6: 
		_newX += _targetTileY; 
		_newY += _targetTileX; 
		break;
		
    case 7: 
		_newX += _targetTileX; 
		_newY += _targetTileY; 
		break;
}

var _currentViewValue = ds_grid_get(oControllerView.viewGrid, _newX, _newY);

//are we setting to visible or invisible
if _visible == true {

	//set tile to visible
	oControllerView.viewGrid[# _newX, _newY] |= ISVISIBLE;
} else {
	//set tile to not visible
	oControllerView.viewGrid[# _newX, _newY] &= ~ISVISIBLE;
}
var _newViewValue = ds_grid_get(oControllerView.viewGrid, _newX, _newY);

scDebugMsg("Updated viewGrid[", _newX, ",", _newY, "] from ", _currentViewValue, " to ",_newViewValue,"." )