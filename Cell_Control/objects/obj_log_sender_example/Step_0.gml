// In obj_sender Step Event
// Create and send a message to the message log when the left mouse button is pressed
if (keyboard_check_pressed(vk_delete)) {
    var _message_text = "This is a new message!";
    obj_message_log.add_message(_message_text);
}