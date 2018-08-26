/// @desc draw tile to screen

for (var _arrayHeight = ds_grid_height(tileGrid)-1; _arrayHeight >= 0; _arrayHeight--; ){
	for (var _arrayLength = ds_grid_width(tileGrid)-1; _arrayLength >= 0; _arrayLength--; ){	
		
		//check if tile ISBLOCKINGMOVEMENT, i.e. a wall. otherwise it is a floor
		if ds_grid_get(tileGrid, _arrayLength, _arrayHeight) & ISBLOCKINGMOVEMENT {
			draw_sprite_ext(darkWall[0], darkWall[1], scConvertToXY(_arrayLength), scConvertToXY(_arrayHeight) , 1, 1, 0,darkWall[2],1);
		} else {
			draw_sprite_ext(darkGround[0], darkGround[1], scConvertToXY(_arrayLength) , scConvertToXY(_arrayHeight) , 1, 1, 0,darkGround[2],1);
		}

	}
}
