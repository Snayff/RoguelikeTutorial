///@desc add entities to a room
///@param maxMonsters maximum monsters allowed in the room
///@param roomX starting X
///@param roomY starting Y
///@param roomEndX Ending X
///@param roomEndY Ending Y
///@param entity entity to create
///@param ... other entities

scDebugMsg("ADD ENTITIES TO ROOM:");

var _maxMonsters = argument[0];
var _roomNumber = argument[1];
var _roomStartX = argument[2];
var _roomStartY = argument[3];
var _roomEndX = argument[4];
var _roomEndY = argument[5];
var _entity = -1;
var _numberOfEntitiesToPlace = -1;
var _placementX = -1;
var _placementY = -1;


//add entities to _entitiy array
for (var _i = 2; _i < argument_count; _i++) {
	_entity[_i - 2] = argument[_i]; //2 is the number of arguments before entity	
	
}


//get random number of entities
_numberOfEntitiesToPlace= irandom_range(0, _maxMonsters);

//Add entities to room
for (_i = 0; _i < _numberOfEntitiesToPlace; _i++) {
	//choose a location in the room (-/+1 to keep in room)
	_placementX = irandom_range(_roomStartX + 1, _roomEndX - 1);
	_placementY = irandom_range(_roomStartY + 1, _roomEndY - 1);
	
	if !scCheckIfEntityOccupiesTile(_placementX, _placementY) {
		//random number to determine what entitiy to generate from possible options
		if irandom(100) < 80 {
			scCreateEntity(_placementX, _placementY, entityName.orc);
			
		} else {
			scCreateEntity(_placementX, _placementY, entityName.troll);	
		}
	}
}



