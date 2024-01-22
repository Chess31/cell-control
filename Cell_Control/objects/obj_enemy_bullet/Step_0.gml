// Destroy the bullet when it goes off-screen
if (x < 0 || y < 0 || x > room_width || y > room_height) {
    instance_destroy();
}

// Check for collision with enemies and destroy them
if (place_meeting(x, y, obj_player)) {
    instance_destroy();
    obj_player.TakeDamage(damage);
	SparkParticles();
}

// Check for collision with cell walls
if (room = Room_Outside) && (piercing = false) {
	if (place_meeting(x, y, obj_cellWall)) {
	    var _wall = instance_place(x, y, obj_cellWall);
	    instance_destroy();
	    _wall.buildingHealth -= damage;
	}
}

// Check for collision with cell walls
if (room = Room_Outside) && (piercing = true) {
	if (place_meeting(x, y, obj_cellWall)) {
	    var _wall = instance_place(x, y, obj_cellWall);
	    //instance_destroy();
	    _wall.buildingHealth -= damage;
	}
}