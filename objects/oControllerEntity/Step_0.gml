/// @desc update position of entity
/*
for (var _entityCounter = 0; _entityCounter < ds_list_size(entityList); _entityCounter++;) {
	for (var _arrayHeight = array_height_2d(entityArray)-1; _arrayHeight >= 0; _arrayHeight--; ){
		for (var _arrayLength = array_length_2d(entityArray, _arrayHeight)-1; _arrayLength >= 0; _arrayLength--; ){	
		
			var _entity = ds_list_find_value(entityList, _entityCounter);
			
			if is_undefined(_entity) {
				show_debug_message("Entity value not found in entityList");
			} else {
				//check if entity is in array position
				if entityArray[_arrayHeight, _arrayLength] == _entity{

					//check if entity exists in same place  in Array as x/y 
					if (_entity.x / TILESIZE <> _arrayLength) || (_entity.y / TILESIZE <> _arrayHeight){
						//entity has moved position in array so update on screen
						_entity.x = _arrayLength * TILESIZE;
						_entity.y = _arrayHeight * TILESIZE;
					}
				}
			} 
		}
	}
}
