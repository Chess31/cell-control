instance_destroy();
with (obj_target) {
	target_health--;
	if (target_health <= 0) {
		instance_destroy();
	}
}