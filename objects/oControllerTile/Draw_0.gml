/// @desc draw tile to screen

for (var _arrayHeight = ds_grid_height(tileGrid)-1; _arrayHeight >= 0; _arrayHeight--; ){
	for (var _arrayLength = ds_grid_width(tileGrid)-1; _arrayLength >= 0; _arrayLength--; ){	
		
		var _tileX = scConvertToXY(_arrayLength);
		var _tileY = scConvertToXY(_arrayHeight);
		var _tileValue = ds_grid_get(tileGrid, _arrayLength, _arrayHeight);
		
		
		
		//check if tile ISBLOCKINGMOVEMENT, i.e. a wall. otherwise it is a floor
		if _tileValue & ISBLOCKINGMOVEMENT {
			//check if can be seen
			if _tileValue & ISVISIBLE {
				scDrawTile(wall[tileInfo.sprite], wall[tileInfo.subImage], _tileX, _tileY, COLOUR_LIGHTWALL);
			} else {
				scDrawTile(wall[tileInfo.sprite], wall[tileInfo.subImage], _tileX, _tileY, COLOUR_DARKWALL);
			}
			
		} else {
			if _tileValue & ISVISIBLE {
				scDrawTile(ground[tileInfo.sprite], ground[tileInfo.subImage], _tileX, _tileY, COLOUR_LIGHTGROUND);
			} else {
				scDrawTile(ground[tileInfo.sprite], ground[tileInfo.subImage], _tileX, _tileY, COLOUR_DARKGROUND);
			}	
		}

	}
}
