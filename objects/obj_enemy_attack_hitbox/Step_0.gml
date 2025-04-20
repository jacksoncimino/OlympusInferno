var instGrab_enemy = collision_rectangle(x+x1, y+y1, x+x2, y+y2, obj_player, 0, 0)
var players = ds_list_create();
var num_players = collision_rectangle_list(x+x1, y+y1, x+x2, y+y2, obj_player,  0, 0, players, 0)

if(instGrab_enemy != noone) {
if(!(instGrab_enemy.isHit)) {
		instGrab_enemy.hp ++
		instGrab_enemy.isHit = true
		instGrab_enemy.image_blend = c_red
		attacker.special_meter++
		
		if(instGrab_enemy.x > x) {
			if(attack_type == "heavy") {
				instGrab_enemy.xsp = knockback * instGrab_enemy.hp
			} else if (attack_type == "light") {
				instGrab_enemy.xsp = light_attack_spd
			}
			else if (attack_type == "combo") {
				instGrab_enemy.xsp = (knockback/2) * instGrab_enemy.hp
			}
		} else {
			if(attack_type == "heavy") {
				instGrab_enemy.xsp = -knockback * instGrab_enemy.hp
			} else if (attack_type == "light") {
				instGrab_enemy.xsp = -light_attack_spd
			} else if (attack_type == "combo") {
				instGrab_enemy.xsp = -(knockback/2) * instGrab_enemy.hp
			}
		}
		if(attack_type == "heavy") {
			instGrab_enemy.hp += 2
			instGrab_enemy.ysp = -1 * instGrab_enemy.hp / 2
		} else if (attack_type == "light") {
			instGrab_enemy.ysp = -1
		} else if (attack_type == "combo") {
			instGrab_enemy.ysp = -1 * instGrab_enemy.hp / 4
		}
	}
}