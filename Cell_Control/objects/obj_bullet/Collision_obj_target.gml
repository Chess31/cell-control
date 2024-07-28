instance_destroy();

if (instance_number(obj_well) = 0) {
	with (obj_target) {
		target_health--;
		if (target_health <= 0) {
			instance_destroy();
		}
	}
} else {
	//show message
	var _warning_text = instance_create_layer(obj_player.x, obj_player.y - 30, "InfectionLayer", obj_message)
	_warning_text.message_text = "Destroy Infection Cores First"
	_warning_text.text_color = c_red;
	//also display lock lines
	obj_target.draw_time = 120;
}