///@desc create camera in room

//Enable the use of views
view_enabled = true;

//Make view 0 visible
view_set_visible(0, true);

// WITH AND _height VARIABLES
var _width = idealWidth;
var _halfWidth = _width*.5;
var _height = idealHeight;
var _halfHeight = _height*.5;

//Camera creation
//Build a camera at (0,0), with size, 0 degrees of angle, no target instance, instant-jupming hspeed and vspeed, with a -1 pixel border
camera = camera_create_view((room_width/2) - _halfWidth, (room_height/2) - _halfHeight,  _width, _height, 0, -1, -1, -1,-1, -1);
view_set_camera(0, camera);


//start at the player if they exist
if  oControllerEntity.player <> -1 {
	var _player = oControllerEntity.player;
	var _cameraDestX = clamp( _player.x - _halfWidth, 0, room_width - _width)
	var _cameraDestY = clamp( _player.y - _halfHeight,0, room_height - _height)
	camera_set_view_pos(camera, _cameraDestX, _cameraDestY)
} else {
	camera_set_view_pos(camera, 0, 0)
}

cameraX = camera_get_view_x(camera);
cameraY = camera_get_view_y(camera);
