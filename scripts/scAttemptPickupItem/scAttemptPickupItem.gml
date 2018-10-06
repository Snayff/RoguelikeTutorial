///@desc pickup item from current space
///@param entity who is trying to pick up?

var _entity = argument0;
var _tileX = _entity.startingGridX ;
var _tileY = _entity.startingGridY;
var _entityListAtPosition = oControllerEntity.entityGrid[# _tileX, _tileY];
var _otherEntity = -1;

//get all entities on current tile
for ( var _i = 0; _i < ds_list_size(_entityListAtPosition); _i++)  {
	_otherEntity = ds_list_find_value(_entityListAtPosition, _i);
				
	//check entity exists
	if !is_undefined(_otherEntity) {
		
		//is there an item to pickup?
		if _otherEntity.object_index == oItem {
			
			//is there space in the invetory to have the item?
			if ds_list_size(_entity.inventory) < _entity.inventoryCapacity {
				var _returnArray = [];
				_returnArray[0] = _entity;
				_returnArray[1] = _otherEntity;
				oControllerEvent.eventQueue[? "pickup"] = _returnArray;
	
			} else {
		
				scAddMessageToEventQueue("You cannot carry anymore, your inventory is full.");
			}
			
			//found an item so stop looking
			break;
		}
	}
}