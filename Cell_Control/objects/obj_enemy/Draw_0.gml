draw_self();

if (enemyType = "Yellow"){
	draw_set_color(c_black);
} else {
	draw_set_color(c_white);
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, enemyHealth);

//if (enemyType = "Purple") {
//    draw_set_color (c_gray);
//	draw_set_alpha(sin(current_time*0.001));
//	draw_circle(x, y, heal_range, true);
//	draw_set_alpha(1);
//}