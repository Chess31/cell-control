if (global.frozen = true) {
	exit;
}

event_inherited();

if (irandom(600) = 1 and instance_exists(parent_id)) {
	image_index++;
	stage++
}

if (stage = fully_grown_stage) {
	var _new_object = choose(obj_infection_barrier, obj_infection_turret, obj_infection_shield, obj_infection_spawner);
	var _new_infection_piece = instance_create_layer(x, y, "Instances", _new_object);
	
	_new_infection_piece.parent_id = parent_id;
	_new_infection_piece.branch_index = branch_index;
	
	evolved = true;
	instance_destroy();
}