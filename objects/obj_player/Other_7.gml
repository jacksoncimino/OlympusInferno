if(sprite_index == spr_attack) {
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
}