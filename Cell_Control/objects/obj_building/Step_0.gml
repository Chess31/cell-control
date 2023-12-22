// Check for collisions with player bullets
var playerBullet = instance_place(x, y, obj_bullet);
if (playerBullet != noone) and (type != "Turret"){
    // Destroy the player bullet
    instance_destroy(playerBullet);
}

// Check for collisions with enemy bullets
var enemyBullet = instance_place(x, y, obj_enemy_bullet); //if an enemy bullet is on our x and y
if (enemyBullet != noone) {
    // Destroy the enemy bullet
    instance_destroy(enemyBullet);
	buildingHealth -= 1;
}

//Building Health Check
if (buildingHealth <= 0)
{
	instance_destroy();
}

// Add custom behavior based on building type
switch (type) {
    case "Wall":
        // Wall-specific behavior
        // For example, walls might not do anything special in the Step Event
        break;

    case "Forge":
        // periodically spawn a collectible
        if (random(125) < 1) { // % chance every step
            // Spawn Collectible
            instance_create_layer(x + lengthdir_x(50, random(360)), y + lengthdir_y(50, random(360)), "Collectibles", obj_collectible);
        }
		image_angle++;
        break;

    case "Turret":
        // turret-specific behavior
        var nearestEnemy = instance_nearest(x, y, obj_enemy);
		if (fireTimer <= 0) {
	        if (nearestEnemy != noone && point_distance(x, y, nearestEnemy.x, nearestEnemy.y) < maxDetectionRange) {
	            // Shoot a bullet at the nearest enemy
	            var directionToEnemy = point_direction(x, y, nearestEnemy.x, nearestEnemy.y);
	            var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
				// Set the bullet's direction and speed
				bullet.direction = directionToEnemy;
				bullet.speed = turretBulletSpeed;
				//point sprite towards enemy
				image_angle = point_direction(x, y, nearestEnemy.x, nearestEnemy.y) + 90;
	        }
			// Reset the firing rate timer
            fireTimer = firingRate;
		}
		// Update the firing rate timer
        fireTimer -= 1;
        break;

	case "Upgrader":
        // Upgrader-specific behavior
        var playerDistance = point_distance(x, y, obj_player.x, obj_player.y);

        // Check if the player is within the interaction range
        playerInRange = (playerDistance < interactionRange);

        // Check for opening the menu
        if (playerInRange && keyboard_check_pressed(ord("F"))) {
            //spawn menu with shop options
			MenuCreate(x, y - 200,
				[
					["10 Health",tenHealth],
					["Weapon Tier",-1],
					["Building Tier",-1]
				],
				"Select Upgrade"
			);
        }
        break;

	case "Proximity Mine":
		// Get the total number of instances of obj_enemy
		var totalEnemies = instance_number(obj_enemy);

		// Rotate the mine during the priming phase
		if (!primed) {
		    //set image speed
			image_speed = 0;
			
			// Rotate 45 degrees clockwise
		    rotationAngle += rotationSpeed;
			
			//spin while being primed
			image_angle += rotationSpeed;
			
		    // Check if the rotation is complete
		    if (rotationAngle >= 45) {
		        rotationAngle = 45; // Ensure the rotation doesn't exceed 45 degrees
		        primed = true; // Set the mine as primed
		    }
		}

		// Check for nearby enemies and trigger explosion if primed
		if (primed) {
		    //set image speed
			image_speed = 1;
			
			for (var i = 0; i < totalEnemies; i++) {
		        //find all enemies
				var enemyInstance = instance_find(obj_enemy, i);

		        // Calculate the distance to the enemy
		        var distanceToEnemy = point_distance(x, y, enemyInstance.x, enemyInstance.y);

		        // Check if the enemy is within the explosion radius
		        if (distanceToEnemy <= explosionRadius) {
		            SparkParticles();// Trigger the explosion
		            instance_destroy(); // Destroy the proximity mine

		            // Damage all buildings within the explosion radius
		            for (var j = 0; j < instance_number(obj_building); j++) {
		                var buildingInstance = instance_find(obj_building, j);
		                if (point_distance(buildingInstance.x, buildingInstance.y, x, y) <= explosionRadius) {
		                    buildingInstance.buildingHealth -= 10; // Adjust the damage as needed
		                }
		            }

		            // Damage all enemies within the explosion radius
		            for (var k = 0; k < totalEnemies; k++) {
		                var damagedEnemy = instance_find(obj_enemy, k);
		                if (point_distance(damagedEnemy.x, damagedEnemy.y, x, y) <= explosionRadius) {
		                    damagedEnemy.enemyHealth -= 10; // Adjust the damage as needed
		                }
		            }

		            // Break the loop since the explosion has occurred
		            break;
		        }
		    }
		}
        break;

    // Add more cases for other building types if needed

    default:
        // Default behavior (if type is not recognized)
        break;
}