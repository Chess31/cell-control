draw_self();

//Upgrader menu drawing
if (playerInRange) {
    if (playerInRange) {
    var textToShow = "Press F";
    
    // Calculate the x-coordinate to center the text above the building
    var centerX = x - string_width(textToShow) / 2;
    
    // Draw the text centered above the building
    draw_set_color(c_white);
	draw_text(centerX, y - 80, textToShow);
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