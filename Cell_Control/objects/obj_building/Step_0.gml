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
	buildingHealth -= enemyBullet.damage;
	if (enemyBullet.piercing = false) {instance_destroy(enemyBullet)};
}

//Building Health Check
if (buildingHealth <= 0)
{
	instance_destroy();
	//remove it from the total building count
	ds_list_replace(global.buildingCount, index, ds_list_find_value(global.buildingCount, index) - 1);
}

// Add custom behavior based on building type
//mask_index = ds_list_find_value(global.buildingSprites, global.currentBuildingIndex); ???
switch (type) {
    case "Wall":
		//add special abilities here
        break;

    case "Forge":
        // periodically spawn a collectible
        if (random(120) < 1) { // % chance every step
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
					["20 Health",tenHealth],
					["Increase Max Buildings",increaseMaxBuild]
					//["Increase Max Buildings",increaseMaxBuild]
				],
				"Select Upgrade"
			);
        }
		//instance find is the way to delete this building from the menu probably
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
		            buildingHealth = 0; // Destroy the proximity mine

		            //damage enemies and buildings in the destroy event

		            // Break the loop since the explosion has occurred
		            break;
		        }
		    }
		}
        break;

	case "Feeder":
		//once kill count has been reached:
		if (enemies_defeated >= global.enemy_kill_goal){
			global.feeder_active = false;
			//killing this building with damage causes two loot drops to happen (maybe not anymore, becuase of the increasing kill recquiremnt
			instance_destroy();
			//remove it from the total building count
			ds_list_replace(global.buildingCount, index, ds_list_find_value(global.buildingCount, index) - 1);
			global.enemy_kill_goal += 10;
			
			if (!instance_exists(obj_coreGate)){
			//spawn a portal math
			var spawnX, spawnY;
			// Determine whether to spawn on the horizontal or vertical edge
			if (irandom(1) == 1) {
			    // Spawn on the left or right edge
			    spawnX = choose(0, room_width);
			    spawnY = random(room_height);
			} else {
			    // Spawn on the top or bottom edge
			    spawnX = random(room_width);
			    spawnY = choose(0, room_height);
			}

		    // Create the gate and weapon drop
		    var _target = instance_create_layer(spawnX, spawnY, "Instances", obj_coreGate);
			var _particle = instance_create_layer(x, y, "Instances", obj_particle);
			_particle.target = _target;
			}
			instance_create_layer(x + irandom_range(-100, 100), y + irandom_range(-100, 100), "Instances", obj_shiftUnlock);
		}
        break;
	
	case "Crafter":
		
		break;
		
    // Add more cases for other building types if needed

    default:
        // Default behavior (if type is not recognized)
        break;
}