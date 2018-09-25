///@desc draw the specified resource bar
///@param resource what resource to link to
///@param startX 
///@param startY
///@param width
///@param height
///@param fillColourMin colour of the resource at low
///@param fillColourMax colour of the resource at high
///@param backColour colour of the bar

var _resource = argument0;
var _startX = argument1;
var _startY = argument2;
var _width = argument3;
var _height = argument4;
var _fillColourMin = argument5;
var _fillColourMax = argument6;
var _backColour = argument7;
var _resourceRatio, _amount;

switch _resource {
	
	case resourceType.hp :
		_resourceRatio = (oControllerEntity.player.hp / oControllerEntity.player.maxHp) * 100;
		_amount = oControllerEntity.player.hp;
		break;
	
	
	
}

//draw bar
draw_healthbar(_startX, _startY, _startX + _width, _startY + _height, _resourceRatio, _backColour, _fillColourMin, _fillColourMax, 0, true, true );
//show amount
draw_text_colour(_startX + (_width / 2), _startY + (_height / 2), string(_amount), c_white, c_white, c_white, c_white, 1);
//draw outline
draw_set_alpha(0.5);
draw_rectangle_colour(_startX, _startY, _startX + _width, _startY + _height,c_white,c_white,c_white,c_white,true);
draw_set_alpha(1);