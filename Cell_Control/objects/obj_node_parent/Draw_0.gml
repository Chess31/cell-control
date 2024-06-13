draw_self();

draw_text(x,y,string(node_health));

if (instance_exists(creator)) {
	draw_line(x,y,creator.x,creator.y)
}