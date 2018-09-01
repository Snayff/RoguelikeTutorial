///@desc check an octant for tiles that block sight and update viewGrid
///@param octant octant number out of 8
///@param tileX origin tile X position
///@param tileY origin tile Y position
///@param fovRange  max radius of vision
///@param targetTileX tile X of target
///@param slopeTopX top slope X position
///@param slopeTopY top slope Y position
///@param slopeBottomX top slope X position
///@param slopeBottomY top slope Y position

var _octant = argument0;
var _tileX = argument1;
var _tileY = argument2;
var _fovRange = argument3;
var _targetTileX = argument4; 
var _slopeTopX = argument5;
var _slopeTopY = argument6;
var _slopeBottomX = argument7;
var _slopeBottomY = argument8;

var _topY;
var _bottomY;
var _targetTileY;
var _wasOpaque = -1; // 0:false, 1:true, -1:not applicable
var _isOpaque;
var _isVisible;
var _newX;
var _newY;
var _ax;


//while _targetTileX remains in radius...
for(; _targetTileX <= _fovRange; _targetTileX++) {
	// compute the Y coordinates of the top and bottom of the sector. we maintain that top > bottom
	
	//check top of tile
	if(_slopeTopX == 1) { // if top == ?/1 then it must be 1/1 because 0/1 < top <= 1/1. this is special-cased because top starts at 1/1 and remains 1/1 as long as it doesn't hit anything, so it's a common case
		 
		_topY = _targetTileX;
	} else { // top < 1
		//get the tile that the top vector enters from the left.
		//since our coordinates refer to the center of the tile, this is (x-0.5)*top+0.5, which can be computed as (x-0.5)*top+0.5 = (2(x+0.5)*top+1)/2 =  ((2x+1)*top+1)/2. since top == a/b, this is ((2x+1)*a+b)/2b. if it enters a tile at one of the left corners, it will round up, so it'll enter from the bottom-left and never the top-left
		_topY = ((_targetTileX*2-1) * _slopeTopY + _slopeTopX) div (_slopeTopX*2); // the Y coordinate of the tile entered from the left
	
		// now it's possible that the vector passes from the left side of the tile up into the tile above before exiting from the right side of this column. so we may need to increment topY
		//check if next tile is blocking sight
		if scCheckIfTileInOctantBlocksSight(_targetTileX, _topY, _octant, _tileX, _tileY)	{
			 //check following tile for NOT blocking sight to confirm increment required
			 if((_slopeTopY * _targetTileX * 2 >= _slopeTopX * (_topY * 2 + 1)) && !scCheckIfTileInOctantBlocksSight(_targetTileX, _topY + 1, _octant, _tileX, _tileY)) {
				 _topY++;
			 }

		} else { //the tile doesnt block light
			_ax = _targetTileX * 2; // center
			
			//check if the tile above and right blocks sight
			if(scCheckIfTileInOctantBlocksSight(_targetTileX + 1 , _topY + 1, _octant,  _tileX, _tileY)) {
				_ax++; // use bottom-right
			}
			
			if((_slopeTopY * _ax > _slopeTopX * (_topY * 2 + 1))) {
				_topY++;
			}
		}
	}
	
	//check bottom of tile
	if(_slopeBottomY == 0) { // if bottom == 0/?, then it's hitting the tile at Y=0 dead center. this is special-cased because bottomY starts at zero and remains zero as long as it doesn't hit anything, so it's common
		_bottomY = 0;
	} else { // bottom > 0
		_bottomY = ((_targetTileX * 2 - 1) * _slopeBottomY + _slopeBottomX) div (_slopeBottomX * 2); // the tile that the bottom vector enters from the left code below assumes that if a tile is a wall then it's visible, so if the tile contains a wall we have to ensure that the bottom vector actually hits the wall shape. it misses the wall shape if the top-left corner is beveled and bottom >= (bottomY*2+1)/(x*2). finally, the top-left corner is beveled if the tiles to the left and above are clear. we can assume the tile to the left is clear because otherwise the bottom vector would be greater, so we only have to check above
		//check above tile for blocking light
		if((_slopeBottomY * _targetTileX * 2 >= _slopeBottomX * (_bottomY * 2 + 1)) && scCheckIfTileInOctantBlocksSight(_targetTileX, _bottomY, _octant, _tileX, _tileY) && !scCheckIfTileInOctantBlocksSight(_targetTileX, _bottomY + 1, _octant, _tileX, _tileY)) {
			_bottomY++;
		}
	}
	
	
	
	// go through the tiles in the column now that we know which ones could possibly be visible
	for(_targetTileY = _topY; _targetTileY >= _bottomY; _targetTileY--) // use a signed comparison because y can wrap around when decremented
	{
		// skip the tile if it's out of visual range
		if(_fovRange < 0 || max(abs(_targetTileX), abs(_targetTileY)) <= _fovRange)  {
			_isOpaque = scCheckIfTileInOctantBlocksSight(_targetTileX, _targetTileY, _octant, _tileX, _tileY);
			// every tile where topY > y > bottomY is guaranteed to be visible. 
			//the code that initializes topY and bottomY guarantees that if the tile is opaque then it's visible. so we only have to do extra work for the case where the tile is clear and y == topY or y == bottomY. if y == topY then we have to make sure that the top vector is above the bottom-right corner of the inner square. if y == bottomY then we have to make sure that the bottom vector is below the top-left corner of the inner square
			_isVisible = ((_targetTileY != _topY || (_slopeTopY * _targetTileX >= _slopeTopX * _targetTileY)) && (_targetTileY != _bottomY || (_slopeBottomY * _targetTileX <= _slopeBottomX * _targetTileY)));
			// NOTE: if you want the algorithm to be either fully or mostly symmetrical, replace the line above with the following line (and uncomment the Slope.LessOrEqual method). the line ensures that a clear tile is visible only if there's an unobstructed line to its center. if you want it to be fully symmetrical, also remove the "isOpaque ||" part and see NOTE comments further down
			
			//check if we have confirmed tile is visible
			if _isVisible  {
				scSetTileVisibilityInOctant(_targetTileX, _targetTileY, _octant, _tileX, _tileY, true);
			}
			
			//check if we are at last column
			if(_targetTileX != _fovRange) {
				
				// if we found a transition from clear to opaque or vice versa, adjust the top and bottom vectors
				if(_isOpaque) {
					if(_wasOpaque == 0) {
						//we found a transition from clear to opaque, this sector is done in this column, so adjust the bottom vector upward and continue processing it in the next column if the opaque tile has a beveled top-left corner, move the bottom vector up to the top center. otherwise, move it up to the top left. the corner is beveled if the tiles above and to the left are clear. we can assume the tile to the left is clear because otherwise the vector would be higher, so we only have to check the tile above
						 _newX = _targetTileX * 2;
						 _newY = _targetTileY * 2 + 1; // top center by default
						
						// we have to maintain the invariant that top > bottom
						//so the new sector created by adjusting the bottom is only valid if that's the case if we're at the bottom of the column, then just adjust the current sector rather than recursing since there's no chance that this sector can be split in two by a later transition back to clear
						if((_slopeTopY * _newX > _slopeTopX * _newY)) { 
							// don't recurse unless necessary
							if(_targetTileY == _bottomY) { 
								_slopeBottomY = _newY; 
								_slopeBottomX = _newX; 
								break; 
							} else {
								scCalculateVisionInOctant(_octant, _tileX, _tileY, _fovRange, _targetTileX + 1, _slopeTopY, _slopeTopX, _newY, _newX);
							}
						} else { // the new bottom is greater than or equal to the top, so the new sector is empty and we'll ignore it
							//if we're at the bottom of the column, we'd normally adjust the current sector rather than
							if(_targetTileY == _bottomY) {
								return; // recursing, so that invalidates the current sector and we're done
							}
						}

						_wasOpaque = 1;
					
					} else { // _wasOpaque <> 0
						if(_wasOpaque > 0) { // if we found a transition from opaque to clear, adjust the top vector downwards
						
							// if the opaque tile has a beveled bottom-right corner, move the top vector down to the bottom center.
							// otherwise, move it down to the bottom right. the corner is beveled if the tiles below and to the right
							// are clear. we know the tile below is clear because that's the current tile, so just check to the right
							_newX = _targetTileX * 2;
							_newY = _targetTileY * 2 + 1; // the bottom of the opaque tile (oy*2-1) equals the top of this tile (y*2+1)

							// we have to maintain the invariant that top > bottom. if not, the sector is empty and we're done
							if((_slopeBottomY * _newX >= _slopeBottomX * _newY)) {
								return;
							}
							
							_slopeTopY = _newY;
							_slopeTopX = _newX;
						}
						
						_wasOpaque = 0;
					}
				}
			}
		}
	}
	
	// if the column didn't end in a clear tile, then there's no reason to continue processing the current sector because that means either 
	//1) wasOpaque == -1, implying that the sector is empty or at its range limit, or 
	//2) wasOpaque == 1, implying that we found a transition from clear to opaque and we recursed and we never found a transition back to clear, so there's nothing else for us to do that the recursive method hasn't already. (if we didn't recurse (because y == bottomY), it would have executed a break, leaving wasOpaque equal to 0.)
	if _wasOpaque != 0 {
		break;
	}

}
