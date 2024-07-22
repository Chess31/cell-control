// Inherit the parent event
event_inherited();

draw_self();

if (target != noone) {
	draw_set_color(c_white);
	
    // Draw the line from the shield node to the target
    draw_line(x, y, target.x, target.y);

    // Draw the shield circle around the target
    draw_circle(target.x, target.y, shield_radius, true);
}