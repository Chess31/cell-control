// Check if the mouse is in the bottom 85% of the screen
//var _menu_key = keyboard_check_pressed(ord("C"));

if (menu_up) { //&& device_mouse_y_to_gui(0) >= display_get_gui_height() * screen_percentage) {
    // Move the hotbar up (visible)
    hotbar_y = lerp(hotbar_y, hotbar_y_visible, 0.1);
} else {
    // Move the hotbar down (hidden)
    hotbar_y = lerp(hotbar_y, hotbar_y_hidden, 0.1);
}