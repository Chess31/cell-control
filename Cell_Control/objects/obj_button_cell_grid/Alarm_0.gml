global.energy_rate = global.cell[cell_row][cell_col].energy_level;
global.available_buildings = global.core_power_skill_tree[0].tier;

room_goto(Room_Loading);
//room_set_persistent(Room_Core,false);
//eventually move the core power incrementing to the end screen of each cell

global.core_power += 5;
global.true_core_power += 5;