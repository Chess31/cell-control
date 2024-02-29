/// @description Insert description here
// You can write your code in this editor

with (obj_enemy) {
	if (gravity_affected = true) {
		enemySpeed = ds_list_find_value(global.enemySpeeds, ds_list_find_index(global.enemyTypes, enemyType));
	}
}



