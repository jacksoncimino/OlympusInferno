if((abs(obj_player.x - x) < sprite_width and abs(obj_player.y - y) < sprite_height) and can_attack) {
	can_attack = false
	instance_create_layer(x,y,"Instances", obj_cyclops_atk)
	obj_cyclops_atk.image_xscale = image_xscale
	alarm[0] = game_get_speed(gamespeed_fps) * attack_cooldown
}
