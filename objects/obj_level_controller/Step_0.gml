if(multiPlayer) {
	if not gameOver {
		if(obj_player1.life <= 0) {
			instance_create_layer((room_width / 2), 75, "Instances", obj_gameover1)
			instance_create_layer((room_width / 2), 175, "Instances", obj_gameover2)
			alarm[1] = game_get_speed(gamespeed_fps) * 3
			gameOver = true
		} else if (obj_player2.life <= 0) {
			instance_create_layer((room_width / 2), 75, "Instances", obj_gameover1)
			instance_create_layer((room_width / 2), 175, "Instances", obj_gameover2)
			alarm[0] = game_get_speed(gamespeed_fps) * 3
			gameOver = true
		}
	}
} else {
	if not gameOver {
		if(obj_player.life <= 0) {
			instance_create_layer((room_width / 2), 75, "Instances", obj_gameover1)
			instance_create_layer((room_width / 2), 175, "Instances", obj_gameover2)
			alarm[2] = game_get_speed(gamespeed_fps) * 3
			gameOver = true
		} else if (not instance_exists(obj_enemy)) {
			instance_create_layer((room_width / 2), 75, "Instances", obj_gameover1)
			instance_create_layer((room_width / 2), 175, "Instances", obj_gameover2)
			alarm[3] = game_get_speed(gamespeed_fps) * 3
			gameOver = true
		}
	}
}