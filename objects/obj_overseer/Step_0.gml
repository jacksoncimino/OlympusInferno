if(room == r_Olympus_Single or room == r_Underworld_Single or room == r_SnowyPeak_Single) {
	if(global.gameOver and setVars) {
		if(instance_exists(obj_level_controller)) {
			if(not obj_level_controller.multiPlayer) {
				php = obj_player.life
				psp = obj_player.special_meter
			}
		}
		setVars = false
		rid = room
	}
}

if (rid != room) {
	rid = room
	setVars = true
	if(instance_exists(obj_level_controller)) {
		if(not obj_level_controller.multiPlayer) {
			if(instance_exists(obj_player)) {
				obj_player.life = php
				obj_player.special_meter = psp
			}
		}
	} else {
		php = 3
		psp = 0
	}
}