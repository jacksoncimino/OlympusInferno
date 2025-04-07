/// @description special attack

if(special_meter > attacks_needed) {
	special_meter = 0
	var _bolt = instance_create_layer(x, y, "Instances", obj_lightning_bolt)
	_bolt.speed = _bolt.spd
	if (image_xscale == 1) {
		_bolt.direction = point_direction(x, y, x+1, y)
	} else {
		_bolt.direction = point_direction(x, y, x-1, y)
	}
}