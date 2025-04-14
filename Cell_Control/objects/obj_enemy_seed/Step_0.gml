if (image_index = image_number - 2) {
	var _list_size = ds_list_size(global.enemy_array_rbgpy);
	var _enemy_type = ds_list_find_value(global.enemy_array_rbgpy, irandom(_list_size - 1));
	instance_create_layer(x,y, "InfectionLayer", _enemy_type);
	instance_destroy();
}