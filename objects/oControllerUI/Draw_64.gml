/// @desc

var _edgeSize = 10;
var _logWidth = 240;
var _logHeight = 180;
var _logStartX = oControllerCamera.cameraWidth - _logWidth - _edgeSize;
var _logStartY = oControllerCamera.cameraHeight - _logHeight - _edgeSize;
var _logBackColour = c_white;
var _logAlpha = 0.5;

scDrawMessageLogWindow(_logStartX, _logStartY, _logWidth, _logHeight, _logBackColour, _logAlpha);

var _barWidth = 120;
var _barHeight = 20;
var _startX = (_logStartX + _logWidth) - _barWidth;
var _startY = oControllerCamera.cameraHeight - (_barHeight * 2) - _logHeight;
var _fillColourMin = c_red;
var _fillColourMax = c_green;
var _backColour = c_black;

scDrawResourceBar(resourceType.hp, _startX, _startY, _barWidth, _barHeight,_fillColourMin, _fillColourMax, _backColour );



