var instGrab_enemy = collision_rectangle(x+x1, y+y1, x+x2, y+y2, obj_enemy, 0, 0)
var instGrab_player = collision_rectangle(x+x1, y+y1, x+x2, y+y2, obj_player, 0, 0)

if(instGrab_enemy != noone) {
	if(!(instGrab_enemy.state == EnemyStates.HIT)) {
		instGrab_enemy.dmg ++
		instGrab_enemy.state = EnemyStates.HIT
		instGrab_enemy.image_blend = c_red
		attacker.special_meter++
	}
}

if(instGrab_player != noone and instGrab_player.id != attacker.id) {
	if(!(instGrab_player.isHit)) {
		instGrab_player.hp --
		instGrab_player.isHit = true
		instGrab_player.image_blend = c_red
		attacker.special_meter++
	}
}