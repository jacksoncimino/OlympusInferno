var _plat = instance_place(x, y+ysp, obj_floating_platform)

var _downkey = keyboard_check(down_key)

if(object_index == obj_player1) {
	var _gp = global.gamepad_main

	if(_gp != undefined) {
		_downkey =  gamepad_button_check(_gp, gp_shoulderl)
	}
}

if(_plat != noone) {
	if bbox_bottom + ysp < _plat.bbox_bottom
	&& ysp >= 0
	&& !_downkey
	{
	//stop moving or snap player to other.bbox_top eg.
	y = _plat.bbox_top - (bbox_bottom - y)
	ysp = 0
	onFloating = true
	jump_current = jump_number
	}
}

if(place_meeting(x, y+.3, obj_floating_platform) and onFloating) {
	ysp = 0	
} else {
	onFloating = false	
}