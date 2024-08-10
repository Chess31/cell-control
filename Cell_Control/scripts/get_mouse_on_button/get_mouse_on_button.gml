function get_mouse_on_button(){
	var _is_on_button = false;
	if (instance_exists(obj_button)) {
		for (var i = 0; i < (instance_number(obj_button)); ++i) {
		    var _button = instance_find(obj_button, i);
			if (_button.hovering) {
				_is_on_button = true;
			}
		}
	}
	return _is_on_button;
}