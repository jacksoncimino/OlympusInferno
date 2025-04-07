//create gravity to handle jumps
ysp += 0.3

//move right or left when arrow key is pressed
var _rightkey = keyboard_check(vk_right)
var _leftkey = keyboard_check(vk_left) 
var _move = _rightkey - _leftkey


if (global.player_state == player_states.NONE || global.player_state == player_states.LIGHT_ATTACK) {
	if (_move == 1) xsp = min(max_spd, xsp + acceleration); //accelerate going right
    if (_move == -1) xsp = max(-max_spd, xsp - acceleration); //accelerate going left
	if (_move == 0) {
		if (xsp > 0) xsp = max(0, xsp - frict); //friction going right
		if (xsp < 0) xsp = min(0, xsp + frict); //friction going left
		if (global.player_state != player_states.LIGHT_ATTACK) {sprite_index = spr_basic}
	} else {
		if (global.player_state != player_states.LIGHT_ATTACK) {sprite_index = spr_move}
		image_xscale = _move
	}
}

if (global.player_state == player_states.LIGHT_ATTACK || sprite_index == spr_attack ) {
	//create hitbox for attack
	var hb_startX = 0
	var hb_startY = 0
	var rect_x1 = 0
	var rect_x2 = 0
	var rect_y1 = 0
	var rect_y2 = 0
	
	if(image_xscale == 1) {
		hb_startX = 15
		hb_startY = 0
		rect_x1 = 0
		rect_x2 = 30
		rect_y1 = 10
		rect_y2 = -10
	}
	
	if (image_xscale == -1) {
		hb_startX = -15
		hb_startY = 0
		rect_x1 = 0
		rect_x2 = -30
		rect_y1 = 10
		rect_y2 = -10
	}
	
	var hitBox = instance_create_layer(x + hb_startX, y + hb_startY, "Instances", obj_attack_hitbox)
	hitBox.x1 = rect_x1
	hitBox.x2 = rect_x2
	hitBox.y1 = rect_y1
	hitBox.y2 = rect_y2
	hitBox.attacker = object_index
	
	if (image_index >= sprite_get_number(spr_attack)) { //#frames in sprite
		global.player_state = player_states.NONE
	}
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
	x = startX
	y = startY
}

//combat
if(isHit) {
	if (alarm[3] == -1) {
		alarm[3] = game_get_speed(gamespeed_fps) * 0.7
		image_blend = c_red
	}
}

//allow player to stand on boxes
move_and_collide(xsp, ysp, obj_platform)