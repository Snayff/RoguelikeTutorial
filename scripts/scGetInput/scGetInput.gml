///@desc get key presses


//---MOVEMENT---
// Directions

//KEYBOARD

kbRightPressed = keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_numpad6);
kbLeftPressed = keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_numpad4);
kbUpPressed = keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_numpad8);
kbDownPressed = keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_numpad2);
kbUpRightPressed = keyboard_check_pressed(vk_numpad9);
kbUpLeftPressed =  keyboard_check_pressed(vk_numpad7);
kbDownRightPressed =  keyboard_check_pressed(vk_numpad3);
kbDownLeftPressed = keyboard_check_pressed(vk_numpad1);


/*
kbRightHeld = keyboard_check(vk_right);
kbLeftHeld = keyboard_check(vk_left);
kbUpHeld =  keyboard_check(vk_up);
kbDownHeld = keyboard_check(vk_down);
*/
inpRight = kbRightPressed;
inpLeft = kbLeftPressed;
inpUp = kbUpPressed;
inpDown = kbDownPressed;
inpUpRight = kbUpRightPressed;
inpUpLeft = kbUpLeftPressed;
inpDownRight = kbDownRightPressed;
inpDownLeft = kbDownLeftPressed;
inpCancel = keyboard_check_pressed(vk_escape);
inpFullScreen = keyboard_check_pressed(ord("F"));

inpSelect = mouse_check_button_pressed(mb_left)

/*
//GAMEPAD
// update dpad values to false to ensure reset when not using controller on new frame
dpadRightPressed = false;
dpadLeftPressed = false;
dpadUpPressed = false;
dpadDownPressed = false;

dpadRightHeld = false;
dpadLeftHeld = false;
dpadUpHeld = false;
dpadDownHeld = false;

// THUMBSTICK VALUES
inpAxisLH = 0;
inpAxisLV = 0;


//check for gamepad movement
var _inputType = oInputController.inputType;

if (_inputType != -1) { //not using kb
	
	var _xAxis = gamepad_axis_value(_inputType, gp_axislh);
	var _yAxis = gamepad_axis_value(_inputType, gp_axislv);
	
	if (_xAxis*_xAxis + _yAxis*_yAxis > gamepadDeadZoneSquared){
		// HORIZONTAL/ VERTICAL RESOLUTION FOR AXIS INPUTS RESOLUTION
		inpAxisLH = round(_xAxis);
		inpAxisLV = round(_yAxis);
		
		// HORIZONTAL TRANSLATION TO inpLeft/inpRight
		switch inpAxisLH{
			case -1:
				inpLeft = true;
			break;
			case 1:
				inpRight = true;
			break;
		}
		
		// VERTICAL TRANSLATION TO inpUp/inpDown
		switch inpAxisLV{
			case -1:
				inpUp = true;
			break;
			case 1:
				inpDown = true;
			break;
		}
	}
	else{
		dpadRightPressed = gamepad_button_check_pressed(_inputType, gp_padr);
		dpadLeftPressed = gamepad_button_check_pressed(_inputType, gp_padl);
		dpadUpPressed = gamepad_button_check_pressed(_inputType, gp_padu);
		dpadDownPressed = gamepad_button_check_pressed(_inputType, gp_padd);
		
		dpadRightHeld = gamepad_button_check(_inputType, gp_padr);
		dpadLeftHeld = gamepad_button_check(_inputType, gp_padl);
		dpadUpHeld = gamepad_button_check(_inputType, gp_padu);
		dpadDownHeld = gamepad_button_check(_inputType, gp_padd);
		
		inpRight = dpadRightHeld;
		inpLeft = dpadLeftHeld;
		inpUp = dpadUpHeld;
		inputDown = dpadDownHeld;
	}
}
	
//---ACTIONS---
inpJumpHeld = keyboard_check(kbJump)			|| gamepad_button_check(_inputType, gpJump); 
inpJump = keyboard_check_pressed(kbJump)		|| gamepad_button_check_pressed(_inputType, gpJump); 
inpMobility = keyboard_check_pressed(kbMobility)|| gamepad_button_check_pressed(_inputType, gpMobility); 
inpAttack1 = keyboard_check_pressed(kbAttack1)	|| gamepad_button_check_pressed(_inputType, gpAttack1); 
inpAttack2 = keyboard_check_pressed(kbAttack2)	|| gamepad_button_check_pressed(_inputType, gpAttack2); 
inpAttack3 = keyboard_check_pressed(kbAttack3)	|| gamepad_button_check_pressed(_inputType, gpAttack3); 
inpMenu = keyboard_check_pressed(kbMenu)		|| gamepad_button_check_pressed(_inputType, gpMenu); 
inpPickup = keyboard_check_pressed(kbPickup)	|| gamepad_button_check_pressed(_inputType, gpPickup); 
inpConfirm = keyboard_check_pressed(kbConfirm)	|| gamepad_button_check_pressed(_inputType, gpConfirm); 
inpCancel = keyboard_check_pressed(kbCancel)	|| gamepad_button_check_pressed(_inputType, gpCancel); 

//---Input Type---
scUpdateInputType();
