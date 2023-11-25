// Set the movement speed of the enemy


// Random movement timer
moveTimer -= 1;

if (moveTimer <= 0) {
    // Reset the timer and choose a new direction
    moveTimer = irandom_range(room_speed/3, room_speed); // Random time between 1 and 3 seconds
    
	//Either the new direction will be towards the player or a different direction
	if (!random(3) == 0) {
        // Move towards the player
        direction = point_direction(x, y, obj_player.x, obj_player.y) + random_range(-15,15);
    } else {
        // Set a random direction
        direction = random(360);
    }
}

// Calculate movement based on the current direction
var moveX = lengthdir_x(enemySpeed, direction);
var moveY = lengthdir_y(enemySpeed, direction);

// Check for collisions with walls
if (!place_meeting(x + moveX, y + moveY, obj_wall)) {
    // Move the enemy
    x += moveX;
    y += moveY;
} else {
    // If there's a collision with a wall, choose a new direction
    direction += 180 + random_range(-30,30);
}











// Shooting logic
shootCooldown -= 1;

if (shootCooldown <= 0 && instance_exists(obj_player)) {
    // Create a bullet object
    var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);

    // Set the bullet's direction and speed towards the player
    bullet.direction = point_direction(x, y, obj_player.x, obj_player.y);
    bullet.speed = 6; // Adjust the bullet speed as needed

    // Reset the shoot cooldown
    shootCooldown = 150 + random(200); // Adjust the time between shots
}

// Health check
if (enemyHealth <= 0) {
    // Destroy the enemy when health reaches zero
    instance_destroy();
}

//Call When Hit
function TakeDamage()
{
	enemyHealth -= 1;
}