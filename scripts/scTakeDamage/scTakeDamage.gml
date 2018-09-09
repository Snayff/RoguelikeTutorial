///@desc entity takes damage to hp
///@param entity who to take damage
///@param amount how much damage

var _entity = argument0;
var _damage = argument1;

_entity.hp -= _damage;

//record death in event queue
if _entity.hp <= 0 {
	oControllerEvent.eventQueue[? "dead"] = _entity;	
	
}
