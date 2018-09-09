///@desc basic attack
///@param attacker entity attacking
///@param defender entity getting hit

var _attacker = argument0;
var _defender = argument1;

//calculate damage
var _damage = _attacker.strength - _defender.defense;

//apply damage
scTakeDamage(_defender, _damage);

//add message to eventQueue
if _damage > 0 {
	var _msg = scConvertToString(_attacker, " attacks ", _defender, " for ", _damage, " damage." );
	oControllerEvent.eventQueue[? "message"] = _msg;	
} else {
	var _msg = scConvertToString(_attacker, " attacks ", _defender, " quite pathetically." );
	oControllerEvent.eventQueue[? "message"] = _msg;	
}



