// Destroy the bullet when it goes off-screen
if (x < 0 || y < 0 || x > room_width || y > room_height) {
    instance_destroy();
}

// Check for collision with enemies and destroy them
if (place_meeting(x, y, obj_enemy)) {
    var _enemy = instance_place(x, y, obj_enemy);
    instance_destroy();
    _enemy.TakeDamage(damage);
} else if (place_meeting(x, y, obj_boss_parent)){
	var _boss = instance_place(x, y, obj_boss_parent);
	instance_destroy();
	_boss.boss_health -= damage;
}

// Check for collision with cell walls
if (room = Room_Outside){
	if (place_meeting(x, y, obj_cellWall)) {
	    var _wall = instance_place(x, y, obj_cellWall);
	    instance_destroy();
	    _wall.buildingHealth -= damage;
	}
}