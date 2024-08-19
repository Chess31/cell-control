if (draw_time > 0){
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text_transformed_color(display_get_gui_width()/2,55,"Core Health: " + string(cellHealth),2,2,0,c_white,c_white,c_white,c_white,draw_alpha);
	//draw_text_transformed_color(display_get_gui_width()/2,40,"Hold 'R' to heal",1.5,1.5,0,c_white,c_white,c_white,c_white,draw_alpha);
	draw_time--;
}

draw_set_halign(fa_left);
draw_set_color(c_white);
var _string_width = string_width("Cell Health: " + string(cellHealth));
draw_text_transformed_color(display_get_gui_width() - _string_width - 10, 10, "Cell Health: " + string(cellHealth), 1.5, 1.5, 0, c_white, c_white, c_white, c_white, 1);