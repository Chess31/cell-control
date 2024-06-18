if (global.frozen = true) {
	exit;
}

//Age the instance
life -= 1;

//Set up force variables
var gravityRadius = 200;
var gravityStrength = 10;

displayRadius = gravityRadius;

//// Loop through all instances of obj_enemy and pull them
//with (obj_enemy) {
//    // Calculate distance between enemy and gravity grenade
//    var dist = point_distance(x, y, other.x, other.y);
    
//    // Check if the enemy is within the gravity radius
//    if (dist < gravityRadius) {
//        // Calculate direction towards the gravity grenade
//        var dir = point_direction(x, y, other.x, other.y);
        
//        // Apply gravitational force
//        var forceX = lengthdir_x(gravityStrength / dist, dir);
//        var forceY = lengthdir_y(gravityStrength / dist, dir);
        
//        // Apply the force to the enemy
//        x += forceX;
//        y += forceY;
//    }
//}

with (obj_enemy) {
	if (gravity_affected = true) {
		speed = 0;
		// Calculate distance to the gravity source
		var dist = point_distance(x, y, other.x, other.y);
		if (dist < gravityRadius)
		{
			// Calculate direction towards the gravity source
			var dirToGravity = point_direction(x, y, other.x, other.y);
    
			// Calculate the angle difference between the object's direction and the direction to the gravity source
			var angleDifference = angle_difference(direction, dirToGravity);
    
			// Adjust the object's direction based on the angle difference, gravity strength, and distance to the gravity source
			direction -= angleDifference * (gravityStrength / dist);
			
			other.life -= 0.5;
			enemySpeed += 0.05;
		} else
		{
			enemySpeed = ds_list_find_value(global.enemySpeeds, ds_list_find_index(global.enemyTypes, enemyType));
		}
	}
}

//stop at clicked position
if (moving) {
    // Move towards the target position
    var _dist = point_distance(x, y, target_x, target_y);
    if (_dist > speed) {
        // Calculate direction towards the target position
        var _dir = point_direction(x, y, target_x, target_y);
        
        // Move towards the target position (small adjustment)
        x += lengthdir_x(speed, _dir);
        y += lengthdir_y(speed, _dir);
    } else {
        // Reached the target position, deactivate the gravity grenade
        moving = false;
		speed = 0;
    }
}

if(life <= 0){instance_destroy()};

// Inherit the parent event
event_inherited();