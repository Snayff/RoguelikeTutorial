/// @desc draw tile to screen

for (var _arrayHeight = ds_grid_height(oControllerTile.tileGrid)-1; _arrayHeight >= 0; _arrayHeight--; ){
	for (var _arrayLength = ds_grid_width(oControllerTile.tileGrid)-1; _arrayLength >= 0; _arrayLength--; ){	
		
		var _tileX = scConvertToXY(_arrayLength);
		var _tileY = scConvertToXY(_arrayHeight);
		var _tileValue = ds_grid_get(oControllerTile.tileGrid, _arrayLength, _arrayHeight);
		var _viewValue = ds_grid_get(oControllerView.viewGrid, _arrayLength, _arrayHeight);
		

		//can we see the tile
		if _viewValue & ISVISIBLE {
			
			//check if tile ISBLOCKINGMOVEMENT, i.e. a wall. otherwise it is a floor
			if _tileValue & ISBLOCKINGMOVEMENT {
				scDrawTile(wall[tileInfo.sprite], wall[tileInfo.subImage], _tileX, _tileY, COLOUR_LIGHTWALL);
			} else {
				scDrawTile(ground[tileInfo.sprite], ground[tileInfo.subImage], _tileX, _tileY, COLOUR_LIGHTGROUND);
			}
		
		} else if _viewValue & ISEXPLORED {
			if _tileValue & ISBLOCKINGMOVEMENT {
				scDrawTile(wall[tileInfo.sprite], wall[tileInfo.subImage], _tileX, _tileY, COLOUR_DARKWALL);
			} else {
				scDrawTile(ground[tileInfo.sprite], ground[tileInfo.subImage], _tileX, _tileY, COLOUR_DARKGROUND);
			}
		}
		
		/*
		//check if tile ISBLOCKINGMOVEMENT, i.e. a wall. otherwise it is a floor
		if _tileValue & ISBLOCKINGMOVEMENT {
			//check if can be seen
			
			
			if _viewValue & ISVISIBLE {
				scDrawTile(wall[tileInfo.sprite], wall[tileInfo.subImage], _tileX, _tileY, COLOUR_LIGHTWALL);
			} else {
				scDrawTile(wall[tileInfo.sprite], wall[tileInfo.subImage], _tileX, _tileY, COLOUR_DARKWALL);
			}
			
		} else {
			if _viewValue & ISVISIBLE {
				scDrawTile(ground[tileInfo.sprite], ground[tileInfo.subImage], _tileX, _tileY, COLOUR_LIGHTGROUND);
			} else {
				scDrawTile(ground[tileInfo.sprite], ground[tileInfo.subImage], _tileX, _tileY, COLOUR_DARKGROUND);
			}
			
		}
		/*if _tileValue & ISBLOCKINGSIGHT {
			scDrawTile(spCalibriFont, 49, _tileX, _tileY, c_lime);
		} else {
			scDrawTile(spCalibriFont, 48, _tileX, _tileY, c_olive);
		}
		*/
		
	}
}
