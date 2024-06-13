draw_self();

draw_set_color(c_white);

draw_text(x,y,string(node_health));

if (instance_exists(creator)) {
	draw_line(x,y,creator.x,creator.y)
}