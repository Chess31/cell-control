switch (state) {
    case "Invinceable":
		//Check for wave 50
		
		if (global.currentWave = 50){
			state = "CanDie";
			speed = 0;
		}
		
        //Enemy Spawning
		// Check if it's time to spawn a new wave
		if (EspawnTimer <= 0) {
		    // Check if the maximum number of enemies in a wave has been reached
			//make this a for loop if you want them all to spawn at once
		    if ((global.currentWave + 1) mod 10 != 0){
				if (enemiesSpawned < min(maxEnemiesInWave + global.currentWave, 30)) { //max per wave is 30 enemies
			        // Spawn an enemy
					var randomEnemy = random(ds_list_size(global.enemyTypes));
			        var enemy = instance_create_layer(x, y, "Instances", obj_enemy);
			        enemiesSpawned++;
					enemy.enemyType = ds_list_find_value(global.enemyTypes, randomEnemy);
					enemy.enemyHealth = ds_list_find_value(global.enemyHealths, randomEnemy);
					enemy.sprite_index = ds_list_find_value(global.enemySprites, randomEnemy);
					enemy.enemySpeed = ds_list_find_value(global.enemySpeeds, randomEnemy);
			    } else {
			        // Reset the enemy count and restart the spawn timer
			        enemiesSpawned = 0;
			        EspawnTimer = max(timeBetweenSpawns - (global.currentWave * 10), 100);
					global.currentWave++;
			    }
			} else {
				//spawn the next boss and increment the wave
				EspawnTimer = max(timeBetweenSpawns - (global.currentWave * 20), 100);
				global.currentWave++;
				var _message_text = "A Virus Has Entered The Cell";
			    obj_message_log.add_message(_message_text);
				var _message_text_2 = "Wave " + string(global.currentWave) + " Reached:";
			    obj_message_log.add_message(_message_text_2);
				instance_create_layer(x, y, "Instances", obj_boss_blue);
			}
		} else {
		    // Decrement the spawn timer
		    EspawnTimer--;
		}
		
		// Move the spawner
		motion_set(direction, speed);
		//switch to this for better collisions possibly, move_and_collide()
		//bouce off all solid objects
		move_bounce_solid(true);

		// Check for collisions with room boundaries
		if (x <= 0 || x >= room_width) {
		    // Reverse the direction upon collision with the left or right boundary
		    direction = 180 - direction;
		}

		if (y <= 0 || y >= room_height) {
		    // Reverse the direction upon collision with the top or bottom boundary
		    direction = -direction;
		}
		
		//Hold to skip logic
		if (button_down_count >= room_speed * 1.5){
			EspawnTimer = 0;
			button_down_count = 0;
		}

		if (keyboard_check(ord("T"))){
			button_down_count ++;
		} else {
			button_down_count = 0;
		}

		if (keyboard_check_pressed(ord("T"))){
			var _warning_text = instance_create_layer(obj_player.x, obj_player.y - 30, "Instances", obj_message)
			_warning_text.message_text = "Hold T to skip to next wave"
		}
        break;
		
	case "CanDie":
		//Final Boss fight
		with (obj_enemy) {
			if (id != other.id){
				instance_destroy();
			}
		}
		
		//Attacks
		shootCooldown -= 1;
		
		if (shootCooldown <= 0 && instance_exists(obj_player)) {
			// Calculate the direction to the player
			var directionToPlayer = point_direction(x, y, obj_player.x, obj_player.y);

			// Set up the bullet spread parameters
			var spreadAngle = 120;
			var numBullets = 3;

			// Loop through the number of bullets to create
			for (var i = 0; i < numBullets; i++) {
				// Calculate the adjusted direction for each bullet in the spread
				var adjustedDirection = directionToPlayer + (i - (numBullets - 1) / 2) * spreadAngle;

				// Create a bullet
				var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);

				// Set the bullet's direction
				bullet.direction = adjustedDirection;
				bullet.speed = 5;
				bullet.bcolor = c_red;
				bullet.big = true;
				bullet.piercing = 4;
				bullet.damage = 5;
			}
			// Reset the shoot cooldown
			shootCooldown = 200 + random(300); // Adjust the time between shots
		}
		
		//movement
		
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

		// Check for collisions with buildings
		if (!place_meeting(x + moveX, y + moveY, obj_building)) {
			// Move the enemy
			x += moveX;
			y += moveY;
		} else {
			// If there's a collision with a wall, choose a new direction
			direction += 180 + random_range(-30,30);
		}
		
		//Check for being dead
		if (enemyHealth <= 0){
			instance_destroy();
		}
		break;
		
    default:
        // code here
        break;
}

//Check for being stuck
time_until_stuck_check --;
if (time_until_stuck_check < 0){
	//reset timer
	time_until_stuck_check = 100;
	//preform stuckness check
	if (point_distance(x, y, ox, oy) < stuck_threshold){
		x = random(room_width);
		y = random(room_height);
	}
	ox = x;
	oy = y;
}