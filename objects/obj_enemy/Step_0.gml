ysp += 0.3

var _plat = instance_nearest(x, y, obj_platform)

if (state == EnemyStates.LIGHT || sprite_index == spr_attack) 
and image_index >= 1 and image_index <= 5{
	//create hitbox for attack
	var hb_startX = 0
	var hb_startY = 0
	var rect_x1 = 0
	var rect_x2 = 0
	var rect_y1 = 0
	var rect_y2 = 0
	
	if(image_xscale == 1) {
		hb_startX = -10
		hb_startY = 0
		rect_x1 = 0
		rect_x2 = 60
		rect_y1 = 20
		rect_y2 = -10
	}
	
	if (image_xscale == -1) {
		hb_startX = 10
		hb_startY = 0
		rect_x1 = 0
		rect_x2 = -60
		rect_y1 = 20
		rect_y2 = -10
	}
	
	var hitBox = instance_create_layer(x + hb_startX, y + hb_startY, "Instances", obj_enemy_attack_hitbox)
	hitBox.x1 = rect_x1
	hitBox.x2 = rect_x2
	hitBox.y1 = rect_y1
	hitBox.y2 = rect_y2
	hitBox.attacker = id
	if(sprite_index == spr_attack) {hitBox.attack_type = "light"}
	else {hitBox.attack_type = "combo"}
}

//heavy attack hitbox
if (state == EnemyStates.HEAVY || sprite_index == spr_heavy_attack ) 
and image_index >= 7 and image_index <= 7{
	//create hitbox for attack
	var hb_startX = 0
	var hb_startY = 0
	var rect_x1 = 0
	var rect_x2 = 0
	var rect_y1 = 0
	var rect_y2 = 0
	
	if(image_xscale == 1) {
		hb_startX = -10
		hb_startY = 0
		rect_x1 = 0
		rect_x2 = 60
		rect_y1 = 20
		rect_y2 = -10
	}
	
	if (image_xscale == -1) {
		hb_startX = 10
		hb_startY = 0
		rect_x1 = 0
		rect_x2 = -60
		rect_y1 = 20
		rect_y2 = -10
	}
	
	var hitBox = instance_create_layer(x + hb_startX, y + hb_startY, "Instances", obj_enemy_attack_hitbox)
	hitBox.x1 = rect_x1
	hitBox.x2 = rect_x2
	hitBox.y1 = rect_y1
	hitBox.y2 = rect_y2
	hitBox.attacker = id
	hitBox.attack_type = "heavy"
}

//reset jumps and dodge
if place_meeting(x, y+ysp, _plat) {
	if (ysp > 0) {
        jump_cur = jump_max;
    }
    ysp = 0;
}
if place_meeting(x, y+ysp, _plat) {
    ysp = 0;
}

if(isHit) {
	if(alarm[2] == -1) {
		alarm[2] = game_get_speed(gamespeed_fps) * 0.7	
	}
}

//wall hang/ jump
if place_meeting(x+xsp, y, _plat) || place_meeting(x-xsp, y, _plat) {
	jump_cur = jump_max - 1
	if(!on_wall) {ysp = 0.5}
	else {ysp -= 0.29}
	on_wall = true
} else {
	on_wall = false
}

if(wall_direction != 0) {
	xsp = max_spd * wall_direction
}

//first and foremost, get on the main platform
var _acc = 0
if(x > (_plat.x + (_plat.sprite_width / 2))) {
	xsp -= 1
	_acc = -1
} else if (x < (_plat.x - (_plat.sprite_width / 2))) {
	xsp += 1
	_acc = 1
}

if (xsp > 0 and xsp < max_spd) xsp = min(max_spd, xsp + _acc); //accelerate going right
if (xsp < 0 and xsp > -max_spd) xsp = max(-max_spd, xsp + _acc); //accelerate going left

//check not going past max speed
if(xsp > 0 and _acc > 0) {
	if(xsp + _acc > max_spd) {
		xsp = max_spd	
	}
} else if (xsp < 0 and _acc < 0) {
	if(xsp + _acc < -max_spd) {
		xsp = -max_spd
	}
}

if((dodge) and (sign(xsp) == sign(_acc)) and (y > _plat.y)) {
	state = EnemyStates.DODGING
	xsp = _acc * max_spd * 4
	if(dodge_current > 0) {
		dodge_current--
		sprite_index = spr_dodge
		//length of dodge/parry
		alarm[4] = 12
	}
}

