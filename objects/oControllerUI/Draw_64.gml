/// @desc



scDrawMessageLogWindow(logStartX, logStartY, logWidth, logHeight, logBackColour, logOutlineColour,  logAlpha);

var _barWidth = 120;
var _barHeight = 20;
var _startX = (logStartX + logWidth) - _barWidth;
var _startY = oControllerCamera.cameraHeight - (_barHeight * 2) - logHeight;
var _fillColourMin = c_red;
var _fillColourMax = c_green;
var _backColour = c_black;

scDrawResourceBar(resourceType.hp, _startX, _startY, _barWidth, _barHeight,_fillColourMin, _fillColourMax, _backColour );


//scribble_draw( oExample.json, oExample.x, oExample.y );
draw_set_font(fTestA);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text_ext(logStartX , logStartY , messageString, -1, logWidth);