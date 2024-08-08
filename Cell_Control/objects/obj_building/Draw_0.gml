draw_self();

//Draw Advanced HUD when tab is pressed
if (global.extra_info = true){
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, y + 35, string(buildingHealth) + "/" + string(ds_list_find_value(global.building_healths, index)));
}

//Upgrader menu drawing
if (playerInRange) {
    if (playerInRange) {
    var textToShow = "Press F";
    
    // Calculate the x-coordinate to center the text above the building
    var centerX = x - string_width(textToShow) / 2;
    
    // Draw the text centered above the building
    draw_set_color(c_white);
	draw_text(x, y - 80, textToShow);
	}
}

// Mine radius visualization
if (primed) {
    draw_set_color(c_white); // Reset drawing color to white
	draw_circle(x, y, explosionRadius, true);
}

if (type = "Feeder"){
	draw_set_color(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, y, string(global.enemy_kill_goal - enemies_defeated));
}

if (type = "Hive"){
	draw_set_color(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, y, string(ammo));
}