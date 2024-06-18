if (global.frozen = true) {
	speed = 0;
	exit;
}

if (instance_exists(target)){
	life++;

	direction = point_direction(x, y, target.x, target.y) + (offset/life);
	speed = 18;
	
	if (place_meeting(x, y, target)){
		instance_destroy();
	}
} else {
	instance_destroy();
}

//show_debug_message(target);