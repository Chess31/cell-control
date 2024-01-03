// Display messages
var _display_x = 10;//display_get_gui_width() - 10;
var _display_y = 50;//10;

for (var i = 0; i < ds_list_size(global.messages); i+=2) {
    var _message = ds_list_find_value(global.messages, i);
    draw_text(_display_x, _display_y + ((i * 20)/2), _message);
}