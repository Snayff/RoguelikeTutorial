///@desc pickup item from current space
///@param entity who is trying to pick up?

var _entity = argument0;

if array_length_1d(_entity.inventory) >= _entity.inventoryCapacity {
	scAddMessageToEventQueue("You cannot carry anymore, your inventory is full.");
	
} else {
		
	
}