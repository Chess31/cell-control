if (instance_exists(obj_boss_blue)){
	with (obj_boss_blue){
		var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);
		// Set bullet properties such as speed, damage, direction, etc.
		bullet.speed = bulletSpeed + random_range(-1.2,1.2);
		bullet.damage = bulletDamage;
		var _wave_adjustment = ((_wave_spread + random_range(-10,10)) - (timeline_position * (_wave_spread/totalBullets)));
		bullet.direction = attackDirection + _wave_adjustment;
		bullet.image_angle = attackDirection + _wave_adjustment;
	}
}