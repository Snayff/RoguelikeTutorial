/// @desc draw tiles to screen


for (var _tilesArrayHeight = array_height_2d(tiles)-1; _tilesArrayHeight >= 0; _tilesArrayHeight--; ){
	for (var _tilesArrayLength = array_length_2d(tiles, _tilesArrayHeight)-1; _tilesArrayLength >= 0; _tilesArrayLength--; ){	
		
		//check if tile isBlockingMovement
		if tiles[_tilesArrayHeight, _tilesArrayLength] & isBlockingMovement {
			draw_sprite_ext(spTile, 0, _tilesArrayLength * TILESIZE, _tilesArrayHeight * TILESIZE, 1, 1, 0,darkWall,1);
		} else {
			draw_sprite_ext(spTile, 0, _tilesArrayLength * TILESIZE, _tilesArrayHeight * TILESIZE, 1, 1, 0,darkGround,1);
		}

	}
}
