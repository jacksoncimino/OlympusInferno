spd = 10

atk = 1

attacker = obj_player

effect = obj_lightning_bolt

knockback = 4

if(object_index == obj_lightning_bolt) {
	effect = obj_lightning_strike
} else if (object_index == obj_fireball) {
	effect = obj_fire_explosion
}