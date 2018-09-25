///@desc add entities to a room
///@param maxMonsters maximum monsters allowed in the room
///@param roomX starting X
///@param roomY starting Y
///@param roomEndX Ending X
///@param roomEndY Ending Y
///@param entity entity to create
///@param [...] other entities

scDebugMsg("ADD ENTITIES TO ROOM:");

var _maxEntities = argument[0];
var _roomStartX = argument[1];
var _roomStartY = argument[2];
var _roomEndX = argument[3];
var _roomEndY = argument[4];
var _entity = -1;
var _numberOfEntitiesToPlace = -1;
var _placementX = irandom_range(_roomStartX + 1, _roomEndX - 1);
var _placementY = irandom_range(_roomStartY - 1, _roomEndY + 1 );


//add entities to _entity array
for (var _i = 6; _i <= argument_count; _i++) {
	_entity[_i - 6] = argument[_i - 1]; //6 is the number of arguments before entity, -1 offset due to arg count starting at 1
	
}


//get random number of entities
_numberOfEntitiesToPlace= irandom_range(1, _maxEntities);

//Add entities to room
for (_i = 0; _i < _numberOfEntitiesToPlace; _i++) {
	
	//choose a location in the room
	while scCheckIfEntityOccupiesTile(_placementX, _placementY) || scCheckIfTileBlocksMovement(_placementX, _placementY) {
		_placementX = irandom_range(_roomStartX + 1, _roomEndX - 1);
		_placementY = irandom_range(_roomStartY - 1, _roomEndY + 1 );
	}
	
	var _randomSelection = irandom_range(0, array_length_1d(_entity) - 1 );
	scCreateEntity(_placementX, _placementY, _entity[_randomSelection]);

}



