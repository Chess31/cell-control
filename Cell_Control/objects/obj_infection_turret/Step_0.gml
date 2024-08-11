if (global.frozen = true) {
	exit;
}

// Inherit the parent event
event_inherited();

if (distance_to_object(obj_player) < player_sight_range) {
	shot_cooldown--;
	
	//point towards the player
	var _angle = point_direction(x,y,obj_player.x, obj_player.y);
	image_angle = _angle - 90;
	
	if (shot_cooldown <= 0) {
		
		// Create a bullet object
		var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);

		// Set the bullet's direction and speed towards the player
		bullet.direction = point_direction(x, y, obj_player.x, obj_player.y);
		bullet.speed = 9; // Adjust the bullet speed as needed
		bullet.my_speed = bullet.speed;
		bullet.bcolor = c_green;

		// Reset the shoot cooldown
		shot_cooldown = shot_interval;
	}
}