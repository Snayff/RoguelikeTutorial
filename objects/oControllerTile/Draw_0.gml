/// @desc draw tile to screen


for (var _arrayHeight = array_height_2d(tileArray)-1; _arrayHeight >= 0; _arrayHeight--; ){
	for (var _arrayLength = array_length_2d(tileArray, _arrayHeight)-1; _arrayLength >= 0; _arrayLength--; ){	
		
		//check if tile isBlockingMovement, i.e. a wall. otherwise it is a floor
		if tileArray[_arrayHeight, _arrayLength] & isBlockingMovement {
			draw_sprite_ext(darkWall[0], darkWall[1], _arrayLength * TILESIZE, _arrayHeight * TILESIZE, 1, 1, 0,darkWall[2],1);
		} else {
			draw_sprite_ext(darkGround[0], darkGround[1], _arrayLength * TILESIZE, _arrayHeight * TILESIZE, 1, 1, 0,darkGround[2],1);
		}

	}
}
