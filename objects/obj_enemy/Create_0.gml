enemy_vals = get_player_values(object_index);

ysp = 0
xsp = 0

startX = x
startY = y

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

life = 3

level = 1
dmg = 0

randomize()