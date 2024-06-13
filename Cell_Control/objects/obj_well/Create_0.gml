//location setup
var _center_x = obj_cell_core.x;
var _center_y = obj_cell_core.y;

var _angle = random(360);
x = _center_x + lengthdir_x(800,_angle);
y = _center_y + lengthdir_y(800,_angle);

shot_cooldown = 30;
shot_interval = 20;

wall_delete_range = 200;

waves_left = 5; //number of waves before a boss
time_between_waves = (30-(global.infections_destroyed)) * game_get_speed(gamespeed_fps); //seconds
wave_timer = time_between_waves;
enemies_per_wave = waves_left + 3 + clamp(floor(global.difficulty * 20),0,20); //total should be the final wave's enemy count (integer is first wave e count, multiplier is total extra enemies)
enemies_spawned = 0;
boss_countdown = 60 * game_get_speed(gamespeed_fps);

//enemy selector
if (global.infections_destroyed = 0) {
	my_enemy_types = global.enemy_array_r;
} else if (global.infections_destroyed = 1) {
	my_enemy_types = global.enemy_array_rb;
} else if (global.infections_destroyed  = 2) {
	my_enemy_types = global.enemy_array_bg;
} else if (global.infections_destroyed = 3) {
	my_enemy_types = global.enemy_array_rp;
} else if (global.infections_destroyed = 4) {
	my_enemy_types = global.enemy_array_y;
} else if (global.infections_destroyed = 5) {
	my_enemy_types = global.enemy_array_rbgpy;
} else {
	my_enemy_types = global.enemy_array_rbgpy;
}

////reset difficulty for specific waves
//if (global.infections_destroyed = 2 
//|| global.infections_destroyed = 4 
//|| global.infections_destroyed = 6
//|| global.infections_destroyed =  8
//|| global.infections_destroyed = 10
//|| global.infections_destroyed = 12) {
//	global.difficulty = 0;
//}