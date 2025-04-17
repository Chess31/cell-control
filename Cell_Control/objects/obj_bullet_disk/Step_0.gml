if (global.frozen = true) {
	speed = 0;
	exit;
}

//stop animation at 3rd frame
if(image_index = 2) {
	image_speed = 0;
}

speed = my_speed;

destroy_offscreen();

// Check for collision with enemies and damage them
if (place_meeting(x, y, obj_enemy)) {
    var _enemy = instance_place(x, y, obj_enemy);
	//check if enemy has already been hit by this bullet
	if(ds_list_find_index(hit_enemies, _enemy) = -1){
		ds_list_add(hit_enemies, _enemy);
		if (piercing < 1){
			image_speed = 1;
			image_index++;
			alarm[0] = 1;
			my_speed = 0;
		} else {
			piercing--;
		}
		_enemy.TakeDamage(damage);
		if (_enemy.enemyType = "Red" or _enemy.enemyType = "Blue") {_enemy.target = obj_player}
	}
	_enemy.time_to_draw += 120;
}

// Check for collision with walls
if (place_meeting(x, y, obj_terrain_piece)) {
	image_speed = 1;
	image_index++;
	alarm[0] = 1;
	speed = 0;
}

if (image_index = image_number - 1) {
	instance_destroy();
}