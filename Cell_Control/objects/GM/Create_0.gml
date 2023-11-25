// Set the timer for spawning collectibles
spawnTimer = 10; // Adjust this value to control spawn frequency

i = 0;
while (i < 10)
{
	instance_create_layer(random(room_width), random(room_height), "Collectibles",obj_collectible);
	i += 1;
}

// Enemy Waves
EspawnTimer = 0;
timeBetweenSpawns = 1000; // Adjust as needed, represents the time between enemy spawns in steps
maxEnemiesInWave = 3;   // Adjust as needed, represents the maximum number of enemies in a wave
enemiesSpawned = 0;
currentWave = 0