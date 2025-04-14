enemy_vals = get_player_values(object_index);

ysp = 0
xsp = 0

frict = enemy_vals.stats.frict

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