// Initialize variables
enemySpeed = 2; // Adjust the enemy movement speed
shootCooldown = 150 + random(200); // Adjust the time between shots
enemyHealth = 3; // Adjust the initial health as needed
enemyType = "";

//Movement things
moveTimer = room_speed/2; // Adjust the time between random movements
direction = random(360);

alarm[0] = 1;

//Call When Hit
function TakeDamage(_damage)
{
	enemyHealth -= _damage;
}