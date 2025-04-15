if(attacker.id != other.id) {

	if (direction == 0) {
		var _strike = instance_create_layer(x, y + other.sprite_height/2, "Instances", effect)
		_strike.image_xscale = -1
		other.xsp = knockback * other.hp
	}
	else {
		var _strike = instance_create_layer(x, y + other.sprite_height/2, "Instances", effect)
		_strike.image_xscale = 1
		other.xsp = -knockback * other.hp
	}
	other.ysp = -1 * other.hp / 2
	
	other.hp += 10
	instance_destroy()
}