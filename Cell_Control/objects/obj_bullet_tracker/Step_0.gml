if (global.frozen = true) {
	speed = 0;
	exit;
}

speed = my_speed;

//var _direction_to_target = point_direction(x,y,target_x,target_y);
//var _angle_difference = angle_difference(_direction_to_target, direction);

//if (_angle_difference > 45) {
//	direction += _angle_difference * 0.1;
//}


// Destroy the bullet when it goes off-screen
if (x < 0 || y < 0 || x > room_width || y > room_height) {
    instance_destroy();
}

// Check for collision with enemies and damage them
if (place_meeting(x, y, obj_enemy)) {
    var _enemy = instance_place(x, y, obj_enemy);
	if(_enemy.canBeHit = true){
		if (piercing < 1){
			instance_destroy()
		} else {
			piercing -= 1;
		}
		_enemy.TakeDamage(damage);
	}
	_enemy.time_to_draw += 120;
}
//else if (place_meeting(x, y, obj_boss_parent)){
//	var _boss = instance_place(x, y, obj_boss_parent);
//	if (piercing = false) {instance_destroy()};
//	_boss.boss_health -= damage;
//}

// Check for collision with cell walls
if (place_meeting(x, y, obj_cellWall)) {
	var _wall = instance_place(x, y, obj_cellWall);
	instance_destroy();
	_wall.buildingHealth -= damage;
	with(_wall) {
		if (buildingHealth <= 0) {
			instance_destroy();
		}
	}
}
