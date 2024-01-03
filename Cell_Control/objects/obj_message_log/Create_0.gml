// Use a global variable to store messages
global.messages = ds_list_create();
global.message_timestamps = ds_list_create();

// In obj_message_log Add a Message Method
// Add a new message to the list along with its creation time
function add_message(_message) {
    ds_list_insert(global.messages, 0, current_time);
    ds_list_insert(global.messages, 0, _message);
	//show_debug_message("announcement succesfully added");
}