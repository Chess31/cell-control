// Remove messages after 3.5 seconds
if (ds_list_size(global.messages) > 0) {
    var _oldest_message_time = ds_list_find_value(global.messages, ds_list_size(global.messages) - 1);
    if (current_time - _oldest_message_time > 3500) {
        ds_list_delete(global.messages, ds_list_size(global.messages) - 1);
        ds_list_delete(global.messages, ds_list_size(global.messages) - 1);
    }
}
