if (index - 1 != -1) {
	//Get segment to follow
	var _follow_me = obj_boss_purple_head.segments[|index - 1];
	
    // Calculate the direction to the previous segment
    var dir = point_direction(x, y, _follow_me.x, _follow_me.y);

    // Calculate the target position
    var target_x = _follow_me.x - lengthdir_x(follow_distance, dir);
    var target_y = _follow_me.y - lengthdir_y(follow_distance, dir);

    // Move the segment towards the target position
    x = lerp(x, target_x, 0.2);
    y = lerp(y, target_y, 0.2);
}

//Weapon
shootCooldown -= 1;

if (shootCooldown <= 0 && instance_exists(obj_player)) {
	// Calculate the direction to the player
	var directionToPlayer = 90; //point_direction(x, y, obj_player.x, obj_player.y);

	// Set up the bullet spread parameters
	var spreadAngle = 180;
	var numBullets = 2;

	// Loop through the number of bullets to create
	for (var i = 0; i < numBullets; i++) {
		// Calculate the adjusted direction for each bullet in the spread
		var adjustedDirection = directionToPlayer + (i - (numBullets - 1) / 2) * spreadAngle;

		// Create a bullet
		var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);

		// Set the bullet's direction
		bullet.direction = adjustedDirection;
		bullet.speed = 3;
		bullet.my_speed = bullet.speed;
		bullet.bcolor = c_yellow;
	}
	// Reset the shoot cooldown
	shootCooldown = 200 + random(300); // Adjust the time between shots
}

if (segment_health <= 0) {
	instance_destroy();
}

if (iframes > 0){
	canBeHit = false;
	iframes--;
} else {
	canBeHit = true;
}

//health bar things
if (time_to_draw < 30) {
	bar_alpha = lerp(bar_alpha, 0, 0.02);
} else {
	bar_alpha = 1;
}