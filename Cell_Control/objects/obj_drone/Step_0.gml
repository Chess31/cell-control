if (global.frozen = true) {
	exit;
}

switch (state) {
    case "collecting":
        // Move towards nearby collectibles
	    var collectible = instance_nearest(x, y, obj_collectible);
	    if (collectible != noone) {
	        // Move towards the collectible
	        direction = point_direction(x, y, collectible.x, collectible.y);
	        speed = 5;
	    }
	    // Check for collision with collectibles
	    if (place_meeting(x, y, obj_collectible)) {
	        // Collect the ammo/energy
	        current_collection++;
	        instance_destroy(collectible);
	    }
		//check if the drone is full
		if (current_collection >= capacity){
			current_collection = capacity;
			state = "returning"
		}
		//Check is home was destoryed
		if (!instance_exists(home)){
			instance_destroy();
		}
        break;
		
	case "returning":
		// Return to the Hive once capacity is reached
	    if (instance_exists(home)) {
	        direction = point_direction(x, y, home.x, home.y);
	        speed = 4;
	        // Check if the drone has reached the Hive
	        if (point_distance(x, y, home.x, home.y) < 5) {
	            instance_destroy(); // Destroy the drone so a new one can be made by the hive
				//add the drone's collection to the hive
				with(home){
					ammo += other.current_collection;
					my_drones--;
				}
	        }
	    } else {
			instance_destroy();
		}
        break;

	case "healing":
		if (current_collection > 0){
			// Shoot logic
	        var nearestEnemy = instance_nearest(x, y, obj_building);
			if (fireTimer <= 0) && (nearestEnemy.buildingHealth < ds_list_find_value(global.buildingHealths, nearestEnemy.index)){
		        if (nearestEnemy != noone && point_distance(x, y, nearestEnemy.x, nearestEnemy.y) < maxDetectionRange) {
		            // Shoot a bullet at the nearest enemy
		            var directionToEnemy = point_direction(x, y, nearestEnemy.x, nearestEnemy.y);
		            var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);
					// Set the bullet's direction and speed
					bullet.direction = directionToEnemy;
					bullet.speed = 6;
					bullet.my_speed = bullet.speed;
					bullet.damage = -1; //negative so it heals buildings and also players if you use it right I guess
					//point sprite towards target
					image_angle = point_direction(x, y, nearestEnemy.x, nearestEnemy.y) + 90;
					//subtract the bullet from the ammo reserve
					current_collection--;
		        }
				// Reset the firing rate timer
	            fireTimer = firingRate;
			}
			// Update the firing rate timer
	        fireTimer--;
			
			//Move Logic
			// Set the radius of the circular path
			var _radius = 300;

			// Get the position of the hive
			if (instance_exists(home)){
				var _hive_x = home.x;
				var _hive_y = home.y;
				
				// Calculate the angle for the circular movement
				var _angle = point_direction(_hive_x, _hive_y, x, y) + 0.5;

				// Calculate the new position
				var _new_x = _hive_x + lengthdir_x(_radius, _angle);
				var _new_y = _hive_y + lengthdir_y(_radius, _angle);

				// Move the drone to the new position
				x = _new_x;
				y = _new_y;

				// Rotate the drone towards the hive
				direction = point_direction(x, y, _hive_x, _hive_y);
			}
		} else {
			state = "returning";
		}
        break;
		
	case "attacking":
		if (current_collection > 0){
			// Shoot logic
	        var nearestEnemy = instance_nearest(x, y, obj_enemy);
			if (fireTimer <= 0) {
		        if (nearestEnemy != noone && point_distance(x, y, nearestEnemy.x, nearestEnemy.y) < maxDetectionRange) {
		            // Shoot a bullet at the nearest enemy
		            var directionToEnemy = point_direction(x, y, nearestEnemy.x, nearestEnemy.y);
		            var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
					// Set the bullet's direction and speed
					bullet.direction = directionToEnemy;
					bullet.speed = 6;
					bullet.my_speed = bullet.speed;
					//point sprite towards enemy
					image_angle = point_direction(x, y, nearestEnemy.x, nearestEnemy.y) + 90;
					//subtract the bullet from the ammo reserve
					current_collection--;
		        }
				// Reset the firing rate timer
	            fireTimer = firingRate;
			}
			// Update the firing rate timer
	        fireTimer--;
			
			//Move Logic
			// Set the radius of the circular path
			var _radius = 300;

			// Get the position of the hive
			if (instance_exists(home)){
				var _hive_x = home.x;
				var _hive_y = home.y;
				
				// Calculate the angle for the circular movement
				var _angle = point_direction(_hive_x, _hive_y, x, y) + 0.5;

				// Calculate the new position
				var _new_x = _hive_x + lengthdir_x(_radius, _angle);
				var _new_y = _hive_y + lengthdir_y(_radius, _angle);

				// Move the drone to the new position
				x = _new_x;
				y = _new_y;

				// Rotate the drone towards the hive
				direction = point_direction(x, y, _hive_x, _hive_y);
			}
		} else {
			state = "returning";
		}
        break;
		
    default:
        // code here
        break;
}