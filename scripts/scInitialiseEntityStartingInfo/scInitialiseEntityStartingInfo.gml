///@desc initialise entityStartingInfoGrid 


var _name;
var	_sprite;
var _subimage;
var _colour;

entityStartingInfoGrid = ds_grid_create(entityStartingInfo.enumSize,entityName.enumSize );

var _grid = entityStartingInfoGrid;

// add entitiy stats to grid
//player
_name = entityName.player;
_sprite = spCalibriFont;
_subimage = 64;
_colour = c_white;
scSetFieldsInGridRow(_grid, entityName.player, 0, _name, _sprite, _subimage, _colour);

//player
_name = entityName.orc;
_sprite = spCalibriFont;
_subimage = 111;
_colour = c_aqua;
scSetFieldsInGridRow(_grid, entityName.orc, 0, _name, _sprite, _subimage, _colour);

//player
_name = entityName.troll;
_sprite = spCalibriFont;
_subimage = 116;
_colour = c_fuchsia;
scSetFieldsInGridRow(_grid, entityName.troll, 0, _name, _sprite, _subimage, _colour);

//ds_grid_add(oControllerEntity.entityStartingInfoGrid, entityStartingInfo.name, _yPos, _yPos);