draw_self();

if (enemyType = "Yellow"){
	draw_set_color(c_black);
} else {
	draw_set_color(c_white);
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, enemyHealth);

if (canBeHit = false){
	flash_sprite();
}