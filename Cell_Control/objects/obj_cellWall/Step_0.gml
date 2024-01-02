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