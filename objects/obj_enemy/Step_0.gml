ysp += 0.3

var _plat = instance_nearest(x,y, obj_platform)

//movement friction
if (xsp > 0) xsp = max(0, xsp - frict); //friction going right
if (xsp < 0) xsp = min(0, xsp + frict); //friction going left

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

if(state == EnemyStates.HIT) {
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
	//If the player is attacking, dodge or parry (chance)
	if((abs(obj_player.x - x) < sprite_width and abs(obj_player.y - y) < sprite_height) and state == EnemyStates.READY and obj_player.player_state == player_states.LIGHT_ATTACK) {
		var _chance = random(100)
	
		if (_chance > level * 2) {
			if (_chance > (100 - (((100 - (level * 2))) / 2) + level)) {
				state = EnemyStates.PARRYING
				sprite_index = enemy_vals.sprites.parry
				alarm[1] = 4
			} else {
				state = EnemyStates.DODGING
				sprite_index = enemy_vals.sprites.parry
				alarm[0] = 12
			}
		}
	}

	//attacking the player if near
	if((abs(obj_player.x - x) < sprite_width and abs(obj_player.y - y) < sprite_height) and state == EnemyStates.READY) {
		state = EnemyStates.ATTACKING
		instance_create_layer(x,y,"Instances", obj_cyclops_atk)
		obj_cyclops_atk.image_xscale = image_xscale
		alarm[0] = game_get_speed(gamespeed_fps) * 2 //attack cooldown
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

move_and_collide(xsp, ysp, obj_platform)
