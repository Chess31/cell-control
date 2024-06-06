// Destroy the bullet when it goes off-screen
if (x < 0 || y < 0 || x > room_width || y > room_height) {
    instance_destroy();
}

// Check for collision with the player
if (place_meeting(x, y, obj_player)) {
    instance_destroy();
    obj_player.TakeDamage(damage);
	if (damage > 0){
		SparkParticles();
	}
}

// Check for collisions with buildings
var _hit_building = instance_place(x, y, obj_building);
if (_hit_building != noone) {
	if (piercing < 1){
		instance_destroy()
	} else {
		piercing -= 1;
	}
	_hit_building.buildingHealth -= damage;
}

// Check for collision with cell walls
if (place_meeting(x, y, obj_cellWall)) {
	var _wall = instance_place(x, y, obj_cellWall);
	if (piercing < 1){
		instance_destroy()
	} else {
		piercing -= 1;
	}
	_wall.buildingHealth -= damage;
	with(_wall) {
		if (buildingHealth <= 0) {
			instance_destroy();
		}
	}
}











//Old.... dont use

//// Check for collision with cell walls
//if (room = Room_Outside) && (piercing = false) {
//	if (place_meeting(x, y, obj_cellWall)) {
//	    var _wall = instance_place(x, y, obj_cellWall);
//	    instance_destroy();
//	    _wall.buildingHealth -= damage;
//	}
//}

//// Check for collision with cell walls
//if (room = Room_Outside) && (piercing = true) {
//	if (place_meeting(x, y, obj_cellWall)) {
//	    var _wall = instance_place(x, y, obj_cellWall);
//	    //instance_destroy();
//	    _wall.buildingHealth -= damage;
//	}
//}