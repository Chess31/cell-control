//cell stats and info
global.energy_rate = global.cell[cell_row][cell_col].energy_level;
//core power stats and abilities
global.available_buildings = global.core_power_skill_tree[0].tier;
global.cell_health = 6 + global.core_power_skill_tree[1].tier;
global.available_rifts = global.core_power_skill_tree[2].tier;

room_goto(Room_Loading);

//eventually move the core power incrementing to the end screen of each cell

global.core_power += 5;
global.true_core_power += 5;