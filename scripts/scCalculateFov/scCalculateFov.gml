///@desc recalculate what player can see

//NOTE: Based on : http://www.adammil.net/blog/v125_Roguelike_Vision_Algorithms.html#mycode

scDebugMsg("CALCULATE FOV:");

var _startX = oControllerEntity.player.startingGridX;
var _startY = oControllerEntity.player.startingGridY;
var _fovRange = oControllerView.fovRadius;

//reset all tiles back to not visible
for (var _arrayHeight = ds_grid_height(oControllerView.viewGrid)-1; _arrayHeight >= 0; _arrayHeight--; ){
	for (var _arrayLength = ds_grid_width(oControllerView.viewGrid)-1; _arrayLength >= 0; _arrayLength--; ){	
		scRemoveBitmaskValue(oControllerView.viewGrid, _arrayLength, _arrayHeight, ISVISIBLE);
	}
}

//set current tile's vision
scAddBitmaskValue(oControllerView.viewGrid, _startX, _startY, ISVISIBLE);

//rotate through octants and set vision
for(var _octant = 0; _octant < 8; _octant++){
	scCalculateVisionInOctant(_octant, _startX, _startY, _fovRange, 1, 1, 1, 0, 1);

}


scDebugMsg("FOV recalculated");