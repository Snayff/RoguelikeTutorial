///@desc draw the message log
///@param startX 
///@param startY
///@param width
///@param height
///@param backColour colour of the log
///@param alpha

var _startX = argument0;
var _startY = argument1;
var _width = argument2;
var _height = argument3;
var _backColour = argument4;
var _alpha = argument5;

draw_set_alpha(_alpha);
draw_rectangle_colour(_startX, _startY, _startX + _width, _startY + _height, _backColour, _backColour, _backColour, _backColour, true );
draw_set_alpha(1); //reset