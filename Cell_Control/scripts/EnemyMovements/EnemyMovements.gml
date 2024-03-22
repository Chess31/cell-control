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

				// Move the enemy
				motion_set(direction, enemySpeed);
				move_bounce_solid(true);
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

				// Move the enemy
				motion_set(direction, enemySpeed);
				move_bounce_solid(true);
			break;
		
		case "Green":
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
			break;
		
		case "Purple":
				// Teleportation
				if (moveTimer <= 0) {
				    TeleportToRandomEnemy()
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

				// Move the enemy
				motion_set(direction, enemySpeed);
				move_bounce_solid(true);
			break;
		
		default:
			//Move like the red enemy by default
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

				// Move the enemy
				motion_set(direction, enemySpeed);
				move_bounce_solid(true);
			break;
	}
}