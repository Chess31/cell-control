//location setup
var _center_x = obj_cell_core.x;
var _center_y = obj_cell_core.y;

x = _center_x + lengthdir_x(700,random(360));
y = _center_y + lengthdir_y(700,random(360));

wall_delete_range = 200;

//enemy spawning setup (might have to be moved to the spawning object)
my_enemy_types = ds_list_create();
ds_list_add(my_enemy_types, "Red");

waves_left = 5; //number of waves before a boss
time_between_waves = 10 * game_get_speed(gamespeed_fps); //seconds
wave_timer = time_between_waves;
enemies_per_wave = waves_left + 3; //total should be the final wave's enemy count
enemies_spawned = 0;
boss_countdown = 60 * game_get_speed(gamespeed_fps);