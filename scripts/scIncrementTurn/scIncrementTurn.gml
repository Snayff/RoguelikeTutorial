///@desc move turn to next entity

scDebugMsg(oControllerEntity.turnHolder,  " ends their turn");

//if currently player then move to other turn
if oControllerEntity.turnHolder == oControllerEntity.player {
		scUpdateGameState(gameState.otherTurn);
}

oControllerEntity.moveToNextTurn = true;