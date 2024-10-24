//drop weapon tokens
for (var i = 0; i < irandom_range(10,20); i++){
	instance_create_layer(x + irandom_range(-120, 120), y + irandom_range(-120, 120), "Instances", obj_weapon_token);
}

//explode
for (var i = 0; i < 10; i++){
	x += irandom_range(-50,50);
	y += irandom_range(-50,50);
	SparkParticles();
}