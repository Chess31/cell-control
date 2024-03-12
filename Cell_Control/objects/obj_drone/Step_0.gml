switch (status) {
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
			status = "returning"
		}
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
    default:
        // code here
        break;
}