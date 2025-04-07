char_vals = get_player_values(object_index);

startX = x
startY = y

xsp = 0
ysp = 0
max_spd = char_vals.stats.xspd_max
acceleration = char_vals.stats.xspd_acc
frict = char_vals.stats.frict

isHit = false

jump_number = char_vals.stats.jumps
jump_current = 0

//players will have default sprites. Change these for each new player child
spr_move = char_vals.sprites.move
spr_basic = char_vals.sprites.basic
spr_dodge = char_vals.sprites.dodge
spr_attack = char_vals.sprites.attack
spr_parry = char_vals.sprites.parry

//special attack threshold
special_meter = 0
attacks_needed = 9

dodge_number = char_vals.stats.dodges
dodge_current = 1

wall_direction = 0
on_wall = false
wall_jump_speed = game_get_speed(gamespeed_fps) * 0.3

hp = 100

enum player_states {
	NONE,
	DODGING,
	PARRYING,
	LIGHT_ATTACK
}

global.player_state = player_states.NONE