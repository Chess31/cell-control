// Hotbar position variables
var _display_height = display_get_gui_height();
var _display_width = display_get_gui_width();
hotbar_height = 40; // Height of the hotbar above the bottom of the screen
hotbar_y_hidden = _display_height + 42; // Y position when hidden (bottom of the screen)
hotbar_y_visible = _display_height - hotbar_height; // Y position when visible
hotbar_y = hotbar_y_hidden; // start hidden

hover_slot = 0;

//create building switching buttons
var _hotbar_size = 3;//ds_list_size(global.building_types);
var _spacing = 128;
var _slot_width = sprite_get_width(s_button_hotbar);
for (var i = 0; i < _hotbar_size; ++i) {
	var _x = 40 + (_slot_width + _spacing) * i;
    var _slot_button = instance_create_layer(_x, hotbar_y_visible, "UI", obj_button_building_hotbar);
	_slot_button.slot_index = i;
}

menu_up = false;

// Animation speed
hotbar_speed = 5;