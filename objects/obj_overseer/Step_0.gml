if(room == r_Olympus_Single or room == r_Underworld_Single or room == r_SnowyPeak_Single) {
	if(global.gameOver and setVars) {
		php = obj_player.life
		psp = obj_player.special_meter
		setVars = false
		rid = room
	}
}

if (rid != room) {
	setVars = true
	rid = room
	if(instance_exists(obj_player)) {
		obj_player.life = php
		obj_player.special_meter = psp
	}
}