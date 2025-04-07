if(place_meeting(x, y, obj_player) and damage) {
	if(global.player_state == player_states.DODGING) {
		
	} else if (global.player_state == player_states.PARRYING) {
		
	} else {
		obj_player.hp -= 1
		obj_player.isHit = true
		damage = false
	}
}