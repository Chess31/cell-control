//Enemy Spawning

// Check if it's time to spawn a new wave
if (EspawnTimer <= 0) {
    // Check if the maximum number of enemies in a wave has been reached
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
    // Decrement the spawn timer
    EspawnTimer--;
}



// Move the spawner
motion_set(direction, speed);

// Check for collisions with buildings
if (place_meeting(x, y, obj_building)) {
    // Reverse the direction upon collision with buildings
    direction += 180;
}

// Check for collisions with room boundaries
if (x <= 0 || x >= room_width) {
    // Reverse the direction upon collision with the left or right boundary
    direction = 180 - direction;
}

if (y <= 0 || y >= room_height) {
    // Reverse the direction upon collision with the top or bottom boundary
    direction = -direction;
}