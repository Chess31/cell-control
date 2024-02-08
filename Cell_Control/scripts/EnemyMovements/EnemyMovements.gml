function EnemyMovements(){
	switch (enemyType){
		case "Red":
				// Random movement timer
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

				// Calculate movement based on the current direction
				var moveX = lengthdir_x(enemySpeed, direction);
				var moveY = lengthdir_y(enemySpeed, direction);

				// Check for collisions with walls
				if (!place_meeting(x + moveX, y + moveY, obj_building)) {
				    // Move the enemy
				    x += moveX;
				    y += moveY;
				} else {
				    // If there's a collision with a wall, choose a new direction
				    direction += 180 + random_range(-30,30);
				}
			break;
	
		case "Blue":
			// Random movement timer
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

				// Calculate movement based on the current direction
				var moveX = lengthdir_x(enemySpeed, direction);
				var moveY = lengthdir_y(enemySpeed, direction);

				// Check for collisions with walls
				if (!place_meeting(x + moveX, y + moveY, obj_building)) {
				    // Move the enemy
				    x += moveX;
				    y += moveY;
				} else {
				    // If there's a collision with a wall, choose a new direction
				    direction += 180 + random_range(-30,30);
				}
			break;
		
		case "Green":
				// Check if there are buildings in the room
				if (instance_number(obj_building) > 0) {
				    // Find the nearest building
				    var nearestBuilding = instance_nearest(x, y, obj_building);

				    // Move towards the nearest building
				    var directionToBuilding = point_direction(x, y, nearestBuilding.x, nearestBuilding.y);
				    var moveX = lengthdir_x(enemySpeed, directionToBuilding);
				    var moveY = lengthdir_y(enemySpeed, directionToBuilding);

				    // Move towards the building
				    x += moveX;
				    y += moveY;
				}
			break;
		
		case "Purple":
				// Check if it's time to teleport
				if (moveTimer <= 0) {
					var _target = instance_find(obj_enemy, irandom(instance_number(obj_enemy)-1))
				    // Teleport to a random location around the player
				    var teleportDistance = 30; // Adjust the teleport distance as needed
				    var teleportAngle = random(360); // Choose a random angle
				    var teleportX = _target.x + lengthdir_x(teleportDistance, teleportAngle);
				    var teleportY = _target.y + lengthdir_y(teleportDistance, teleportAngle);

				    // Teleport the enemy
				    x = teleportX;
				    y = teleportY;

				    // Reset the teleportation cooldown
				    moveTimer = room_speed * 2;
				} else {
				    // Decrement the teleportation timer
				    moveTimer--;
				}
			break;
		
		case "Yellow":
				// Random movement timer
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

				// Calculate movement based on the current direction
				var moveX = lengthdir_x(enemySpeed, direction);
				var moveY = lengthdir_y(enemySpeed, direction);

				// Check for collisions with walls
				if (!place_meeting(x + moveX, y + moveY, obj_building)) {
				    // Move the enemy
				    x += moveX;
				    y += moveY;
				} else {
				    // If there's a collision with a wall, choose a new direction
				    direction += 180 + random_range(-30,30);
				}
			break;
		
		default:
			//default code
			break;
	}
}