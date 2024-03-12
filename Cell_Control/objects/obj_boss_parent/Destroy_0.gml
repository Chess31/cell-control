//drop weapon tokens
for (var i = 0; i < irandom_range(10,20); i++){
	instance_create_layer(x + irandom_range(-200, 200), y + irandom_range(-200, 200), "Instances", obj_weapon_token);
}