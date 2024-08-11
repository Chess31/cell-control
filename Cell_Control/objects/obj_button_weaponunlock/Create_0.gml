event_inherited();

button_text = noone;

show_button = true;

my_weapon_index = 0;

price = 0;

activate_button = function()
{
	if (obj_sliding_menu.tab = 1 and show_button = true and global.core_power >= price)
	{
		array_push(obj_player.available_weapons, my_weapon_index + 1);
		global.core_power -= price;
		show_button = false;
	}
}