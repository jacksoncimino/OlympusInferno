xsp = 0
ysp = 0
spd = 5

jump_number = 3
jump_current = 0

dodge_number = 1
dodge_current = 0

wall_direction = 0
on_wall = false
wall_jump_speed = game_get_speed(gamespeed_fps) * 0.3

enum player_states {
	NONE,
	DODGING,
	PARRYING
}

global.player_state = player_states.NONE