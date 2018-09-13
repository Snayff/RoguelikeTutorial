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


//add entities to _entity array
for (var _i = 6; _i < argument_count; _i++) {
	_entity[_i - 6] = argument[_i]; //6 is the number of arguments before entity	
	
}


//get random number of entities
_numberOfEntitiesToPlace= irandom_range(0, _maxMonsters);

//Add entities to room
for (_i = 0; _i < _numberOfEntitiesToPlace; _i++) {
	//choose a location in the room
	_placementX = irandom_range(_roomStartX, _roomEndX);
	_placementY = irandom_range(_roomStartY , _roomEndY );
	
	if !scCheckIfEntityOccupiesTile(_placementX, _placementY) {
		//random number to determine what entitiy to generate from possible options 
		//***need to make entity choosing dynamic
		if irandom(100) < 80 {
			scCreateEntity(_placementX, _placementY, entityName.orc, true, scFighter, scBasicMonster);
			
		} else {
			scCreateEntity(_placementX, _placementY, entityName.troll, true, scFighter, scBasicMonster);	
		}
	}
}



