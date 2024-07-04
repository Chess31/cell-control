if (global.frozen = true) {
	exit;
}

//check if the player is close enough to collect and abilities are not full

if (keyboard_check_pressed(ord("F")) and point_distance(x, y, obj_player.x, obj_player.y) < collect_distance and array_length(global.upgrades) < 3) {
	array_push(global.upgrades, my_upgrade);
	instance_destroy();
}