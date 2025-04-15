char_vals = get_player_values(object_index);

startX = x
startY = y

name = char_vals.stats.name

xsp = 0
ysp = 0
max_spd = char_vals.stats.xspd_max
acceleration = char_vals.stats.xspd_acc
frict = char_vals.stats.frict

isHit = false
onFloating = false

jump_number = char_vals.stats.jumps
jump_current = 0

//players will have default sprites. Change these for each new player child
spr_move = char_vals.sprites.move
spr_basic = char_vals.sprites.basic
spr_dodge = char_vals.sprites.dodge
spr_attack = char_vals.sprites.attack
spr_attack2 = char_vals.sprites.attack2
spr_heavy_attack = char_vals.sprites.heavy_attack
spr_parry = char_vals.sprites.parry
spr_jump = char_vals.sprites.jump
spr_special = char_vals.sprites.special

combo_active = false

//special attack threshold
special_meter = 0
attacks_needed = 9

dodge_number = char_vals.stats.dodges
dodge_current = 1

wall_direction = 0
on_wall = false
wall_jump_speed = game_get_speed(gamespeed_fps) * 0.3

hp = 0

enum player_states {
	NONE,
	DODGING,
	PARRYING,
	LIGHT_ATTACK,
	HEAVY_ATTACK,
	JUMPING
}

player_state = player_states.NONE

//controls for player
move_left_key = vk_left
move_right_key = vk_right
jump_key = vk_up
down_key = vk_down
dodge_key = ord("C")
quick_attack_key = ord("X")
special_attack_key = ord("S")
heavy_attack_key = ord("Z")

life = 3

