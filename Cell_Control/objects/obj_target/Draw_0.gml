draw_self();

if (draw_time > 0){
	draw_set_color(c_white);
	var _alpha = draw_get_alpha();
	draw_set_alpha(draw_alpha);
	
	for (var i = 0; i < instance_number(obj_well); ++i) {
		var _well_number = instance_find(obj_well, i);
	    draw_line_width_color(x,y,_well_number.x,_well_number.y,3,c_purple,c_fuchsia);
	}
	draw_time--;
	
	draw_set_alpha(_alpha);
}

if (draw_time < 80) {
	draw_alpha = lerp(draw_alpha, 0, 0.02);
} else {
	draw_alpha = 1;
}