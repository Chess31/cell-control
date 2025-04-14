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
var _building_list_size = ds_list_size(global.building_types);
for (var i = 0; i < _building_list_size - 1; ++i) {
	var _x = ((display_get_gui_width()/2 - sprite_get_width(s_core_menu)) + 84);
	var _y = display_get_gui_height()/2 - 114 + (i * 62);
	var _building_button = instance_create_layer(_x, _y, "UI", obj_button_buildingunlock);
	_building_button.my_building_index = i;
	switch (i) {
    case 0:
        // Wall
		_building_button.tooltip_text = "Simple Defensive Structure";
        break;
	case 1:
        // Turret
		_building_button.tooltip_text = "Automated defence for the Core";
        break;
	case 2:
        // Forge
		_building_button.tooltip_text = "Generates energy over time";
        break;
	case 3:
        // Bomb
		_building_button.tooltip_text = "Blasts enemies when they get too close";
        break;
	case 4:
        // Feeder
		_building_button.tooltip_text = "Generates power with enemy kills";
        break;
	case 5:
        // Hive
		_building_button.tooltip_text = "Lauches drones to collect energy automatically. Can heal buildings or act at a turret.";
        break;
    default:
        // code here
        break;
}
	//create wall and turret buttons
	if (_building_button.my_building_index = 0 or _building_button.my_building_index = 1) {
		_building_button.generate_starting_buttons();
	}
}
//create weapon purchase buttons
for (var i = 0; i < 5; ++i) {
	var _x = ((display_get_gui_width()/2 - sprite_get_width(s_core_menu)) + 104);
	var _y = display_get_gui_height()/2 - 124 + (i * 62);
    var _weapon_button = instance_create_layer(_x, _y, "UI", obj_button_weaponunlock);
	switch (i) {
	    case 0:
	        _weapon_button.button_text = "Disk Launcher";
	        _weapon_button.my_weapon_index = 0;
	        _weapon_button.price = 10;
	        _weapon_button.tooltip_text = "Shoots a fast, high damage attack.";
	        break;
		case 1:
	        _weapon_button.button_text = "Gravity Well";
	        _weapon_button.my_weapon_index = 1;
			_weapon_button.price = 20;
			_weapon_button.tooltip_text = "Lobs a black hole to the targeted position.";
	        break;
		case 2:
	        _weapon_button.button_text = "Tripple Shot";
	        _weapon_button.my_weapon_index = 2;
			_weapon_button.price = 30;
			_weapon_button.tooltip_text = "Launches 3 piercing bullets.";
	        break;
		case 3:
	        _weapon_button.button_text = "Bit Blaster";
	        _weapon_button.my_weapon_index = 3;
			_weapon_button.price = 40;
			_weapon_button.tooltip_text = "Double rapid firing cannons.";
	        break;
		case 4:
	        _weapon_button.button_text = "Chlorophyte Rifle";
	        _weapon_button.my_weapon_index = 4;
			_weapon_button.price = 0;
			_weapon_button.tooltip_text = "Never misses.";
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
			_defence_button.tooltip_text = "Periodically creates a zone that will heal the player.";
	        break;
		case 1:
	        _defence_button.button_text = "Energy Rift";
	        _defence_button.my_defence_index = 1;
			_defence_button.price = 25;
			_defence_button.tooltip_text = "Periodically creates a zone that will generate energy.";
	        break;
		case 2:
	        _defence_button.button_text = "Damage Rift";
	        _defence_button.my_defence_index = 2;
			_defence_button.price = 35;
			_defence_button.tooltip_text = "Periodically creates a zone that will boost bullet damage.";
	        break;
	    default:
	        // code here
	        break;
	}
}

menu_up = false;

// Animation speed
hotbar_speed = 5;