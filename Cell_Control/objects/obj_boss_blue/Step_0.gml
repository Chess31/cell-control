//Attacks:

// Wave Attack
if (wave_attack_cooldown <= 0) {	
	global.tl = timeline_add();
	//set the direction this attack will be in
	attackDirection = point_direction(x, y, obj_player.x, obj_player.y) - (_wave_spread/2);

	for (var i = 0; i < totalBullets; i++) {
		
		var _f = function create_wave_bullet(){
			global.current_bullet++;
			if (global.current_bullet = totalBullets){alarm[0] = bullet_spacing * totalBullets}
			
			var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);
			// Set bullet properties such as speed, damage, direction, etc.
			bullet.speed = bulletSpeed + random_range(-0.5,0.5);
			bullet.damage = bulletDamage;
			var _wave_adjustment = ((_wave_spread + random_range(-10,10)) - (global.current_bullet * (_wave_spread/totalBullets)));
			bullet.direction = attackDirection + _wave_adjustment;
			bullet.image_angle = attackDirection + _wave_adjustment;
		}
		
		timeline_index = global.tl;
		timeline_running = true;
		timeline_loop = false;
		timeline_moment_add_script(global.tl, i * bullet_spacing, _f);
		
	}
    // Reset the cooldown
    wave_attack_cooldown = room_speed * 5;
	global.current_bullet = 0;
} else {
    wave_attack_cooldown--;
}

//Big attack

if (big_attack_cooldown <= 0) {	
	attackDirection = point_direction(x, y, obj_player.x, obj_player.y);

	var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);
	// Set bullet properties such as speed, damage, direction, etc.
	bullet.speed = 3;
	bullet.damage = 2000;
	bullet.direction = attackDirection;
	bullet.image_angle = attackDirection;
	//bullet.image_xscale = 5;
	//bullet.image_yscale = 5;
	bullet.big = true;
	bullet.piercing = true;
	
    big_attack_cooldown = room_speed * 5;
} else {
    big_attack_cooldown--;
}





// Inherit the parent event
event_inherited();