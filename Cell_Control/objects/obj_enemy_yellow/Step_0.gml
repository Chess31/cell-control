if (global.frozen = true) {
	speed = 0;
	exit;
} else {
	speed = enemySpeed;
}

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
	// Calculate the direction to the player
	var directionToPlayer = point_direction(x, y, obj_player.x, obj_player.y);

	// Set up the bullet spread parameters
	var spreadAngle = 60;
	var numBullets = 6;

	// Loop through the number of bullets to create
	for (var i = 0; i < numBullets; i++) {
		// Calculate the adjusted direction for each bullet in the spread
		var adjustedDirection = directionToPlayer + (i - (numBullets - 1) / 2) * spreadAngle;

		// Create a bullet
		var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);

		// Set the bullet's direction
		bullet.direction = adjustedDirection;
		bullet.speed = 3;
		bullet.my_speed = bullet.speed;
		bullet.bcolor = c_yellow;
	}
	// Reset the shoot cooldown
	shootCooldown = 200 + random(300); // Adjust the time between shots
}

//grab health and iFrame system from parent
event_inherited();