///@desc initialise actorStatGrid 


var _name, _sprite, _subimage, _colour, _maxHp, _defense, _strength, _deathImage, _blocksMovement, _fighter, _ai, _inventory;

actorStatGrid = ds_grid_create(actorStat.enumSize,entityNumber.enumSize );

var _grid = actorStatGrid;

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
_blocksMovement = true;
_fighter = false;
_ai = false;
_inventory  = true;
scSetFieldsInGridRow(_grid, entityNumber.player, 0, _name, _sprite, _subimage, _colour, _maxHp, _defense, _strength, _deathImage, _blocksMovement, _fighter, _ai, _inventory);

//orc
_name = entityNumber.orc;
_sprite = spCalibriFont;
_subimage = 111;
_colour = c_aqua;
_maxHp = 8;
_defense = 0;
_strength = 2;
_deathImage = 37;
_blocksMovement = true;
_fighter = true;
_ai = scAiBasicMonster;
_inventory  = false;
scSetFieldsInGridRow(_grid, entityNumber.orc, 0, _name, _sprite, _subimage, _colour, _maxHp, _defense, _strength, _deathImage, _blocksMovement, _fighter, _ai, _inventory);

//troll
_name = entityNumber.troll;
_sprite = spCalibriFont;
_subimage = 116;
_colour = c_fuchsia;
_maxHp = 5;
_defense = 0;
_strength = 1;
_deathImage = 37;
_blocksMovement = true;
_fighter = true;
_ai = scAiBasicMonster;
_inventory  = false;
scSetFieldsInGridRow(_grid, entityNumber.troll, 0, _name, _sprite, _subimage, _colour, _maxHp, _defense, _strength, _deathImage, _blocksMovement, _fighter, _ai, _inventory);

//healingPotion
_name = entityNumber.healingPotion;
_sprite = spCalibriFont;
_subimage = 104;
_colour = c_purple;
_maxHp = -1;
_defense = -1;
_strength = -1;
_deathImage = -1;
_blocksMovement = false;
_fighter = false;
_ai = false;
_inventory  = false;
scSetFieldsInGridRow(_grid, entityNumber.healingPotion, 0, _name, _sprite, _subimage, _colour, _maxHp, _defense, _strength, _deathImage, _blocksMovement, _fighter, _ai, _inventory);

