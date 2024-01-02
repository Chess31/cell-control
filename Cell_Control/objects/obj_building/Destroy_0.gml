if ((type = "Proximity Mine") && primed)
{
	var totalEnemies = instance_number(obj_enemy);
	
	// Damage all buildings within the explosion radius
	for (var j = 0; j < instance_number(obj_building); j++) {
		var buildingInstance = instance_find(obj_building, j);
		if (point_distance(buildingInstance.x, buildingInstance.y, x, y) <= explosionRadius) {
		    buildingInstance.buildingHealth -= 10; // Adjust the damage as needed
		}
	}

	// Damage all enemies within the explosion radius
	for (var k = 0; k < totalEnemies; k++) {
		var damagedEnemy = instance_find(obj_enemy, k);
		if (point_distance(damagedEnemy.x, damagedEnemy.y, x, y) <= explosionRadius) {
		    damagedEnemy.enemyHealth -= 10; // Adjust the damage as needed
		}
	}
}