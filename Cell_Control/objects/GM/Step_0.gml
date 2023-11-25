// Decrease the spawn timer
spawnTimer -= 1;

// Check if it's time to spawn a new collectible
if (spawnTimer <= 0) {
    // Spawn a collectible at a random position
    instance_create_layer(random(room_width), random(room_height), "Collectibles",obj_collectible);
    
    // Reset the spawn timer
    spawnTimer = 10 * 5;
}
 
 if (keyboard_check_pressed(vk_enter))
 {
	game_restart()
 }
 
 
 //Enemy Spawning
 // Check if it's time to spawn a new wave
if (EspawnTimer <= 0) {
    // Check if the maximum number of enemies in a wave has been reached
    if (enemiesSpawned < maxEnemiesInWave) {
        // Spawn an enemy
        instance_create_layer(x, y, "Instances", obj_enemy);
        enemiesSpawned++;
    } else {
        // Reset the enemy count and restart the spawn timer
        enemiesSpawned = 0;
        EspawnTimer = timeBetweenSpawns;
		currentWave++;
    }
} else {
    // Decrement the spawn timer
    EspawnTimer--;
}