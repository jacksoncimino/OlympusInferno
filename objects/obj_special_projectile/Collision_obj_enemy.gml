other.dmg += damage
if (direction == 0) {
		var _strike = instance_create_layer(x, y + other.sprite_height/2, "Instances", effect)
		_strike.image_xscale = -1
		other.xsp = knockback * other.dmg
	}
	else {
		var _strike = instance_create_layer(x, y + other.sprite_height/2, "Instances", effect)
		_strike.image_xscale = 1
		other.xsp = -knockback * other.dmg
	}
	other.ysp = -1 * other.dmg / 2
instance_destroy()