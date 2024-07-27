if (place_meeting(x,y, obj_enemy_bullet)){
	draw_time = 3 * game_get_speed(gamespeed_fps);
}

if (draw_time > 0){
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text_transformed_color(display_get_gui_width()/2,25,"Core Health: " + string(cellHealth),1.5,1.5,0,c_white,c_white,c_white,c_white,draw_alpha);
	draw_text_transformed_color(display_get_gui_width()/2,40,"Hold 'R' to heal",1.5,1.5,0,c_white,c_white,c_white,c_white,draw_alpha);
	draw_time--;
}