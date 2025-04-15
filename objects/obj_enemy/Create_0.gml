enemy_vals = get_player_values(object_index);

ysp = 0
xsp = 0

max_spd = 3
wall_jump_speed = 2

frict = enemy_vals.stats.frict

wall_direction = 0

life = 3

jump_cur = 3
jump_max = 3

on_wall = false

//States
enum EnemyStates {
	READY,
	ATTACKING,
	DODGING,
	PARRYING,
	HIT,
	PARRYFAIL
}

state = EnemyStates.READY

level = 1
dmg = 0

randomize()