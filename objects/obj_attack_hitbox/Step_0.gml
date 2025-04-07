var instGrab = collision_rectangle(x+x1, y+y1, x+x2, y+y2, obj_enemy, 0, 0)

if(instGrab != noone) {
	if(!(instGrab.state == EnemyStates.HIT)) {
		instGrab.dmg ++
		instGrab.state = EnemyStates.HIT
		instGrab.image_blend = c_red
		attacker.special_meter++
	}
}