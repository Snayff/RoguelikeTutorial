///@desc check a tile on the tileGrid to see if it blocks sight
///@param targetTileX tile X of target
///@param targetTileY tile Y of target
///@param octant octant number out of 8
///@param tileX origin tile X position
///@param tileY origin tile Y position


var _targetTileX = argument0;
var _targetTileY = argument1;
var _octant = argument2;
var _tileX = argument3;
var _tileY = argument4;

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

//check tileGrid for sight block
if ds_grid_get(oControllerTile.tileGrid, _newX, _newY) & ISBLOCKINGSIGHT {
	return true;		
} else {
	return false;	
}