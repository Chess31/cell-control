if ((type = "Proximity Mine") && primed)
{
	var totalEnemies = instance_number(obj_enemy);
	var _leveled_radius = explosionRadius  + ((global.building_levels[|index] - 1) * 16);
	
	// Damage all buildings within the explosion radius
	for (var j = 0; j < instance_number(obj_building); j++) {
		var buildingInstance = instance_find(obj_building, j);
		if (point_distance(buildingInstance.x, buildingInstance.y, x, y) <= _leveled_radius) {
		    buildingInstance.buildingHealth -= 10; // Adjust the damage as needed
		}
	}

	// Damage all enemies within the explosion radius
	for (var k = 0; k < totalEnemies; k++) {
		var damagedEnemy = instance_find(obj_enemy, k);
		if (point_distance(damagedEnemy.x, damagedEnemy.y, x, y) <= _leveled_radius) {
		    damagedEnemy.enemyHealth -= 10; // Adjust the damage as needed
		}
	}
}

//shake screen
screen_shake(12,30);