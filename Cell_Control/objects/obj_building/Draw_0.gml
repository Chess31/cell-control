draw_self();

//Upgrader menu drawing
if (playerInRange) {
    if (playerInRange) {
    var textToShow = "Press D";
    
    // Calculate the x-coordinate to center the text above the building
    var centerX = x - string_width(textToShow) / 2;
    
    // Draw the text centered above the building
    draw_set_color(c_white);
	draw_text(centerX, y - 100, textToShow);
	}
}