///@desc add item to entity inventory
///@param entity entity picking up item
///@param item item to add to inventory

var _entity = argument0;
var _item = argument1;
var _itemName = _item.name;

//add item to inventory (take the entity number)
ds_list_add(_entity.inventory, _item.number);

//remove item from map
scDeleteEntity(_item);


//show confirmation in message log
var _msg = scConvertToString("Picked up ", _itemName, ".")

scAddMessageToEventQueue(_msg);