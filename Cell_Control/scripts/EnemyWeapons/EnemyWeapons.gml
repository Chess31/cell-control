function EnemyWeapons(){
	switch (enemyType){
		case "Red":
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
			break;
	
		case "Blue":
				shootCooldown -= 1;

				if (shootCooldown <= 0 && instance_exists(obj_player)) {
					// Calculate the direction to the player
				    var directionToPlayer = point_direction(x, y, obj_player.x, obj_player.y);

				    // Set up the bullet spread parameters
				    var spreadAngle = 10; // Adjust the spread angle as needed
				    var numBullets = 3;

				    // Loop through the number of bullets to create
				    for (var i = 0; i < numBullets; i++) {
				        // Calculate the adjusted direction for each bullet in the spread
				        var adjustedDirection = directionToPlayer + (i - (numBullets - 1) / 2) * spreadAngle;

				        // Create a bullet
				        var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);

				        // Set the bullet's direction
				        bullet.direction = adjustedDirection;

				        // Optional: You can set other bullet properties here (speed, sprite, etc.)
				        bullet.speed = 8; // Adjust the bullet speed as needed
				    }
					// Reset the shoot cooldown
					shootCooldown = 150 + random(300); // Adjust the time between shots
				}
			break;
		
		case "Green":
			    shootCooldown -= 1;
				
				if (shootCooldown <= 0 && instance_exists(obj_building)) {
					// Find the nearest building
				    var nearestBuilding = instance_nearest(x, y, obj_building);

				    // Check if the green enemy is touching the building
				    if (place_meeting(x, y, obj_building)) {
				        // Damage the building (adjust the damage value as needed)
				        nearestBuilding.buildingHealth -= 1; // Adjust the damage amount
						
						//spawn particles
						SparkParticles();
				    }
					shootCooldown = 50;
				}
			break;
		
		default:
			//default code
			break;
	}
}