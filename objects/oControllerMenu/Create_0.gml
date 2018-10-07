/// @desc init menu info

var _screenHeight = oControllerCamera.idealHeight;
var _screenWidth = oControllerCamera.idealWidth;
menuStartX = _screenWidth * 0.25;
menuStartY = _screenHeight * 0.1;
menuWidth = _screenWidth - (menuStartX *2);
menuHeight = _screenHeight - (menuStartY *2);
menuBackColour = c_black;
menuOutlineColour = c_white;
menuAlpha = 0.8;
menuEdgeIndent = 5;

activeMenu = -1; //store which menu to show