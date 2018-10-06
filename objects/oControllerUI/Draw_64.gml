/// @desc selected tile info, resource bars, message log

//font and alignment info
draw_set_font(fTestA);
draw_set_valign(fa_top);
draw_set_halign(fa_left);



#region Message log

scDrawWindow(logStartX , logStartY , logWidth, logHeight, logBackColour, logOutlineColour,  logAlpha);

//show text in log
draw_text_ext(logStartX + edgeSize , logStartY + edgeSize, messageString, -1, logWidth);

#endregion

#region select Info

if showTileSelect {
	var _selectTileX = oControllerTile.tileSelectedX;
	var _selectTileY = oControllerTile.tileSelectedY;

	var _tileValue = 0;
	var _viewValue = 0; 
	var _entityValue = 0;
	var _entityName = "";
	var _entityMaxHp = "";
	var _entityHp = "";
	var _entityHpString = "";
	var _entityStrengthString = "";
	var _entityDefenseString = "";
	var _entityListAtPosition = -1;
	var _tempEntity = -1;
	
	//if selection is in map then get values
	if _selectTileX > 0 && _selectTileX < global.mapWidthInTiles && _selectTileY > 0 && _selectTileY < global.mapHeightInTiles {
		_tileValue = ds_grid_get(oControllerTile.tileGrid, _selectTileX, _selectTileY);
		_viewValue = ds_grid_get(oControllerEntity.viewGrid, _selectTileX, _selectTileY);
		//_entityValue = ds_grid_get(oControllerEntity.entityGrid, _selectTileX, _selectTileY);
		_entityListAtPosition = oControllerEntity.entityGrid[# _selectTileX, _selectTileY];
		
		//check entity list exists in selected space
		if ds_exists(_entityListAtPosition, ds_type_list) {
			_entityValue = ds_list_find_value(_entityListAtPosition, 0);
			
			//loop all entities on spot and get one with nearest depth
			var _size = ds_list_size(_entityListAtPosition);
			for ( var _i = 0; _i < ds_list_size(_entityListAtPosition); _i++)  {
				_tempEntity = ds_list_find_value(_entityListAtPosition, _i);
				
				//check which has nearest depth
				if _tempEntity.depth > _entityValue.depth {
					_entityValue = _tempEntity;
				}
			}
		}
	}

	//what do we need to draw?
	var _blocksSight = false;
	var _blocksMovement = false;

	//can we see the tile
	if _viewValue & ISEXPLORED {
	
		if _tileValue & ISBLOCKINGMOVEMENT {
			_blocksMovement = true;	
		}
	
		if _tileValue & ISBLOCKINGSIGHT {
			_blocksSight = true;	
		}
	
		//get entity info
		if _entityValue <> 0 {
			if variable_instance_exists(_entityValue, "name") {
				_entityName = scConvertToString(_entityValue.name);
			}
			if variable_instance_exists(_entityValue, "maxHp") {
				_entityMaxHp = scConvertToString(_entityValue.maxHp);
				_entityHp = scConvertToString(_entityValue.hp);
				_entityHpString = "HP: " + _entityHp + "/" + _entityMaxHp
			}

			if variable_instance_exists(_entityValue, "strength") {
				_entityStrengthString = scConvertToString("Str: ", _entityValue.strength);
			}
			if variable_instance_exists(_entityValue, "defense") {
				_entityDefenseString = scConvertToString("Def: ", _entityValue.defense);
			}
		
		}
	}

	//draw tileBox
	scDrawWindow(tileBoxStartX, tileBoxStartY, tileBoxWidth, tileBoxHeight, logBackColour, logOutlineColour,  logAlpha);

	var _tileHeader = scConvertToString("Tile Info");
	var _tileSightString = scConvertToString("Blocks sight = ", _blocksSight);
	var _tileMoveString = scConvertToString("Blocks movement = ", _blocksMovement);
	draw_text(tileBoxStartX + edgeSize, tileBoxStartY + edgeSize, _tileHeader);
	draw_text(tileBoxStartX + edgeSize, tileBoxStartY + edgeSize + fontHeight + 2, _tileSightString);
	draw_text(tileBoxStartX  + edgeSize, tileBoxStartY +  edgeSize + (fontHeight *2) + 2, _tileMoveString);

	//draw infoBox
	scDrawWindow(infoBoxStartX, infoBoxStartY, infoBoxWidth, infoBoxHeight, logBackColour, logOutlineColour,  logAlpha);

	var _entityHeader = scConvertToString("Entity info");
	draw_text(infoBoxStartX + 2, infoBoxStartY + 2, _entityHeader);

	if _entityValue <> 0 && _entityName <> "" {
		draw_text(infoBoxStartX  + 2, infoBoxStartY + fontHeight + 2, _entityName);
		draw_text(infoBoxStartX +  2, infoBoxStartY + (fontHeight *2) + 2, _entityHpString);
		draw_text(infoBoxStartX +  2, infoBoxStartY + (fontHeight *3) + 2, _entityStrengthString + "  " + _entityDefenseString );
	}
}
#endregion

#region Resource Bars

var _fillColourMin = c_red;
var _fillColourMax = c_green;

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
scDrawResourceBar(resourceType.hp, resourceBarStartX, resourceBarStartY, resourceBarWidth, resourceBarHeight,_fillColourMin, _fillColourMax, resourceBackColour );

#endregion