if(state != EnemyStates.DODGING) {
	if(jump_cur > 0 and jump and _acc != 0) {
		jump = false
		ysp = -8
		jump_cur --
		alarm[6] = game_get_speed(gamespeed_fps) * 1
	}
}

if(wall_direction != 0) {
	xsp = max_spd * wall_direction
}

if(xsp != 0) {
	if(place_meeting(x+xsp, y, _plat)) {
		if (jump_cur > 0) {
			ysp = -8
			jump_cur--
			if (place_meeting(x + max_spd, y, _plat)) {
				wall_direction = -1
				alarm[3] = wall_jump_speed
				jump_cur--
			}
			if (place_meeting(x - max_spd, y, _plat)) {
				wall_direction = 1
				alarm[3] = wall_jump_speed
				jump_cur--
			}
			image_index = spr_jump
		}
	}
}

if(instance_exists(obj_player)) {
	
	//if on the platform, move to player
	if(_acc == 0) {
		if(x > (obj_player.x + (obj_player.image_xscale * (obj_player.sprite_width - (obj_player.sprite_width / 8))))) {
			xsp -= 1
			_acc = -1
		} else if (x < obj_player.x - (obj_player.image_xscale * (obj_player.sprite_width - (obj_player.sprite_width / 8)))) {
			xsp += 1
			_acc = 1
		}

		if (xsp > 0 and xsp < max_spd) xsp = min(max_spd, xsp + _acc); //accelerate going right
		if (xsp < 0 and xsp > -max_spd) xsp = max(-max_spd, xsp + _acc); //accelerate going left

		//check not going past max speed
		if(xsp > 0 and _acc > 0) {
			if(xsp + _acc > max_spd) {
				xsp = max_spd	
			}
		} else if (xsp < 0 and _acc < 0) {
			if(xsp + _acc < -max_spd) {
				xsp = -max_spd
			}
		}
	}
	
	//If the player is attacking, dodge
	if((abs(obj_player.x - x) < sprite_width and abs(obj_player.y - y) < sprite_height) and state == EnemyStates.READY and obj_player.player_state == player_states.LIGHT_ATTACK) {
		if(dodge and (sign(xsp) == sign(_acc))) {
			state = EnemyStates.DODGING
			xsp = _acc * max_spd * 4
			if(dodge_current > 0) {
				dodge_current--
				sprite_index = spr_dodge
				//length of dodge/parry
				alarm[4] = 12
			}
		}
	}

	//attacking the player if near
	if((abs(obj_player.x - x) < (sprite_width * image_xscale)) and (abs(obj_player.y - y) < sprite_height) and (state == EnemyStates.READY)) {
		//attack
		var _atk = random(100)
		if (_atk > 25 and on_wall == false) {
			if(state != EnemyStates.LIGHT and state != EnemyStates.HEAVY ) {
				if(combo_active) {sprite_index = spr_attack2}
				else {sprite_index = spr_attack}
		
				image_index = 0
				state = EnemyStates.LIGHT
			}
		}

		//heavy attack
		if (_atk <= 25 and on_wall == false) {
			if(state != EnemyStates.HEAVY and state != EnemyStates.LIGHT) {
				sprite_index = spr_heavy_attack
				image_index = 0
				state = EnemyStates.HEAVY
			}
		}
	}

	if(y > room_height + sprite_height * 2) {
		life = life - 1
		if(life == 0) {
			instance_destroy(id, false)
		} else {
			x = stx
			y = sty
			xsp = 0
			ysp = 0
			dmg = 0
		}
	}
}

if (_acc == 0) {
	if (xsp > 0) xsp = max(0, xsp - frict); //friction going right
	if (xsp < 0) xsp = min(0, xsp + frict); //friction going left
	if (state != EnemyStates.LIGHT and state != EnemyStates.HEAVY 
	and sprite_index != spr_jump and sprite_index != spr_special) {sprite_index = spr_basic}
} else {
	if (state != EnemyStates.LIGHT and state != EnemyStates.HEAVY 
	and sprite_index != spr_jump and sprite_index != spr_special) {sprite_index = spr_move}
	image_xscale = _acc
}

move_and_collide(xsp, ysp, obj_platform)
