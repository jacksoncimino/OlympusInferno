ysp += 0.3

//movement friction
if (xsp > 0) xsp = max(0, xsp - frict); //friction going right
if (xsp < 0) xsp = min(0, xsp + frict); //friction going left


//reset jumps and dodge
if place_meeting(x, y+ysp, obj_platform) {
	if (ysp > 0) {
        jump_cur = jump_max;
    }
    ysp = 0;
}
if place_meeting(x, y+ysp, obj_platform) {
    ysp = 0;
}

if(state == EnemyStates.HIT) {
	if(alarm[2] == -1) {
		alarm[2] = game_get_speed(gamespeed_fps) * 0.7	
	}
}

//wall hang/ jump
if place_meeting(x+xsp, y, obj_platform) || place_meeting(x-xsp, y, obj_platform) {
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

if(x > (obj_platform.x + (obj_platform.sprite_width / 2))) {
	xsp -= .3
} else if (x < (obj_platform.x - (obj_platform.sprite_width / 2))) {
	xsp += .3
}
if(xsp != 0) {
	if(place_meeting(x+xsp, y, obj_platform)) {
		if (jump_current > 0) {
			ysp = -8
			jump_current--
			if (place_meeting(x + max_spd, y, obj_platform)) {
				wall_direction = -1
				alarm[3] = wall_jump_speed
				jump_current--
			}
			if (place_meeting(x - max_spd, y, obj_platform)) {
				wall_direction = 1
				alarm[3] = wall_jump_speed
				jump_current--
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
		}
	}
}

move_and_collide(xsp, ysp, obj_platform)
