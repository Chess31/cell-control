//Enemy Spawning

// Check if it's time to spawn a new wave
if (EspawnTimer <= 0) {
    // Check if the maximum number of enemies in a wave has been reached
	//make this a for loop if you want them all to spawn at once
    if ((global.currentWave + 1) mod 10 != 0){
		if (enemiesSpawned < maxEnemiesInWave + global.currentWave) {
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
	        EspawnTimer = max(timeBetweenSpawns - (global.currentWave * 20), 100);
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