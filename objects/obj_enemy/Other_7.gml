if (state == EnemyStates.LIGHT || sprite_index == spr_attack ||
	state == EnemyStates.HEAVY || sprite_index == spr_heavy_attack ) {
	if(state == EnemyStates.LIGHT and sprite_index == spr_attack) {
		if(combo_active) {
			combo_active = false
		} else {
			combo_active = true
			alarm[7] = game_get_speed(gamespeed_fps) * 0.25
		}
	}
	state = EnemyStates.READY
	
}

if (sprite_index == spr_jump || sprite_index == spr_special) {
	sprite_index = spr_basic
}