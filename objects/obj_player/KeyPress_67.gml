if (keyboard_check(vk_right) || keyboard_check(vk_left) ) {
	if ( dodge_current > 0 ) {
		global.player_state = player_states.DODGING
		var _rightkey = keyboard_check(vk_right)
		var _leftkey = keyboard_check(vk_left) 
		var _move = _rightkey - _leftkey
		sprite_index = spr_temp_dodge
		image_xscale = _move * -2.4
		xsp = _move * spd * 4
		dodge_current--
	}
} else {
	global.player_state = player_states.PARRYING
}

//length of dodge/parry
alarm[1] = 12
