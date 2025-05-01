//create gravity to handle jumps
ysp += 0.3

//move right or left when arrow key is pressed
var _rightkey = keyboard_check(move_right_key)
var _leftkey = keyboard_check(move_left_key) 
var _dodgekey = keyboard_check(dodge_key)
var _downkey = keyboard_check(down_key)
var _quickattackkey = keyboard_check(quick_attack_key)
var _heavyattackkey = keyboard_check(heavy_attack_key)
var _specialattackkey = keyboard_check_pressed(special_attack_key)
var _jumpkey = keyboard_check_pressed(jump_key)

var _move = _rightkey - _leftkey

var _gp = undefined

if(object_index == obj_player1) {
	_gp = global.gamepad_main
} else if (object_index == obj_player2) {
	_gp = global.gamepad_secondary
} else {
	_gp = global.gamepad_main
}

if(_gp != undefined) {
	_move = ceil(gamepad_axis_value(_gp, gp_axislh))
	_dodgekey = gamepad_button_check_pressed(_gp, gp_face2)
	_downkey = gamepad_button_check_pressed(_gp, gp_shoulderl)
	_quickattackkey = gamepad_button_check_pressed(_gp, gp_face3)
	_heavyattackkey = gamepad_button_check_pressed(_gp, gp_face4)
	_specialattackkey = gamepad_button_check_pressed(_gp, gp_shoulderr)
	_jumpkey = gamepad_button_check_pressed(_gp, gp_face1)
}

if (player_state == player_states.NONE || player_state == player_states.LIGHT_ATTACK || player_state == player_states.HEAVY_ATTACK) {
	if (_move == 1 and xsp < max_spd) xsp = min(max_spd, xsp + acceleration); //accelerate going right
    if (_move == -1 and xsp > -max_spd) xsp = max(-max_spd, xsp - acceleration); //accelerate going left
	if (_move == 0) {
		if (xsp > 0) xsp = max(0, xsp - frict); //friction going right
		if (xsp < 0) xsp = min(0, xsp + frict); //friction going left
		if (player_state != player_states.LIGHT_ATTACK and player_state != player_states.HEAVY_ATTACK 
		and sprite_index != spr_jump and sprite_index != spr_special) {sprite_index = spr_basic}
	} else {
		if (player_state != player_states.LIGHT_ATTACK and player_state != player_states.HEAVY_ATTACK 
		and sprite_index != spr_jump and sprite_index != spr_special) {sprite_index = spr_move}
		image_xscale = _move
	}
}

if (player_state == player_states.LIGHT_ATTACK || sprite_index == spr_attack) 
and image_index >= 1 and image_index <= 5{
	//create hitbox for attack
	var hb_startX = 0
	var hb_startY = 0
	var rect_x1 = 0
	var rect_x2 = 0
	var rect_y1 = 0
	var rect_y2 = 0
	
	if(name = "Poseidon") {
		hb_startX = 50
		hb_startY = 0
		rect_x1 = 0
		rect_x2 = 30
		rect_y1 = 20
		rect_y2 = 10
		if(sprite_index != spr_attack) {
			hb_startX += 15
		}	
	} else {
		hb_startX = 10
		hb_startY = 0
		rect_x1 = 0
		rect_x2 = 40
		rect_y1 = 20
		rect_y2 = 10
	}
	
	if(image_xscale == 1) {
		hb_startX = hb_startX
		hb_startY = hb_startY
		rect_x1 = rect_x1
		rect_x2 = rect_x2
		rect_y1 = rect_y1
		rect_y2 = -rect_y2
	}
	
	if (image_xscale == -1) {
		hb_startX = -hb_startX
		hb_startY = hb_startY
		rect_x1 = rect_x1
		rect_x2 = -rect_x2
		rect_y1 = rect_y1
		rect_y2 = -rect_y2
	}
	
	var hitBox = instance_create_layer(x + hb_startX, y + hb_startY, "Instances", obj_attack_hitbox)
	hitBox.x1 = rect_x1
	hitBox.x2 = rect_x2
	hitBox.y1 = rect_y1
	hitBox.y2 = rect_y2
	hitBox.attacker = id
	if(sprite_index == spr_attack) {hitBox.attack_type = "light"}
	else {hitBox.attack_type = "combo"}
}

//heavy attack hitbox
if (player_state == player_states.HEAVY_ATTACK || sprite_index == spr_heavy_attack ) 
and image_index >= 7 and image_index <= 9{
	//create hitbox for attack
	var hb_startX = 0
	var hb_startY = 0
	var rect_x1 = 0
	var rect_x2 = 0
	var rect_y1 = 0
	var rect_y2 = 0
	
	if(name = "Poseidon") {
		hb_startX = 65
		hb_startY = 0
		rect_x1 = 0
		rect_x2 = 30
		rect_y1 = 20
		rect_y2 = 10
	} else {
		hb_startX = 10
		hb_startY = 0
		rect_x1 = 0
		rect_x2 = 40
		rect_y1 = 20
		rect_y2 = 10
	}
	
	if(image_xscale == 1) {
		hb_startX = hb_startX
		hb_startY = hb_startY
		rect_x1 = rect_x1
		rect_x2 = rect_x2
		rect_y1 = rect_y1
		rect_y2 = -rect_y2
	}
	
	if (image_xscale == -1) {
		hb_startX = -hb_startX
		hb_startY = hb_startY
		rect_x1 = rect_x1
		rect_x2 = -rect_x2
		rect_y1 = rect_y1
		rect_y2 = -rect_y2
	}
	
	var hitBox = instance_create_layer(x + hb_startX, y + hb_startY, "Instances", obj_attack_hitbox)
	hitBox.x1 = rect_x1
	hitBox.x2 = rect_x2
	hitBox.y1 = rect_y1
	hitBox.y2 = rect_y2
	hitBox.attacker = id
	hitBox.attack_type = "heavy"
}

