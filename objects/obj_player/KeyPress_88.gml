///@description attack

if(global.player_state != player_states.LIGHT_ATTACK) {
	sprite_index = spr_attack
	image_index = 0
	global.player_state = player_states.LIGHT_ATTACK
}
