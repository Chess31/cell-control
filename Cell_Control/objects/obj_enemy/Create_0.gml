// Initialize common variables
enemySpeed = 2; // Adjust the enemy movement speed
shootCooldown = 150 + random(200); // Adjust the time between shots
enemyHealth = 3; // Adjust the initial health as needed
enemyType = "";

//Movement things
moveTimer = room_speed/2; // Adjust the time between random movements
direction = random(360);

alarm[0] = 1;
alarm[1] = 1;

//Purple specific variables
heal_per_hit = 1;
heal_range = 90;

//Yellow specific variables
splitCount = 3; // Number of smaller enemies to split into
splitEnemyType = "Red"; // Type of enemy to split into

//Call when hit
function TakeDamage(_damage)
{
	enemyHealth -= _damage;
}