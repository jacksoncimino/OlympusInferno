var _posX = attackee.x
var _posY = attackee.y

x = _posX

if(steps > 8) {
	ysp += 0.3
	move_and_collide(0, ysp, obj_platform)
	if( y >= attackee.y - 30) {
		instance_destroy()
	}
} else {
	y = _posY - offsetY - height
}

