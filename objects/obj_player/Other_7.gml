if (player_state == player_states.LIGHT_ATTACK || sprite_index == spr_attack ||
	player_state == player_states.HEAVY_ATTACK || sprite_index == spr_heavy_attack ) {
	if(player_state == player_states.LIGHT_ATTACK and sprite_index == spr_attack) {
		if(combo_active) {
			combo_active = false
		} else {
			combo_active = true
			alarm[4] = game_get_speed(gamespeed_fps) * 0.25
		}
	}
	player_state = player_states.NONE
	
}

if (sprite_index == spr_jump || sprite_index == spr_special) {
	sprite_index = spr_basic 
}