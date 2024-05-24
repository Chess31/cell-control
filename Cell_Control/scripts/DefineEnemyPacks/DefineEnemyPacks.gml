function DefineEnemyPacks(){
	global.enemy_array_r = ds_list_create();
	ds_list_add(global.enemy_array_r, obj_enemy_red);
	
	global.enemy_array_rb = ds_list_create();
	ds_list_add(global.enemy_array_rb, obj_enemy_red);
	ds_list_add(global.enemy_array_rb, obj_enemy_blue);
	
	global.enemy_array_bg = ds_list_create();
	ds_list_add(global.enemy_array_bg, obj_enemy_blue);
	ds_list_add(global.enemy_array_bg, obj_enemy_green);
	
	global.enemy_array_rp = ds_list_create();
	ds_list_add(global.enemy_array_rp, obj_enemy_red);
	ds_list_add(global.enemy_array_rp, obj_enemy_purple);
	
	global.enemy_array_y = ds_list_create();
	ds_list_add(global.enemy_array_y, obj_enemy_yellow);
	
	global.enemy_array_rbgpy = ds_list_create();
	ds_list_add(global.enemy_array_rbgpy, obj_enemy_red);
	ds_list_add(global.enemy_array_rbgpy, obj_enemy_blue);
	ds_list_add(global.enemy_array_rbgpy, obj_enemy_green);
	ds_list_add(global.enemy_array_rbgpy, obj_enemy_purple);
	ds_list_add(global.enemy_array_rbgpy, obj_enemy_yellow);
}