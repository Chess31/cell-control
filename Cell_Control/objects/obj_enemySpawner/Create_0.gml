//randomize start location
x = random(room_width);
y = random(room_height);

// Enemy Waves
EspawnTimer = 100;
timeBetweenSpawns = 2000; // Adjust as needed, represents the time between enemy spawns in steps
maxEnemiesInWave = 3;   // count for starting wave
enemiesSpawned = 0;
global.currentWave = 5;

//Movement
speed = 3; // Adjust as needed
direction = random(360); // Start with a random direction