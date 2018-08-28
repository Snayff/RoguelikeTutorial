/// @desc determine if position in world has changed
// NOTE: Parent Event NOT inherited

if startingGridX <> endingGridX || startingGridY <> endingGridY {
		
		oControllerTile.fovRecompute = true;
		
		startingGridX = endingGridX;
		startingGridY = endingGridY;
	
}

