//Movement
moveTimer -= 1;

if (moveTimer <= 0) {
	// Reset the timer and choose a new direction
	moveTimer = irandom_range(room_speed/3, room_speed); // Random time between 1 and 3 seconds
    
	//Either the new direction will be towards the player or a different direction
	if (!random(3) == 0) {
		// Move towards the player
		direction = point_direction(x, y, obj_player.x, obj_player.y) + random_range(-15,15);
	} else {
		// Set a random direction
		direction = random(360);
	}
}

// Move the enemy
motion_set(direction, enemySpeed);
move_bounce_solid(true);

//Weapons
shootCooldown -= 1;

if (shootCooldown <= 0 && instance_exists(obj_player)) {
	// Create a bullet object
	var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);

	// Set the bullet's direction and speed towards the player
	bullet.direction = point_direction(x, y, obj_player.x, obj_player.y);
	bullet.speed = 6; // Adjust the bullet speed as needed
	bullet.bcolor = c_red;

	// Reset the shoot cooldown
	shootCooldown = 150 + random(200); // Adjust the time between shots
}


//grab health and iFrame system from parent
event_inherited();