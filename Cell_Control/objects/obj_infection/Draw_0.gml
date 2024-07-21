
draw_self();

draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

var _name = object_get_name(object_index);
var _string = string_delete(_name, 0, 14);

draw_text(x, y, _string);
draw_text(x, y + 15, node_health);