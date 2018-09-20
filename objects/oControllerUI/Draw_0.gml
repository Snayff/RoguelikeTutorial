/// @desc mouse highlight


var _selectTileX = scConvertToXY(oControllerTile.tileSelectedX);
var _selectTileY = scConvertToXY(oControllerTile.tileSelectedY);

var _mouseTileX = scConvertToTile(mouse_x);
var _mouseTileY = scConvertToTile(mouse_y);

var _tileHighlight = c_white;

draw_set_alpha(0.5);
draw_rectangle_colour(_selectTileX, _selectTileY, _selectTileX + TILESIZE, _selectTileY + TILESIZE, _tileHighlight, _tileHighlight, _tileHighlight, _tileHighlight, true)
draw_set_alpha(1);


var _string = scConvertToString("x:", mouse_x, " y:", mouse_y, "\n", "tx: ", _mouseTileX, " ty: ", _mouseTileY);
draw_text(mouse_x, mouse_y, _string);