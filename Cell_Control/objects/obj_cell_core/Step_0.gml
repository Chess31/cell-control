//Check for enemy bullet collisions
var bulletCollided = instance_place(x, y, obj_enemy_bullet);
if (bulletCollided != noone) {
    cellHealth -= 1; // Adjust the damage per bullet
    instance_destroy(bulletCollided); // Destroy the enemy bullet
}

// Defeat logic
if (cellHealth <= 0) {
    global.playerAlive = false; // Restart the game
}