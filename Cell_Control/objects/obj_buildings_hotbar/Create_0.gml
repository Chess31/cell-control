// Hotbar position variables
var _display_height = display_get_gui_height();
var _display_width = display_get_gui_width();
hotbar_height = 40; // Height of the hotbar above the bottom of the screen
hotbar_y_hidden = _display_height + 46; // Y position when hidden (bottom of the screen)
hotbar_y_visible = _display_height - hotbar_height; // Y position when visible
hotbar_y = hotbar_y_hidden; // start hidden

hover_slot = 0;

//create initial hotbar
hotbar_width = 0;
recalculate_hotbar_spacing();

menu_up = false;

// Animation speed
hotbar_speed = 5;

//set the hotbar to be farther away from the camera than the buttons (draw at -1)
depth = 0;