if (global.frozen = true) {
	speed = 0;
	exit;
} else {
	speed = enemySpeed;
}

//Movement
// Check if there are buildings in the room
if (instance_exists(obj_building)) {
	// Find the nearest building
	var nearestBuilding = instance_nearest(x, y, obj_building);

	target = nearestBuilding;

	//Assing Direction
	if (moveTimer <= 0){
	direction = point_direction(x, y, target.x, target.y);
	moveTimer = room_speed/6;
	} else {
		moveTimer--;
	}
	
	//Assign Speed
	var _distance_to_target = point_distance(target.x,target.y,x,y);
	
	if (_distance_to_target > ideal_range) {
		var moveX = lengthdir_x(speed, direction);
		var moveY = lengthdir_y(speed, direction);

		// Move towards the building
		x += moveX;
		y += moveY;
	} else {
		speed = 0;
	}
}

//Weapons
shootCooldown -= 1;
				
if (shootCooldown <= 0 && instance_exists(obj_building)) {
	var _distance_to_target = point_distance(target.x,target.y,x,y);
	// Check if the green enemy is touching the building
	if (_distance_to_target <= ideal_range) {
		// Damage target
		target.buildingHealth -= 1;		
		//Spawn particles
		SparkParticles();
	}
	shootCooldown = 50;
}

//grab health and iFrame system from parent
event_inherited();