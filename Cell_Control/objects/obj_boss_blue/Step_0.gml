//Attacks:

// Wave Attack
if (wave_attack_cooldown <= 0) {
    // Shoot a wave of bullets
	var _wave_spread = 35; //angle of the wave attack
    var bulletSpeed = 10; // Set the speed of the bullets
    var bulletDamage = 3; // Set the damage value of the bullets
    var totalBullets = 20; // Set the total number of bullets in the wave
    var attackDirection = point_direction(x, y, obj_player.x, obj_player.y) - (_wave_spread/2);
	
	//if (canshoot = true) {
		
	    for (var i = 0; i < totalBullets; i++) {
			alarm[0] = 5;
			canshoot = false;
	        var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);
	        // Set bullet properties such as speed, damage, direction, etc.
	        bullet.speed = bulletSpeed + random_range(-1.2,1.2);
	        bullet.damage = bulletDamage;
			var _wave_adjustment = ((_wave_spread + random_range(-10,10)) - (i * (_wave_spread/totalBullets)));
	        bullet.direction = attackDirection + _wave_adjustment;
	        bullet.image_angle = attackDirection + _wave_adjustment;
	    }
	//}
    // Reset the cooldown
    wave_attack_cooldown = room_speed * 5;
} else {
    wave_attack_cooldown--;
}