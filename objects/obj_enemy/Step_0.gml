

//If the player is attacking, dodge or parry (chance)
if((abs(obj_player.x - x) < sprite_width and abs(obj_player.y - y) < sprite_height) and state == EnemyStates.READY and global.player_state == player_states.ATTACKING) {
	var _chance = random(100)
	
	if (_chance > level * 2) {
		if (_chance > (100 - (((100 - (level * 2))) / 2) + level)) {
			state = EnemyStates.PARRYING
			sprite_index = enemy_vals.sprites.parry
			alarm[1] = 4
		} else {
			state = EnemyStates.DODGING
			sprite_index = enemy_vals.sprites.parry
			alarm[0] = 12
		}
	}
}

//attacking the player if near
if((abs(obj_player.x - x) < sprite_width and abs(obj_player.y - y) < sprite_height) and state == EnemyStates.READY) {
	state = EnemyStates.ATTACKING
	instance_create_layer(x,y,"Instances", obj_cyclops_atk)
	obj_cyclops_atk.image_xscale = image_xscale
	alarm[0] = game_get_speed(gamespeed_fps) * 2 //attack cooldown
}