if (global.frozen = true) {
	exit;
}

// Check for collisions with player bullets
var playerBullet = instance_place(x, y, obj_bullet);
if (playerBullet != noone) and (type != "Turret"){
    // Destroy the player bullet
    instance_destroy(playerBullet);
}

//Building Health Check
if (buildingHealth <= 0)
{
	instance_destroy();
	//remove it from the total building count
	ds_list_replace(global.buildingCount, index, ds_list_find_value(global.buildingCount, index) - 1);
}

// Add custom behavior based on building type
switch (type) {
	case "Destroy Nearest":
		//remove nearest building and drop some ammo
		var _destroy_me = instance_place(x,y, obj_building);
		if (_destroy_me != noone){
			with(_destroy_me){buildingHealth -= 1000000;}//ds_list_find_value(global.buildingHealths, _destroy_me.index)};
			buildingHealth -= 10;
			
			// Drop a random number of items from the loot pool
			var numberOfItems = irandom_range(1, 5);
			for (var i = 0; i < numberOfItems; i++) {
			    instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", obj_collectible);
			}
		} else {
			buildingHealth -= 10;
		}
		break;
	
    case "Wall":
		//add special abilities here
        break;

    case "Forge":
        // periodically spawn a collectible
        if (random(110) < 1) { // % chance every step
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
				bullet.my_speed = bullet.speed;
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
			mainUpgraderOptions();
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
			
			//increment feeder variables
			global.enemy_kill_goal += 10;
			global.feeders_complete ++;
			
			//drop weapon tokens
			for (var i = 0; i < irandom_range(5,15); i++){
				instance_create_layer(x + irandom_range(-120, 120), y + irandom_range(-120, 120), "Instances", obj_weapon_token);
			}
		}
        break;
		
    // Add more cases for other building types if needed
	case "Hive":
		if (my_drones < max_drones){
			var _new_drone = instance_create_layer(x,y,"Instances",obj_drone)
			_new_drone.home = id;
			_new_drone.state = drone_mode;
			_new_drone.capacity = my_drone_capacity;
			//fill drone from reserves if not collecting
			if (drone_mode != "collecting") && (ammo >= my_drone_capacity){
				ammo -= my_drone_capacity;
				_new_drone.current_collection = my_drone_capacity;
			}
			my_drones++;
		}

		var distanceToPlayer = point_distance(x, y, obj_player.x, obj_player.y);

		if (distanceToPlayer <= interactionRange) {
			playerInRange = true;
		    image_index = 1;
		} else {
			playerInRange = false;
			image_index = 0;
		}

		if (playerInRange = true) and (keyboard_check_pressed(ord("F"))){
			global.hiveInActiveMenu = id;
			hive_options_menu();
		}
		break;

    default:
        // Default behavior (if type is not recognized)
        break;
}