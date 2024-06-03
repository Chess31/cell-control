//update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

//Update cam object position
x += (xTo - x) / 10;
y += (yTo -y) / 10;

x= clamp(x,view_w_half, room_width-view_w_half);
y= clamp(y,view_h_half, room_height-view_h_half);

//Update view of cam
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

global.cam_right = x + view_w_half;
global.cam_left = x - view_w_half;
global.cam_bottom = y + view_h_half;
global.cam_top = y - view_h_half;

//instance_activate_region(global.cam_left, global.cam_top, camera_get_view_width(cam), camera_get_view_height(cam), inside);