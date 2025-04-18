var instGrab_enemy = collision_rectangle(x+x1, y+y1, x+x2, y+y2, obj_enemy, 0, 0)
var players = ds_list_create();
var num_players = collision_rectangle_list(x+x1, y+y1, x+x2, y+y2, obj_player,  0, 0, players, 0)

if(instGrab_enemy != noone) {
	if(!(instGrab_enemy.state == EnemyStates.HIT)) {
		instGrab_enemy.dmg ++
		instGrab_enemy.state = EnemyStates.HIT
		instGrab_enemy.image_blend = c_red
		attacker.special_meter++
		
		//knockback
		if(instGrab_enemy.x > x) {
			if(attack_type == "heavy") {
				instGrab_enemy.xsp = knockback * instGrab_enemy.dmg
			} else if (attack_type == "light") {
				instGrab_enemy.xsp = light_attack_spd
			} else if (attack_type == "combo") {
				instGrab_enemy.xsp = (knockback/2) * instGrab_enemy.dmg
			}
		} else {
			if(attack_type == "heavy") {
				instGrab_enemy.xsp = -knockback * instGrab_enemy.dmg
			} else if (attack_type == "light") {
				instGrab_enemy.xsp = -light_attack_spd
			} else if (attack_type == "combo") {
				instGrab_enemy.xsp = -(knockback/2) * instGrab_enemy.dmg
			}
		}
		if(attack_type == "heavy") {
			instGrab_enemy.ysp = -1 * instGrab_enemy.dmg / 2
		} else if (attack_type == "light") {
			instGrab_enemy.ysp = -1
		} else if (attack_type == "combo") {
			instGrab_enemy.ysp = -1 * instGrab_enemy.dmg / 4
		}
	}
}

if(num_players > 0) {
	for (var i = 0; i < num_players; ++i;)
    {
		var instGrab_player = players[| i]
		if (instGrab_player.id != attacker) {
			if(!(instGrab_player.isHit)) {
				instGrab_player.hp ++
				instGrab_player.isHit = true
				instGrab_player.image_blend = c_red
				attacker.special_meter++
		
				if(instGrab_player.x > x) {
					if(attack_type == "heavy") {
						instGrab_player.xsp = knockback * instGrab_player.hp
					} else if (attack_type == "light") {
						instGrab_player.xsp = light_attack_spd
					}
					else if (attack_type == "combo") {
						instGrab_player.xsp = (knockback/2) * instGrab_player.hp
					}
				} else {
					if(attack_type == "heavy") {
						instGrab_player.xsp = -knockback * instGrab_player.hp
					} else if (attack_type == "light") {
						instGrab_player.xsp = -light_attack_spd
					} else if (attack_type == "combo") {
						instGrab_player.xsp = -(knockback/2) * instGrab_player.hp
					}
				}
				if(attack_type == "heavy") {
					instGrab_player.hp += 2
					instGrab_player.ysp = -1 * instGrab_player.hp / 2
				} else if (attack_type == "light") {
					instGrab_player.ysp = -1
				} else if (attack_type == "combo") {
					instGrab_player.ysp = -1 * instGrab_player.hp / 4
				}
			}
		}
    }
}

