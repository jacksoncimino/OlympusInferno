xsp = 0
ysp = 0
max_spd = 5
acceleration = 1
frict = 0.5

jump_number = 3
jump_current = 0

//players will have default sprites. Change these for each new player child
spr_move = spr_temp_move
spr_basic = spr_temp
spr_dodge = spr_temp_dodge
spr_attack = spr_temp_atk
spr_parry = spr_temp_parry

dodge_number = 1
dodge_current = 1

wall_direction = 0
on_wall = false
wall_jump_speed = game_get_speed(gamespeed_fps) * 0.3

enum player_states {
	NONE,
	DODGING,
	PARRYING
}

global.player_state = player_states.NONE