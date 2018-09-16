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
var _attackerColour, _defenderColour;

if _attacker.name = "player" {
	_attackerColour = COLOUR_NAME_PLAYER;
} else {
	_attackerColour = COLOUR_NAME_ENTITY;
}
if _defender.name = "player" {
	_defenderColour = COLOUR_NAME_PLAYER;
} else {
	_defenderColour = COLOUR_NAME_ENTITY;
}

if _damage > 0 {
	//var _msg = scConvertToString(_attackerColour, _attacker.name, "[] attacks ",_defenderColour, _defender.name, "[] for ", _damage, " damage." );
	var _msg = scConvertToString(_attacker.name, " attacks ", _defender.name, " for ", _damage, " damage." );
	scAddMessageToEventQueue(_msg);
} else {
	//var _msg = scConvertToString(_attackerColour, _attacker.name, "[] attacks ",_defenderColour, _defender.name, "[]  quite pathetically." );
	var _msg =   scConvertToString(_attacker.name, " attacks ", _defender.name, " quite pathetically.");
	scAddMessageToEventQueue(_msg);
	
}



