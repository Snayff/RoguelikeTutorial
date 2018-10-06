///@desc draw inventory menu
var _screenHeight = oControllerCamera.idealHeight;
var _screenWidth = oControllerCamera.idealWidth;

var _startX = _screenWidth * 0.2;
var _startY = _screenHeight * 0.1;
var _width = _screenWidth - (_startX *2);
var _height = _screenHeight - (_startY *2);
var _backColour = c_black;
var _outlineColour = c_white;
var _alpha = 0.8;

scDrawWindow(_startX, _startY, _width, _height,_backColour, _outlineColour, _alpha );

//draw inventory grid

//draw items