//clear the area of walls when summoned
var _nearest_wall = instance_nearest(x,y,obj_cellWall);

if (instance_exists(_nearest_wall)) && (point_distance(x,y, _nearest_wall.x, _nearest_wall.y) < wall_delete_range) {
	with (obj_cellWall) {
		//check all walls for being to close to the well
		if (point_distance(x, y, other.x, other.y) < 200){instance_destroy()};
	}
}

//Start spawning waves of enemies
if (waves_left > 0) {
	wave_timer--;
	if (wave_timer < 0) {
		if ((enemies_spawned + waves_left) < enemies_per_wave) {
			// Spawn an enemy
			var randomEnemy = random(ds_list_size(my_enemy_types));
			var _enemy_to_spawn = ds_list_find_value(my_enemy_types,randomEnemy);
			instance_create_layer(x, y, "Instances", _enemy_to_spawn);
			enemies_spawned++;
		} else {
			waves_left--;
			wave_timer = time_between_waves;
			enemies_spawned = 0;
		}
	}
} else {
	//get ready to summon the boss
	boss_countdown--;
	//shorten timer if hit by a player bullet
	if (place_meeting(x, y, obj_bullet)) {
		var _collided_bullet = instance_place(x, y, obj_bullet);
		instance_destroy(_collided_bullet);
		boss_countdown -= game_get_speed(gamespeed_fps);
	}
	//spawn the boss
	if (boss_countdown <= 0) {
		instance_create_layer(x, y, "Instances", obj_boss_blue);
		instance_destroy();
	}
}

if (distance_to_object(obj_player) < wall_delete_range) {
	shot_cooldown--;
	
	if (shot_cooldown <= 0) {
	// Create a bullet object
	var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);

	// Set the bullet's direction and speed towards the player
	bullet.direction = point_direction(x, y, obj_player.x, obj_player.y);
	bullet.speed = 9; // Adjust the bullet speed as needed
	bullet.bcolor = c_green;

	// Reset the shoot cooldown
	shot_cooldown = shot_interval;
}
}