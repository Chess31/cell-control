//start of the step determine if hovering is true or false
hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if (hovering && mouse_check_button_pressed(mb_left)) 
{
	clicked = true;
} 

if (mouse_check_button_released(mb_left)) 
{
	clicked = false;

	if (hovering) 
	{
		//audio_play_sound(snd_button, 1, false);
		activate_button();
	}
	
}

if (clicked) 
{
	image_index = 2;
} 
else if (hovering) 
{
	image_index = 1;
} 
else 
{
	image_index = 0;
}

//show tooltip if the button has one
if (tooltip_text != -1) {
	var _visible = true;
	
	if (object_index = obj_button_buildingunlock or object_index = obj_button_building_upgrades)
	{
		if (obj_sliding_menu.tab != 0) {
			_visible = false;
		}
	}
	
	if (object_index = obj_button_weaponunlock)
	{
		if (obj_sliding_menu.tab != 1) {
			_visible = false;
		}
	}
	
	if (object_index = obj_button_defenceunlock)
	{
		if (obj_sliding_menu.tab != 2) {
			_visible = false;
		}
	}
	
	if (hovering and _visible) {
		hover_time++;
	} else {
		hover_time = 0;
	}

	if (hover_time > 30 and !instance_exists(obj_tooltip)) {
		create_tooltip(device_mouse_x_to_gui(0) + 20, device_mouse_y_to_gui(0), tooltip_text, id);
	}
}