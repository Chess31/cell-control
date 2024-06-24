event_inherited();

button_text = "Reset"

activate_button = function()
{
	global.core_power_skill_tree[0].tier = 2;
	global.core_power_skill_tree[1].tier = 0;
	global.core_power_skill_tree[2].tier = 0;
	
	global.core_power = global.true_core_power;
}