/// @desc draw tile to screen

var _xPos = -1;
var _yPos = -1;
var _tileValue = -1;
var _viewValue = -1;


//loop backwards through tileGrid and draw all tiles as required
for (var _tileY = ds_grid_height(oControllerTile.tileGrid)-1; _tileY >= 0; _tileY--; ){
	for (var _tileX = ds_grid_width(oControllerTile.tileGrid)-1; _tileX >= 0; _tileX--; ){	
		
		_xPos = scConvertToXY(_tileX);
		_yPos = scConvertToXY(_tileY);
		_tileValue = ds_grid_get(oControllerTile.tileGrid, _tileX, _tileY);
		_viewValue = ds_grid_get(oControllerEntity.viewGrid, _tileX, _tileY);


		//can see the tile
		if _viewValue & ISVISIBLE {
			
			//check if tile ISBLOCKINGMOVEMENT, i.e. a wall. otherwise it is a floor
			if _tileValue & ISBLOCKINGMOVEMENT {
				scDrawTile(wall[tileInfo.sprite], wall[tileInfo.subImage], _xPos, _yPos, COLOUR_LIGHTWALL);
			} else {
				scDrawTile(ground[tileInfo.sprite], ground[tileInfo.subImage], _xPos, _yPos, COLOUR_LIGHTGROUND);
			}
			
			
			
		} else if _viewValue & ISEXPLORED { //have seen
			
			if _tileValue & ISBLOCKINGMOVEMENT {
				scDrawTile(wall[tileInfo.sprite], wall[tileInfo.subImage], _xPos, _yPos, COLOUR_DARKWALL);
			} else {
				scDrawTile(ground[tileInfo.sprite], ground[tileInfo.subImage], _xPos, _yPos, COLOUR_DARKGROUND);
			}
			
		} else { //can't see & haven't seen
				
		}
	}
}
