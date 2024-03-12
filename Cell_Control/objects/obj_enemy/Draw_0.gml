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
	flash_sprite();//draw_sprite_ext(sprite_index,image_index,x,y,0.9+sin(iframes/2),0.8+sin(iframes/2),0,c_white, 1); //flash_sprite();
	iframes --;
}






//if (enemyType = "Purple") {
//    draw_set_color (c_gray);
//	draw_set_alpha(sin(current_time*0.001));
//	draw_circle(x, y, heal_range, true);
//	draw_set_alpha(1);
//}