////turn off if off screen
//if (!point_in_rectangle(x, y, camera_get_view_width(view_camera[0]) - camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]) - camera_get_view_height(view_camera[0]), camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]))) {
//    instance_deactivate_object(self);
//} else {
//    instance_activate_object(self);
//}
if (buildingHealth <= 0)
{
	instance_destroy();
}

//Code for creating active areas vs inactive areas (loaded chunks)
//instance_deactivate_all(true);
//var _vx = camera_get_view_x(view_camera[0]);
//var _vy = camera_get_view_y(view_camera[0]);
//var _vw = camera_get_view_width(view_camera[0]);
//var _vh = camera_get_view_height(view_camera[0]);
//instance_activate_region(_vx - 64, _vy - 64, _vw + 128, _vh + 128, false);