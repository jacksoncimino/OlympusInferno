if ( dodge_current > 0 ) {	
	if (keyboard_check(vk_right) || keyboard_check(vk_left) ) {
		dodge_current--
		global.player_state = player_states.DODGING
		var _rightkey = keyboard_check(vk_right)
		var _leftkey = keyboard_check(vk_left) 
		var _move = _rightkey - _leftkey
		sprite_index = spr_dodge
		xsp = _move * max_spd * 4
	} else if (keyboard_check(vk_down)) {
		dodge_current--
		global.player_state = player_states.PARRYING
		sprite_index = spr_parry
	}
	//length of dodge/parry
	alarm[1] = 12
}

