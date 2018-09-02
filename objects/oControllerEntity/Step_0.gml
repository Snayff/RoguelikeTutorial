/// @desc update entities 

var _entity = -1;

//handle enemy turn
if global.currentGameState == gameState.enemyTurn {
	
	//loop all entities 
	for (var _i = 0; _i < ds_list_size(oControllerEntity.entityList); _i++) {
		_entity = ds_list_find_value(oControllerEntity.entityList, _i);
		
		//ensure entity isnt player
		if _entity <> oControllerEntity.player {	
			scDebugMsg(_entity.name, "(", _entity, ") waits patiently for something interesting to happen.", );

		}
		
	}
		
	//update gameState
	global.currentGameState = gameState.playerTurn;
}