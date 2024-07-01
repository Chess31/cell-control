// Hotbar position variables
var _display_height = display_get_gui_height();
hotbar_height = 100; // Height of the hotbar above the bottom of the screen
hotbar_y_hidden = _display_height // Y position when hidden (bottom of the screen)
hotbar_y_visible = _display_height - hotbar_height; // Y position when visible
hotbar_y = hotbar_y_hidden; // start hidden
screen_percentage = ((_display_height - hotbar_height) / _display_height);

// Animation speed
hotbar_speed = 5;
