// Hotbar position variables
var _display_height = display_get_gui_height();
hotbar_height = _display_height/2; // Height of the hotbar above the bottom of the screen
hotbar_y_hidden = _display_height + 257; // Y position when hidden (bottom of the screen)
hotbar_y_visible = _display_height - hotbar_height; // Y position when visible
hotbar_y = hotbar_y_hidden; // start hidden
screen_percentage = ((_display_height - hotbar_height) / _display_height);

tab = 0;

//create tab switching buttons
for (var i = 0; i < 3; ++i) {
	var _x = ((display_get_gui_width()/2 - sprite_get_width(s_core_menu)) + 80) + (i * 176);
	var _y = display_get_gui_height()/2 - 204;
    var _tab_button = instance_create_layer(_x, _y, "UI", obj_button_tab);
	_tab_button.my_tab = i;
}
//create building purchase buttons
for (var i = 0; i < 7; ++i) {
	var _x = ((display_get_gui_width()/2 - sprite_get_width(s_core_menu)) + 84);
	var _y = display_get_gui_height()/2 - 162 + (i * 64);
    var _tab_button = instance_create_layer(_x, _y, "UI", obj_button_buildingunlock);
	_tab_button.my_building_index = i;
} 

menu_up = false;

// Animation speed
hotbar_speed = 5;
