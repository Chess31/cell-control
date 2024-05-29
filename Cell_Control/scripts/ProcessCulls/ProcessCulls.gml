// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ProcessCulls(){
	var i = 0;
	repeat (ds_list_size(global.deactivatedInstances)) {
		var _inst = global.deactivatedInstances[| i];
		
		var _cam_right = obj_camera.x + obj_camera.view_w_half;
		var _cam_left = obj_camera.x - obj_camera.view_w_half;
		var _cam_bottom = obj_camera.y + obj_camera.view_h_half;
		var _cam_top = obj_camera.y - obj_camera.view_h_half;
		
		var _cull = !((_inst[1] < _cam_right)
			and (_inst[2] < _cam_bottom)
			and (_inst[3] > _cam_left)
			and (_inst[4] > _cam_top));
		if !(_cull) {
			instance_activate_object(_inst[0]);
			_inst[0].active = true;
			ds_list_delete(global.deactivatedInstances, i--);
		}
		++i;
	}
}