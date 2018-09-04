///@desc initialise entityStartingInfoGrid 


var _name;
var	_sprite;
var _subimage;
var _colour;
var _maxHp;
var _defense;
var _strength;

entityStartingInfoGrid = ds_grid_create(entityStartingInfo.enumSize,entityName.enumSize );

var _grid = entityStartingInfoGrid;

// add entitiy stats to grid
//player
_name = entityName.player;
_sprite = spCalibriFont;
_subimage = 64;
_colour = c_white;
_maxHp = 10;
_defense = 1;
_strength = 3;
scSetFieldsInGridRow(_grid, entityName.player, 0, _name, _sprite, _subimage, _colour, _maxHp, _defense, _strength);

//ord
_name = entityName.orc;
_sprite = spCalibriFont;
_subimage = 111;
_colour = c_aqua;
_maxHp = 8;
_defense = 0;
_strength = 2;
scSetFieldsInGridRow(_grid, entityName.orc, 0, _name, _sprite, _subimage, _colour, _maxHp, _defense, _strength);

//troll
_name = entityName.troll;
_sprite = spCalibriFont;
_subimage = 116;
_colour = c_fuchsia;
_maxHp = 5;
_defense = 0;
_strength = 1;
scSetFieldsInGridRow(_grid, entityName.troll, 0, _name, _sprite, _subimage, _colour, _maxHp, _defense, _strength);