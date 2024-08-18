with (obj_cell_core) {
	obj_cell_core.draw_time = 3 * game_get_speed(gamespeed_fps);
	if (other.damage > 0){
		cellHealth -= 1;
		cellHealth = max(cellHealth,0)
	}
	image_index++;
}

//shake screen
screen_shake(15,20);

instance_destroy();