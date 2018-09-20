/// @desc UI

//font and alignment info
draw_set_font(fTestA);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
var _fontHeight = string_height("0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM");

#region Tile Info
var _selectTileX = oControllerTile.tileSelectedX;
var _selectTileY = oControllerTile.tileSelectedY;
scDebugMsg("select: ", _selectTileX, _selectTileY);

var _tileValue = 0;
var _viewValue = 0; 
var _entityValue = 0;

if _selectTileX > 0 && _selectTileX < global.mapWidthInTiles && _selectTileY > 0 && _selectTileY < global.mapHeightInTiles {
	_tileValue = ds_grid_get(oControllerTile.tileGrid, _selectTileX, _selectTileY);
	_viewValue = ds_grid_get(oControllerEntity.viewGrid, _selectTileX, _selectTileY);
	_entityValue = ds_grid_get(oControllerEntity.entityGrid, _selectTileX, _selectTileY);
}

//what do we need to draw?
var _blocksSight = false;
var _blocksMovement = false;

//can we see the tile
if _viewValue & ISEXPLORED {
	if _tileValue & ISBLOCKINGMOVEMENT {
		_blocksSight = true;	
	}
	if _tileValue & ISBLOCKINGSIGHT {
		_blocksMovement = true;	
	}
	if _entityValue <> 0 {
		
		var _entityName = scConvertToString(_entityValue.name);
		var _entityMaxHp = scConvertToString(_entityValue.maxHp);
		var _entityHp = scConvertToString(_entityValue.hp);
		var _entityStrengthString = scConvertToString("Str: ", _entityValue.strength);
		var _entityDefenseString = scConvertToString("Def: ", _entityValue.defense);
	}
}

//draw tileBox
scDrawWindow(tileBoxStartX, tileBoxStartY, tileBoxWidth, tileBoxHeight, logBackColour, logOutlineColour,  logAlpha);

var _tileHeader = scConvertToString("Tile Info");
var _tileSightString = scConvertToString("Blocks sight = ", _blocksSight);
var _tileMoveString = scConvertToString("Blocks movement = ", _blocksMovement);
draw_text(tileBoxStartX + edgeSize, tileBoxStartY + edgeSize, _tileHeader);
draw_text(tileBoxStartX + edgeSize, tileBoxStartY + edgeSize + _fontHeight + 2, _tileSightString);
draw_text(tileBoxStartX  + edgeSize, tileBoxStartY +  edgeSize + (_fontHeight *2) + 2, _tileMoveString);

//draw infoBox
scDrawWindow(infoBoxStartX, infoBoxStartY, infoBoxWidth, infoBoxHeight, logBackColour, logOutlineColour,  logAlpha);

var _entityHeader = scConvertToString("Actor info");
draw_text(infoBoxStartX + 2, infoBoxStartY + 2, _entityHeader);

if _entityValue <> 0  {
	draw_text(infoBoxStartX  + 2, infoBoxStartY + _fontHeight + 2, _entityName);
	draw_text(infoBoxStartX +  2, infoBoxStartY + (_fontHeight *2) + 2, "HP: " + _entityHp + "/" + _entityMaxHp);
	draw_text(infoBoxStartX +  2, infoBoxStartY + (_fontHeight *3) + 2, _entityStrengthString + "  " + _entityDefenseString );
}

#endregion


#region Resource Bar

var _fillColourMin = c_red;
var _fillColourMax = c_green;

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
scDrawResourceBar(resourceType.hp, resourceBarStartX, resourceBarStartY, resourceBarWidth, resourceBarHeight,_fillColourMin, _fillColourMax, resourceBackColour );

#endregion

#region Message log
draw_set_valign(fa_top);
draw_set_halign(fa_left);
scDrawWindow(logStartX + incrementX, logStartY + incrementY, logWidth, logHeight, logBackColour, logOutlineColour,  logAlpha);

//populate text in log
//scribble_draw( oExample.json, oExample.x, oExample.y );
draw_text_ext(logStartX + edgeSize , logStartY + edgeSize, messageString, -1, logWidth);
#endregion



