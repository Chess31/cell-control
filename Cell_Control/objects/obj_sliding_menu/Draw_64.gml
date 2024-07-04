draw_set_color(c_navy);
draw_rectangle(0, hotbar_y, display_get_gui_width(), hotbar_y + hotbar_height, false);

// Draw the hotbar contents (replace this with your own content drawing)
draw_set_color(c_white);
draw_text(10, hotbar_y + 10, "Hotbar Content");
	
for (var i = 0; i < array_length(global.upgrades); i++) {
	var upgrade = global.upgrades[i];
	draw_text(10, hotbar_y + 30 + (i * 20), string(upgrade.upgrade_name) + ": " + string(upgrade.description));
}