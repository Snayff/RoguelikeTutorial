///@desc fighter component - loads fighter data

maxHp = ds_grid_get(oControllerEntity.actorStatGrid, actorStat.maxHp , name);
hp = ds_grid_get(oControllerEntity.actorStatGrid, actorStat.maxHp , name);
defense = ds_grid_get(oControllerEntity.actorStatGrid, actorStat.defense , name);
strength = ds_grid_get(oControllerEntity.actorStatGrid, actorStat.strength , name);




// configurable version...
/*
///@param maxHP entity max health 
///@param defense entity defense
///@param strength entity strength

var _maxHp = argument0;
var _defense = argument1;
var _strength = argument2;


maxHp = _maxHp;
hp = _maxHp;
defense = _defense;
strength = _strength;

