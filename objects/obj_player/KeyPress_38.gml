/// @description handle jump
if (jump_current > 0) {
	ysp = -8
	jump_current--
	if (place_meeting(x + max_spd, y, obj_platform)) {
		wall_direction = -1
		alarm[0] = wall_jump_speed
		jump_current--
	}
	if (place_meeting(x - max_spd, y, obj_platform)) {
		wall_direction = 1
		alarm[0] = wall_jump_speed
		jump_current--
	}
	image_index = spr_jump
}