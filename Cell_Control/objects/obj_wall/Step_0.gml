// Check for collisions with player bullets
var playerBullet = instance_place(x, y, obj_bullet);

if (playerBullet != noone) {
    // Destroy the player bullet
    instance_destroy(playerBullet);
}

// Check for collisions with enemy bullets
var enemyBullet = instance_place(x, y, obj_enemy_bullet);

if (enemyBullet != noone) {
    // Destroy the enemy bullet
    instance_destroy(enemyBullet);
	wallStrength -= 1
}

//Walls Health Check
if (wallStrength <= 0)
{
	instance_destroy()
}