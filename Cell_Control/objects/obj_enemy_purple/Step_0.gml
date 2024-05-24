//Movement
if (moveTimer <= 0) {
	TeleportToRandomEnemy()
	moveTimer = room_speed * 2;
} else {
	// Decrement the teleportation timer
	moveTimer--;
}

//Weapons
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
				if (enemyInstance.enemyHealth + heal_per_hit < 30)//(ds_list_find_value(global.enemyHealths, ds_list_find_index(global.enemyTypes, enemyInstance.enemyType)) * 3))
				{
					enemyInstance.enemyHealth += heal_per_hit;
				} else {
					enemyInstance.enemyHealth = 30; //ds_list_find_value(global.enemyHealths, ds_list_find_index(global.enemyTypes, enemyInstance.enemyType)) * 3;
				}
			}
		}
	}
	shootCooldown = 90;
}

//grab health and iFrame system from parent
event_inherited();