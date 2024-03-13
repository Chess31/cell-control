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
					bullet.bcolor = c_red;

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
				    var spreadAngle = 10;
				    var numBullets = 3;

				    // Loop through the number of bullets to create
				    for (var i = 0; i < numBullets; i++) {
				        // Calculate the adjusted direction for each bullet in the spread
				        var adjustedDirection = directionToPlayer + (i - (numBullets - 1) / 2) * spreadAngle;

				        // Create a bullet
				        var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);

				        // Set the bullet's direction
				        bullet.direction = adjustedDirection;
				        bullet.speed = 8;
						bullet.bcolor = c_blue;
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
		
		case "Purple":
				shootCooldown -= 1;
				
				if (shootCooldown <= 0)
				{
					//get the nearest enemy
					var _nearest_enemy = instance_nearest(x, y, obj_enemy);
					
					//Check to see if it is in range
					if (point_distance(x,y,_nearest_enemy.x,_nearest_enemy.y) < heal_range)
					{
						//It was so heal all nearby enemies in range
						for (var i = 0; i < instance_number(obj_enemy); i++)
						{
							var enemyInstance = instance_find(obj_enemy, i);
							if (point_distance(enemyInstance.x, enemyInstance.y, x, y) <= heal_range) && (enemyInstance.enemyType != "Purple") && (enemyInstance.enemyType != "boss")
							{
								//heal them up to three times their base health
								if (enemyInstance.enemyHealth + heal_per_hit < (ds_list_find_value(global.enemyHealths, ds_list_find_index(global.enemyTypes, enemyInstance.enemyType)) * 3))
								{
									enemyInstance.enemyHealth += heal_per_hit;
								} else {
									enemyInstance.enemyHealth = ds_list_find_value(global.enemyHealths, ds_list_find_index(global.enemyTypes, enemyInstance.enemyType)) * 3;
								}
							}
						}
					}
					shootCooldown = 90;
				}
				
			break;
		
		case "Yellow":
				shootCooldown -= 1;

				if (shootCooldown <= 0 && instance_exists(obj_player)) {
					// Calculate the direction to the player
				    var directionToPlayer = point_direction(x, y, obj_player.x, obj_player.y);

				    // Set up the bullet spread parameters
				    var spreadAngle = 60;
				    var numBullets = 6;

				    // Loop through the number of bullets to create
				    for (var i = 0; i < numBullets; i++) {
				        // Calculate the adjusted direction for each bullet in the spread
				        var adjustedDirection = directionToPlayer + (i - (numBullets - 1) / 2) * spreadAngle;

				        // Create a bullet
				        var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);

				        // Set the bullet's direction
				        bullet.direction = adjustedDirection;
				        bullet.speed = 3;
						bullet.bcolor = c_yellow;
				    }
					// Reset the shoot cooldown
					shootCooldown = 200 + random(300); // Adjust the time between shots
				}
			break;
		
		default:
			//default code
			break;
	}
}