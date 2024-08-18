// Initialize common variables
enemySpeed = 1; // Adjust the enemy movement speed
shootCooldown = 150 + random(200); // Adjust the time between shots
enemyHealth = 8; // Adjust the initial health as needed
enemyType = "Green";

canBeHit = true;
iframes = 0;
iframeMax = 10;

//Movement things
moveTimer = room_speed/2; // time between movements
direction = random(360); // Start with a random direction that will change after moveTimer is zero
gravity_affected = true; // Default is true, spawn enemy with this as false if needed

alarm[0] = 1; //generate loot pools, this is dependent on enemyType so it must be one step after this one

//grab the damage function
event_inherited();