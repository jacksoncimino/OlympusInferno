if(attacker.id != other.id) {

	other.hp += 10
	if (direction == 0) {
		var _strike = instance_create_layer(x + other.sprite_width/2, y + other.sprite_height/3, "Instances", obj_lightning_strike)
		_strike.image_xscale = -1
	}
	else {
		var _strike = instance_create_layer(x - other.sprite_width/2, y + other.sprite_height/3, "Instances", obj_lightning_strike)
		_strike.image_xscale = 1
	}
	instance_destroy()
}