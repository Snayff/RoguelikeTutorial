/// @desc


#region camera follow

var _player = oControllerEntity.player;

// WITH AND _height VARIABLES
var _width = idealWidth;
var _halfWidth = _width*.5;
var _height = idealHeight;
var _halfHeight = _height*.5;

if _player <> -1 {
	var _playerX = _player.x;
	var _playerY = _player.y; 
} else {
	var _playerX = _halfWidth;
	var _playerY = _halfHeight;
}
		
	var _xBorderSize = _halfWidth;
			
	// establish pre-existing camera variables
	var _cameraX = cameraX;
	var _cameraY = cameraY;
	var _cameraDestX = _cameraX;
	var _cameraDestY = _cameraY;
			
	// establish camera destination
	// X CAMERA
	if (_playerX > _cameraX + _width - _xBorderSize){
		_cameraDestX = _playerX + _xBorderSize - _width;
	} else if (_playerX < _cameraX + _xBorderSize){
		_cameraDestX = _playerX - _xBorderSize;
	}
			
	_cameraDestX = lerp(_cameraX, _cameraDestX, 0.07); 
			
	// Y CAMERA
	_cameraDestY = lerp(_cameraY, _playerY - _halfHeight, 0.05 )
			
	// UPDATE CAMERA X/Y (BASE POSITION)
	cameraX = _cameraDestX;
	cameraY = _cameraDestY;
	
	//to clamp to room use this instead
	//var _finalCameraX = round(clamp(_cameraDestX, 0, room_width - _width));
	//var _finalCameraY = round(clamp(_cameraDestY, 0, room_height - _height));

	var _finalCameraX = _cameraDestX;
	var _finalCameraY = _cameraDestY;
	
	camera_set_view_pos(camera, _finalCameraX , _finalCameraY )

#endregion




#region test functions
if keyboard_check_pressed(ord("Z")) {
 	
	zoom++;
	
	if (zoom > max_zoom){
		zoom = 1;
	}

	window_set_size(idealWidth*zoom, idealHeight*zoom);
	alarm[0] = 1; // trigger recentre of display and resixze of UI

}

if (keyboard_check_pressed(ord("F"))) {
	switch fullScreen
	{
		case 0:
			window_set_fullscreen(1);
			fullScreen = 1;
			break;
		case 1:
			window_set_fullscreen(0);
			fullScreen = 0;
			break;
		
	}
	alarm[0] = 1; // recenters display.
}
#endregion