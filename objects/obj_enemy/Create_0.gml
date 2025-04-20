enemy_vals = get_player_values(object_index);

spr_move = enemy_vals.sprites.move
spr_basic = enemy_vals.sprites.basic
spr_dodge = enemy_vals.sprites.dodge
spr_attack = enemy_vals.sprites.attack
spr_attack2 = enemy_vals.sprites.attack2
spr_heavy_attack = enemy_vals.sprites.heavy_attack
spr_parry = enemy_vals.sprites.parry
spr_jump = enemy_vals.sprites.jump
spr_special = enemy_vals.sprites.special

ysp = 0
xsp = 0

max_spd = 5
wall_jump_speed = game_get_speed(gamespeed_fps) * 0.3

dodge = true
dodge_current = 1

frict = enemy_vals.stats.frict

wall_direction = 0

life = 3

combo_active = false

special_meter = 0

jump_cur = 3
jump_max = 3
jump = true

on_wall = false

isHit = false

//States
enum EnemyStates {
	READY,
	LIGHT,
	HEAVY,
	DODGING
}

state = EnemyStates.READY

stx = x
sty = y

level = 1
dmg = 0

randomize()