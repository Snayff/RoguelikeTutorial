/// @desc update entities  & fov

var _entity = -1;

//handle enemy turn
//if global.currentGameState == gameState.enemyTurn {

if oControllerEntity.moveToNextTurn {
	//loop all entities 
	//for (var _i = 0; _i < ds_list_size(oControllerEntity.entityList); _i++) {
		var _currentIndex = ds_list_find_index(oControllerEntity.entityList, oControllerEntity.turnHolder);
		if _currentIndex == ds_list_size(oControllerEntity.entityList) - 1 {
			var _index = 0;
		}else {
			var _index = _currentIndex + 1;
		}
		
		_entity = ds_list_find_value(oControllerEntity.entityList, _index);
		
		//check if entity has ai
		if _entity.ai <> -1  {	
			oControllerEntity.moveToNextTurn = false;
			
			//assign turn to entity
			oControllerEntity.turnHolder = _entity;
			with _entity {
				
				script_execute(ai); //run ai 
				//if startingGridX <> endingGridX || startingGridY <> endingGridY {
				//	startingGridX = endingGridX;
				//	startingGridY = endingGridY;
				//}
			}

		} else if _entity.name = "player"  {
			oControllerEntity.turnHolder = _entity;
			oControllerEntity.moveToNextTurn = false;
			//with _entity {
			//	if startingGridX <> endingGridX || startingGridY <> endingGridY {
			//			oControllerEntity.fovRecompute = true;
			//			startingGridX = endingGridX;
			//			startingGridY = endingGridY;
			//	}
			//}
		}
		
		//scProcessEvents();
		
		//if player has died stop AI taking actions
		//if global.currentGameState == gameState.playerDead {
			//break;	
		//}
		
	//}
}		
	//update gameState
	//global.currentGameState = gameState.playerTurn;
	//oControllerEntity.turnHolder = oControllerEntity.player;
//}

//recalculate FOV
if fovRecompute == true {
	scCalculateFov();	
	fovRecompute = false; //turn flag off
}

//ensure all enities position matched
for (var _i = 0; _i < ds_list_size(oControllerEntity.entityList); _i++) {
	
	_entity = ds_list_find_value(oControllerEntity.entityList, _i);
	with _entity {
		if startingGridX <> endingGridX || startingGridY <> endingGridY {
				if _entity.name == "player" {
					oControllerEntity.fovRecompute = true;
				}
				startingGridX = endingGridX;
				startingGridY = endingGridY;
		}
	}
	
}