//Check for enemy bullet collisions
var bulletCollided = instance_place(x, y, obj_enemy_bullet);
if (bulletCollided != noone) {
    cellHealth -= 1;
	image_index++;
    instance_destroy(bulletCollided); // Destroy the enemy bullet
}

// Defeat logic
if (cellHealth <= 0) {
	image_speed = 3;
    global.playerAlive = false; // Restart the game
}