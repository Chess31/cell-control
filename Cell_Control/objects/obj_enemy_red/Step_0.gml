if (global.frozen = true) {
	speed = 0;
	exit;
} else {
	speed = enemySpeed;
}

//Movement
moveTimer--;

if (moveTimer <= 0) {
	// Reset the timer and choose a new direction
	moveTimer = irandom_range(10,30); //Random time between 1 and 3 seconds
	
	//Either the new direction will be towards the player or a different direction
	if (!random(3) == 0) {
		// Move towards the player
		direction = point_direction(x, y, target.x, target.y) + random_range(-15,15);
		//motion_set(direction, enemySpeed * _speed_multiplier);
	} else {
		// Set a random direction
		direction = random(360);
		//motion_set(direction, enemySpeed * _speed_multiplier);
	}
}

var _distance_to_target = point_distance(x, y, target.x, target.y);

if (_distance_to_target < ideal_range) {
	var _speed_multiplier = -1.0; //move backwards
} else {
	var _speed_multiplier = 1.0; //move forwards
}

motion_set(direction, enemySpeed * _speed_multiplier);
move_bounce_solid(true);
image_angle = point_direction(x, y, target.x, target.y) - 90;

//Weapons
shootCooldown -= 1;

if (shootCooldown <= 0 && instance_exists(target)) {
	// Create a bullet object
	var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);

	// Set the bullet's direction and speed towards the player
	bullet.direction = point_direction(x, y, target.x, target.y);
	bullet.speed = 6; // Adjust the bullet speed as needed
	bullet.my_speed = bullet.speed;
	bullet.bcolor = c_red;

	// Reset the shoot cooldown
	shootCooldown = 150 + random(200); // Adjust the time between shots
}

//grab health and iFrame system from parent
event_inherited();