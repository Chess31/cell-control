event_inherited();

button_text = noone;

slot_index = undefined;

//start in the correct spot (stops new slots from flashing)
y = ystart - (obj_buildings_hotbar.hotbar_y_visible - obj_buildings_hotbar.hotbar_y);

activate_button = function()
{
	obj_player.current_building_index = slot_index;
}

//set the buttons to be in front of the hotbar object
depth = -1;