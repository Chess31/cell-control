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
	var _y = display_get_gui_height()/2 - 154 + (i * 62);
    var _building_button = instance_create_layer(_x, _y, "UI", obj_button_buildingunlock);
	_building_button.my_building_index = i;
	//create wall and turret buttons
	if (_building_button.my_building_index = 0 or _building_button.my_building_index = 1) {
		_building_button.generate_starting_buttons();
	}
}
//create weapon purchase buttons
for (var i = 0; i < 3; ++i) {
	var _x = ((display_get_gui_width()/2 - sprite_get_width(s_core_menu)) + 104);
	var _y = display_get_gui_height()/2 - 124 + (i * 92);
    var _weapon_button = instance_create_layer(_x, _y, "UI", obj_button_weaponunlock);
	switch (i) {
	    case 0:
	        _weapon_button.button_text = "Disk Whisk";
	        _weapon_button.my_weapon_index = 0;
	        _weapon_button.price = 10;
	        break;
		case 1:
	        _weapon_button.button_text = "Gravity Globber";
	        _weapon_button.my_weapon_index = 1;
			_weapon_button.price = 20;
	        break;
		case 2:
	        _weapon_button.button_text = "Trippler Crippler";
	        _weapon_button.my_weapon_index = 2;
			_weapon_button.price = 30;
	        break;
	    default:
	        // code here
	        break;
	}
}
//create defence purchase buttons
for (var i = 0; i < 3; ++i) {
	var _x = ((display_get_gui_width()/2 - sprite_get_width(s_core_menu)) + 104);
	var _y = display_get_gui_height()/2 - 124 + (i * 92);
    var _defence_button = instance_create_layer(_x, _y, "UI", obj_button_defenceunlock);
	switch (i) {
	    case 0:
	        _defence_button.button_text = "Heal Rift";
	        _defence_button.my_defence_index = 0;
	        _defence_button.price = 15;
	        break;
		case 1:
	        _defence_button.button_text = "Energy Rift";
	        _defence_button.my_defence_index = 1;
			_defence_button.price = 25;
	        break;
		case 2:
	        _defence_button.button_text = "Damage Rift";
	        _defence_button.my_defence_index = 2;
			_defence_button.price = 35;
	        break;
	    default:
	        // code here
	        break;
	}
}

menu_up = false;

// Animation speed
hotbar_speed = 5;