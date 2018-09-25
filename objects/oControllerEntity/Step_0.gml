/// @desc update entities  & fov

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

//recalculate FOV
if fovRecompute == true {
	scCalculateFov();	
	fovRecompute = false; //turn flag off
}

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