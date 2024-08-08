event_inherited();

button_text = noone;

show_button = true;

my_defence_index = 0;

price = 0;

activate_button = function()
{
	if (obj_sliding_menu.tab = 2 and show_button = true and global.core_power >= price) {
		switch (my_defence_index) {
		    case 0:
		        ds_list_add(global.rift_types, obj_rift_heal);
		        break;
			case 1:
		        ds_list_add(global.rift_types, obj_rift_energy);
		        break;
			case 2:
		        ds_list_add(global.rift_types, obj_rift_damage);
		        break;
		    default:
		        // code here
		        break;
		}
		global.core_power -= price;
		show_button = false;
	}
}