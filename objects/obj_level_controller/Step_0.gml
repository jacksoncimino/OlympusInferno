if(multiPlayer) {
	if(song) {
		audio_play_sound(OI_simplebackground, 1, true)
		song = false
	}
	if not global.gameOver {
		if(obj_player1.life <= 0) {
			audio_stop_sound(OI_simplebackground)
			instance_create_layer((room_width / 2), 75, "Instances", obj_gameover1)
			instance_create_layer((room_width / 2), 175, "Instances", obj_gameover2)
			alarm[1] = game_get_speed(gamespeed_fps) * 3
			global.gameOver = true
		} else if (obj_player2.life <= 0) {
			audio_stop_sound(OI_simplebackground)
			instance_create_layer((room_width / 2), 75, "Instances", obj_gameover1)
			instance_create_layer((room_width / 2), 175, "Instances", obj_gameover2)
			alarm[0] = game_get_speed(gamespeed_fps) * 3
			global.gameOver = true
		}
	}
} else {
	if(song) {
		audio_play_sound(OI_simplebackground, 1, true)
		song = false
	}
	if not global.gameOver {
		if(obj_player.life <= 0) {
			audio_stop_sound(OI_simplebackground)
			instance_create_layer((room_width / 2), 75, "Instances", obj_gameover1)
			instance_create_layer((room_width / 2), 175, "Instances", obj_gameover2)
			alarm[2] = game_get_speed(gamespeed_fps) * 3
			global.gameOver = true
		} else if (not instance_exists(obj_enemy)) {
			audio_stop_sound(OI_simplebackground)
			instance_create_layer((room_width / 2), 75, "Instances", obj_gameover1)
			instance_create_layer((room_width / 2), 175, "Instances", obj_gameover2)
			if(room == r_Mountain_Single) {
				alarm[3] = game_get_speed(gamespeed_fps) * 3
			} else {
				alarm[4] = game_get_speed(gamespeed_fps) * 3
			}
			global.gameOver = true
		}
	}
}