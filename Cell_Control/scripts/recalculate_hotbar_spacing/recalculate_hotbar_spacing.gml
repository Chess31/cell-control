function recalculate_hotbar_spacing(){
	//destroy current hotbar
	if (instance_exists(obj_button_building_hotbar)) {
		with (obj_button_building_hotbar) {
			instance_destroy();
		}
	}
	
	// Recreate hotbar
	var _display_height = display_get_gui_height();
	var _display_width = display_get_gui_width();

	var _hotbar_size = array_length(obj_player.available_buildings);
	var _spacing = 128;
	var _slot_width = sprite_get_width(s_button_hotbar);
	for (var i = 0; i < _hotbar_size; ++i) {
		var _x = 40 + (_slot_width + _spacing) * i;
		_x = _x + (_display_width/2 - (_hotbar_size * (_spacing + _slot_width))/2) + _slot_width;
	    var _slot_button = instance_create_layer(_x, obj_buildings_hotbar.hotbar_y_visible, "UI", obj_button_building_hotbar);
		_slot_button.slot_index = i;
	}
}