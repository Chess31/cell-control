function CullObject(_object){
	with (_object) {
		var _hpad = -100;
		var _vpad = -100;
		var _bbox_left = x - sprite_xoffset - _hpad;
		var _bbox_top = y - sprite_yoffset - _vpad;
		var _bbox_right = _bbox_left + sprite_width + (_hpad * 2);
		var _bbox_bottom = _bbox_top + sprite_height + (_vpad * 2);
		
		var _cam_right = obj_camera.x + obj_camera.view_w_half;
		var _cam_left = obj_camera.x - obj_camera.view_w_half;
		var _cam_bottom = obj_camera.y + obj_camera.view_h_half;
		var _cam_top = obj_camera.y - obj_camera.view_h_half;
		
		var _cull = !((_bbox_left < _cam_right)
			and (_bbox_top < _cam_bottom)
			and (_bbox_right > _cam_left)
			and (_bbox_bottom > _cam_top));
	
		if (_cull) {
			active = false;
			instance_deactivate_object(id);
			ds_list_add(global.deactivatedInstances, [id, _bbox_left, _bbox_top, _bbox_right, _bbox_bottom]);
		}
	}
}