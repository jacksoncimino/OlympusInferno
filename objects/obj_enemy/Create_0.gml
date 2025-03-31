enemy_vals = get_player_values(object_index);

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