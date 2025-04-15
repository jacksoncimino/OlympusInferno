//create gravity to handle jumps
ysp += 0.3

//move right or left when arrow key is pressed
var _rightkey = keyboard_check(move_right_key)
var _leftkey = keyboard_check(move_left_key) 
var _move = _rightkey - _leftkey


if (player_state == player_states.NONE || player_state == player_states.LIGHT_ATTACK || player_state == player_states.HEAVY_ATTACK) {
	if (_move == 1) xsp = min(max_spd, xsp + acceleration); //accelerate going right
    if (_move == -1) xsp = max(-max_spd, xsp - acceleration); //accelerate going left
	if (_move == 0) {
		if (xsp > 0) xsp = max(0, xsp - frict); //friction going right
		if (xsp < 0) xsp = min(0, xsp + frict); //friction going left
		if (player_state != player_states.LIGHT_ATTACK and player_state != player_states.HEAVY_ATTACK) {sprite_index = spr_basic}
	} else {
		if (player_state != player_states.LIGHT_ATTACK and player_state != player_states.HEAVY_ATTACK ) {sprite_index = spr_move}
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
	
	var hitBox = instance_create_layer(x + hb_startX, y + hb_startY, "Instances", obj_attack_hitbox)
	hitBox.x1 = rect_x1
	hitBox.x2 = rect_x2
	hitBox.y1 = rect_y1
	hitBox.y2 = rect_y2
	hitBox.attacker = id
	if(sprite_index == spr_attack) {hitBox.attack_type = "light"}
	else {hitBox.attack_type = "heavy"}
}

//heavy attack hitbox
if (player_state == player_states.HEAVY_ATTACK || sprite_index == spr_heavy_attack ) 
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

//respawn
if(y > room_height + 500) {
	life -= 1
	if(life > 0) {
		x = startX
		y = startY
		hp = 0
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
if( keyboard_check(dodge_key)) {
	if ( dodge_current > 0 ) {	
		if (keyboard_check(move_right_key) || keyboard_check(move_left_key) ) {
			dodge_current--
			player_state = player_states.DODGING
			var _right = keyboard_check(vk_right)
			var _left = keyboard_check(vk_left) 
			var _moveDodge = _right - _left
			sprite_index = spr_dodge
			xsp = _move * max_spd * 4
		} else if (keyboard_check(down_key)) {
			dodge_current--
			player_state = player_states.PARRYING
			sprite_index = spr_parry
		}
		//length of dodge/parry
		alarm[1] = 12
	}
}

//attack
if (keyboard_check(quick_attack_key) and on_wall == false) {
	if(player_state != player_states.LIGHT_ATTACK) {
		if(combo_active) {sprite_index = spr_attack2}
		else {sprite_index = spr_attack}
		
		image_index = 0
		player_state = player_states.LIGHT_ATTACK
	}
}

//heavy attack
if (keyboard_check(heavy_attack_key) and on_wall == false) {
	if(player_state != player_states.HEAVY_ATTACK) {
		sprite_index = spr_heavy_attack
		image_index = 0
		player_state = player_states.HEAVY_ATTACK
	}
}

//special attack
if( keyboard_check(special_attack_key)) {
	if(special_meter > attacks_needed) {
		special_meter = 0
		
		
		if (name == "Zeus"){
			var _bolt = instance_create_layer(x, y, "Instances", obj_lightning_bolt)
			_bolt.speed = _bolt.spd
			_bolt.attacker = object_index
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
			if (image_xscale == 1) {
				_fireball.direction = point_direction(x, y, x+1, y)
			} else {
				_fireball.image_xscale = -0.25
				_fireball.direction = point_direction(x, y, x-1, y)
			}
		}
	}
}

//allow player to stand on boxes
move_and_collide(xsp, ysp, obj_platform)