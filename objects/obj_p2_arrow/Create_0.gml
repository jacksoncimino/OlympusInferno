visible = false

dir = 1

player = noone

if(obj_level_controller.multiPlayer) {
	player = obj_player2
} else {
	player = obj_enemy
}