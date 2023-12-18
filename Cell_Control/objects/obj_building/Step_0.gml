// Check for collisions with player bullets
var playerBullet = instance_place(x, y, obj_bullet);

if (playerBullet != noone) and (type != "Turret"){
    // Destroy the player bullet
    instance_destroy(playerBullet);
}

// Check for collisions with enemy bullets
var enemyBullet = instance_place(x, y, obj_enemy_bullet); //if an enemy bullet is on our x and y

if (enemyBullet != noone) {
    // Destroy the enemy bullet
    instance_destroy(enemyBullet);
	buildingHealth -= 1;
}

//Building Health Check
if (buildingHealth <= 0)
{
	instance_destroy();
}

// Add custom behavior based on building type
switch (type) {
    case "Wall":
        // Wall-specific behavior
        // For example, walls might not do anything special in the Step Event
        break;

    case "Forge":
        // periodically spawn a collectible
        if (random(125) < 1) { // % chance every step
            // Spawn Collectible
            instance_create_layer(x + lengthdir_x(50, random(360)), y + lengthdir_y(50, random(360)), "Collectibles", obj_collectible);
        }
		image_angle++;
        break;

    case "Turret":
        // turret-specific behavior
        var nearestEnemy = instance_nearest(x, y, obj_enemy);
		if (fireTimer <= 0) {
	        if (nearestEnemy != noone && point_distance(x, y, nearestEnemy.x, nearestEnemy.y) < maxDetectionRange) {
	            // Shoot a bullet at the nearest enemy
	            var directionToEnemy = point_direction(x, y, nearestEnemy.x, nearestEnemy.y);
	            var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
				// Set the bullet's direction and speed
				bullet.direction = directionToEnemy;
				bullet.speed = turretBulletSpeed;
				//point sprite towards enemy
				image_angle = point_direction(x, y, nearestEnemy.x, nearestEnemy.y) + 90;
	        }
			// Reset the firing rate timer
            fireTimer = firingRate;
		}
		// Update the firing rate timer
        fireTimer -= 1;
        break;

	case "Upgrader":
        // Upgrader-specific behavior
        var playerDistance = point_distance(x, y, obj_player.x, obj_player.y);

        // Check if the player is within the interaction range
        playerInRange = (playerDistance < interactionRange);

        // Check for opening the menu
        if (playerInRange && keyboard_check_pressed(ord("D"))) {
            //spawn menu with shop options
			MenuCreate(x, y - 200,
				[
					["10 Health",tenHealth],
					["Weapon Tier",-1],
					["Building Tier",-1]
				],
				"Select Upgrade"
			);
        }
        break;

    // Add more cases for other building types if needed

    default:
        // Default behavior (if type is not recognized)
        break;
}