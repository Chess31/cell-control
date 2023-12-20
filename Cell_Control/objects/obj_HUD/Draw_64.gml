// Reset Text to White
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw the HUD
draw_text(10, 10, "Ammo: " + string(obj_player.ammo) + " Health: " + string(obj_player.playerHealth) + " Wave: " + string(global.currentWave));

// Draw the countdown timer in the HUD
if (obj_player.restartTimer > 0) and (global.playerAlive = 0) {
    var secondsLeft = ceil(obj_player.restartTimer / room_speed);
    draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(room_width / 2, room_height / 2, string(secondsLeft), 10, 10, 0);
}