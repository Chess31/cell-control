event_inherited();

skill = 0;
//next_tier_cost = 1;//ceil((global.core_power_skill_tree[skill].tier + 1) * 1.3);

activate_button = function()
{
	if (skill = 0) { //buildings
		var _next_tier_cost = max(1,ceil((global.core_power_skill_tree[0].tier) * 1.5));
		if (global.core_power >= _next_tier_cost && global.core_power_skill_tree[0].tier < 7) {
			global.core_power -= _next_tier_cost;
			global.core_power_skill_tree[0].tier += 1;
		}
	} else if (skill = 1) { //health
		//set health
		var _next_tier_cost = max(1,ceil((global.core_power_skill_tree[1].tier) * 1.5));
		if (global.core_power >= _next_tier_cost && global.core_power_skill_tree[1].tier < 5) {
			global.core_power -= _next_tier_cost;
			global.core_power_skill_tree[1].tier += 1;
		}
	} else if (skill = 2) { //rifts
		//add next rift to the list
		var _next_tier_cost = max(1,ceil((global.core_power_skill_tree[2].tier) * 1.5));
		if (global.core_power >= _next_tier_cost && global.core_power_skill_tree[2].tier < 3) {
			global.core_power -= _next_tier_cost;
			global.core_power_skill_tree[2].tier += 1;
		}
	}
}