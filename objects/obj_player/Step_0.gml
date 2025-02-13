//create gravity to handle jumps
ysp += 0.3
xsp = 0

//move right or left when arrow key is pressed
if keyboard_check(vk_right) {
	xsp = +5
}
if keyboard_check(vk_left) {
	xsp = -5
}

//reset jumps
if place_meeting(x, y+ysp, obj_platform) {
	if (ysp > 0) {
        jump_current = jump_number;
    }
    ysp = 0;
}

//allow player to stand on boxes
move_and_collide(xsp, ysp, obj_platform)