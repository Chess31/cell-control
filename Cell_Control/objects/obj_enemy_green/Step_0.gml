//Movement
// Check if there are buildings in the room
if (instance_number(obj_building) > 0) {
	// Find the nearest building
	var nearestBuilding = instance_nearest(x, y, obj_building);

	// Move towards the nearest building
	if (moveTimer <= 0){
	direction = point_direction(x, y, nearestBuilding.x, nearestBuilding.y);
	moveTimer = room_speed/6;
	} else {
		moveTimer--;
	}
					
	var moveX = lengthdir_x(enemySpeed, direction);
	var moveY = lengthdir_y(enemySpeed, direction);

	// Move towards the building
	x += moveX;
	y += moveY;
}

//Weapons
shootCooldown -= 1;
				
if (shootCooldown <= 0 && instance_exists(obj_building)) {
	// Find the nearest building
	var nearestBuilding = instance_nearest(x, y, obj_building);

	// Check if the green enemy is touching the building
	if (place_meeting(x, y, obj_building)) {
		// Damage the building (adjust the damage value as needed)
		nearestBuilding.buildingHealth -= 1; // Adjust the damage amount
						
		//spawn particles
		SparkParticles();
	}
	shootCooldown = 50;
}

//grab health and iFrame system from parent
event_inherited();