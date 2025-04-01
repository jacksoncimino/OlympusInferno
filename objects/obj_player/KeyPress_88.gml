///@description attack

if(global.player_state != player_states.ATTACKING) {
	sprite_index = spr_attack
	image_index = 0
	global.player_state = player_states.ATTACKING
}
