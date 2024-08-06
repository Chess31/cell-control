event_inherited();

button_text = noone;

my_tab = noone;

//x = ((display_get_gui_width()/2 - sprite_get_width(s_core_menu)) + 60) + (my_tab * 10);
//y = display_get_gui_height()/2 - 224;

activate_button = function()
{
	if (obj_sliding_menu.menu_up = true) {
		obj_sliding_menu.tab = my_tab;
	}
}