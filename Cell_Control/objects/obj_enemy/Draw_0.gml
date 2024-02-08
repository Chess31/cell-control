draw_self();
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, enemyHealth);

if (enemyType = "Purple") {
    draw_set_color (c_gray); // Reset drawing color to white
	draw_set_alpha(sin(current_time*0.001));
	draw_circle(x, y, heal_range, true);
	draw_set_alpha(1);
}