other.dmg += 10
if (direction == 0) {instance_create_layer(x + other.sprite_width/2, y, "Instances", obj_lightning_strike)}
else {instance_create_layer(x - other.sprite_width/2, y, "Instances", obj_lightning_strike)}
instance_destroy()