/// @desc update entities  & fov


#region handle entity turns
var _entity = -1;

//allocate turn
if oControllerEntity.moveToNextTurn {
	
	//loop all entities 
	var _currentIndex = ds_list_find_index(oControllerEntity.entityList, oControllerEntity.turnHolder);
	if _currentIndex == ds_list_size(oControllerEntity.entityList) - 1 {
		var _index = 0;
	}else {
		var _index = _currentIndex + 1;
	}
	
	//assign turn to entity
	_entity = ds_list_find_value(oControllerEntity.entityList, _index);
	oControllerEntity.turnHolder = _entity;
	
	//check if entity has ai and hp
	var _hasAi = variable_instance_exists(_entity, "ai");
	var _hasHp = variable_instance_exists(_entity, "hp");
	
	//has the hp variable so check if actually has hp
	if _hasHp {
		if _entity.hp > 0 {
			_hasHp = true;	
		} else {
			_hasHp = false;	
		}
	}
	
	//if entity has ai and hp take turn
	if  _hasAi && _hasHp {	
		oControllerEntity.moveToNextTurn = false;
			
		with _entity {	
			script_execute(ai); //run ai 
		}

	} else if _entity.name = "player"  {
		oControllerEntity.moveToNextTurn = false;

	}
}
#endregion	

#region trigger FoV recalc
//recalculate FOV
if fovRecompute == true {
	scCalculateFov();	
	fovRecompute = false; //turn flag off
}
#endregion

#region update entity positions
//ensure all enities position matched
for (var _i = 0; _i < ds_list_size(oControllerEntity.entityList); _i++) {
	
	_entity = ds_list_find_value(oControllerEntity.entityList, _i);
	with _entity {
		//moved position this turn
		if startingGridX <> endingGridX || startingGridY <> endingGridY {
				if name == "player" {
					oControllerEntity.fovRecompute = true;
				}
				
				movedThisTurn = true;
				startingGridX = endingGridX;
				startingGridY = endingGridY;
		} else {//didnt move
			movedThisTurn = false;
		}
	}
}
#endregion

#region entity visibility
//update entity visiblity
var _xPos = -1;
var _yPos = -1;
var _viewValue = -1;
var _entityValue = -1;
var _entityListAtPosition = -1;
var _entity = -1;
var _entityWithHighestDepth = -1;

//loop backwards through entityGrid and update visibility as required
for (var _tileY = ds_grid_height(oControllerEntity.entityGrid)-1; _tileY >= 0; _tileY--; ){
	for (var _tileX = ds_grid_width(oControllerEntity.entityGrid)-1; _tileX >= 0; _tileX--; ){	
		
		_xPos = scConvertToXY(_tileX);
		_yPos = scConvertToXY(_tileY);
		_viewValue = ds_grid_get(oControllerEntity.viewGrid, _tileX, _tileY);
		_entityListAtPosition = oControllerEntity.entityGrid[# _tileX, _tileY];
		

		//can we see the tile
		if _viewValue & ISVISIBLE {
				
			//ENTITIES
			if _entityListAtPosition <> -1 {
				if ds_exists(_entityListAtPosition, ds_type_list) {
					for ( var _i = 0; _i <= ds_list_size(_entityListAtPosition); _i++)  {
						_entityValue = ds_list_find_value(_entityListAtPosition, _i);
						_entityValue.visible = true;
					}
				}
			}
			
			
		} else if _viewValue & ISEXPLORED { //have we seen
			
			//ENTITIES
			if _entityListAtPosition <> -1 {
				if ds_exists(_entityListAtPosition, ds_type_list) {
					for ( var _i = 0; _i <= ds_list_size(_entityListAtPosition); _i++)  {
						_entityValue = ds_list_find_value(_entityListAtPosition, _i);
						_entityValue.visible = false;
					}
				}
			}
			
		} else { //can't see & haven't seen
			
			//ENTITIES
			if _entityListAtPosition <> -1 {
				if ds_exists(_entityListAtPosition, ds_type_list) {
					for ( var _i = 0; _i <= ds_list_size(_entityListAtPosition); _i++)  {
						_entityValue = ds_list_find_value(_entityListAtPosition, _i);
						_entityValue.visible = false;
					}
				}
			}	
		}
	}
}
#endregion