//reset jumps and dodge
if place_meeting(x, y+ysp, obj_platform) {
	if (ysp > 0) {
        jump_current = jump_number;
    }
    ysp = 0;
}
//wall hang/ jump
if place_meeting(x+xsp, y, obj_platform) || place_meeting(x-xsp, y, obj_platform) {
	jump_current = jump_number - 1
	if(!on_wall) {ysp = 0.5}
	else {ysp -= 0.29}
	on_wall = true
} else {
	on_wall = false
}

if(wall_direction != 0) {
	xsp = max_spd * wall_direction
}

if(_jumpkey) {
	if (jump_current > 0) {
		ysp = -8
		jump_current--
		if (place_meeting(x + max_spd, y, obj_platform)) {
			wall_direction = -1
			alarm[0] = wall_jump_speed
			jump_current--
		}
		if (place_meeting(x - max_spd, y, obj_platform)) {
			wall_direction = 1
			alarm[0] = wall_jump_speed
			jump_current--
		}
		if(player_state != player_states.LIGHT_ATTACK and player_state != player_states.HEAVY_ATTACK and sprite_index != spr_special ) {
			sprite_index = spr_jump
		}
	}
}

//respawn
if(y > room_height + 500) {
	life -= 1
	if(life > 0) {
		x = startX
		y = startY
		hp = 0
		xsp = 0
		ysp = 0
	} else {
		life = 0	
	}
}

//combat
if(isHit) {
	if (alarm[3] == -1) {
		alarm[3] = game_get_speed(gamespeed_fps) * 0.7
		image_blend = c_red
	}
}

//dodge
if( _dodgekey) {
	if ( dodge_current > 0 ) {	
		if (_move == 1 or _move ==-1) {
			dodge_current--
			player_state = player_states.DODGING
			sprite_index = spr_dodge
			xsp = _move * max_spd * 4
		} else if (_downkey) {
			dodge_current--
			player_state = player_states.PARRYING
			sprite_index = spr_parry
		}
		//length of dodge/parry
		alarm[1] = 12
	}
}

//attack
if (_quickattackkey and on_wall == false) {
	if(player_state != player_states.LIGHT_ATTACK and player_state != player_states.HEAVY_ATTACK and sprite_index != spr_special ) {
		if(combo_active) {sprite_index = spr_attack2}
		else {sprite_index = spr_attack}
		
		image_index = 0
		player_state = player_states.LIGHT_ATTACK
	}
}

//heavy attack
if (_heavyattackkey and on_wall == false) {
	if(player_state != player_states.HEAVY_ATTACK and player_state != player_states.LIGHT_ATTACK and sprite_index != spr_special ) {
		sprite_index = spr_heavy_attack
		image_index = 0
		player_state = player_states.HEAVY_ATTACK
	}
}

//special attack
if( _specialattackkey) {
	if(special_meter > attacks_needed) {
		if(not spak_cooldown) {
			special_meter = special_meter - (attacks_needed + 1)
			var _special_knockback = 2
			if (name == "Zeus"){
				var _bolt = instance_create_layer(x, y, "Instances", obj_lightning_bolt)
				_bolt.speed = _bolt.spd
				_bolt.attacker = object_index
				_bolt.knockback = _special_knockback
				if (image_xscale == 1) {
					_bolt.direction = point_direction(x, y, x+1, y)
				} else {
					_bolt.direction = point_direction(x, y, x-1, y)
				}
			} else if (name == "Kronos") {
				var _fireball = instance_create_layer(x, y, "Instances", obj_fireball)
				_fireball.image_xscale = 0.25
				_fireball.image_yscale = 0.25
				_fireball.speed = _fireball.spd
				_fireball.attacker = object_index
				_fireball.knockback = _special_knockback
				if (image_xscale == 1) {
					_fireball.direction = point_direction(x, y, x+1, y)
				} else {
					_fireball.image_xscale = -0.25
					_fireball.direction = point_direction(x, y, x-1, y)
				}
			} else if (name == "Poseidon") {
				var _waterball = undefined
				var _player = undefined
				for(var i = 0;i<instance_number(obj_player);i++){
				    var _currplayer = instance_find(obj_player,i);

				    if _currplayer.id == id{
						continue
				    } else {
						_player = _currplayer
						break
					}
				}
				var _offsetY = 70
				_waterball = instance_create_layer(_player.x, _player.y - _offsetY, "Instances", obj_water_ball)
				_waterball.image_xscale = 0.25
				_waterball.image_yscale = 0.25
				_waterball.attackee = _player.id
				_waterball.offsetY = _offsetY
				_waterball.knockback = _special_knockback
			}
			spak_cooldown = true
			alarm[5] = game_get_speed(gamespeed_fps) * 1
		}
	}
	sprite_index = spr_special
}

//allow player to stand on boxes
move_and_collide(xsp, ysp, obj_platform)