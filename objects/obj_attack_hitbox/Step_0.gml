
var instGrab = collision_rectangle(x+x1, y+y1, x+x2, y+y2, obj_cyclops, 0, 0)

if(instGrab != noone) {
	if(!instGrab.isHit) {
		instGrab.hp --
		instGrab.isHit = true
		instGrab.image_blend = c_red
	}
}