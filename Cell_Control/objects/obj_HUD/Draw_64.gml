// Reset Text to White
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw the HUD
draw_text(10, 10, "Ammo: " + string(obj_player.ammo) + " Health: " + string(obj_player.playerHealth) + " Wave: " + string(max(global.currentWave,1)));

// Draw the countdown timer in the HUD
if (obj_player.restartTimer > 0) and (global.playerAlive = 0) {
    var secondsLeft = ceil(obj_player.restartTimer / room_speed);
    draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(room_width / 2, room_height / 2, string(secondsLeft), 10, 10, 0);
}

// Draw HUD in the top right corner
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var display_x = display_get_gui_width() - string_width(" Primary Attack: " + string(obj_player.primarySlot));
var display_y = 10;

// Draw primary weapon
draw_text(display_x, display_y, "Primary Attack: " + string(obj_player.primarySlot));

// Draw shift weapon
if (obj_player.shiftSlot != -1) {
    draw_text(display_x, display_y + 20, "Shift Attack: " + string(obj_player.shiftSlot));
}

// Draw alt weapon
if (obj_player.altSlot != -1) {
    draw_text(display_x, display_y + 40, "Alt Attack: " + string(obj_player.altSlot));
}