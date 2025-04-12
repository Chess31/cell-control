if (global.frozen = true) {
	speed = 0;
	exit;
}

speed = my_speed;

destroy_offscreen();

// Check for collision with enemies and damage them
if (place_meeting(x, y, obj_enemy)) {
    var _enemy = instance_place(x, y, obj_enemy);
	if(_enemy.canBeHit = true){
		if (piercing < 1){
			image_speed = 2;
			my_speed = 0;
		} else {
			piercing -= 1;
		}
		_enemy.TakeDamage(damage);
		if (_enemy.enemyType = "Red" or _enemy.enemyType = "Blue") {_enemy.target = obj_player}
	}
	_enemy.time_to_draw += 120;
}
//else if (place_meeting(x, y, obj_boss_parent)){
//	var _boss = instance_place(x, y, obj_boss_parent);
//	if (piercing = false) {instance_destroy()};
//	_boss.boss_health -= damage;
//}

// Check for collision with cell walls
if (place_meeting(x, y, obj_terrain_piece)) {
	//var _wall = instance_place(x, y, obj_terrain_piece);
	
	image_speed = 2;
	speed = 0;
	//_wall.buildingHealth -= damage;
	//with(_wall) {
	//	if (buildingHealth <= 0) {
	//		instance_destroy();
	//	}
	//}
}

if (image_index = image_number - 1) {
	instance_destroy();
}