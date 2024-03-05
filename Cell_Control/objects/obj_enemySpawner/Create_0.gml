//randomize start location
x = random(room_width);
y = random(room_height);

// Enemy Waves
EspawnTimer = 100;
timeBetweenSpawns = 2000; // Adjust as needed, represents the time between enemy spawns in steps
maxEnemiesInWave = 3;   // count for starting wave
enemiesSpawned = 0;
global.currentWave = 0;

//Movement
speed = 3; // Adjust as needed
direction = random(360); // Start with a random direction
time_until_stuck_check = 100;
stuck_threshold = 10;
ox = x; //old x and y
oy = y;

//skip counter
button_down_count = 0;