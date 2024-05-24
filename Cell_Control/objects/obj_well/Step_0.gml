//clear the area of walls when summoned
var _nearest_wall = instance_nearest(x,y,obj_cellWall);

if (point_distance(x,y, _nearest_wall.x, _nearest_wall.y) < wall_delete_range) {
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





////test movement	
//if (keyboard_check_pressed(vk_space)) {
//	x += irandom_range(-50,50);
//	y += irandom_range(-50,50);
//}