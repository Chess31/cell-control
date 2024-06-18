//don't add freeze capability here

//fullscreen game hotkey
if (keyboard_check_pressed(vk_f11)) {
	if (window_get_fullscreen()) {
		window_set_fullscreen(false);
	} else {
		window_set_fullscreen(true);
	}
}

//extra info hotkey
if (keyboard_check_pressed(vk_tab)){
	if (global.extra_info = true){
		global.extra_info = false
	} else {
		global.extra_info = true;
	}
}