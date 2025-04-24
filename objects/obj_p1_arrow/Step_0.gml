if(player.x > (room_width / 2) + 100) {
	x = (room_width) - ((sprite_width * image_xscale) * 2)
	if(dir == -1) {
		dir = 1
		image_xscale *= -1
	}
}

else if(player.x < (room_width / 2) - 100) {
	x = (sprite_width * image_xscale) * 2
	if(dir == 1) {
		dir = -1
		image_xscale *= -1
	}
}

if(player.x < 0) {
	visible = true
} else if (player.x > room_width) {
	visible = true	
} else {
	visible = false	
}

y = player.y