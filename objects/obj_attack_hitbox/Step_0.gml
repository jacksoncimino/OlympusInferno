
var instGrab = collision_rectangle(x+x1, y+y1, x+x2, y+y2, obj_player, 0, 0)

if(instGrab != noone) {
	instGrab.hp --
}