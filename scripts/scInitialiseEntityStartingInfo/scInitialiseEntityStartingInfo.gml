///@desc initialise entityStartingInfoGrid 


var _name;
var	_sprite;
var _subimage;
var _colour;
var _maxHp;
var _defense;
var _strength;
var _deathImage;

entityStartingInfoGrid = ds_grid_create(entityStartingInfo.enumSize,entityNumber.enumSize );

var _grid = entityStartingInfoGrid;

// add entitiy stats to grid
//player
_name = entityNumber.player;

_sprite = spCalibriFont;
_subimage = 64;
_colour = c_white;
_maxHp = 10;
_defense = 1;
_strength = 3;
_deathImage = 37;
scSetFieldsInGridRow(_grid, entityNumber.player, 0, _name, _sprite, _subimage, _colour, _maxHp, _defense, _strength, _deathImage);

//ord
_name = entityNumber.orc;
_sprite = spCalibriFont;
_subimage = 111;
_colour = c_aqua;
_maxHp = 8;
_defense = 0;
_strength = 2;
_deathImage = 37;
scSetFieldsInGridRow(_grid, entityNumber.orc, 0, _name, _sprite, _subimage, _colour, _maxHp, _defense, _strength, _deathImage);

//troll
_name = entityNumber.troll;
_sprite = spCalibriFont;
_subimage = 116;
_colour = c_fuchsia;
_maxHp = 5;
_defense = 0;
_strength = 1;
_deathImage = 37;
scSetFieldsInGridRow(_grid, entityNumber.troll, 0, _name, _sprite, _subimage, _colour, _maxHp, _defense, _strength, _deathImage);