///@desc draw inventory menu

var _inventoryRows = 5; //***update to dynamically match inventoryCapacity
var _inventoryCols = 4;
var _inventorySlotSprite = spInventorySlot;

var _inventorySlotWidth = sprite_get_width(_inventorySlotSprite);
var _inventorySlotHeight = sprite_get_height(_inventorySlotSprite)
var _itemsInInventory = ds_list_size(oControllerEntity.player.inventory);

var _inventoryItemToShow = 0;
var _currentDrawX = 0;
var _currentDrawY = 0;

//draw inventory grid by creating slots in position
for (var _i = 1; _i <= _inventoryCols; _i++){
	for (var _j = 1; _j <= _inventoryRows; _j++){
		
		//determine where to draw
		_currentDrawX = menuStartX + menuEdgeIndent + ( _inventorySlotWidth * _j);
		_currentDrawY = menuStartY + menuEdgeIndent + (_inventorySlotHeight * _i)
		
		//draw slot
		draw_sprite(_inventorySlotSprite, -1,_currentDrawX , _currentDrawY );
		
		//draw items, if any left to show
		if _inventoryItemToShow < _itemsInInventory {
			var _entityNumber = oControllerEntity.player.inventory[| _inventoryItemToShow];
			//ds_list_find_value()
			draw_sprite_ext( scGetEntityStat(_entityNumber, actorStat.sprite), scGetEntityStat(_entityNumber, actorStat.subimage), _currentDrawX, _currentDrawY, 1, 1, 0, scGetEntityStat(_entityNumber, actorStat.colour), 1) ;
			
			_inventoryItemToShow++; //increment counter
		}
	}
}




