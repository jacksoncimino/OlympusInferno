//create gravity to handle jumps
ysp += 0.3

//move right or left when arrow key is pressed
var _rightkey = keyboard_check(vk_right)
var _leftkey = keyboard_check(vk_left) 
var _move = _rightkey - _leftkey


if (global.player_state == player_states.NONE) {
	if (_move == 1) xsp = min(max_spd, xsp + acceleration); //accelerate going right
    if (_move == -1) xsp = max(-max_spd, xsp - acceleration); //accelerate going left
	if (_move == 0) {
		if (xsp > 0) xsp = max(0, xsp - frict); //friction going right
		if (xsp < 0) xsp = min(0, xsp + frict); //friction going left
		sprite_index = spr_basic
	} else {
		sprite_index = spr_move
		image_xscale = _move
	}
}

if (global.player_state == player_states.ATTACKING || sprite_index == spr_attack ) {
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

//allow player to stand on boxes
move_and_collide(xsp, ysp, obj_platform)