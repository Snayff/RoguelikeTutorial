/// @desc DEBUG

draw_self();

//draw movement path
if path_exists(path) {
	
	draw_path(path, scConvertToXY(startingGridX), scConvertToXY(startingGridX) , true);
	
	
	var _pointX1 = path_get_point_x(path, 1);
	var _pointY1 = path_get_point_y(path, 1);
	draw_circle(_pointX1,_pointY1, 5, false)

	if path_get_number(path) > 1 {
		var _pointX2 = path_get_point_x(path, 2);
		var _pointY2 = path_get_point_y(path, 2);
		draw_circle(_pointX2,_pointY2, 5, false)
	} else if path_get_number(path) > 2 {

		var _pointX3 = path_get_point_x(path, 3);
		var _pointY3 = path_get_point_y(path, 3);
		draw_circle(_pointX3,_pointY3, 5, false)
	}
}
