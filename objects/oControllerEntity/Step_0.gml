/// @desc update entities  & fov

var _entity = -1;

//handle enemy turn
if global.currentGameState == gameState.enemyTurn {
	
	//loop all entities 
	for (var _i = 0; _i < ds_list_size(oControllerEntity.entityList); _i++) {
		_entity = ds_list_find_value(oControllerEntity.entityList, _i);
		
		//check if entity has ai
		if _entity.ai <> -1 {	
			//assign turn to entity
			oControllerEntity.turnHolder = _entity;
			with _entity {
				script_execute(ai); //run ai 
			}
			
			//process event
			//with oControllerEvent {
				scProcessEvents();
			//}

		}
		
		//if player has died stop AI taking actions
		if global.currentGameState == gameState.playerDead {
			break;	
		}
		
	}
		
	//update gameState
	global.currentGameState = gameState.playerTurn;
	oControllerEntity.turnHolder = oControllerEntity.player;
}

//recalculate FOV
if fovRecompute == true {
	scCalculateFov();	
	
	fovRecompute = false; //turn flag off
}
