if(other.id = attackee and other.player_state != player_states.DODGING and steps > 8) {
	instance_create_layer(x, y, "Instances", obj_wave)
	other.hp += damage
	other.xsp = knockback * other.hp * -1 * other.image_xscale
	other.ysp = -1 * other.hp / 2
	instance_destroy()
}